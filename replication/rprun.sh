docker run -d --name rptest myal:testdow
sleep 5

t1=$(date +%s.%N)
echo $t1

docker checkpoint create --checkpoint-dir=/tmp --leave-running rptest checkpoint2
echo "nuc" | sudo -S chmod 666 /tmp/checkpoint2/criu.work/dump.log
sshpass -p 123456 scp -r /tmp/checkpoint2 ann@192.168.1.2:/tmp
echo "checkpoint2 copied"
sshpass -p "123456" ssh ann@192.168.1.2 "cd ~/project; bash rprun2.sh"


echo "nuc" |sudo -S rm -rf /tmp/checkpoint2/

#t2=$(date +%s.%N)
#echo "t2: $t2"
#echo "$t2 - $t1" | bc


