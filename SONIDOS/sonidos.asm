
_main:

;sonidos.c,1 :: 		void main() {
;sonidos.c,2 :: 		char byte_recebido = 0;
	CLRF        main_byte_recebido_L0+0 
;sonidos.c,3 :: 		UART1_Init(19200);
	MOVLW       25
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;sonidos.c,4 :: 		Sound_Init(&PORTC, 2);
	MOVLW       PORTC+0
	MOVWF       FARG_Sound_Init_snd_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Sound_Init_snd_port+1 
	MOVLW       2
	MOVWF       FARG_Sound_Init_snd_pin+0 
	CALL        _Sound_Init+0, 0
;sonidos.c,6 :: 		while(1)
L_main0:
;sonidos.c,9 :: 		if(UART1_Data_Ready())
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;sonidos.c,11 :: 		byte_recebido = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_byte_recebido_L0+0 
;sonidos.c,12 :: 		}
L_main2:
;sonidos.c,13 :: 		switch(byte_recebido){
	GOTO        L_main3
;sonidos.c,14 :: 		case '1': Sound_Play(200, 25);
L_main5:
	MOVLW       200
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       25
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;sonidos.c,15 :: 		break;
	GOTO        L_main4
;sonidos.c,16 :: 		case '2': Sound_Play(400, 25);
L_main6:
	MOVLW       144
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       1
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       25
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;sonidos.c,17 :: 		break;
	GOTO        L_main4
;sonidos.c,18 :: 		case '3': Sound_Play(600, 25);
L_main7:
	MOVLW       88
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       2
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       25
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;sonidos.c,19 :: 		break;
	GOTO        L_main4
;sonidos.c,20 :: 		case '4': Sound_Play(800, 25);
L_main8:
	MOVLW       32
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       3
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       25
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;sonidos.c,21 :: 		break;
	GOTO        L_main4
;sonidos.c,22 :: 		case '5': Sound_Play(1000, 25);
L_main9:
	MOVLW       232
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       3
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       25
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;sonidos.c,23 :: 		break;
	GOTO        L_main4
;sonidos.c,24 :: 		case '6': Sound_Play(1200, 25);
L_main10:
	MOVLW       176
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       4
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       25
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;sonidos.c,25 :: 		break;
	GOTO        L_main4
;sonidos.c,26 :: 		case '7': Sound_Play(1400, 25);
L_main11:
	MOVLW       120
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       5
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       25
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;sonidos.c,27 :: 		break;
	GOTO        L_main4
;sonidos.c,28 :: 		case '8': Sound_Play(1600, 25);
L_main12:
	MOVLW       64
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       6
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       25
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;sonidos.c,29 :: 		break;
	GOTO        L_main4
;sonidos.c,30 :: 		case '9': Sound_Play(1800, 25);
L_main13:
	MOVLW       8
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       7
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       25
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;sonidos.c,31 :: 		break;
	GOTO        L_main4
;sonidos.c,32 :: 		case '0': Sound_Play(2000, 25);
L_main14:
	MOVLW       208
	MOVWF       FARG_Sound_Play_freq_in_hz+0 
	MOVLW       7
	MOVWF       FARG_Sound_Play_freq_in_hz+1 
	MOVLW       25
	MOVWF       FARG_Sound_Play_duration_ms+0 
	MOVLW       0
	MOVWF       FARG_Sound_Play_duration_ms+1 
	CALL        _Sound_Play+0, 0
;sonidos.c,33 :: 		break;
	GOTO        L_main4
;sonidos.c,35 :: 		}
L_main3:
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       52
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       53
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       54
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       55
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       56
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       57
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
	MOVF        main_byte_recebido_L0+0, 0 
	XORLW       48
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
L_main4:
;sonidos.c,36 :: 		}
	GOTO        L_main0
;sonidos.c,37 :: 		}
	GOTO        $+0
; end of _main
