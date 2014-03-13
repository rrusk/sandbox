#!/bin/sh
filename='cmsv31-master-descriptions.zip'
if [ -e $filename ]; then
  mv $filename $filename.old
fi
wget http://www.cms.gov/Medicare/Coding/ICD9ProviderDiagnosticCodes/Downloads/$filename
unzip $filename
