t1=$(date +%s.%N)
echo $t1
sleep 1
t2=$(date +%s.%N)
echo $t2

echo "$t2 - $t1" | bc
