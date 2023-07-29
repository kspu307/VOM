float x;
float y;
float x1;
float y1;

int step = 1;
void setup() { 
    size(500, 500); 
    surface.setTitle("Движение");
    background(255); 
    x=width/2;
    y=height/3;
    x1=width/2;
    y1=height/2;
   }  
void draw() {
  background(255); 
  circle(x,y,50);
  circle(x1,y1,50);
  x-=step;
  x1-=noise(x-step);
  }
