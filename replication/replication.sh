echo '' > t1_rp.txt
echo '' > t2_rp.txt

sshpass -p "nuc" scp rprun.sh nuc2@192.168.1.1:~/project
sshpass -p "123456" scp rprun2.sh ann@192.168.1.2:~/project

#for ((i=0:i<50;i++))
#do
sshpass -p "nuc" ssh nuc2@192.168.1.1 "cd ~/project; bash rprun.sh"
#done
