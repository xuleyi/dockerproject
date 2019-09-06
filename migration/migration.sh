echo "" > downtime.txt
sshpass -p "nuc" scp mi_h1.sh nuc2@192.168.1.1:~/project
sshpass -p "123456" scp mi_h2.sh ann@192.168.1.2:~/project


for ((i=0;i<50;i++));
do
sshpass -p "nuc" ssh nuc2@192.168.1.1 "cd ~/project; bash mi_h1.sh"
done
