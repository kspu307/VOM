#define L 2
#define R 4
int val_L=0;
int val_R=0;
void setup() {
  Serial.begin(115200);
  pinMode(L, INPUT);
  pinMode(R, INPUT);
}
void loop() {
  val_L = digitalRead(L);
  val_R = digitalRead(R);
  if (val_L==LOW){
    Serial.println(-1);
  }
  else if (val_R==LOW){
    Serial.println(1);
  }
  else{
    Serial.println(0);
    }
    delay(50);
}
