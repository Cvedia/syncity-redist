# Introduction

This is the common test function kit, it works with `config.json` that exists
on the same folder; The intention is setup the SDK systems to behavior, disabling
shutdown hooks while preserving the majority of the functions so we don't need
to maintain 2 of the same.

Any common functions on the tests should be added at `tcommon.py`, if you're
using a specific function only one time, you should keep it on the test it's
running, otherwise it should be added to this file. Any image manipulation / checks
should be also added here, as they would be very common in the validation process.

Make sure you take advantage of the existing config parameters for paths for
both the simulator and the SDK.

Finally, keep in mind that the test should only run on the same machine that
the simulator is running, different from the SDK, having distinct paths that
are not accessible by the SDK will cause tests that relay on files to falsely
fail as no files will be found at `config.output_path`.

# Guidelines

Tests should be simple and FAST, ideally you'd start creating a simple test that
scales into something more complex, where the complex test depends on one or more
simpler tests, this way you break the funcionality apart in logical simple components
instead of testing a monolithic piece that might be very hard to trace.

I recommend you read the [pytest docs](https://docs.pytest.org/en/latest/) to familiarize
yourself with how it works and how marks work.

If you see that there's a recurring issue or a new feature you just wrote that
worth a test, create a new test file, it's important you comment it properly so
one failing the test can quickly understand what happened.

All tests should be a closed loop, meaning that if they suceeded they must teardown
anything they created, including game objects and others, this way we can run
several tests on the same instance without trashing it.

If a test fails it's desired that it leaves trash components and game objects
behind, as this would help debugging the problem, the reproducible steps for that
failed run will also be available on the `logs` folder, including the commands
sent and returns from the simulator.

# Logs and errors

pytest will not output everything from the SDK, as it's intended to be a testing
automation tool and not to pretty print shit, for that, this script will initialize
the logging and recording mechanism of the SDK on every telnet invoke, this will
create a log_<timestamp>.txt and record_<timestamp>.txt under `config.local_path`
which you can use to do indepth debugging and replicate the CL commands sent.

Added to this there's the pytest logs themselves that are stored under `logs`
within this folder, ideally you'd set your `config.local_path` to the same
location (this is the default), the pytest files are prefixed named as
`pytest_<timestamp>.txt`.

More configurables for pytest can be found under `pytest.ini`

# Automation, automatic testing and continuos integration

You shouldn't run the full test suite locally, this might take a long time to
complete and you might not have all the assets needed, however, if you happen to
do a huge change that you consider affecting several areas, it's recommended you
do it so.

Once the jenkins automation is completed, any pushes to the watched branches on
plastic will be subject to automated tests, those fall into a queue and will be
continuously performed, so you don't have to wait for results to come in, you
can still coding until further notice from the testing system. There will be
more insight information like timings and warning tracking when the CI is completed.

Runing single-test or targeted tests locally is recommended, specially when you're
changing API or components used on the API, you can run it like:

`python -m pytest -vv <test_file.py>`

# SDK vs Simulator tests

Unless stated by the test filename, `test_sdk_<testname>`, all tests are simulator
centric.
