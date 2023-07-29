void setup() { 
    size(400, 200); 
    surface.setTitle("Первая меирактивная программа на Processing");
    surface.setResizable(true);
    stroke(0,255,0); 
    background(192, 64, 0); 
   }  

void draw() { 
    line(width/2, height/2, mouseX, mouseY); 
   }
