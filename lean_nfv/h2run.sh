shpass -p "123456" ssh ann@192.168.1.2 "cd ~/project; docker run -d --name lntest-clone -p 13141:13141/udp myal:testln2"

