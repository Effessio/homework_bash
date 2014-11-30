grep log_for_task_4.log -e '200 [0-9]*.\w*$'|grep -e '[0-9]*-[0-9]*-[0-8]* 12'| grep ' /resume'| awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp1.log
echo 'сумма и среднее'
awk '{s+=$1} END {print s, s/NR}' < temp1.log
num_lines=$(wc -l < temp1.log)
line_95=$((num_lines*95/100))
line_99=$((num_lines*99/100))
echo '95 % квантиль'
sed $line_95'q;d' temp1.log
echo '99 % квантиль'
sed $line_99'q;d' temp1.log