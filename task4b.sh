#!/bin/sh
grep $1 -e $2 | grep -e 'id=43' | awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp2.log
echo 'среднее'
awk '{s+=$1} END {print s/NR}' < temp2.log
echo 'медиана'
num_lines=$(wc -l < temp2.log)
if [[ $((num_lines%2)) -eq 0 ]]; then
	bef=$(sed $((num_lines/2))'q;d' temp2.log)
	bef=${bef%.*}
	aft=$(sed $((num_lines/2+1))'q;d' temp2.log)
	aft=${aft%.*}
	echo $(((bef+aft)/2))
else
	sed $((num_lines/2+1))'q;d' temp2.log
fi
rm temp2.log