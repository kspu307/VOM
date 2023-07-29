import processing.serial.*;
PImage pic,bg,wl,bm;
Serial serial; 
float x,x1;
float y;
String val;
int cmnd=0;


void setup() {
  String p = Serial.list()[Serial.list().length-1];
  serial = new Serial(this, p, 115200); 
  size(284, 512);
  pic = loadImage("bird.png");
  bg = loadImage("background.jpg");
  x=width/2;
  y=height/2;
  wl = loadImage("wall.JPG");
  x1=284;
  bm = loadImage("bam.png");

}

void draw() {
  background(bg);
  if ( serial.available() > 0) { 
    val = serial.readStringUntil('\n'); 
   try {
      cmnd = Integer.parseInt(val.trim()); //1 //0
       }
   catch(Exception e) {
      println(e);
      }
  }
//задаем движение стены
  image(wl,x1,260);
  x1--;
  if (x1 < -pic.width) {
    x1 = 300;
  }
//задаем движение птицы 
  x++;
  if (x > pic.width) {
    x = -100;
  }
   y=y+cmnd;
  image(pic,x,y,pic.width/3,pic.height/3);
// Проверяем, пересекаются ли изображения птицы и стены
  if (abs(x-x1)<10 && y>230 ) {
// Если да, выводим изображение "boom!" 
  image(bm, x-50, y-50,bm.width/3,bm.height/3); 
}
}
