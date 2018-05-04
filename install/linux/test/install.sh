#!/bin/bash
apt install python3-logilab-common -y
python3 -m pip install -U pip pytest pytest_dependency pytest_ordering Image
