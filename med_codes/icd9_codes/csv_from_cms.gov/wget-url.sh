#!/bin/sh
filename='cmsv31-master-descriptions.zip'
if [ -e $filename ]; then
  mv $filename $filename.old
fi
echo "Downloading from http://www.cms.gov/Medicare/Coding/ICD9ProviderDiagnosticCodes/codes.html"
wget http://www.cms.gov/Medicare/Coding/ICD9ProviderDiagnosticCodes/Downloads/$filename
unzip $filename
