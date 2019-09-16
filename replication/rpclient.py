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
    if (i==0):
        t0 = time.time()*1000
    if switch: 
        if (addr[0] == "192.168.1.1"):
            #record data rate of h1
            t1 = time.time()*1000-t0
            with open("./t1_rp.txt",'a+') as f_t1:
                f_t1.write(str(t1))
                f_t1.write('\n')
            val_h1.append(data) 
            val.append(data)
 #           print("val from h1",val_h1,"t1",t1)
        if (addr[0] == "192.168.1.2"):
            #record data rate of h2
            t2 = time.time()*1000-t0
            with open("./t2_rp.txt",'a+') as f_t2:
                f_t2.write(str(t2))
                f_t2.write('\n')
            val_h2.append(data)
            print("val_h2",val_h2) 
            if (int(data) == int(val_h1[len(val_h1)-1])):
                switch = False
    elif (addr[0] == "192.168.1.2"): 
        t2 = time.time()*1000-t0
        with open("./t2_rp.txt",'a+') as f_t2:
            f_t2.write(str(t2))
            f_t2.write('\n')
        val.append(data) 
#        print("val from h2",val,"t2",t2) 
    data  = data.decode(encoding='utf-8').upper()
    t = int((time.time())*1000)
    print("t is",t)
    lst.append(t)
    if len(lst)>2:
        interval = lst[-1] - lst[-2]    
       # print('interval:',interval)
    i += 1
    if (i == 100000000):
        break

udpServer.close()

print(lst)

