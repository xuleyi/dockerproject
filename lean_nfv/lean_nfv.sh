#echo '' > t1_rp.txt
#echo '' > t2_rp.txt

sshpass -p "nuc" scp run1ln.sh nuc2@192.168.1.1:~/project

#sshpass -p "123456" ssh ann@192.168.1.2 "cd ~/project; docker run -d --name lntest-clone myal:testln"

#for ((i=0:i<50;i++))
#do
sshpass -p "nuc" ssh nuc2@192.168.1.1 "cd ~/project; bash run1ln.sh" 
#&& sshpass -p "123456" ssh ann@192.168.1.2 "cd ~/project; bash run2ln.sh"
#done

#sleep 6
#sshpass -p "123456" ssh ann@192.168.1.2 "cd ~/project; docker rm -f lntest-clone"
