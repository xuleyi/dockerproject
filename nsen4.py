from socket import *
import time

host  = '192.168.0.3'
port = 13141
bufsize = 1024

addr = (host,port)
udpClient = socket(AF_INET,SOCK_DGRAM)

i = 0
while i<1000:
    data = str(i)
    data = data.encode(encoding="utf-8") 
    udpClient.sendto(data,addr)
    print(data.decode(encoding="utf-8"))
#some_str = ' ' * 512000000
    bytearray(512000000)
    time.sleep(0.1)
    i += 1



udpClient.close()
