docker run -d --name lntest myal:testln1
sleep 5
echo "run lntest for 5s"
echo "stop container, now start migration"

t1=$(date +%s.%N)
echo $t1
docker rm -f lntest

