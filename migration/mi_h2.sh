docker create --name test-clone myal:testdow
#result2=$(sudo -S docker inspect -f '{{.Id}}' test-clone) 

#t2_1=$(date +%s.%N)
docker start --checkpoint-dir=/tmp --checkpoint=checkpoint1 test-clone
#echo "restart"

#cleanup source container
#sshpass -p "nuc" ssh nuc2@192.168.1.1 "docker container stop test; docker \
#container rm test; echo "nuc" |sudo -S rm -rf /tmp/checkpoint1/"

t2=$(date +%s.%N)
echo "t2: $t2"

echo $t2 >> mi_t2.txt

sleep 3
docker stop test-clone
echo "123456" |sudo -S rm -rf /tmp/checkpoint1/
docker rm test-clone
