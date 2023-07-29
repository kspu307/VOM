import processing.serial.*;
Serial serial;
String val; int c;

void setup()
{
size(300,300);
String port = Serial.list()[Serial.list().length-1];
serial = new Serial(this, port, 9600);
}
void draw()
{
if ( serial.available() > 0) { 
    val = serial.readStringUntil('\n'); 
    try 
    {
    c = Integer.parseInt(val.trim());
    } 
    catch(Exception e)
    {
     println(e); 
    }
 }
if (c < 60) {
    background(192, 192, 192);
  } //если значение c меньше 60, устанавливаем серый фон
  if ((c > 60) & (c <= 90)) {
    background(144, 238, 144);
  }
  if ((c >  90) & (c <= 140)) {
    background(0, 128, 0);
  }
  if ((c >  140) & (c <= 160)) {
    background(255, 69, 0);
  }
  if ((c >  160) & (c <= 180)) {
    background(174, 34, 34);
  }
  if (c > 180) {
    background(128, 0, 0);
  }// если значение ccr больше 180, устанавливаем темно-красный фон
  textSize(32);// устанавливаем размер шрифта
  fill(0, 0, 0); // устанавливаем цвет текста в черный (RGB)
  text(c, 20, 80);// выводим значение c в левом верхнем углу окна
}
