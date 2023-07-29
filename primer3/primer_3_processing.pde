void setup() { 
    size(200, 600); 
    surface.setTitle("Рисование графических примитивов");
    noStroke();
    background(192, 64, 0); 
   }  
void draw() { 

  fill(204);
triangle(30, 30,30, 100, 100, 100);

fill(0);
rect(30, 150, 100, 50);

fill(50);
rect(30, 230, 100, 50,40);

fill(70);
quad(30, 320, 100, 340, 90, 370, 20, 380);

fill(100);
arc(70, 430, 90, 50, PI, TWO_PI);
fill(255);
ellipse(70, 500, 90, 70);
}
