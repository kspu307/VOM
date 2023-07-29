void setup() {
  size(640, 360);
  noStroke();
}

void draw() {
  background(0);
  // масштабируем значение mouseX 0-640
  // к новому числовому диапазону 0-175:
  float c = map(mouseX, 0, width, 0, 175);
  // масштабируем значение mouseX 0-640
  // к новому числовому диапазону 40-300:
  float d = map(mouseX, 0, width, 40, 300);
  fill(255, c, 0);
  ellipse(width/2, height/2, d, d);   
}
