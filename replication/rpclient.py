from socket import *
import time

host = '' 
port = 13141
bufsize = 1024
addr = (host,port) 

udpServer = socket(AF_INET,SOCK_DGRAM)
udpServer.bind(addr)

lst = []
val = []
val_h1 = []
val_h2 = []
switch = True
i = 0
f = open("./rectime.txt",'w+')
interval = 0
while True:
    print('Waiting for connection...')
    data,addr = udpServer.recvfrom(bufsize)
    if switch: 
        if (addr[0] == "192.168.0.1"):
            val_h1.append(data) 
            val.append(data)
        if (addr[0] == "192.168.0.2"):
            val_h2.append(data)
            if (int(data) >= int(val_h1[len(val_h1)-1])):
                switch = False
    elif (addr[0] == "192.168.0.2"):
        val.append(data)   
    print("val",val) 
    data  = data.decode(encoding='utf-8').upper()
    t = time.strftime('%H:%M:%S.%f')[:-3]
    t1 = int((time.time())*1000)
    lst.append(t1)
    if len(lst)>2:
        interval = lst[-1] - lst[-2]    
        print('interval:',interval)
    i += 1
    if (i == 100):
        break

udpServer.close()

print(lst)

