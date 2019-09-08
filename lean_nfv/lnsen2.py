from socket import *
import time

host = '' 
port = 13141
bufsize = 1024
addr = (host,port) 

udpServer = socket(AF_INET,SOCK_DGRAM)
udpServer.bind(addr)

host2 = '192.168.1.3'
addr2 = (host2,port)
udpClient = socket(AF_INET,SOCK_DGRAM)

while True:
    print('Waiting for DC...')
    data,addr = udpServer.recvfrom(bufsize)
    data  = data.decode(encoding='utf-8').upper()
    t = int((time.time())*1000)
    print("update data",t)
    i = int(data) 
    while i<200:
        i += 1 
        data = str(i)
        data = data.encode(encoding="utf-8")
        udpClient.sendto(data,addr2)
        print(data.decode(encoding="utf-8"))
        time.sleep(1)

udpServer.close()



