#echo '' > t1_rp.txt
#echo '' > t2_rp.txt

sshpass -p "nuc" scp runln.sh nuc2@192.168.1.1:~/project

#sshpass -p "123456" ssh ann@192.168.1.2 "cd ~/project; docker run -d --name lntest-clone -p 13141:13141/udp myal:testln2"

gnome-terminal -x bash -c "bash h2run.sh; exec bash"
#for ((i=0:i<50;i++))
#do
#sshpass -p "nuc" ssh nuc2@192.168.1.1 "cd ~/project; bash run1ln.sh" 

gnome-terminal -x bash -c "bash crun.sh; exec bash"
#&& sshpass -p "123456" ssh ann@192.168.1.2 "cd ~/project; bash run2ln.sh"
#done

