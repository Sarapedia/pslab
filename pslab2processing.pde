

import oscP5.*;
    import netP5.*;

    OscP5 oscP5;
    Float OSCvalue = 0.0;
    
    void setup() {
      frameRate(30);
      size(320, 240, P3D);
      oscP5 = new OscP5(this,12345);
    }
    void draw() {
      background(255);
      noStroke();
      fill(255, 0, 0);
      //circle(width/2, height/2, OSCvalue*50);
      lights();
      translate(width/2, height/2, 0);
      if (OSCvalue<=5){
      rotateY(OSCvalue);  
      box(100);}
    }
    
    void oscEvent(OscMessage theOscMessage) {
      if(theOscMessage.checkAddrPattern("/inputs") == true) {
          OSCvalue = theOscMessage.get(0).floatValue();
          println(" values: "+OSCvalue);
          return;
        }
    }
