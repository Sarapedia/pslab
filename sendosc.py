
from pythonosc.udp_client import SimpleUDPClient
from pslab import ScienceLab
import time

ip = "127.0.0.1"
port = 12000
psl = ScienceLab()
client = SimpleUDPClient(ip, port)  # Create client
while True:
    res=psl.multimeter.measure_resistance()
    client.send_message("/some/address",psl.multimeter.measure_resistance())   # Send 
    time.sleep(1)
    print(res)


