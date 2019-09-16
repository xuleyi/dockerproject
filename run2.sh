docker create --name test-clone myal:t5
#result2=$(sudo -S docker inspect -f '{{.Id}}' test-clone) 


docker start --checkpoint-dir=/tmp --checkpoint=checkpoint1 test-clone
echo "restart"

sshpass -p "nuc" ssh nuc2@192.168.0.1 "docker stop test"

sleep 10
docker stop test-clone
echo "123456" |sudo -S rm -rf /tmp/checkpoint1/
docker rm test-clone
