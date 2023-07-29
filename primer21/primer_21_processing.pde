import processing.serial.*;
Serial serial; // создаем объект последовательного порта
String val;
int cmnd=0;
void setup(){
  String p = Serial.list()[Serial.list().length-1];
  serial = new Serial(this, p, 115200); 
  size(500, 500);
  surface.setResizable(true);
  noStroke();
}
void draw() {
  background(255);
  if ( serial.available() > 0) { // если есть данные,
    val = serial.readStringUntil('\n'); // считываем данные
   try {
      cmnd = Integer.parseInt(val.trim()); //1 //0
       }
   catch(Exception e) {
           println(e);
      }
  }
  if (cmnd==0){
  fill(255, 0, 0);
  
  beginShape();
  vertex(150, 130);  vertex(200, 100);
  vertex(250, 130);  vertex(300, 100);
  vertex(350, 130);  vertex(330, 230);
  vertex(250, 300);  vertex(170, 230);
  endShape(CLOSE);
}
  else{
  fill(255, 0, 0);
  beginShape();
  vertex(170, 130);  vertex(200, 120);
  vertex(250, 150);  vertex(300, 120);
  vertex(330, 130);  vertex(310, 230);
  vertex(250, 280);  vertex(190, 230);
  endShape(CLOSE);
 }
}
