#define button 2
int val=0;
void setup() {
  Serial.begin(115200);
  pinMode(button, INPUT);
}
void loop() {
  val = digitalRead(button);
  if (val==LOW){
    Serial.println(1);
  }
  else{
    Serial.println(0);
    }
    delay(50);
}
