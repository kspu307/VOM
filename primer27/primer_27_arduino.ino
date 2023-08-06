#define PPG A1
int value1 = 0;
int value2 = 0;
int value3 = 0;

unsigned long prev = 0;
unsigned long curr = 0;

int pulse = 0;
int cnt = 0;
int number_of_beats = 5;

void setup() {
  Serial.begin(115200);
}

void loop() {
  value1 = value2;
  value2 = value3;
  value3 = analogRead(PPG);
  if (value1 < value2 && value2 > value3){
    cnt++;
    Serial.println(1);
  }
  else{
    Serial.println(0);
  }
  /*if (cnt == number_of_beats){
    curr = millis();
    pulse = number_of_beats * 60000 / (curr - prev);
    cnt = 0;
    prev = curr;
  }
  //Serial.println(pulse);*/
  delay(50);
}
