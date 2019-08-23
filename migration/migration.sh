sshpass -p "nuc" scp mi_h1.sh nuc2@192.168.0.1:~/project
sshpass -p "123456" scp mi_h2.sh ann@192.168.0.2:~/project
sshpass -p "nuc" ssh nuc2@192.168.0.1 "cd ~/project; bash mi_h1.sh"
