
#include <TimerOne.h> // подключаем библиотеку TimerOne для задействования функций Таймера1 

int val = 0;                                 // переменная для хранения оцифрованного значения сигнала  
int threshold = 615; //значение КГР в покое, подбирается эмпирически
          
// функция sendData вызывается каждый раз, когда срабатывает прерывание Таймера1 (проходит заданное число микросекунд)
void sendData() {
    val = analogRead(A2);                     // записываем в переменную val оцифрованное значение сигнала с ножки А0 на Arduino.
  //Serial.write("A2");                       // записываем в Serial-порт имя поля в программе для визуализации, куда надо выводить сигнал
  //Serial.write(map(val, 0, 1023, 0, 255));  // записываем в Serial-порт значение val, предварительно отнормированное на диапазон значений от 0 до 255,
  //Serial.println(val);                       
  if (val <= threshold) { // Если значение сигнала КГР меньше значения в покое (т.е. есть стресс)
    Serial.println(1);  //передаем  "1"
  }
  else {
    Serial.println(0);  //передаем  "0"
  }  
   }
// функция setup вызывается однократно при запуске Arduino
void setup() {
  Serial.begin(115200);                    // инициализируем Serial-порт на скорости 115200 Кбит/c. 
                                           // такую же скорость надо установить в программе для визуализации
  Timer1.initialize(1000000);                // инициализируем Таймер1, аргументом указываем интервал срабатывания 1 000 000 микросекунд = 1 сек
  Timer1.attachInterrupt(sendData);        // как только проходит 1 секкунда - наступает прерывание (вызывается функция sendData)
}

void loop(){
// а в бесконечном цикле мы ничего не делаем. Таймер1 сам будет вызывать функцию sendData через каждую секунду
}
