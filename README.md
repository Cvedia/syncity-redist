# What is this?

This is a compilation of demo scripts and helper functions for syncity simulator
intended to show case some test scenarios programatically built and at the same
time allow familiarizing with the command line interface.

# How to install?

This script requires python

### Linux install

On a ubuntu system you probably already have
that installed, to make sure just run:

`apt-get install python -y`

After that you might need to install some python libraries, just go to the folder
where you have the syncity scripts and run:

`pip install`

### Windows install

Download python 2.7 (python 3 will also work) here:

`https://www.python.org/ftp/python/2.7/python-2.7.amd64.msi`

After install you will have python and pip added to your PATH, then just open
a command prompt, go to the folder where you have syncity scripts and run:

`pip install`

# Running

python syncity_test_v2.py --help

Shows you a list of options, switches and so on. What you want to do first is
run a simple demo, keep in mind that you can run this script from a different
machine, as long it has access to the machine running the simulator.

We recommend you running the --help page so you can see a detailed description
of all demos currently available.

### Warning

The test script will output to the host where it's running but also will
output to the machine where the simulator is running, if you're running a
hybrid setup, make sure you set output paths correctly, as the python script
will detect the OS where it's being ran and set paths accordinly to it if no
specific paths are set.

### Examples

python syncity_test_v2.py --demo 0 --cooldown 0 --verbose -i 192.168.1.75 -p 10200 --record

This will run demo 0, with no cooldown time, showing all commands sent and
received (verbose), on the machine with ip 192.168.1.75 port 10200 (default)
and will record all commands sent to a file.

Depending on the demo you run it will also export files, those files will be
saved on the machine running the simulator, with the option -o you can configure
the path to write those files, this defaults to E:\tmp\

python syncity_test_v2.py --demo 0 --cooldown 0 --keep

By default, once the demo script is completed, it will delete all objects on
the scene, effectively reseting it, with --keep all objects will be kept so you
can interact with them after the demo is completed; This is ideal if you want
to experiment with different settings without bothering creating a full scenario.

python syncity_test_v2.py -r file.txt

Instead of running a demo, this will just run the commands on file.txt

