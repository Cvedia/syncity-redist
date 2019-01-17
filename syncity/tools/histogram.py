#!/usr/bin/python
from PIL import Image
import os, sys, getopt
import cv2
import shutil
import matplotlib.pyplot as plt
from .. import common, helpers, settings_manager, db

settings = settings_manager.Singleton()

def help():
	return '''\
	This tool iterates through all images in the input path and generates images with a histogram in the output path  
'''

def args(parser):
	try:
		parser.add_argument('--prefix', default='', help='The prefix that is used to filter which images will be processed')
	except: pass
	try:
		parser.add_argument('--limit', default=50, help='Maximum number of images to process')
	except: pass

def hist_analysis(path, path_out, prefix, limit):
	print("Doing " + path)
	print("Using prefix: " + prefix)
	dirs = os.listdir(path)
	basename = os.path.basename(os.path.normpath(path))

	count = 0
	for item in dirs:
		if os.path.isfile(path + item):
			if item.startswith(prefix):
				print("Read file ", path + item)
				im = cv2.imread(path + item)
				f, e = os.path.splitext(item)
				imResize = cv2.resize(im, (256, 256))
				if count < limit:
					plt.figure(figsize=(10, 5))
					plt.subplot(121), plt.imshow(imResize)
					#plt.subplot(122), plt.hist(imResize.ravel(), bins=253, range=(3, 256))
					plt.subplot(122), plt.hist(imResize.ravel(), bins=256, range=(0, 256))
					plt.xlabel("pixel value")
					plt.ylabel("No of pixels")
					# plt.show()
					plt.savefig(os.path.join(path_out, 'histogram_' + f + e), bbox_inches='tight')
					plt.close()
					count += 1
			else:
				print("Skip file ", path + item)
		else:
			print("File not found " + path + item)


def run():
	prefix = settings.prefix

	inPath = settings.local_path
	outPath = settings.output_path
	limit = settings.limit

	print("Input Path:  ", inPath)
	print("Output Path: ", outPath)

	hist_analysis(inPath , outPath , prefix,limit)
	
	print("Done!")
