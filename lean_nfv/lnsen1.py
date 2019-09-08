from socket import *
import time

host1  = '192.168.1.3'
host2 = '192.168.0.4'
port = 13141
bufsize = 1024

addr1 = (host1,port)
addr2 = (host2,port)
udpClient = socket(AF_INET,SOCK_DGRAM)

i = 0
while i<100:
    data = str(i)
    data = data.encode(encoding="utf-8") 
    udpClient.sendto(data,addr1)
    udpClient.sendto(data,addr2)
    print(data.decode(encoding="utf-8"))
    time.sleep(1)
    i += 1



udpClient.close()
