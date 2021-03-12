from pythonosc.udp_client import SimpleUDPClient
import numpy as np
import time

ip = "127.0.0.1"
port = 12000

x = np.linspace(0, 20, 100)  # Create a list of evenly-spaced numbers over the range

data = np.sin(x)
client = SimpleUDPClient(ip, port)  # Create client   
i = 99
while i > 1:
    client.send_message("/sinus", data[i])  
    time.sleep(3)
    #print(data)
    print (data[i])
    i=i-1