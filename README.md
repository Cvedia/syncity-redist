# What is this?

This is a compilation of sample scripts and helper functions for syncity simulator
intended to show case some test scenarios programatically built and at the same
time allow familiarizing with the command line interface.

As you learn how the system works, you can simply get one of the provided scripts
as base, place it under syncity/scripts/ folder to make it visible to the
controller script.

## Structure

- `syncity.py`: Main controller / spawner
- `syncity/`
  - `scripts/`: Scripts repository, check `template.py` as main reference
  - `tools/`: Tools repository, check `template.py` as main reference
  - `helpers.py`: Generic helpers for spawning objects and cameras
  - `common.py`: Telnet controller, output functions and other
  - `settings_manager.py`: Singleton for cross-module shared variables

# How to install?

This script requires python

### Linux install

On a ubuntu system you probably already have
that installed, to make sure just run:

`apt-get install python -y`

After that you might need to install some python libraries, just go to the folder
where you have the syncity scripts and run:

`pip install -r requeriments.txt`

### Windows install

Download python 2.7 (python 3 will also work) here:

`https://www.python.org/ftp/python/2.7/python-2.7.amd64.msi`

After install you will have python and pip added to your PATH, then just open
a command prompt, go to the folder where you have syncity scripts and run:

`pip install -r requeriments.txt`

# Running

`python syncity.py --help`

Shows you a list of options, switches and so on. What you want to do first is
run a simple script, keep in mind that you can run this script from a different
machine, as long it has access to the machine running the simulator.

We recommend you running the --help page so you can see a detailed description
of all scripts currently available.

### Warning

The test script will output to the host where it's running but also will
output to the machine where the simulator is running, if you're running a
hybrid setup, make sure you set output paths correctly, as the python script
will detect the OS where it's being ran and set paths accordinly to it if no
specific paths are set.

### Examples

`python syncity.py --script basic --cooldown 0 -i 192.168.1.75 -p 10200 --record`

This will run script basic (syncity/scripts/basic.py), with no cooldown time,
on the machine with ip 192.168.1.75 port 10200 (default)
and will record all commands sent to a file.

Depending on the script you run it will also export files, those files will be
saved on the machine running the simulator, with the option -o you can configure
the path to write those files, this defaults to E:\tmp\

`python syncity.py --script basic --cooldown 0 --keep`

By default, once the script script is completed, it will delete all objects on
the scene, effectively reseting it, with --keep all objects will be kept so you
can interact with them after the script is completed; This is ideal if you want
to experiment with different settings without bothering creating a full scenario.

`python syncity.py -r file.txt`

Instead of running a script, this will just run the commands on file.txt

# Reporting issues

We developed a special tool to generate meaningfull reports by collecting all
existing logs, initialization files, hashes, etc. If you happen to have a issue
with the simulator running the report tool will probably generate all information
required for us to debug the problem.

### Running report tool

`python syncity.py --tool report --binary <path to binary> --assets <path to assets>`

#### Example:

`python syncity.py --tool report --binary E:\syncity\windows-171211 --assets E:\syncity\assets-windows-171211`

#### Notes:

- If you happen to have a large collection of assets you can run this without the `assets` parameter.
- This script will save a `report_XXX.txt` on your `local_path` (defaults to tmp) that you should submit to our support
- No sensitive data will be collected using this tool, keep in mind that all syncity related logs will be sent
