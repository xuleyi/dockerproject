
from socket import *
from time import ctime

host = '' 
port = 13141
bufsize = 1024
addr = (host,port) 

udpServer = socket(AF_INET,SOCK_DGRAM)
udpServer.bind(addr) 

while True:
    print('Waiting for connection...')
    data,addr = udpServer.recvfrom(bufsize)
    data = data.decode(encoding='utf-8').upper()
#    data = "at %s :%s"%(ctime(),data)
    udpServer.sendto(data.encode(encoding='utf-8'),addr)
    print('...recevied from and return to :',addr)

udpServer.close()
