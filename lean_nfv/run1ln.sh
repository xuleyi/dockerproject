docker run -d --name lntest myal:testln1 && sshpass -p vw4 ssh vw4@192.168.0.4 "cd ~/project; python lnclient_dc.py &" 

wait
echo "run lntest"
sleep 2

t1=$(date +%s.%N)
echo $t1

docker rm -f lntest



