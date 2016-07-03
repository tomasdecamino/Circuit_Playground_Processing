//data order:
//cap3(0),cap2(1),cap0(2),cap1(3),cap12(4),cap6(5),cap9(6),cap10(7),slide(8),
//button_left(9),button_right(10),light(11),sound(12),X(13),Y(14),Z(15),temp(16)


import processing.sound.*;
import processing.serial.*;

Serial port;
TriOsc [] note = new TriOsc[8];

String data;
int [] capSense= new int[8];
int slide, buttonLeft, buttonRight;
float light, sound, temp;
float aX, aY, aZ;

//Frequencies starting with middle C
float [] freq = {261.626, 293.665, 329.668, 349.228, 391.995, 440, 493.883, 523.251};


void setup() {
  println(Serial.list());
  //Seleccionar puerto de la lista
  port = new Serial(this, "/dev/ttyACM0", 9600);
  port.bufferUntil('\n');  //clear the buffer

  //start oscilators
  for (int i=0; i<8; i++) {
    note[i] = new TriOsc(this);
    note[i].play();
    note[i].freq(0);
  }



  size(1000, 500);
  ellipseMode(CENTER);
  background(0);
}

void draw() {
  //light changes background
  background(0, 250);
  //whenever a capacitive sensor is touched, plays a note
  for (int i=0; i<8; i++) {
    if (capSense[i]>50) note[i].freq(freq[i]); 
    else note[i].freq(0);
    note[i].amp(0.5);
    fill(capSense[i]);
    rect(i*width/8,0,width/8,height);
  }
}

void serialEvent(Serial port) {
  //cap3(0),cap2(1),cap0(2),cap1(3),cap12(4),cap6(5),cap9(6),cap10(7),slide(8),
  //button_left(9),button_right(10),light(11),sound(12),X(13),Y(14),Z(15),temp(16)
  data = port.readString();
  String[] list = split(data, ',');
  if (list.length==17) {
    capSense[0]=int(list[0]);
    capSense[1]=int(list[1]);
    capSense[2]=int(list[2]);
    capSense[3]=int(list[3]);
    capSense[4]=int(list[4]);
    capSense[5]=int(list[5]);
    capSense[6]=int(list[6]);
    capSense[7]=int(list[7]);
    slide=int(list[8]);
    buttonLeft=int(list[9]);
    buttonRight=int(list[10]);
    light=float(list[11]);
    sound=float(list[12]);
    aX=float(list[13]);
    aY=float(list[14]);
    aZ=float(list[15]);
    temp=float(list[16]);
  }
}