#!/bin/sh

inputFile=$1
outputFile1=$2
outputFile2=$3
outputFile3=$4

rm -f $outputFile1
rm -f $outputFile2
rm -f $outputFile3

i=1
while IFS=';' read -r key value1 value2 value3
do
	test $i -eq 1 && ((i=i+1)) && continue

	if [[ $key = '//'* ]]; then
	  	echo "$key" >> $outputFile1
	  	echo "$key" >> $outputFile2
	  	echo "$key" >> $outputFile3
  	else
  		#echo "$key = \"$value1\";" >> $outputFile1
  		#echo "$key = \"$value2\";" >> $outputFile2
  		#echo "$key = \"$value3\";" >> $outputFile3
  		printf '%s = "%s";\n' $key $value1 >> $outputFile1
  		printf '%s = "%s";\n' $key $value2 >> $outputFile2
  		printf '%s = "%s";\n' $key $value3 >> $outputFile3
  	fi
done < "$inputFile"