float x,y;
int step = 1; 
void setup() { 
    size(500, 500); //размер холста
    background(0);
    x =width/2;  y=0;
   }  
void draw() {
  fill(0, 10);
  rect(0,0,width,height);
  noStroke();
  fill(255, 50);
  circle(x,y,50);    
  y+=step; 
  // Если круг выходит за границы экрана - отскок
  if (y >= 500) {
    step=-step;
}
  if (y <= 0) {
    step=-step;
  }
  }  
