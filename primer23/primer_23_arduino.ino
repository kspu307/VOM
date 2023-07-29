#define A 2
#define D 4
int val_A=0;
int val_D=0;
void setup() {
  Serial.begin(115200);
  pinMode(A, INPUT);
  pinMode(D, INPUT);
}
void loop() {
  val_A = digitalRead(A);
  val_D = digitalRead(D);
  if (val_A==LOW){
    Serial.println(1);
  }
  else if (val_D==LOW){
    Serial.println(-1);
  }
  else{
    Serial.println(0);
    }
    delay(50);
}
