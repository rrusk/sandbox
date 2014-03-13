#!/usr/bin/env python

import sys
import csv

if len(sys.argv) != 1:
  print "Usage: " + sys.argv[0]+ " > output_file_name.csv"
  exit(1)

dict = {}

with open('ther.txt', 'rb') as f:
    reader = csv.reader(f)
    for row in reader:
	if row[1] != '':
	    dict[row[1]] = row[2]

with open('ther_ia.txt', 'rb') as f:
    reader = csv.reader(f)
    for row in reader:
	if row[1] != '':
	    dict[row[1]] = row[2]

quote = '\"'

for atc in sorted(dict.keys()):
    print quote+atc+quote+","+quote+dict[atc]+quote
