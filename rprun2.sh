docker create --name rptest-clone myal:t7
docker start --checkpoint-dir=/tmp --checkpoint=checkpoint2 rptest-clone
echo "restart"
sshpass -p "nuc" ssh nuc2@192.168.1.1 "docker container stop rptest; docker \
container rm rptest"

t3=$(date +%s.%N)
echo "t3: $t3"
echo $t3 > migrationtime_rp.txt

sleep 9
docker container stop rptest-clone

echo "123456" |sudo -S rm -rf /tmp/checkpoint2/
docker rm rptest-clone
