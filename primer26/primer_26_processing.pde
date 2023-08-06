import processing.serial.*;

Serial serial; // создаем объект последовательного порта
int is_srtess = -1; // данные, получаемые с последовательного порта
String val = "";
int y = 180;
int step=5;
int startTime; // время начала отсчета
int elapsedTime; // прошедшее время

void setup()
{
  size(640, 360);
  startTime = millis(); // сохраняем время начала отсчета
  String port = Serial.list()[Serial.list().length-1];
  serial = new Serial(this, port, 115200);
noStroke();
}

void draw() {
  background(100);
  elapsedTime = millis() - startTime; // вычисляем прошедшее время
  int seconds = int(elapsedTime / 1000); // переводим миллисекунды в секунды
  textSize(20);
  if (seconds<=180){
  text(seconds + " сек", 50, 50); // выводим текст на экран
  }
  else{
  text("Время закончилось", 50, 50); }
  
  if ( serial.available() > 0) { // если есть данные,
    val = serial.readStringUntil('\n'); // считываем данные
    try {
      is_srtess = Integer.parseInt(val.trim());
      println(is_srtess);
    }
    catch(Exception e) {
      println(e);
  }
  }
   
  if (is_srtess == 0) {
    y-=step;  
    fill(144, 238, 144);
    ellipse(320, y, 90, 90);
    if (y<0){y=0;}

  } 
  if (is_srtess == 1){
    y+=step;
    fill(179,34, 34);
    ellipse(320, y, 90, 90);
    if (y>360){y=360;}
  }
  
  delay(1000);
}
