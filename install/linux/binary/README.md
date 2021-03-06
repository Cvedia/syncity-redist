## Intro

Before running the simulator on linux you need to install some dependencies, 
you should run the script as root, after it completes, it's recommended that you
restart your graphical interface or simply reboot to make sure all drivers
been loaded properly.

To install binary dependencies, as root, run:

`./install_binary_depends.sh`

The simulator requires OpenGL 4.5 or newer, depending on your linux install it
might not be available on the regular repositories, it's recommended that you
install the properietary drivers from either NVIDIA or AMD (depending on your
hardware) to get the latest OpenGL as the native MESA drivers currently only
support OpenGL 3.3.

To know what version of OpenGL is currently supported on your system, within 
a graphical interface terminal, run:

`glxinfo | grep OpenGL`

You will be looking for something like this:

```
OpenGL core profile version string: 4.5 (Core Profile) Mesa 17.2.0-devel - padoka PPA
OpenGL core profile shading language version string: 4.50
```

Note: It's important you don't confuse OpenGL core profile with OpenGL version string:

```
OpenGL version string: 3.0 Mesa 17.2.0-devel - padoka PPA
```

As version string, 3.0, is just the currently loaded driver.

## Installing MESA latest drivers

This is an alternate to installing properietary drivers, so it's not recommended
we're adding this as last resort option, this is for ubuntu 16:

```
add-apt-repository ppa:ubuntu-x-swat/updates && apt update && apt upgrade -y
```

## Running the binary

Syncity has it's own .so files that may not be on LD_PATH, if you run the
binary directly it might work, but not all modules would, so it's recommended
to run it using the helper script, like:

`./run.sh`

## Killing a stuck binary

`pkill -9 syncity`

## Logs and others

If you happen to have a issue it's critical to us to have log files to trace
your problem, there's 3 different log files generated by the system:

- Syncity.log - simulator logs
- SyncityProxy.log - command line / api logs
- syncity_Data/output_log.txt - simulator engine logs

In order to debug a problem we need to have all 3 logs.

## Simulator init script

The file syncity_Data/StreamingAssets/init.cl, is what instantiate the initial
components of the simulator, this usually sets the path to the assets and
add a telnet object with a configurable port and ip number.

The included default file should be good enough, but if you cannot access the 
command line, it worth looking into this file to make sure you have all
components properly set.

