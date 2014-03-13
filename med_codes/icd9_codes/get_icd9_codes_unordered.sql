USE oscar_ontario;
SELECT icd9, description FROM icd9
INTO OUTFILE '/tmp/icd9_codes.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
