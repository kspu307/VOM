import processing.serial.*;
Serial serial; // создаем объект последовательного порта
String val;
int cmnd=0;

import ddf.minim.*;// Импортируем библиотеку Minim для работы со звуковыми файлами
Minim minim; // Создаем переменные для объектов Minim и AudioPlayer
AudioPlayer player;
PShape hartmax; //создаем объект класса PShape для работы с векторной графикой

void setup(){
  String p = Serial.list()[Serial.list().length-1];
  serial = new Serial(this, p, 115200); 
  size(500, 500);
  surface.setResizable(true);
  noStroke();
  minim = new Minim(this); // Инициализируем объект Minim, передавая ему текущий объект (this)
  player = minim.loadFile("heartbeat.mp3");  // Загружаем звуковой файл "heartbeat.mp3" в объект AudioPlayer
  
  shapeMode(CENTER);// центр координатной системы находится в центре векторного объекта
  hartmax = loadShape("hartmax.svg"); //загружаем векторное изображение сердца
}
void draw() {
  background(255);
  
  if ( serial.available() > 0) { // если есть данные,
    val = serial.readStringUntil('\n'); // считываем данные
    println(val);
   try {
      cmnd = Integer.parseInt(val.trim()); //1 //0
       }
   catch(Exception e) {
           println(e);
      }
  }
  if (cmnd==1){ //если есть удар пульса, рисуем большое сердце в центре окна и запускаем звук биения
  float size_svg = 200;
  shape(hartmax, width/2, height/2, size_svg, size_svg);  
  if (!player.isPlaying()) {// Если звуковой файл не проигрывается в данный момент, 
    player.play(); //то начинаем его проигрывание
    player.rewind();//сразу же перематываем звуковой файл в начало после того, как он проиграется до конца  
  } 
}
  if (cmnd==0){ //если нет удара, рисуем сердце поменьшн
  float size_svg = 180;
  shape(hartmax, width/2, height/2, size_svg, size_svg);
 
}
}
