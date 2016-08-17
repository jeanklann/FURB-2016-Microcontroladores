
_main:

;Projeto.c,1 :: 		void main() {
;Projeto.c,3 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Projeto.c,4 :: 		while(1){
L_main0:
;Projeto.c,5 :: 		A_D = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_A_D_L0+0 
	MOVF        R1, 0 
	MOVWF       main_A_D_L0+1 
;Projeto.c,7 :: 		if(A_D <= 128){
	MOVLW       0
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVF        R0, 0 
	SUBLW       128
L__main18:
	BTFSS       STATUS+0, 0 
	GOTO        L_main2
;Projeto.c,8 :: 		PORTD = 0x00;
	CLRF        PORTD+0 
;Projeto.c,9 :: 		} else if(A_D <= 128*2){
	GOTO        L_main3
L_main2:
	MOVF        main_A_D_L0+1, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVF        main_A_D_L0+0, 0 
	SUBLW       0
L__main19:
	BTFSS       STATUS+0, 0 
	GOTO        L_main4
;Projeto.c,10 :: 		PORTD = 0x01;
	MOVLW       1
	MOVWF       PORTD+0 
;Projeto.c,11 :: 		} else if(A_D <= 128*3){
	GOTO        L_main5
L_main4:
	MOVF        main_A_D_L0+1, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
	MOVF        main_A_D_L0+0, 0 
	SUBLW       128
L__main20:
	BTFSS       STATUS+0, 0 
	GOTO        L_main6
;Projeto.c,12 :: 		PORTD = 0x03;
	MOVLW       3
	MOVWF       PORTD+0 
;Projeto.c,13 :: 		} else if(A_D <= 128*4){
	GOTO        L_main7
L_main6:
	MOVF        main_A_D_L0+1, 0 
	SUBLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVF        main_A_D_L0+0, 0 
	SUBLW       0
L__main21:
	BTFSS       STATUS+0, 0 
	GOTO        L_main8
;Projeto.c,14 :: 		PORTD = 0x07;
	MOVLW       7
	MOVWF       PORTD+0 
;Projeto.c,15 :: 		} else if(A_D <= 128*5){
	GOTO        L_main9
L_main8:
	MOVF        main_A_D_L0+1, 0 
	SUBLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVF        main_A_D_L0+0, 0 
	SUBLW       128
L__main22:
	BTFSS       STATUS+0, 0 
	GOTO        L_main10
;Projeto.c,16 :: 		PORTD = 0x0F;
	MOVLW       15
	MOVWF       PORTD+0 
;Projeto.c,17 :: 		} else if(A_D <= 128*6){
	GOTO        L_main11
L_main10:
	MOVF        main_A_D_L0+1, 0 
	SUBLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__main23
	MOVF        main_A_D_L0+0, 0 
	SUBLW       0
L__main23:
	BTFSS       STATUS+0, 0 
	GOTO        L_main12
;Projeto.c,18 :: 		PORTD = 0x1F;
	MOVLW       31
	MOVWF       PORTD+0 
;Projeto.c,19 :: 		} else if(A_D <= 128*7){
	GOTO        L_main13
L_main12:
	MOVF        main_A_D_L0+1, 0 
	SUBLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
	MOVF        main_A_D_L0+0, 0 
	SUBLW       128
L__main24:
	BTFSS       STATUS+0, 0 
	GOTO        L_main14
;Projeto.c,20 :: 		PORTD = 0x3F;
	MOVLW       63
	MOVWF       PORTD+0 
;Projeto.c,21 :: 		} else if(A_D <= 128*8){
	GOTO        L_main15
L_main14:
	MOVF        main_A_D_L0+1, 0 
	SUBLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L__main25
	MOVF        main_A_D_L0+0, 0 
	SUBLW       0
L__main25:
	BTFSS       STATUS+0, 0 
	GOTO        L_main16
;Projeto.c,22 :: 		PORTD = 0x7F;
	MOVLW       127
	MOVWF       PORTD+0 
;Projeto.c,23 :: 		} else {
	GOTO        L_main17
L_main16:
;Projeto.c,24 :: 		PORTD = 0xFF;
	MOVLW       255
	MOVWF       PORTD+0 
;Projeto.c,25 :: 		}
L_main17:
L_main15:
L_main13:
L_main11:
L_main9:
L_main7:
L_main5:
L_main3:
;Projeto.c,27 :: 		}
	GOTO        L_main0
;Projeto.c,29 :: 		}
	GOTO        $+0
; end of _main
