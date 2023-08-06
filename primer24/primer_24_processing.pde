import processing.serial.*;
Serial serial; // создаем объект последовательного порта
int ccr = 0; // данные, получаемые с последовательного порта
String val;

void setup()
{
  size(800, 800);
  String port = Serial.list()[Serial.list().length-1];
  serial = new Serial(this, port, 115200);
}

void draw() {

  if ( serial.available() > 0) { // если есть данные,
    val = serial.readStringUntil('\n'); // считываем данные
    try {
      ccr = Integer.parseInt(val.trim()); //1 //0
    }
    catch(Exception e) {
      println(e);
  }    
  }
    if (ccr == 1) {
    background(128, 0, 0);
  }
    if (ccr == 0) {
    background(144, 238, 144);
  }  
  textSize(50);
  text(ccr, width/2, height/2);
}
