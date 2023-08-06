import processing.serial.*;

Serial serial; // создаем объект последовательного порта
int is_alpha = 0; // данные, получаемые с последовательного порта
String val = "";
PShape tree;

void setup()
{
  size(640, 360);
  String port = Serial.list()[2];
  serial = new Serial(this, port, 115200);
  
  tree = loadShape("../img/tree.svg");
}

void draw() {
 
  if ( serial.available() > 0) { // если есть данные,
    val = serial.readStringUntil('\n'); // считываем данные
    try {
      is_alpha = Integer.parseInt(val.trim());
      println(is_alpha);
    }
    catch(Exception e) {
      is_alpha = 0;
      println(e);
  }
  }
  else {
    is_alpha = 0;
  }
  
  if (is_alpha == 1) {
    float size_svg = random(50, 200);
    float x = random(width - 100);
    float y = random(height - 100);
    
    shape(tree, x, y, size_svg, size_svg);
  } 
  
  delay(1000);

}
