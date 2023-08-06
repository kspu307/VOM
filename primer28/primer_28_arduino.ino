#include <fft.h>

#define PIN_SENSOR A1
#define PIN_SENSOR_NAME "A1"

#define DELAY 2

class Alpha {
    static const int num = 256;
    int8_t data[num], im[num];
    int n = 0;
    long signal_sum = 0;
    float prev_specter = 0;
    float threshold = 0;
    
    public:
        bool is_ready = false;
        Alpha(float th) {
          threshold = th;
        }
        bool get_alpha(int val) {
            if (n < num) {
                is_ready = false;
                accumulation_signal(val);
                return false;
            }
            else {
                is_ready = true;
                n = 0;
                
                bool is_correct = validate_signal();
                
                if (!is_correct) {
                    return false;
                }
                
                float cur_specter = process_signal();
                prev_specter = cur_specter;               
                return cur_specter > threshold;
            }
        }
    private: 
        void accumulation_signal(int val){
            data[n] = val/8;
            im[n] = 0;
            signal_sum += data[n];
            n++;
        }
        bool validate_signal() {
            for (int j = 0; j < num; j++) {
                if (data[j] < 2 || data[j] > 120) {
                    return false;
                }
                return true;
            }
        }
        float process_signal() {
            for (int i=0; i < num; i++) {                                     
                data[i] = data[i] - signal_sum/num;                
            }
            
            fix_fft(data, im, 8, 0);            
             
            float cur_specter = 0;     
            for (int i = 4; i < 8; i++) {
                cur_specter +=  sqrt(data[i]*data[i] + im[i]*im[i]);
            }
            
            cur_specter = 0.3 * cur_specter + 0.7 * prev_specter; 
            
            Serial.println(cur_specter);
     
            return cur_specter;
        }
};

Alpha alpha = Alpha(34); 
int val = 0;

void visualization(int val) { 
  Serial.write(PIN_SENSOR_NAME);
  Serial.write(val);
}

void print_signal(int val) {
  Serial.println(val);  
}

void control_monitor(bool state) {
  if (state) {
    Serial.println(1);
  }
  else {
    Serial.println(0);
  }  
}

void setup() {  
  Serial.begin(115200);
}

void loop() {
  val = analogRead(PIN_SENSOR);
  
  print_signal(val); 
  //visualization(val); 

  bool is_aplha = alpha.get_alpha(val);
  if (alpha.is_ready) {
    control_monitor(is_aplha);  
  }
  
  delay(DELAY); 
}
