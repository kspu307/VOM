import processing.serial.*;
Serial serial; // создаем объект последовательного порта
float x;
float y;
String val;
int cmnd=0;

void setup(){
  String p = Serial.list()[Serial.list().length-1];
  serial = new Serial(this, p, 115200); 
  size(500, 500);
  surface.setResizable(true);
  x=width/2;
  y=height/2;
}
void draw() {
  background(255);
  if ( serial.available() > 0) { // если есть данные,
    val = serial.readStringUntil('\n'); // считываем данные
   try {
      cmnd = Integer.parseInt(val.trim()); //1 //0
       }
   catch(Exception e) {
      cmnd=0;
      println(e);
      }
  }
  x=x+1*cmnd*noise(x-cmnd*0.5);//-1 0 1
  circle(x,y,50);
  textSize(32);
  fill(0, 0, 0);
  text(cmnd, 20, 80);
}
