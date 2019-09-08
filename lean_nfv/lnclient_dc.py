from socket import *
import time

host = '' 
port = 13141
bufsize = 1024
addr = (host,port) 

udpServer = socket(AF_INET,SOCK_DGRAM)
udpServer.bind(addr)
udpServer.settimeout(5)

host2 = '192.168.0.2'
addr2 = (host2,port)

lst = []
i = 0
interval = 0
while True:
    try:
        print('Waiting for connection...')
        data,addr = udpServer.recvfrom(bufsize)
        data  = data.decode(encoding='utf-8').upper()
        t = int((time.time())*1000)
        lst.append(t)
        if len(lst)>2:
            interval = lst[-1] - lst[-2]    
            print('interval:',interval)
    except timeout:
        print("time out")
        udpServer.sendto(data,addr2)
        break
udpServer.close()


