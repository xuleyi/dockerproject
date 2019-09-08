docker run -d --name test myal:testdow
sleep 4

t1=$(date +%s.%N)
echo "t1: $t1"
echo $t1 >> mi_t1.txt

docker checkpoint create --checkpoint-dir=/tmp test checkpoint1
result1=$(docker inspect -f '{{.Id}}' test)
echo $result1

echo "nuc" |sudo -S chmod 666 /tmp/checkpoint1/criu.work/dump.log
sshpass -p 123456 scp -r /tmp/checkpoint1/ ann@192.168.1.2:/tmp

echo "checkpoint copied 1"


docker rm test && echo "nuc" |sudo -S rm -rf /tmp/checkpoint1/ && sshpass -p "123456" ssh ann@192.168.1.2 "cd ~/project; bash mi_h2.sh"







