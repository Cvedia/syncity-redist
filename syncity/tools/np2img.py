import cv2
import numpy as np
import math
import glob

from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()


def args(parser):
    try:
        parser.add_argument('--scale', type=int, default=256,
                            help='Defines a scale limit value to proportionally scale the original numpy array, defaults to 256 (this value is always subtracted by one)')
    except:
        pass
    try:
        parser.add_argument('--height', type=int, default=1080, help='Defines output image height')
    except:
        pass
    try:
        parser.add_argument('--width', type=int, default=1920, help='Defines output image width')
    except:
        pass
    try:
        parser.add_argument('--input', default=None,
                            help='Define whichs numpy array files (npy or npz) to be processed. Globs are accepted')
    except:
        pass
    try:
        parser.add_argument('--nan_check', default=False,
                            help='Defines whether the script checks/fixes for NaNs in the data. Checking for NaNs has a considerable impact in the performance of the script')
    except:
        pass


def help():
    return '''\
	Reads a numpy array, scales it's values and outputs an image.

	This tool is intended to visualize data exports greater than 8bit that would be otherwise impossible to be displayed as a image.
'''


def run():
    if settings.input == None:
        common.output('No --input set')
        return

    files = glob.glob(settings.input)

    for fp in files:

        common.output("Loading: {}".format(fp))

        data = np.load(fp)
        i = 0
        k = 0
        j = data.size

        common.output("Array size: {} Type: {}".format(j, data.dtype))

        if j != settings.width * settings.height:
            common.output(
                'Image size doesn\'t match the number of pixels found in numpy! Numpy pixels: {} Image pixels: {}'.format(
                    j, settings.width * settings.width), 'ERROR')

        if settings.nan_check:
            # clean / check for nan
            while i < j:
                if math.isnan(data[i]):
                    data[i] = 0
                    k += 1
                i += 1

        img = ((data / data.max()) * 255).astype(np.uint8).flatten().reshape(settings.height, settings.width)

        common.output(
            "NaN k: {} Original Max: {} Min: {} Unique: {} Scaled Max: {} Min: {} Unique: {}".format(k, data.max(),
                                                                                                     data.min(),
                                                                                                     np.unique(
                                                                                                         data).size,
                                                                                                     img.max(),
                                                                                                     img.min(),
                                                                                                     np.unique(
                                                                                                         img).size))
        ifn = "{}.png".format(fp)

        common.output("Writing: {}".format(ifn))
        cv2.imwrite(ifn, img)
