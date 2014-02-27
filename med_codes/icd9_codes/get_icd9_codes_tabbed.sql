USE oscar_ontario;
SELECT icd9, description FROM icd9
ORDER BY icd9
INTO OUTFILE '/tmp/icd9_codes.csv';
