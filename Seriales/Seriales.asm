
_main:

;Seriales.c,1 :: 		void main() {
;Seriales.c,2 :: 		char ENTER_CONST[] = {13,0};
	MOVLW       13
	MOVWF       main_ENTER_CONST_L0+0 
	CLRF        main_ENTER_CONST_L0+1 
;Seriales.c,6 :: 		unsigned char byte_recebido = 0;
	CLRF        main_byte_recebido_L0+0 
;Seriales.c,7 :: 		unsigned int temperatura_ate_1023 = 0;
;Seriales.c,8 :: 		double temperatura = 0.0;
	CLRF        main_temperatura_L0+0 
	CLRF        main_temperatura_L0+1 
	CLRF        main_temperatura_L0+2 
	CLRF        main_temperatura_L0+3 
;Seriales.c,9 :: 		double temperatura_escolhida = 0.0;
	CLRF        main_temperatura_escolhida_L0+0 
	CLRF        main_temperatura_escolhida_L0+1 
	CLRF        main_temperatura_escolhida_L0+2 
	CLRF        main_temperatura_escolhida_L0+3 
;Seriales.c,10 :: 		int i = 0;
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
;Seriales.c,11 :: 		UART1_Init(19200);
	MOVLW       25
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Seriales.c,12 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Seriales.c,13 :: 		TRISC.F1 = 0; //aquecedor
	BCF         TRISC+0, 1 
;Seriales.c,14 :: 		TRISC.F2 = 0; //ventoinha
	BCF         TRISC+0, 2 
;Seriales.c,22 :: 		for( i = 0; i<7; i++)
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main0:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       7
	SUBWF       main_i_L0+0, 0 
L__main19:
	BTFSC       STATUS+0, 0 
	GOTO        L_main1
;Seriales.c,23 :: 		int_str[i] = 0;
	MOVLW       main_int_str_L0+0
	ADDWF       main_i_L0+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(main_int_str_L0+0)
	ADDWFC      main_i_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;Seriales.c,22 :: 		for( i = 0; i<7; i++)
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;Seriales.c,23 :: 		int_str[i] = 0;
	GOTO        L_main0
L_main1:
;Seriales.c,24 :: 		while(1)
L_main3:
;Seriales.c,26 :: 		temperatura_ate_1023 = ADC_Read(3);
	MOVLW       3
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;Seriales.c,27 :: 		temperatura = (temperatura_ate_1023*(5.0/1023.0)) * 100.0;
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
;Seriales.c,29 :: 		if(temperatura >= 40.0)
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
	GOTO        L_main5
;Seriales.c,33 :: 		}
L_main5:
;Seriales.c,34 :: 		if(temperatura <= 25.0)
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
	GOTO        L_main6
;Seriales.c,38 :: 		}
L_main6:
;Seriales.c,39 :: 		if(UART1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
;Seriales.c,42 :: 		byte_recebido = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_byte_recebido_L0+0 
;Seriales.c,43 :: 		}
L_main7:
;Seriales.c,44 :: 		if(byte_recebido == 'V')
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       86
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;Seriales.c,46 :: 		if(PORTC.F2)
	BTFSS       PORTC+0, 2 
	GOTO        L_main9
;Seriales.c,48 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;Seriales.c,49 :: 		}
	GOTO        L_main10
L_main9:
;Seriales.c,52 :: 		PORTC.F2 = 1;
	BSF         PORTC+0, 2 
;Seriales.c,53 :: 		}
L_main10:
;Seriales.c,54 :: 		byte_recebido = 0;
	CLRF        main_byte_recebido_L0+0 
;Seriales.c,55 :: 		}
L_main8:
;Seriales.c,57 :: 		if(byte_recebido == 'R')
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;Seriales.c,59 :: 		if(PORTC.F1)
	BTFSS       PORTC+0, 1 
	GOTO        L_main12
;Seriales.c,61 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;Seriales.c,62 :: 		}
	GOTO        L_main13
L_main12:
;Seriales.c,65 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;Seriales.c,66 :: 		}
L_main13:
;Seriales.c,67 :: 		byte_recebido = 0;
	CLRF        main_byte_recebido_L0+0 
;Seriales.c,68 :: 		}
L_main11:
;Seriales.c,71 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 0
	BRA         L_main14
	DECFSZ      R12, 1, 0
	BRA         L_main14
	DECFSZ      R11, 1, 0
	BRA         L_main14
	NOP
;Seriales.c,72 :: 		IntToStr(((int)temperatura), int_str);
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
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_int_str_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_int_str_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Seriales.c,73 :: 		UART1_Write_Text(int_str);
	MOVLW       main_int_str_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_int_str_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Seriales.c,74 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Seriales.c,75 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Seriales.c,76 :: 		for( i = 0; i<7; i++)
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main15:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
	MOVLW       7
	SUBWF       main_i_L0+0, 0 
L__main20:
	BTFSC       STATUS+0, 0 
	GOTO        L_main16
;Seriales.c,77 :: 		int_str[i] = 0;
	MOVLW       main_int_str_L0+0
	ADDWF       main_i_L0+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(main_int_str_L0+0)
	ADDWFC      main_i_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;Seriales.c,76 :: 		for( i = 0; i<7; i++)
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;Seriales.c,77 :: 		int_str[i] = 0;
	GOTO        L_main15
L_main16:
;Seriales.c,78 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 0
	BRA         L_main18
	DECFSZ      R12, 1, 0
	BRA         L_main18
	DECFSZ      R11, 1, 0
	BRA         L_main18
	NOP
;Seriales.c,79 :: 		}
	GOTO        L_main3
;Seriales.c,81 :: 		}
	GOTO        $+0
; end of _main
