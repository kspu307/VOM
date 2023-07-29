const int Pot1= A0;
const int Pot2= A1;
void setup()
{
  Serial.begin (115200);
}

void loop() 
{
 int val1 = map(analogRead(Pot1),0,1023,0,799);
 int val2 = map(analogRead(Pot2),0,1023,0,799);
 Serial.println(val1); 
 Serial.println(val2);
 delay(100); 
}
