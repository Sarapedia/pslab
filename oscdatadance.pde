import oscP5.*; // OSC
import netP5.*; // OSC

OscP5 oscP5; //OSC
Float OSCvalue=0.0; // We are expecting a float data so lets prepare some space for them

void setup(){
  size(800, 660); // size of your canvas
  background(0); //black background
  oscP5 = new OscP5(this,12000); //a new osc objekt listens to port 12000 
}
void draw(){
  if (OSCvalue>0)  
  background(255,0,0);//red background
  
  
  ellipse(100+abs(OSCvalue)*100,10+abs(OSCvalue)*200,10+abs(OSCvalue)*200,10+abs(OSCvalue)*200);
  ellipse(400+abs(OSCvalue)*100,200+abs(OSCvalue)*200,10+abs(OSCvalue)*200,10+abs(OSCvalue)*200);
  ellipse(600+abs(OSCvalue)/100,200+abs(OSCvalue)*200,10+abs(OSCvalue)*200,10+abs(OSCvalue)*200);
}
void oscEvent(OscMessage theOscMessage){
if(theOscMessage.checkAddrPattern("/sinus") == true) { // !!!!!! "/sinus"... the address must be the same like in the sender
          OSCvalue = theOscMessage.get(0).floatValue(); 
          print(" addrpattern: "+theOscMessage.addrPattern());
          print(" values: "+OSCvalue);
          return;
            }
}
