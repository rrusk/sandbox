#!/usr/bin/env python

import sys
import csv

if len(sys.argv) != 1:
  print "Usage: "+sys.argv[0]
  exit(1)

print "-- Add the following codes to Oscar icd9 table:"

icd9_dict = {}
new_codes = []

quote = '"'
delimiter = ','

with open('icd9_codes.csv', 'rb') as f:
    reader = csv.reader(f)
    for row in reader:
        if row[0] != '':
            icd9_dict[row[0]] = row[1]

with open('cms_icd9_codes.csv', 'rb') as f:
    reader = csv.reader(f)
    for row in reader:
        if row[0] != '':
            if row[0] not in icd9_dict:
                new_codes.append(row)

for row in new_codes:
    print "INSERT INTO icd9 (icd9, description) VALUES (" + quote + row[0] + quote + delimiter + quote + row[1] + quote + ");"

print "-- End"


