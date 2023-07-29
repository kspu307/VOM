void setup() { 
    size(500, 400); 
    surface.setTitle("Сложные фигуры");
    stroke(0); 
    background(200); 
   }  
void draw() {
// определяем количество треугольников
int numTriangles = int(map(mouseX, 0, width, 1, 10)); 
background(200);
beginShape(TRIANGLE_STRIP);
  vertex(50, 50);
  vertex(100, 100);
  for (int i = 2; i <= numTriangles; i++) {
    float x = map(i, 1, numTriangles, 150,450); // вычисляем x-координату для вершины
    float y = (i % 2 == 0) ? 50 : 100; // вычисляем y-координату для вершины
    vertex(x, y);
  }
  
  endShape();
}
