void star( int numSpikes, float innerRadius, float outerRadius )
{
  int numVertices = numSpikes * 2;
  float angleStep = radians(360) / numVertices;
  beginShape();
  
  for ( int i = 0; i < numVertices; i++ ) {
    float x, y;
    if ( i % 2 == 0 ) {
      x = cos( angleStep * i ) * outerRadius;
      y = sin( angleStep * i ) * outerRadius;
    } else {
      x = cos( angleStep * i ) * innerRadius;
      y = sin( angleStep * i ) * innerRadius;
    } 
    vertex( x, y );
  } 
  endShape(CLOSE);
}
void setup()
{
  size(400, 400 );
} 

void draw() {
  translate(200, 200);
  int n = int(map(mouseX, 0, width, 3, 20));
  background(255);
  star(n, 90, 190);
  
} 
