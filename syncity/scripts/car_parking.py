from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()


def help():
    return '''\
Parking exporter

You should run this script after the scene built by cl/car_parking.cl is ready. This
will setup the image exporter and start producing data.
'''


def args(parser):
    try:
        parser.add_argument('--loop_limit', type=int, default=500, help='Defines a limit of iterations for exporting')
    except:
        pass
    try:
        parser.add_argument('--reshuffle_frames_frequency', type=int, default=40,
                            help='Defines a number of frames after which the objects will be reshuffled')
    except:
        pass
    try:
        parser.add_argument('--line_layout', default=None,
                            help='Set this to spawn cars in a line layout instead of perpendicular')
    except:
        pass


def minVersion():
    return '18.07.26.0000'


def run():
    loop = 0
    mycams = ['Camera/Segmentation', 'Camera/RGB', 'Camera/Thermal']

    if settings.line_layout:
        common.sendData('"Cars-Left" PUSH RandomProps.Spawners.PropArea fixedRotations (0 -5~5 0) (0 175~185 0)')
        common.sendData('"Cars-Right" PUSH RandomProps.Spawners.PropArea fixedRotations (0 -5~5 0) (0 175~185 0)')
    else:
        common.sendData('"Cars-Left" PUSH RandomProps.Spawners.PropArea fixedRotations (0 85~95 0) (0 265~275 0)')
        common.sendData('"Cars-Right" PUSH RandomProps.Spawners.PropArea fixedRotations (0 85~95 0) (0 265~275 0)')


    common.sendData('REGEX "Cars-.*" SET active true')
    common.sendData('REGEX "Cars-.*/.*/Reflection Probe" SET active true')
    common.sendData('REGEX "Cars-.*/.*/Reflection Probe" SET ReflectionProbe enabled true')
    common.sendData('REGEX "Cars-.*/.*/Reflection Probe" SET transform localEulerAngles (0 0~180 0) localPosition (0 0 0)')

    common.sendData([  # work around for preventing the export of an "old" frame
        'CREATE "dummy"',
        '"dummy" SET active true'
    ])

    if settings.skip_setup == False:
        common.sendData('"AssetBundles.GameobjectCache" SET AssetBundles.GameobjectCache cachedObjectsLimit {}'.format(
            settings.cache_limit))

        helpers.addDataExport(
            imageLinks=helpers.cameraExportParametrize(mycams, "image"),
            fieldLinks=[
                {
                    "target": "dummy",
                    "label": "dummy",
                    "componentName": "Transform",
                    "fieldName": "position",
                    "onChange": True
                }
            ]
        )

    # loop changing camera positions with random agc bounduaries
    while loop < settings.loop_limit:
        common.sendData([
            'REGEX "Cars-.*/.*/Reflection Probe" SET active true',
            'REGEX "Cars-.*/.*/Reflection Probe" SET ReflectionProbe enabled true',
            'REGEX "Cars-.*/.*/Reflection Probe" SET transform localEulerAngles (0 0~180 0) localPosition (0 0 0)',
            'NOOP'
            '"Camera" SET Transform localEulerAngles (-2~0 -5~5 -3~3)',
        ])

        if loop > 0 and loop % settings.reshuffle_frames_frequency == 0:
            common.sendData([
                'REGEX "Cars-.*" SET active false',

                'REGEX "Cars-.*" SET active true',

                # disable reflection probes in new spawned cars
                # 'REGEX "^Cars$/.*/Reflection Probe" SET ReflectionProbe enabled false'
                # ...or enable them
                'REGEX "Cars-.*/.*/Reflection Probe" SET active true',
                'REGEX "Cars-.*/.*/Reflection Probe" SET ReflectionProbe enabled true',
                'REGEX "Cars-.*/.*/Reflection Probe" SET transform localEulerAngles (0 0~180 0) localPosition (0 0 0)',

                # ...or update them to be less heavy
                # 'REGEX "^Cars$/.*/Reflection Probe" SET ReflectionProbe boxProjection false farClipPlane 70 size (50 50 50) resolution 128 hdr false enabled true',
            ])


        # common.sendData("SLEEP 1")

        # intentionally last as this will trigger data export
        common.sendData('"Camera" SET Transform localPosition (-1~1 0.5~2 -2~-1)')
        common.sendData(['NOOP', 'NOOP'])
        # intentionally last as this will trigger data export
        common.sendData('"dummy" SET Transform position (0~100 0~100 0~100)"')
        common.sendData('NOOP')
        common.output('Loop {} ({}%)'.format(loop, round(100 * (loop / settings.loop_limit), 2)))

        loop += 1
