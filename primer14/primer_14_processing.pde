PImage pic,bg;
void setup() {
  size(400, 400);
  pic = loadImage("bird.png");
  bg = loadImage("background.jpg");
}

void draw() {
  image(bg, 0, 0);
  image(bg, 180, 0);
  image(pic,150,100,pic.width/2,pic.height/2);
}
