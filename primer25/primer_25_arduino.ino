#define LED_PIN 2 // определяем контакт для светодиода
#define BUZZER_PIN 3 // определяем контакт для пьезодинамика
#define SENSOR_EMG A1 // определяем контакт для сенсора ЭМГ

int amp = 0; // переменная для хранения значения амплитуды ЭМГ-сигнала
int emg = 0; // переменная для хранения ЭМГ-сигнала с сенсора
int max1 = 0; // переменная для хранения максимального значения при обработке
int min1 = 255; // переменная для хранения минимального значения при обработке
int threshold = 30; // пороговое значения для определения напряжения/расслабления мышцы

int k = 0;

// функция для вычисления амплитуды ЭМГ-сигнала
void calc_amp() {
    if (k < 32) {
      emg = analogRead(SENSOR_EMG); // считываем значение с сенсора ЭМГ 
      emg = map(emg, 0, 1023, 0, 255); // пропорционально переносим значение из диапазона 0...1023 в диапазон 0...255 
      if (emg > max1)  // если текущее значение больше значения переменной max1   
        max1 = emg;  // обновляем значение максимума       
      if (emg < min1)  // если текущее значение меньше значения переменной min1    
        min1 = emg; // обновляем значение минимума

      k++;
    }
    else {
      k = 0;
    }
    amp =  0.4*amp + 0.6*(max1 - min1); // рассчитываем значение амплитуды

    if (k == 0) {
      max1 = 0; // возвращаем переменной начальной значение для следующего цикла обработки 
      min1 = 255; // возвращаем переменной начальной значение для следующего цикла обработки
    }     
  }

void setup() {
  Serial.begin(115200);
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
    calc_amp(); // вычисляем амплитуды при вызове функции calc_amp()
    if (k == 0) { 
      Serial.println(amp); // выводим значение амплитуды в монитор порта
      if (amp > threshold){ // если амплитуда больше порогового значения
      digitalWrite(LED_PIN, HIGH); // включаем светодиод
      tone(BUZZER_PIN, 1500); // генерируем звук на пьезодинамике
      }
      else{ // иначе
        digitalWrite(LED_PIN, LOW); // выключаем светодиод
        noTone(BUZZER_PIN); // останавливаем генерацию звука
      }
    }
    delay(1); 
}