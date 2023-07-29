const int Pot= A0;

void setup()
{
  Serial.begin (9600);
}

void loop() 
{
 int val = map(analogRead(Pot),0,1023,0,230);
 Serial.println(val);
 delay(50); 

}
