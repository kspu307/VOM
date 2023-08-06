import processing.serial.*;
Serial port;
float amp = 0;
float threshold = 30;
int y = 450;
int step=5;
String p;

void setup(){
  size(500, 500);
  String p = Serial.list()[Serial.list().length-1];
  port = new Serial(this, p, 115200);
  port.bufferUntil('\n');

}

void draw(){
  background(100);
  if (amp > threshold){ // если амплитуда больше порогового значения
  y-=step;    // изменяем координату y - объект перемещается вверх
  }
  else { // иначе
   if (y<450){
      y+=step;
    }
   else{
      y = 450;
    } 
  }
  ellipse(250, y, 90, 90); // отрисовывaем объект по данным координатам
}

void serialEvent(Serial port){
  try {
  if (port.available() > 0) { // если есть данные,
    amp = float(port.readStringUntil('\n')); // сохраняем их в переменную amp
  }
  else {
    amp = 0;
  }
    delay(1);
  }
  catch(Exception e) {
    amp = 0;
  }
}
