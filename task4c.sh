#!/bin/sh
rm ex.dat
touch ex.dat
for i in $(seq -w 0 23)
do
	gv="$2 $i"
	echo "$gv"
	grep $1 -e "$gv"| grep '/resume'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
	num_lines=$(wc -l < temp1.log)
	line_95=$((num_lines*95/100))
	res=$(sed $line_95'q;d' temp1.log)
	res=${res%.*}
	grep $1 -e "$gv"| grep '/user'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
	num_lines=$(wc -l < temp1.log)
	line_95=$((num_lines*95/100))
	usr=$(sed $line_95'q;d' temp1.log)
	usr=${usr%.*}
	grep $1 -e "$gv"| grep '/vacancy'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
	num_lines=$(wc -l < temp1.log)
	line_95=$((num_lines*95/100))
	vac=$(sed $line_95'q;d' temp1.log)
	vac=${vac%.*}
	echo $i $res $usr $vac >> ex.dat
done
rm temp1.log
cat << __EOF | gnuplot
 plot 'ex.dat' u 1:2 w linesp title 'resume', 'ex.dat' u 1:3 w linesp title 'users', 'ex.dat' u 1:4 w linesp title 'vacancy'
pause 1000
__EOF