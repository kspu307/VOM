import processing.serial.*;
Serial serial; 
String val1,val2;
float x;
float y;

void setup(){
size(800, 800);
noStroke();
String port = Serial.list()[Serial.list().length-1];
serial = new Serial(this, port, 115200);
}
void draw() {
background(51); // Установка цвета фона

  if ( serial.available() > 0) { 
    val1 = serial.readStringUntil('\n');
    val2 = serial.readStringUntil('\n'); 
    try {
      //x = Integer.parseInt(val1.trim()); 
      //y = Integer.parseInt(val2.trim());
      x = float(val1);
      y = float(val2);
    } 
    catch(Exception e)
        {
      println(e);
        }
  }
ellipse(x, y, 66, 66); // Отрисовка круга по текущим координатам x и y
}
