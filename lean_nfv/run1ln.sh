#sshpass -p vw4 ssh vw4@192.168.0.4 "cd ~/project; python lnclient_dc.py"

docker run -d --name lntest myal:testdow
echo "run lntest"
sleep 2

t1=$(date +%s.%N)
echo $t1

docker stop lntest 
docker rm lntest



