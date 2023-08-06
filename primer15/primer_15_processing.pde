PImage pic,bg,bg2;
int x,x1;
void setup() {
  size(284, 512);
  pic = loadImage("bird.png");
  bg = loadImage("background.jpg");

}

void draw() {
  //Фоновое изображение должно быть того же размера, что и параметры холста
  background(bg);
  image(pic,x,100,pic.width/3,pic.height/3);
  //На каждом кадре значение этой переменной увеличивается на единицу
  //что приводит к движению изображения вправо
  //Если позиция вышла за пределы изображения, то ее значение сбрасывается в -100
  //чтобы создать эффект бесконечного цикла.
  x++;
  if (x > pic.width) {
    x = -100;
  }
}
