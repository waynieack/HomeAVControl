#!/usr/bin/python
## This script is so xbmc can run a shell script. xbmc requires a python script.
import sys
import os
os.system(sys.argv[1] + " " + sys.argv[2])
