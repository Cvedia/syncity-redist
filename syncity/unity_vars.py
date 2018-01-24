"""
A collection of unity constants used as a lookup table for several scripts.
"""

tonemappings = [ 'Filmic', 'Reinhard', 'LumaReinhard', 'Photographic' ]

# https://docs.unity3d.com/ScriptReference/RenderingPath.html
renderingPath = [
	'DeferredShading',	# 0
	'DeferredLighting',	# 1 (deprecated)
	'VertexLit',				# 2
	'Forward',					# 3
	'UsePlayerSettings'	# 4 (default)
]


# https://docs.unity3d.com/ScriptReference/TextureFormat.html
textureFormat = [
	'Alpha8',						# 0 Alpha-only texture format.
	'ARGB4444',					# 1 A 16 bits/pixel texture format. Texture stores color with an alpha channel.
	'RGB24',						# 2 Color texture format, 8-bits per channel.
	'RGBA32',						# 3 Color with alpha texture format, 8-bits per channel.
	'ARGB32',						# 4 Color with alpha texture format, 8-bits per channel. (default)
	'RGB565',						# 5 A 16 bit color texture format.
	'R16',							# 6 A 16 bit color texture format that only has a red channel.
	'DXT1',							# 7 Compressed color texture format.
	'DXT5',							# 8 Compressed color with alpha channel texture format.
	'RGBA4444',					# 9 Color and alpha texture format, 4 bit per channel.
	'BGRA32',						# 10 Color with alpha texture format, 8-bits per channel.
	'RHalf',						# 11 Scalar (R) texture format, 16 bit floating point.
	'RGHalf',						# 12 Two color (RG) texture format, 16 bit floating point per channel.
	'RGBAHalf',					# 13 RGB color and alpha texture format, 16 bit floating point per channel.
	'RFloat',						# 14 Scalar (R) texture format, 32 bit floating point. (for depth map)
	'RGFloat',					# 15 Two color (RG) texture format, 32 bit floating point per channel.
	'RGBAFloat',				# 16 RGB color and alpha texture format, 32-bit floats per channel.
	'YUY2',							# 17 A format that uses the YUV color space and is often used for video encoding or playback.
	'RGB9e5Float',			# 18 RGB HDR format, with 9 bit mantissa per channel and a 5 bit shared exponent.
	'BC4',							# 19 Compressed one channel (R) texture format.
	'BC5',							# 20 Compressed two-channel (RG) texture format.
	'BC6H',							# 21 HDR compressed color texture format.
	'BC7',							# 22 High quality compressed color texture format.
	'DXT1Crunched',			# 23 Compressed color texture format with Crunch compression for small storage sizes.
	'DXT5Crunched',			# 24 Compressed color with alpha channel texture format with Crunch compression for small storage sizes.
	'PVRTC_RGB2',				# 25 PowerVR (iOS) 2 bits/pixel compressed color texture format.
	'PVRTC_RGBA2',			# 26 PowerVR (iOS) 2 bits/pixel compressed with alpha channel texture format.
	'PVRTC_RGB4',				# 27 PowerVR (iOS) 4 bits/pixel compressed color texture format.
	'PVRTC_RGBA4',			# 28 PowerVR (iOS) 4 bits/pixel compressed with alpha channel texture format.
	'ETC_RGB4',					# 29 ETC (GLES2.0) 4 bits/pixel compressed RGB texture format.
	'ATC_RGB4',					# 30 ATC (ATITC) 4 bits/pixel compressed RGB texture format.
	'ATC_RGBA8',				# 31 ATC (ATITC) 8 bits/pixel compressed RGB texture format.
	'EAC_R',						# 32 ETC2 / EAC (GL ES 3.0) 4 bits/pixel compressed unsigned single-channel texture format.
	'EAC_R_SIGNED',			# 33 ETC2 / EAC (GL ES 3.0) 4 bits/pixel compressed signed single-channel texture format.
	'EAC_RG',						# 34 ETC2 / EAC (GL ES 3.0) 8 bits/pixel compressed unsigned dual-channel (RG) texture format.
	'EAC_RG_SIGNED',		# 35 ETC2 / EAC (GL ES 3.0) 8 bits/pixel compressed signed dual-channel (RG) texture format.
	'ETC2_RGB',					# 36 ETC2 (GL ES 3.0) 4 bits/pixel compressed RGB texture format.
	'ETC2_RGBA1',				# 37 ETC2 (GL ES 3.0) 4 bits/pixel RGB+1-bit alpha texture format.
	'ETC2_RGBA8',				# 38 ETC2 (GL ES 3.0) 8 bits/pixel compressed RGBA texture format.
	'ASTC_RGB_4x4',			# 39 ASTC (4x4 pixel block in 128 bits) compressed RGB texture format.
	'ASTC_RGB_5x5',			# 40 ASTC (5x5 pixel block in 128 bits) compressed RGB texture format.
	'ASTC_RGB_6x6',			# 41 ASTC (6x6 pixel block in 128 bits) compressed RGB texture format.
	'ASTC_RGB_8x8',			# 42 ASTC (8x8 pixel block in 128 bits) compressed RGB texture format.
	'ASTC_RGB_10x10',		# 43 ASTC (10x10 pixel block in 128 bits) compressed RGB texture format.
	'ASTC_RGB_12x12',		# 44 ASTC (12x12 pixel block in 128 bits) compressed RGB texture format.
	'ASTC_RGBA_4x4',		# 45 ASTC (4x4 pixel block in 128 bits) compressed RGBA texture format.
	'ASTC_RGBA_5x5',		# 46 ASTC (5x5 pixel block in 128 bits) compressed RGBA texture format.
	'ASTC_RGBA_6x6',		# 47 ASTC (6x6 pixel block in 128 bits) compressed RGBA texture format.
	'ASTC_RGBA_8x8',		# 48 ASTC (8x8 pixel block in 128 bits) compressed RGBA texture format.
	'ASTC_RGBA_10x10',	# 49 ASTC (10x10 pixel block in 128 bits) compressed RGBA texture format.
	'ASTC_RGBA_12x12',	# 50 ASTC (12x12 pixel block in 128 bits) compressed RGBA texture format.
	'ETC_RGB4_3DS',			# 51 ETC 4 bits/pixel compressed RGB texture format.
	'ETC_RGBA8_3DS',		# 52 ETC 4 bits/pixel RGB + 4 bits/pixel Alpha compressed texture format.
	'RG16',							# 53 Two color (RG) texture format, 8-bits per channel.
	'R8'								# 54 Scalar (R) render texture format, 8 bit fixed point.
]
