PImage pic,bg;
float x;
float y;
float easing = 0.05;

void setup() {
  size(284, 512);
  pic = loadImage("bird.png");
  bg = loadImage("background.jpg");

}

void draw() {
  background(bg);
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;

  image(pic,x,y,pic.width/3,pic.height/3);

}
