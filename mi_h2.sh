docker create --name test-clone myal:testdow
#result2=$(sudo -S docker inspect -f '{{.Id}}' test-clone) 

docker start --checkpoint-dir=/tmp --checkpoint=checkpoint1 test-clone
echo "restart"

t3=$(date +%s.%N)
echo "t3: $t3"
echo $t3 > migrationtime_mi.txt

sleep 3
docker stop test-clone
echo "123456" |sudo -S rm -rf /tmp/checkpoint1/
docker rm test-clone
