import sys
import csv

if len(sys.argv) != 2:
  print "Usage: "+sys.argv[0]+" prefix"
  exit(1)

atc_results = {}

print "\nFound these ATC codes:"

with open('ther.txt', 'rb') as f:
    reader = csv.reader(f)
    for row in reader:
	if row[1].upper().startswith(sys.argv[1].upper()):
	    atc_results[row[1]] = row[2]
with open('ther_ia.txt', 'rb') as f:
    reader = csv.reader(f)
    for row in reader:
	if row[1].upper().startswith(sys.argv[1].upper()):
	    atc_results[row[1]] = row[2]

for atc in sorted(atc_results.keys()):
    print atc, atc_results[atc]

print "\nPaste the following string into the guideline:"
i = 0
last = len(atc_results)
for atc in sorted(atc_results.keys()):
    i = i+1
    if i < last:
      print "atc:"+atc+",",
    else:
      print "atc:"+atc
