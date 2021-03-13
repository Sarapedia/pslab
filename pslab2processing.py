#this example captures the readings from the HC-SR04 distance sensor and forwards it to processing via OSC

from PSL import sciencelab
import time
from pythonosc import udp_client
time.sleep(1) 
client = udp_client.SimpleUDPClient('127.0.1.1', 12345)
I = sciencelab.connect()
I.pwm_generator.set_state(sq1=True) # 5V to HC-SR04
while True:
    client.send_message("/inputs", I.estimateDistance())     
    #client.send_message("/inputs", I.multimeter.measure_resistance())
    time.sleep(1) 
