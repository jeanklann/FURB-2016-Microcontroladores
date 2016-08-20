void main() {
          unsigned int temperatura_ate_1023 = 0;
          double temperatura = 0.0;
          
          TRISD = 0;

          TRISC.F1 = 0; //aquecedor
          TRISC.F2 = 0; //ventoinha

          PORTC.F1 = 1; //liga aquecedor


     while(1){
          temperatura_ate_1023 = ADC_Read(3);
          temperatura = (temperatura_ate_1023*(5.0/1023.0)) * 100.0;
          if(temperatura >= 40.0){
                         PORTC.F1 = 0; //desliga aquecedor
                         PORTC.F2 = 1; //liga ventoinha
          }
          if(temperatura <= 25.0){
                         PORTC.F1 = 1; //liga aquecedor
                         PORTC.F2 = 0; //desliga ventoinha
          }
          PORTD = (int)(temperatura);


     }

}
