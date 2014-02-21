#!/bin/sh
wget http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/ther.zip || curl -O http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/ther.zip
unzip ther.zip
wget http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/ther_ia.zip || curl -O http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/ther_ia.zip
unzip ther_ia.zip
