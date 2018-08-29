"""
This script builds a list of stereo images based in inputs and passes them 
thuru a panorama merger and disparity comparison

Based in the original from https://github.com/kushalvyas/Python-Multiple-Image-Stitching/
"""

import json
import sys
import os
import time
import re
import numpy as np

import cv2
from .. import common, helpers, settings_manager

from datetime import datetime
from jinja2 import Template
from tqdm import tqdm

settings = settings_manager.Singleton()

def chunkSplit(l, n):
	o = []
	n = max(1, n)
	for i in range(0, len(l), n):
		o.append(l[i:i+n])
	return o

class Matchers:
	def __init__(self):
		self.surf = cv2.xfeatures2d.SURF_create()
		FLANN_INDEX_KDTREE = 0
		index_params = dict(algorithm=0, trees=5)
		search_params = dict(checks=50)
		self.flann = cv2.FlannBasedMatcher(index_params, search_params)

	def match(self, i1, i2, direction=None):
		imageSet1 = self.getSURFFeatures(i1)
		imageSet2 = self.getSURFFeatures(i2)
		common.output("Direction : {}".format(direction), 'DEBUG')
		matches = self.flann.knnMatch(
			imageSet2['des'],
			imageSet1['des'],
			k=2
			)
		good = []
		for i , (m, n) in enumerate(matches):
			if m.distance < 0.7*n.distance:
				good.append((m.trainIdx, m.queryIdx))

		if len(good) > 4:
			pointsCurrent = imageSet2['kp']
			pointsPrevious = imageSet1['kp']

			matchedPointsCurrent = np.float32(
				[pointsCurrent[i].pt for (__, i) in good]
			)
			matchedPointsPrev = np.float32(
				[pointsPrevious[i].pt for (i, __) in good]
				)

			H, s = cv2.findHomography(matchedPointsCurrent, matchedPointsPrev, cv2.RANSAC, 4)
			return H
		return None

	def getSURFFeatures(self, im):
		gray = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)
		kp, des = self.surf.detectAndCompute(gray, None)
		return {'kp':kp, 'des':des}

class Stitch:
	def __init__(self, args):
		filenames = args
		
		# self.images = [cv2.resize(cv2.imread(each),(480, 320)) for each in filenames]
		self.images = [cv2.imread(each) for each in filenames]
		self.count = len(self.images)
		self.left_list, self.right_list, self.center_im = [], [],None
		self.matcher_obj = Matchers()
		self.prepare_lists()
	
	def prepare_lists(self):
		common.output("Number of images : {}".format(self.count), 'DEBUG')
		self.centerIdx = self.count/2 
		
		common.output("Center index image : {}".format(self.centerIdx), 'DEBUG')
		self.center_im = self.images[int(self.centerIdx)]
		
		for i in range(self.count):
			if i <= self.centerIdx:
				self.left_list.append(self.images[i])
			else:
				self.right_list.append(self.images[i])
		
		common.output("Image lists prepared", 'DEBUG')

	def leftshift(self):
		# self.left_list = reversed(self.left_list)
		a = self.left_list[0]
		
		for b in self.left_list[1:]:
			H = self.matcher_obj.match(a, b, 'left')
			common.output("Homography is : {}".format(H), 'DEBUG')
			
			xh = np.linalg.inv(H)
			common.output("Inverse Homography : {}".format(xh), 'DEBUG')
			
			ds = np.dot(xh, np.array([a.shape[1], a.shape[0], 1]));
			ds = ds/ds[-1]
			common.output("final ds=>{}".format(ds), 'DEBUG')
			
			f1 = np.dot(xh, np.array([0,0,1]))
			f1 = f1/f1[-1]
			
			xh[0][-1] += abs(f1[0])
			xh[1][-1] += abs(f1[1])
			
			ds = np.dot(xh, np.array([a.shape[1], a.shape[0], 1]))
			
			offsety = abs(int(f1[1]))
			offsetx = abs(int(f1[0]))
			
			dsize = (int(ds[0])+offsetx, int(ds[1]) + offsety)
			common.output("image dsize =>{}".format(dsize), 'DEBUG')
			
			try:
				tmp = cv2.warpPerspective(a, xh, dsize)
				# cv2.imshow("warped", tmp)
				# cv2.waitKey()
				
				tmp[offsety:b.shape[0]+offsety, offsetx:b.shape[1]+offsetx] = b
				a = tmp
			except:
				pass
		
		self.leftImage = tmp
	
	def rightshift(self):
		for each in self.right_list:
			H = self.matcher_obj.match(self.leftImage, each, 'right')
			common.output("Homography : {}".format(H), 'DEBUG')
			
			txyz = np.dot(H, np.array([each.shape[1], each.shape[0], 1]))
			txyz = txyz/txyz[-1]
			
			dsize = (int(txyz[0])+self.leftImage.shape[1], int(txyz[1])+self.leftImage.shape[0])
			tmp = cv2.warpPerspective(each, H, dsize)
			
			cv2.imshow("tp", tmp)
			cv2.waitKey()
			
			# tmp[:self.leftImage.shape[0], :self.leftImage.shape[1]]=self.leftImage
			tmp = self.mix_and_match(self.leftImage, tmp)
			
			common.output("tmp shape {}".format(tmp.shape), 'DEBUG')
			common.output("self.leftimage shape={}".format(self.leftImage.shape), 'DEBUG')
			
			self.leftImage = tmp
		# self.showImage('left')
	
	def mix_and_match(self, leftImage, warpedImage):
		i1y, i1x = leftImage.shape[:2]
		i2y, i2x = warpedImage.shape[:2]
		common.output(leftImage[-1,-1], 'DEBUG')
		
		t = time.time()
		black_l = np.where(leftImage == np.array([0,0,0]))
		black_wi = np.where(warpedImage == np.array([0,0,0]))
		
		common.output(time.time() - t, 'DEBUG')
		common.output(black_l[-1], 'DEBUG')
		
		for i in range(0, i1x):
			for j in range(0, i1y):
				try:
					if (np.array_equal(leftImage[j,i],np.array([0,0,0])) and  np.array_equal(warpedImage[j,i],np.array([0,0,0]))):
						# print "BLACK"
						# instead of just putting it with black, 
						# take average of all nearby values and avg it.
						warpedImage[j,i] = [0, 0, 0]
					else:
						if (np.array_equal(warpedImage[j,i],[0,0,0])):
							# print "PIXEL"
							warpedImage[j,i] = leftImage[j,i]
						else:
							if not np.array_equal(leftImage[j,i], [0,0,0]):
								bw, gw, rw = warpedImage[j,i]
								bl,gl,rl = leftImage[j,i]
								# b = (bl+bw)/2
								# g = (gl+gw)/2
								# r = (rl+rw)/2
								warpedImage[j, i] = [bl,gl,rl]
				except:
					pass
		
		# cv2.imshow("waRPED mix", warpedImage)
		# cv2.waitKey()
		return warpedImage
	
	def trim_left(self):
		pass
	
	def showImage(self, string=None):
		if string == 'left':
			cv2.imshow("left image", self.leftImage)
			# cv2.imshow("left image", cv2.resize(self.leftImage, (400,400)))
		elif string == "right":
			cv2.imshow("right Image", self.rightImage)
		cv2.waitKey()

def args(parser):
	try:
		parser.add_argument('--camera', action='append', nargs='+', default=None, help='Defines a list of one of more cameras to be exported, those will be syncronized by default, bounding box support is automatic')
	except: pass

def help():
	return '''\
	This script builds a list of stereo images based in inputs and passes them thuru a panorama merger and disparity comparison.
	
	Based in the original from https://github.com/kushalvyas/Python-Multiple-Image-Stitching/
	
	Usage:
		-l base/path/to/images
		--camera camera1 camera2
	
	Where options define the filename prefix from cameras that should be merged
'''

def run():
	mycams = []
	align = {}
	matches = 0
	
	if settings.camera == None:
		common.output('No --camera sent!', 'ERROR')
		return
	
	if settings.camera != None:
		for c in settings.camera:
			if isinstance(c, list):
				mycams.extend(c)
			else:
				mycams.append(c)
	
	expected = len(mycams)
	
	common.output('Analyzing files from {}...'.format(settings.local_path))
	fns = common.getAllFiles(settings.local_path, recursive=False)
	
	for fn in tqdm(fns):
		lnm = os.path.basename(fn)
		
		for c in mycams:
			if c in lnm:
				key = lnm.replace(c, '')
				
				try:
					align[key].append(fn)
				except KeyError:
					align[key] = [ fn ]
				
				matches += 1
	
	common.output('Found {} matches'.format(matches))
	
	if matches == 0:
		return
	
	for k, v in align.items():
		if len(v) != expected:
			continue
		common.output('Stitching {}...'.format(v), 'DEBUG')
		
		s = Stitch(v)
		s.leftshift()
		s.rightshift()
		
		ofn = os.path.join(settings.output_path, '_panorama_'.join(mycams) + k)
		common.output('Writing: {}...'.format(ofn))
		
		cv2.imwrite(ofn, s.leftImage)
		cv2.destroyAllWindows()
		
		if len(v) % 2 == 0:
			common.output('Calculating disparity groups...', 'DEBUG')
			chunks = chunkSplit(v, 2)
			camChunks = chunkSplit(mycams, 2)
			idx = 0
			for c in chunks:
				imgL = cv2.imread(c[0],0)
				imgR = cv2.imread(c[1],0)
				
				# stereo = cv2.StereoBM_create(numDisparities=16, blockSize=15)
				stereo = cv2.StereoBM_create(numDisparities=0, blockSize=5)
				disparity = stereo.compute(imgL, imgR)
				
				ofn = os.path.join(settings.output_path, '_disparity_'.join(camChunks[idx]) + k)
				cv2.imwrite(ofn, disparity)
				common.output('Writing: {}...'.format(ofn))
				idx += 1
	
	common.output('Completed')
