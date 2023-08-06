PImage pic,bg,wl,bm;
float x,x1;
float y;
float easing = 0.05;

void setup() {
  size(284, 512);
  //imageMode(CENTER);
  pic =loadImage("bird.png");
  bg = loadImage("background.jpg");
  bm = loadImage("bam.png");
  wl = loadImage("wall.JPG");
  x1=284;
}

void draw() {
  background(bg);
  //выводим надпись
  fill(255, 0, 0);
  textSize(30);
  textAlign(CORNER);
  text("Лети, птичка!", 50, 50);
  //задаем движение стены
  image(wl,x1,260);
  x1--;
  if (x1 < -pic.width) {
    x1 = 300;
  }
  //задаем движение птицы за курсором мыши
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  image(pic,x,y,pic.width/3,pic.height/3);
  // Проверяем, пересекаются ли изображения птицы и стены
  if (abs(x-x1)<10 && mouseY>230 ) {
  // Если да, выводим изображение "boom!" 
  image(bm, x-50, y-50,bm.width/3,bm.height/3); 
}
}
