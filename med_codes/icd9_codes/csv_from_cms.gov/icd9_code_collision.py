#!/usr/bin/env python

__author__ = 'rrusk'

import sys
import re

if len(sys.argv) != 1:
  print "Usage: " + sys.argv[0]+ " > output_file_name.csv"
  exit(1)

dict = {}

with open('CMS31_DESC_SHORT_DX.txt', 'rb') as f:
    lines = f.readlines()
    for line in lines:
        result = re.findall(r'(\w+) +(.+)', line)
        dict[result[0][0]]=result[0][1]


with open('CMS31_DESC_SHORT_SG.txt', 'rb') as f:
    lines = f.readlines()
    for line in lines:
        result = re.findall(r'(\w+) +(.+)', line)
        if result[0][0] in dict:
            print result[0][0]

