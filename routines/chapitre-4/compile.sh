#!/bin/sh

python3 -m venv /tmp/mrw
source /tmp/mrw/bin/activate
pip install matplotlib numpy scipy

python3 mrw-transition.py
