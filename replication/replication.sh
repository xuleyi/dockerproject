sshpass -p "nuc" scp rprun.sh nuc2@192.168.0.1:~/project
sshpass -p "123456" scp rprun2.sh ann@192.168.0.2:~/project
sshpass -p "nuc" ssh nuc2@192.168.0.1 "cd ~/project; bash rprun.sh"
