Please refeer to [https://docs.syncity.com/](https://docs.syncity.com/) for the full documentation.

## SDK

### Introduction

This [python](https://www.python.org/) toolset allows you to quickly learn how the command line works.

We've included plently of examples to solve specific scenarios while parameters are fully exposed allowing you to fine tune and experiment with them.

You don't necessarly need to develop your solution in python as the command line itself is a simple telnet interface to communicate with. 

### File Structure

- syncity.py
	- cl/
		*command line repository*
		- head/
		*all `syncity/scripts` scene setup outputs in command line format*
	- syncity/
		- scripts/
			*scripts repository, this is where your custom code should go*
		- tools/
			*custom tools assortment for reporting and assessing problems with the simulation*
		- helpers.py
			*A collection of helper functions*
		- common.py
			*Telnet and common functions*
		- settings_manager.py
			*settings singleton controller*
		- unity_vars.py
			*static unity variables repository*
	- etc/
		*repository of misc files*
	- install/
		*per platform / implementation easy install scripts*

### How to install

You can clone or download the SDK at [github](https://github.com/Cvedia/syncity-redist).

#### Linux install

Run `install/linux/sdk/install.sh`, this should automatically detect and install all packages you need.

#### Windows install

1. [Download python](https://www.python.org/downloads/windows/) - We recommend python 3+.
2. After install you will have python and pip added to your PATH, then just open a command prompt, go to the folder where you have syncity redistributables and run:

```bash
install/windows/sdk/install.bat
```

### Running

`python syncity.py --help`

Shows you a list of options, switches and so on. What you want to do first is run a simple script, keep in mind that you can run this script from a different machine, as long it has access to the machine running the simulator.

We recommend you running the --help page so you can see a detailed description of all scripts currently available.

#### Warning

By default the telnet based outputs will be placed where the python scripts are running, however, binary outputs, such as images will be placed on the machine where the simulator is running, that's why the SDK has 2 configurable output paths.

### Examples

`python syncity.py --script basic --cooldown 0 -i 192.168.1.75 -p 10200 --record`

This will run script basic (syncity/scripts/basic.py), with no cooldown time, on the machine with ip 192.168.1.75 port 10200 (default) and will record all commands sent to a file.

Depending on the script you run it will also export files, those files will be saved on the machine running the simulator, with the option -o you can configure the path to write those files, this defaults to E:\tmp\

`python syncity.py --script basic --cooldown 0 --keep`

By default, once the script script is completed, it will delete all objects on the scene, effectively reseting it, with --keep all objects will be kept so you can interact with them after the script is completed; This is ideal if you want to experiment with different settings without bothering creating a full scenario.

`python syncity.py -r file.txt`

Instead of running a script, this will just run the commands on file.txt

### Daisy chaining

You can run a combination of scripts, tools and cl in a chain using the SDK, this allows for very complex combinations avoiding you from running several commands at the same time. The order you send the arguments will be respected on the execution, for example:

```bash
python syncity.py \
     -r static_init.cl \
     -s loop1 \
     -t gallery \
     -r static_scenario.cl fixes.cl \
     -s loop2 loop3 \
     -t gallery
```

This will run, in order:
- A local `static_init.cl` file
- A python script `loop1` (syncity/scripts/loop1.py)
- Gallery tool
- Local scripts `static_scenario.cl` followed by `fixes.cl`
- A python script `loop2` (syncity/scripts/loop2.py) followed by `loop3` (syncity/scripts/loop3.py)
- Gallery tool


### Creating your own script / tool

If you want to use our SDK as base for your development you can check `scripts/template.py` and `tools/template.py` as base to create a script or a tool. All you have to do is place the file on it's respective folder and call it from the main controller, like:

`python syncity.py -s my_custom_script`

Where my_custom_script is located at `syncity/scripts/my_custom_script.py`

## Reporting issues

We developed a special tool to generate meaningfull reports by collecting all existing logs, initialization files, hashes, etc. If you happen to have a issue with the simulator running the report tool will probably generate all information required for us to debug the problem.

### Running report tool

`python syncity.py --tool report --binary <path to binary> --assets <path to assets>`

#### Example:

`python syncity.py --tool report --binary E:\syncity\windows-171211 --assets E:\syncity\assets-windows-171211`

#### Notes:

- If you happen to have a large collection of assets you can run this without the `assets` parameter.
- This script will save a `report_XXX.txt` on your `local_path` (defaults to tmp) that you should submit to our support
- No sensitive data will be collected using this tool, keep in mind that all syncity related logs will be sent
- The SDK should work with python 2, but it's support is no longer provided, make sure you're running python 3+.


### Argument list

Here's a list of all currently supported arguments, of course you can find it by running `python syncity.py -h`:

```
SynCity toolbox - v18.04.05.1828
Copyright (c) 2016-2018 CVEDIA PVE Ltd

usage: syncity.py [-h] [-p PORT] [-i IP] [-s SCRIPT [SCRIPT ...]]
                  [-t TOOL [TOOL ...]] [-r RUN [RUN ...]]
                  [--cooldown COOLDOWN] [-o OUTPUT_PATH] [-l LOCAL_PATH] [-q]
                  [-n] [-Z] [-A ASSETS] [--db DB] [--seed_py SEED_PY]
                  [--seed_api SEED_API] [--interactive] [--keep] [-R]
                  [--record [RECORD]] [-b] [-d] [-L LOGLEVEL] [--debug]
                  [--log [LOG]] [--async] [--skip_init] [--skip_disk]
                  [--skip_setup] [-c CONFIG] [--skip_config] [--save_config]
                  [--setup_only] [--enable_physics] [--enable_console_log]
                  [--disable_envirosky] [--disable_canvas]
                  [--use_old_depth_buffer] [--flycam] [--nohead]
                  [--carsLimit CARSLIMIT] [--propsLimit PROPSLIMIT]
                  [--signsLimit SIGNSLIMIT] [--treesLimit TREESLIMIT]
                  [--backdropsLimit BACKDROPSLIMIT] [--X_COMP X_COMP]
                  [--Y_COMP Y_COMP] [--Z_COMP Z_COMP] [-v]
                  [--loop_limit LOOP_LIMIT] [--disable_ros]
                  [--lidar_ip LIDAR_IP] [--disable_lidar] [--enable_cube]
                  [--binary BINARY] [--asset_file ASSET_FILE]

This script allows experimentation, recording and playback of scripted events 
using syncity simulator telnet api. We also added some demos that show case 
different specific features of the api.

You can pipe multiple scripts, tools and command line (-r , --run) files on the 
same run, this script will respect the order of the arguments even if they are 
interleaved with each other, this allows for very flexible pipelines, for 
example:

`syncity.py -r path/to/my.cl -s 360 -t gallery -s something something_else -r 
other.cl -s 360 -t gallery`

optional arguments:
  -h, --help            show this help message and exit
  -p PORT, --port PORT  Port to connect, defaults to 10200
  -i IP, --ip IP        IP of syncity simulator
  -s SCRIPT [SCRIPT ...], --script SCRIPT [SCRIPT ...]
                        Defines one or more python scripts to run
  -t TOOL [TOOL ...], --tool TOOL [TOOL ...]
                        Defines one or more tools to run
  -r RUN [RUN ...], --run RUN [RUN ...]
                        Defines one or more command line (.cl) script to run
  --cooldown COOLDOWN   Cooldown after snapshot
  -o OUTPUT_PATH, --output OUTPUT_PATH
                        Defines output path for snapshots, note that this path
                        is relative to the machine running the simulator,
                        defaults to /tmp/
  -l LOCAL_PATH, --local_path LOCAL_PATH
                        Defines local output path for recordings, json
                        exports, etc; This path is relative to the machine
                        running this script, defaults to /tmp/
  -q, --quiet           Quiet mode
  -n, --no_color        Disable color output
  -Z, --abort_on_error  Abort execution on error
  -A ASSETS, --assets ASSETS
                        Defines assets folder name
  --db DB               Defines database folder name, if not set will follow
                        --assets, if --assets is not defined, this value will
                        not be touched
  --seed_py SEED_PY     Defines a seed number for random methods on python
                        layer. Note that this will be treated as a string.
  --seed_api SEED_API   Defines a seed number for random methods on api layer.
  --interactive         Drops to a interactive shell after executing stack or
                        when interrupted.
  --keep                Keep created assets on scene
  -R, --reset           Resets simulator before running anything on stack
  --record [RECORD]     Record commands sent to API using --local_path as
                        output path when no parameters sent, or defines a
                        filename to write to
  -b, --benchmark       Enables benchmarking on API reply time
  -d, --dry_run         Pretends to run, but never send any command thuru
                        telnet
  -L LOGLEVEL, --loglevel LOGLEVEL
                        Minimum log level to display / log.
  --debug               Defines a global debug flag, this will cause a lot of
                        outputs
  --log [LOG]           Log all IOs, if a parameter is specified this will log
                        to a specific file
  --async               Send some telnet commands asyncronously --
                        EXPERIMENTAL
  --skip_init           Disables telnet init sequence
  --skip_disk           Disables disk export completly
  --skip_setup          Skip script setup and go straight to data extraction
  -c CONFIG, --config CONFIG
                        Defines a path/filename for syncity.conf
  --skip_config         Skips SDK default config file
  --save_config         Save sent parameters as SDK config file -- WARNING:
                        This will not save the stack parameters (-r, -s and
                        -t)
  --setup_only          Runs script setup and exits
  --enable_physics      Enable Physics, mainly affects objects with
                        rigidbodies.
  --enable_console_log  Enable UI console log
  --disable_envirosky   Disables Envirosky -- NOT RECOMMENDED
  --disable_canvas      Disables client rendering visualization, better for
                        performance, but you will only see outputs written to
                        disk.
  --use_old_depth_buffer
                        Uses old depth buffer component
  --flycam              Spawns fly cam, controllable via simulator
  --nohead              Disables header outputs on log / record
  --carsLimit CARSLIMIT
                        Spawn cars into scene, defaults to 100
  --propsLimit PROPSLIMIT
                        Spawn props into scene, defaults to 250
  --signsLimit SIGNSLIMIT
                        Spawn signs into scene, defaults to 250
  --treesLimit TREESLIMIT
                        Spawn trees into scene, defaults to 250
  --backdropsLimit BACKDROPSLIMIT
                        Spawn backdrops into scene, defaults to 50
  --X_COMP X_COMP       Spawner X Compensation, defaults to 0
  --Y_COMP Y_COMP       Spawner Y Compensation, defaults to 1
  --Z_COMP Z_COMP       Spawner Z Compensation, defaults to 0
  -v, --version         Shows current SDK version, can be combined with -i and
                        -p to get simulator version


```

