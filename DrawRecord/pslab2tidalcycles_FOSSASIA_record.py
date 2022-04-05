 #example of capturing sensordata from the HC-SR04 distance sensor and forwarding it to TidalCycles via OSC 

from pslab import ScienceLab
from pslab.external.HCSR04 import HCSR04
import time
from pythonosc import udp_client
time.sleep(1)
client = udp_client.SimpleUDPClient('127.0.0.1', 6010) #TidalCycles expects port 6010
psl = ScienceLab()
#distance_sensor = HCSR04(psl)
psl.pwm_generator.set_state(sq2=True) # 5V to HC-SR04
while True:
    #client.send_message("/ctrl", ["HCSR04", distance_sensor.estimate_distance()])
    #print(distance_sensor.estimate_distance())
    client.send_message("/ctrl", ["VOLT", psl.multimeter.measure_voltage()])
    time.sleep(0.1)



