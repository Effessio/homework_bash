#!/bin/sh
rm -rf ex.dat
touch ex.dat
grep log_for_task_4.log -e '2013-01-18 11'| grep '/resume'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
num_lines=$(wc -l < temp1.log)
line_95=$((num_lines*95/100))
res=$(sed $line_95'q;d' temp1.log)
res=${res%.*}
grep log_for_task_4.log -e '2013-01-18 11'| grep '/user'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
num_lines=$(wc -l < temp1.log)
line_95=$((num_lines*95/100))
usr=$(sed $line_95'q;d' temp1.log)
usr=${usr%.*}
grep log_for_task_4.log -e '2013-01-18 11'| grep '/vacancy'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
num_lines=$(wc -l < temp1.log)
line_95=$((num_lines*95/100))
vac=$(sed $line_95'q;d' temp1.log)
vac=${vac%.*}
echo 11 $res $usr $vac >> ex.dat

grep log_for_task_4.log -e '2013-01-18 11'| grep '/resume'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
num_lines=$(wc -l < temp1.log)
line_95=$((num_lines*95/100))
res=$(sed $line_95'q;d' temp1.log)
res=${res%.*}
grep log_for_task_4.log -e '2013-01-18 11'| grep '/user'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
num_lines=$(wc -l < temp1.log)
line_95=$((num_lines*95/100))
usr=$(sed $line_95'q;d' temp1.log)
usr=${usr%.*}
grep log_for_task_4.log -e '2013-01-18 11'| grep '/vacancy'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
num_lines=$(wc -l < temp1.log)
line_95=$((num_lines*95/100))
vac=$(sed $line_95'q;d' temp1.log)
vac=${vac%.*}
echo 12 $res $usr $vac >> ex.dat

grep log_for_task_4.log -e '2013-01-18 13'| grep '/resume'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
num_lines=$(wc -l < temp1.log)
line_95=$((num_lines*95/100))
res=$(sed $line_95'q;d' temp1.log)
res=${res%.*}
grep log_for_task_4.log -e '2013-01-18 13'| grep '/user'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
num_lines=$(wc -l < temp1.log)
line_95=$((num_lines*95/100))
usr=$(sed $line_95'q;d' temp1.log)
usr=${usr%.*}
grep log_for_task_4.log -e '2013-01-18 13'| grep '/vacancy'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
num_lines=$(wc -l < temp1.log)
line_95=$((num_lines*95/100))
vac=$(sed $line_95'q;d' temp1.log)
vac=${vac%.*}
echo 13 $res $usr $vac >> ex.dat
rm -rf temp1.log

cat << __EOF | gnuplot
 plot 'ex.dat' u 1:2 w linesp title 'resume', 'ex.dat' u 1:3 w linesp title 'users', 'ex.dat' u 1:4 w linesp title 'vacancy'
pause 1000
__EOF