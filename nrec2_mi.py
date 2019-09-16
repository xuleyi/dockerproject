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
fr = open("./record.txt", 'w+')
fd = open("./downtime.txt",'w+')
f_t1 = open("./t1_mi.txt",'w+')
f_t2 = open("./t2_mi.txt",'w+')
while True:
    print('Waiting for connection...')
    data,addr = udpServer.recvfrom(bufsize)
    if (addr[0] == "192.168.1.1"):
        t1 = time.time()
        f_t1.write(str(t1))
        f_t1.write('\n')
   #     lst_t1.append(t1) 
    if (addr[0] == "192.168.1.2"):
        t2 = time.time()
        f_t2.write(str(t2))
        f_t2.write('\n')
    data  = data.decode(encoding='utf-8').upper()
#    t = time.strftime('%H:%M:%S.%f')[:-3];
    t = int((time.time())*1000)
    lst.append(t)
    if len(lst)>2:
        interval = lst[-1] - lst[-2]    
        print('interval:',interval)
       # print(type(lst[-1]))
        fr.write("%d, %d, %d\n" % (lst[-2],lst[-1],interval))
        if (interval>3000):
            fd.write("%d\n" % interval)
    i += 1
    if (i == 100):
        break
    
fr.close()
fd.close()
udpServer.close()



