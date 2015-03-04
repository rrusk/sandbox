#!/usr/bin/env python

import sys
import re

if len(sys.argv) != 1:
  print "Usage: " + sys.argv[0]+ " > output_file_name.csv"
  exit(1)

quote = '"'
delimiter = ','

with open('CMS32_DESC_SHORT_DX.txt', 'rb') as f:
    lines = f.readlines()
    for line in lines:
        result = re.findall(r'(\w+) +(.+)', line)
        print quote + result[0][0] + quote + delimiter + quote + result[0][1].upper() + quote
