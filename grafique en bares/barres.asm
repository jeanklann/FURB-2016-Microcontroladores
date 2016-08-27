
_main:

;barres.c,1 :: 		void main() {
;barres.c,2 :: 		char ENTER_CONST[] = {13,0};
	MOVLW       13
	MOVWF       main_ENTER_CONST_L0+0 
	CLRF        main_ENTER_CONST_L0+1 
;barres.c,6 :: 		unsigned char byte_recebido = 0;
	CLRF        main_byte_recebido_L0+0 
;barres.c,7 :: 		unsigned int temperatura_ate_1023 = 0;
;barres.c,8 :: 		double temperatura = 0.0;
	CLRF        main_temperatura_L0+0 
	CLRF        main_temperatura_L0+1 
	CLRF        main_temperatura_L0+2 
	CLRF        main_temperatura_L0+3 
;barres.c,9 :: 		double temperatura_escolhida = 0.0;
	CLRF        main_temperatura_escolhida_L0+0 
	CLRF        main_temperatura_escolhida_L0+1 
	CLRF        main_temperatura_escolhida_L0+2 
	CLRF        main_temperatura_escolhida_L0+3 
;barres.c,10 :: 		int i = 0;
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
;barres.c,11 :: 		UART1_Init(19200);
	MOVLW       25
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;barres.c,12 :: 		TRISD = 0;
	CLRF        TRISD+0 
;barres.c,13 :: 		TRISC.F1 = 0; //aquecedor
	BCF         TRISC+0, 1 
;barres.c,14 :: 		TRISC.F2 = 0; //ventoinha
	BCF         TRISC+0, 2 
;barres.c,22 :: 		for( i = 0; i<7; i++)
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main0:
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
	GOTO        L_main1
;barres.c,23 :: 		int_str[i] = 0;
	MOVLW       main_int_str_L0+0
	ADDWF       main_i_L0+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(main_int_str_L0+0)
	ADDWFC      main_i_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;barres.c,22 :: 		for( i = 0; i<7; i++)
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;barres.c,23 :: 		int_str[i] = 0;
	GOTO        L_main0
L_main1:
;barres.c,24 :: 		while(1)
L_main3:
;barres.c,26 :: 		temperatura_ate_1023 = ADC_Read(3);
	MOVLW       3
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;barres.c,27 :: 		temperatura = (temperatura_ate_1023*(5.0/1023.0)) * 100.0;
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
;barres.c,29 :: 		if(UART1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;barres.c,31 :: 		byte_recebido = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_byte_recebido_L0+0 
;barres.c,32 :: 		}
L_main5:
;barres.c,33 :: 		if(byte_recebido == 'V')
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       86
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;barres.c,35 :: 		if(PORTC.F2)
	BTFSS       PORTC+0, 2 
	GOTO        L_main7
;barres.c,37 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;barres.c,38 :: 		}
	GOTO        L_main8
L_main7:
;barres.c,41 :: 		PORTC.F2 = 1;
	BSF         PORTC+0, 2 
;barres.c,42 :: 		}
L_main8:
;barres.c,43 :: 		byte_recebido = 0;
	CLRF        main_byte_recebido_L0+0 
;barres.c,44 :: 		}
L_main6:
;barres.c,46 :: 		if(byte_recebido == 'R')
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;barres.c,48 :: 		if(PORTC.F1)
	BTFSS       PORTC+0, 1 
	GOTO        L_main10
;barres.c,50 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;barres.c,51 :: 		}
	GOTO        L_main11
L_main10:
;barres.c,54 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;barres.c,55 :: 		}
L_main11:
;barres.c,56 :: 		byte_recebido = 0;
	CLRF        main_byte_recebido_L0+0 
;barres.c,57 :: 		}
L_main9:
;barres.c,60 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 0
	BRA         L_main12
	DECFSZ      R12, 1, 0
	BRA         L_main12
	DECFSZ      R11, 1, 0
	BRA         L_main12
	NOP
;barres.c,61 :: 		IntToStr(((int)temperatura), int_str);
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
;barres.c,62 :: 		UART1_Write(27);
	MOVLW       27
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;barres.c,63 :: 		UART1_Write_text("[2J");
	MOVLW       ?lstr1_barres+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_barres+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;barres.c,65 :: 		UART1_Write(27);
	MOVLW       27
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;barres.c,66 :: 		UART1_Write_text("[13;10H");
	MOVLW       ?lstr2_barres+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_barres+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;barres.c,68 :: 		for(i = 0; i < (int)temperatura; i++)
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main13:
	MOVF        main_temperatura_L0+0, 0 
	MOVWF       R0 
	MOVF        main_temperatura_L0+1, 0 
	MOVWF       R1 
	MOVF        main_temperatura_L0+2, 0 
	MOVWF       R2 
	MOVF        main_temperatura_L0+3, 0 
	MOVWF       R3 
	CALL        _Double2Int+0, 0
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVF        R0, 0 
	SUBWF       main_i_L0+0, 0 
L__main21:
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;barres.c,69 :: 		UART1_Write('*');
	MOVLW       42
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;barres.c,68 :: 		for(i = 0; i < (int)temperatura; i++)
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;barres.c,69 :: 		UART1_Write('*');
	GOTO        L_main13
L_main14:
;barres.c,70 :: 		UART1_Write_Text(int_str);
	MOVLW       main_int_str_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_int_str_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;barres.c,71 :: 		UART1_Write('o');
	MOVLW       111
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;barres.c,72 :: 		UART1_Write('C');
	MOVLW       67
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;barres.c,73 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;barres.c,74 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;barres.c,75 :: 		for( i = 0; i<7; i++)
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main16:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVLW       7
	SUBWF       main_i_L0+0, 0 
L__main22:
	BTFSC       STATUS+0, 0 
	GOTO        L_main17
;barres.c,76 :: 		int_str[i] = 0;
	MOVLW       main_int_str_L0+0
	ADDWF       main_i_L0+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(main_int_str_L0+0)
	ADDWFC      main_i_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;barres.c,75 :: 		for( i = 0; i<7; i++)
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;barres.c,76 :: 		int_str[i] = 0;
	GOTO        L_main16
L_main17:
;barres.c,81 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 0
	BRA         L_main19
	DECFSZ      R12, 1, 0
	BRA         L_main19
	DECFSZ      R11, 1, 0
	BRA         L_main19
	NOP
;barres.c,82 :: 		}
	GOTO        L_main3
;barres.c,84 :: 		}
	GOTO        $+0
; end of _main
