import oscP5.*; // OSC
import netP5.*; // OSC

OscP5 oscP5; //OSC
Float OSCvalue=0.0; //OSC


void setup(){
  size(640, 360);
  background(0);
  oscP5 = new OscP5(this,12000);
}
void draw(){
  
  
  if (OSCvalue>0)
  background(255,0,0);
  
  
  textAlign(CENTER);
  
  String s=String.valueOf(OSCvalue);  
  
  text(s, 133,133);
}

void oscEvent(OscMessage theOscMessage){
if(theOscMessage.checkAddrPattern("/some/address") == true) {
          OSCvalue = theOscMessage.get(0).floatValue();
          print(" addrpattern: "+theOscMessage.addrPattern());
          print(" values: "+OSCvalue);
          return;
        
    }
}
