
_le_teclado:

;teste_teclado.c,2 :: 		unsigned short le_teclado(){
;teste_teclado.c,3 :: 		PORTB = 0x70;
	MOVLW       112
	MOVWF       PORTB+0 
;teste_teclado.c,4 :: 		if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return('A'); }
	BTFSC       PORTB+0, 0 
	GOTO        L_le_teclado0
L_le_teclado1:
	BTFSC       PORTB+0, 0 
	GOTO        L_le_teclado2
	GOTO        L_le_teclado1
L_le_teclado2:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado3:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado3
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado3
	NOP
	NOP
	MOVLW       65
	MOVWF       R0 
	RETURN      0
L_le_teclado0:
;teste_teclado.c,5 :: 		if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return('B'); }
	BTFSC       PORTB+0, 1 
	GOTO        L_le_teclado4
L_le_teclado5:
	BTFSC       PORTB+0, 1 
	GOTO        L_le_teclado6
	GOTO        L_le_teclado5
L_le_teclado6:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado7:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado7
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado7
	NOP
	NOP
	MOVLW       66
	MOVWF       R0 
	RETURN      0
L_le_teclado4:
;teste_teclado.c,6 :: 		if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return('C'); }
	BTFSC       PORTB+0, 2 
	GOTO        L_le_teclado8
L_le_teclado9:
	BTFSC       PORTB+0, 2 
	GOTO        L_le_teclado10
	GOTO        L_le_teclado9
L_le_teclado10:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado11:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado11
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado11
	NOP
	NOP
	MOVLW       67
	MOVWF       R0 
	RETURN      0
L_le_teclado8:
;teste_teclado.c,7 :: 		if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return('D'); }
	BTFSC       PORTB+0, 3 
	GOTO        L_le_teclado12
L_le_teclado13:
	BTFSC       PORTB+0, 3 
	GOTO        L_le_teclado14
	GOTO        L_le_teclado13
L_le_teclado14:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado15:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado15
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado15
	NOP
	NOP
	MOVLW       68
	MOVWF       R0 
	RETURN      0
L_le_teclado12:
;teste_teclado.c,8 :: 		PORTB = 0xB0;
	MOVLW       176
	MOVWF       PORTB+0 
;teste_teclado.c,9 :: 		if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return('3'); }
	BTFSC       PORTB+0, 0 
	GOTO        L_le_teclado16
L_le_teclado17:
	BTFSC       PORTB+0, 0 
	GOTO        L_le_teclado18
	GOTO        L_le_teclado17
L_le_teclado18:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado19:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado19
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado19
	NOP
	NOP
	MOVLW       51
	MOVWF       R0 
	RETURN      0
L_le_teclado16:
;teste_teclado.c,10 :: 		if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return('6'); }
	BTFSC       PORTB+0, 1 
	GOTO        L_le_teclado20
L_le_teclado21:
	BTFSC       PORTB+0, 1 
	GOTO        L_le_teclado22
	GOTO        L_le_teclado21
L_le_teclado22:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado23:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado23
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado23
	NOP
	NOP
	MOVLW       54
	MOVWF       R0 
	RETURN      0
L_le_teclado20:
;teste_teclado.c,11 :: 		if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return('9'); }
	BTFSC       PORTB+0, 2 
	GOTO        L_le_teclado24
L_le_teclado25:
	BTFSC       PORTB+0, 2 
	GOTO        L_le_teclado26
	GOTO        L_le_teclado25
L_le_teclado26:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado27:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado27
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado27
	NOP
	NOP
	MOVLW       57
	MOVWF       R0 
	RETURN      0
L_le_teclado24:
;teste_teclado.c,12 :: 		if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return('#'); }
	BTFSC       PORTB+0, 3 
	GOTO        L_le_teclado28
L_le_teclado29:
	BTFSC       PORTB+0, 3 
	GOTO        L_le_teclado30
	GOTO        L_le_teclado29
L_le_teclado30:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado31:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado31
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado31
	NOP
	NOP
	MOVLW       35
	MOVWF       R0 
	RETURN      0
L_le_teclado28:
;teste_teclado.c,13 :: 		PORTB = 0xD0;
	MOVLW       208
	MOVWF       PORTB+0 
;teste_teclado.c,14 :: 		if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return('2'); }
	BTFSC       PORTB+0, 0 
	GOTO        L_le_teclado32
L_le_teclado33:
	BTFSC       PORTB+0, 0 
	GOTO        L_le_teclado34
	GOTO        L_le_teclado33
L_le_teclado34:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado35:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado35
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado35
	NOP
	NOP
	MOVLW       50
	MOVWF       R0 
	RETURN      0
L_le_teclado32:
;teste_teclado.c,15 :: 		if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return('5'); }
	BTFSC       PORTB+0, 1 
	GOTO        L_le_teclado36
L_le_teclado37:
	BTFSC       PORTB+0, 1 
	GOTO        L_le_teclado38
	GOTO        L_le_teclado37
L_le_teclado38:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado39:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado39
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado39
	NOP
	NOP
	MOVLW       53
	MOVWF       R0 
	RETURN      0
L_le_teclado36:
;teste_teclado.c,16 :: 		if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return('8'); }
	BTFSC       PORTB+0, 2 
	GOTO        L_le_teclado40
L_le_teclado41:
	BTFSC       PORTB+0, 2 
	GOTO        L_le_teclado42
	GOTO        L_le_teclado41
L_le_teclado42:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado43:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado43
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado43
	NOP
	NOP
	MOVLW       56
	MOVWF       R0 
	RETURN      0
L_le_teclado40:
;teste_teclado.c,17 :: 		if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return('0'); }
	BTFSC       PORTB+0, 3 
	GOTO        L_le_teclado44
L_le_teclado45:
	BTFSC       PORTB+0, 3 
	GOTO        L_le_teclado46
	GOTO        L_le_teclado45
L_le_teclado46:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado47:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado47
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado47
	NOP
	NOP
	MOVLW       48
	MOVWF       R0 
	RETURN      0
L_le_teclado44:
;teste_teclado.c,18 :: 		PORTB = 0xE0;
	MOVLW       224
	MOVWF       PORTB+0 
;teste_teclado.c,19 :: 		if(!PORTB.F0) { while(!PORTB.F0); Delay_ms(20); return('1'); }
	BTFSC       PORTB+0, 0 
	GOTO        L_le_teclado48
L_le_teclado49:
	BTFSC       PORTB+0, 0 
	GOTO        L_le_teclado50
	GOTO        L_le_teclado49
L_le_teclado50:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado51:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado51
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado51
	NOP
	NOP
	MOVLW       49
	MOVWF       R0 
	RETURN      0
L_le_teclado48:
;teste_teclado.c,20 :: 		if(!PORTB.F1) { while(!PORTB.F1); Delay_ms(20); return('4'); }
	BTFSC       PORTB+0, 1 
	GOTO        L_le_teclado52
L_le_teclado53:
	BTFSC       PORTB+0, 1 
	GOTO        L_le_teclado54
	GOTO        L_le_teclado53
L_le_teclado54:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado55:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado55
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado55
	NOP
	NOP
	MOVLW       52
	MOVWF       R0 
	RETURN      0
L_le_teclado52:
;teste_teclado.c,21 :: 		if(!PORTB.F2) { while(!PORTB.F2); Delay_ms(20); return('7'); }
	BTFSC       PORTB+0, 2 
	GOTO        L_le_teclado56
L_le_teclado57:
	BTFSC       PORTB+0, 2 
	GOTO        L_le_teclado58
	GOTO        L_le_teclado57
L_le_teclado58:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado59:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado59
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado59
	NOP
	NOP
	MOVLW       55
	MOVWF       R0 
	RETURN      0
L_le_teclado56:
;teste_teclado.c,22 :: 		if(!PORTB.F3) { while(!PORTB.F3); Delay_ms(20); return('*'); }
	BTFSC       PORTB+0, 3 
	GOTO        L_le_teclado60
L_le_teclado61:
	BTFSC       PORTB+0, 3 
	GOTO        L_le_teclado62
	GOTO        L_le_teclado61
L_le_teclado62:
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_le_teclado63:
	DECFSZ      R13, 1, 0
	BRA         L_le_teclado63
	DECFSZ      R12, 1, 0
	BRA         L_le_teclado63
	NOP
	NOP
	MOVLW       42
	MOVWF       R0 
	RETURN      0
L_le_teclado60:
;teste_teclado.c,23 :: 		return(255);
	MOVLW       255
	MOVWF       R0 
;teste_teclado.c,24 :: 		}
	RETURN      0
; end of _le_teclado

_main:

;teste_teclado.c,26 :: 		void main(){
;teste_teclado.c,28 :: 		TRISB = 0B00001111;
	MOVLW       15
	MOVWF       TRISB+0 
;teste_teclado.c,30 :: 		INTCON2.RBPU = 0;
	BCF         INTCON2+0, 7 
;teste_teclado.c,32 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;teste_teclado.c,33 :: 		UART1_Init(19200);
	MOVLW       25
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;teste_teclado.c,34 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main64:
	DECFSZ      R13, 1, 0
	BRA         L_main64
	DECFSZ      R12, 1, 0
	BRA         L_main64
	DECFSZ      R11, 1, 0
	BRA         L_main64
	NOP
;teste_teclado.c,35 :: 		UART1_write_text("Start");
	MOVLW       ?lstr1_teste_teclado+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_teste_teclado+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;teste_teclado.c,36 :: 		while(1){
L_main65:
;teste_teclado.c,37 :: 		tecla = le_teclado();
	CALL        _le_teclado+0, 0
	MOVF        R0, 0 
	MOVWF       _tecla+0 
;teste_teclado.c,38 :: 		while(tecla == 255){
L_main67:
	MOVF        _tecla+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main68
;teste_teclado.c,39 :: 		tecla = le_teclado();
	CALL        _le_teclado+0, 0
	MOVF        R0, 0 
	MOVWF       _tecla+0 
;teste_teclado.c,40 :: 		}
	GOTO        L_main67
L_main68:
;teste_teclado.c,41 :: 		UART1_write(tecla);
	MOVF        _tecla+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;teste_teclado.c,42 :: 		}
	GOTO        L_main65
;teste_teclado.c,43 :: 		}
	GOTO        $+0
; end of _main
