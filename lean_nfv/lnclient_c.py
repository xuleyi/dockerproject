from socket import *
import time

host = '' 
port = 13141
bufsize = 1024
addr = (host,port) 

udpServer = socket(AF_INET,SOCK_DGRAM)
udpServer.bind(addr)

lst = []
i = 0
interval = 0
fr = open("./record.txt", 'a+')
fd = open("./downtime.txt",'a+')
while True:
    print('Waiting for connection...')
    data,addr = udpServer.recvfrom(bufsize)
#    data  = data.decode(encoding='utf-8').upper()
    t1 = int((time.time())*1000)
    lst.append(t1)
    print("data",data)
    if len(lst)>2:
        interval = lst[-1] - lst[-2]    
        print('interval:',interval)
        fr.write("%d, %d, %d\n" % (lst[-2],lst[-1],interval))
        if (interval>3000):
            fd.write("%d\n" % interval)
    i += 1
    if (i == 100):
        break

fr.close()
fd.close()
udpServer.close()



