
_main:

;vsf.c,1 :: 		void main() {
;vsf.c,2 :: 		unsigned int temperatura_ate_1023 = 0;
;vsf.c,3 :: 		double temperatura = 0.0;
	CLRF        main_temperatura_L0+0 
	CLRF        main_temperatura_L0+1 
	CLRF        main_temperatura_L0+2 
	CLRF        main_temperatura_L0+3 
;vsf.c,5 :: 		TRISD = 0;
	CLRF        TRISD+0 
;vsf.c,7 :: 		TRISC.F1 = 0; //aquecedor
	BCF         TRISC+0, 1 
;vsf.c,8 :: 		TRISC.F2 = 0; //ventoinha
	BCF         TRISC+0, 2 
;vsf.c,10 :: 		PORTC.F1 = 1; //liga aquecedor
	BSF         PORTC+0, 1 
;vsf.c,13 :: 		while(1){
L_main0:
;vsf.c,14 :: 		temperatura_ate_1023 = ADC_Read(3);
	MOVLW       3
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;vsf.c,15 :: 		temperatura = (temperatura_ate_1023*(5.0/1023.0)) * 100.0;
	CALL        _Word2Double+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       40
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       main_temperatura_L0+0 
	MOVF        R1, 0 
	MOVWF       main_temperatura_L0+1 
	MOVF        R2, 0 
	MOVWF       main_temperatura_L0+2 
	MOVF        R3, 0 
	MOVWF       main_temperatura_L0+3 
;vsf.c,16 :: 		if(temperatura >= 40.0){
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;vsf.c,17 :: 		PORTC.F1 = 0; //desliga aquecedor
	BCF         PORTC+0, 1 
;vsf.c,18 :: 		PORTC.F2 = 1; //liga ventoinha
	BSF         PORTC+0, 2 
;vsf.c,19 :: 		}
L_main2:
;vsf.c,20 :: 		if(temperatura <= 25.0){
	MOVF        main_temperatura_L0+0, 0 
	MOVWF       R4 
	MOVF        main_temperatura_L0+1, 0 
	MOVWF       R5 
	MOVF        main_temperatura_L0+2, 0 
	MOVWF       R6 
	MOVF        main_temperatura_L0+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       72
	MOVWF       R2 
	MOVLW       131
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;vsf.c,21 :: 		PORTC.F1 = 1; //liga aquecedor
	BSF         PORTC+0, 1 
;vsf.c,22 :: 		PORTC.F2 = 0; //desliga ventoinha
	BCF         PORTC+0, 2 
;vsf.c,23 :: 		}
L_main3:
;vsf.c,24 :: 		PORTD = (int)(temperatura);
	MOVF        main_temperatura_L0+0, 0 
	MOVWF       R0 
	MOVF        main_temperatura_L0+1, 0 
	MOVWF       R1 
	MOVF        main_temperatura_L0+2, 0 
	MOVWF       R2 
	MOVF        main_temperatura_L0+3, 0 
	MOVWF       R3 
	CALL        _Double2Int+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;vsf.c,27 :: 		}
	GOTO        L_main0
;vsf.c,29 :: 		}
	GOTO        $+0
; end of _main
