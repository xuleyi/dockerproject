docker create --name rptest-clone myal:t6
docker start --checkpoint-dir=/tmp --checkpoint=checkpoint2 rptest-clone
echo "restart"
sshpass -p "nuc" ssh nuc2@192.168.0.1 "docker container stop rptest"

sleep 9
docker container stop rptest-clone

#echo "123456" |sudo -S rm -rf /tmp/checkpoint2/
#docker rm rptest-clone
