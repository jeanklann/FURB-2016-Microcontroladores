
_CustomChar:

;temp_lcd.c,36 :: 		void CustomChar(){
;temp_lcd.c,38 :: 		LCD_Cmd(0x40);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;temp_lcd.c,39 :: 		for(i = 0; i<=7; i++) LCD_Chr_Cp(char1[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar0:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar1
	MOVLW       _char1+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_char1+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_char1+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar0
L_CustomChar1:
;temp_lcd.c,40 :: 		for(i = 0; i<=7; i++) LCD_Chr_Cp(char2[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar3:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar4
	MOVLW       _char2+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_char2+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_char2+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar3
L_CustomChar4:
;temp_lcd.c,41 :: 		for(i = 0; i<=7; i++) LCD_Chr_Cp(char3[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar6:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar7
	MOVLW       _char3+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_char3+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_char3+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar6
L_CustomChar7:
;temp_lcd.c,42 :: 		for(i = 0; i<=7; i++) LCD_Chr_Cp(char4[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar9:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar10
	MOVLW       _char4+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_char4+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_char4+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar9
L_CustomChar10:
;temp_lcd.c,43 :: 		for(i = 0; i<=7; i++) LCD_Chr_Cp(char5[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar12:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar13
	MOVLW       _char5+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_char5+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_char5+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar12
L_CustomChar13:
;temp_lcd.c,44 :: 		for(i = 0; i<=7; i++) LCD_Chr_Cp(char6[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar15:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar16
	MOVLW       _char6+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_char6+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_char6+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar15
L_CustomChar16:
;temp_lcd.c,45 :: 		for(i = 0; i<=7; i++) LCD_Chr_Cp(char7[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar18:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar19
	MOVLW       _char7+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_char7+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_char7+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar18
L_CustomChar19:
;temp_lcd.c,46 :: 		for(i = 0; i<=7; i++) LCD_Chr_Cp(char8[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar21:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar22
	MOVLW       _char8+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_char8+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_char8+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar21
L_CustomChar22:
;temp_lcd.c,47 :: 		LCD_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;temp_lcd.c,48 :: 		}
	RETURN      0
; end of _CustomChar

_VoltaProComeco:

;temp_lcd.c,50 :: 		void VoltaProComeco(){
;temp_lcd.c,51 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;temp_lcd.c,52 :: 		}
	RETURN      0
; end of _VoltaProComeco

_main:

;temp_lcd.c,54 :: 		void main(){
;temp_lcd.c,55 :: 		TRISC.F1 = 0; //aquecedor
	BCF         TRISC+0, 1 
;temp_lcd.c,56 :: 		TRISC.F2 = 0; //ventoinha
	BCF         TRISC+0, 2 
;temp_lcd.c,57 :: 		PORTC.F1 = 1; //liga aquecedor
	BSF         PORTC+0, 1 
;temp_lcd.c,60 :: 		adcon1 = 0x0f;
	MOVLW       15
	MOVWF       ADCON1+0 
;temp_lcd.c,62 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;temp_lcd.c,63 :: 		CustomChar();
	CALL        _CustomChar+0, 0
;temp_lcd.c,64 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;temp_lcd.c,65 :: 		while(1){
L_main24:
;temp_lcd.c,66 :: 		for(i = 0; i < 15; i++) temperatura_str[i] = 0;
	CLRF        _i+0 
	CLRF        _i+1 
L_main26:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main58
	MOVLW       15
	SUBWF       _i+0, 0 
L__main58:
	BTFSC       STATUS+0, 0 
	GOTO        L_main27
	MOVLW       _temperatura_str+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(_temperatura_str+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main26
L_main27:
;temp_lcd.c,67 :: 		temperatura_ate_1023 = ADC_Read(3);
	MOVLW       3
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _temperatura_ate_1023+0 
	MOVF        R1, 0 
	MOVWF       _temperatura_ate_1023+1 
;temp_lcd.c,68 :: 		temperatura = (temperatura_ate_1023*(5.0/1023.0)) * 100.0;
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
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        FLOC__main+0, 0 
	MOVWF       _temperatura+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       _temperatura+1 
	MOVF        FLOC__main+2, 0 
	MOVWF       _temperatura+2 
	MOVF        FLOC__main+3, 0 
	MOVWF       _temperatura+3 
;temp_lcd.c,69 :: 		temperaturaInt = (int)temperatura;
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
	MOVF        FLOC__main+2, 0 
	MOVWF       R2 
	MOVF        FLOC__main+3, 0 
	MOVWF       R3 
	CALL        _Double2Int+0, 0
	MOVF        R0, 0 
	MOVWF       _temperaturaInt+0 
	MOVF        R1, 0 
	MOVWF       _temperaturaInt+1 
;temp_lcd.c,70 :: 		if(temperatura<=25){
	MOVF        FLOC__main+0, 0 
	MOVWF       R4 
	MOVF        FLOC__main+1, 0 
	MOVWF       R5 
	MOVF        FLOC__main+2, 0 
	MOVWF       R6 
	MOVF        FLOC__main+3, 0 
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
	GOTO        L_main29
;temp_lcd.c,71 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;temp_lcd.c,72 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;temp_lcd.c,73 :: 		} else if(temperatura >= 40){
	GOTO        L_main30
L_main29:
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	MOVF        _temperatura+0, 0 
	MOVWF       R0 
	MOVF        _temperatura+1, 0 
	MOVWF       R1 
	MOVF        _temperatura+2, 0 
	MOVWF       R2 
	MOVF        _temperatura+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main31
;temp_lcd.c,74 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;temp_lcd.c,75 :: 		PORTC.F2 = 1;
	BSF         PORTC+0, 2 
;temp_lcd.c,76 :: 		}
L_main31:
L_main30:
;temp_lcd.c,77 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;temp_lcd.c,78 :: 		switch(temperaturaInt){
	GOTO        L_main32
;temp_lcd.c,79 :: 		case 31: Lcd_Chr_Cp(0); break;
L_main34:
	CLRF        FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main33
;temp_lcd.c,80 :: 		case 32: Lcd_Chr_Cp(1); break;
L_main35:
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main33
;temp_lcd.c,81 :: 		case 33: Lcd_Chr_Cp(2); break;
L_main36:
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main33
;temp_lcd.c,82 :: 		case 34: Lcd_Chr_Cp(3); break;
L_main37:
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main33
;temp_lcd.c,83 :: 		case 35: Lcd_Chr_Cp(4); break;
L_main38:
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main33
;temp_lcd.c,84 :: 		case 36: Lcd_Chr_Cp(5); break;
L_main39:
	MOVLW       5
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main33
;temp_lcd.c,85 :: 		case 37: Lcd_Chr_Cp(6); break;
L_main40:
	MOVLW       6
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main33
;temp_lcd.c,86 :: 		case 38: Lcd_Chr_Cp(7); break;
L_main41:
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main33
;temp_lcd.c,87 :: 		default:
L_main42:
;temp_lcd.c,88 :: 		if(temperatura>=38) Lcd_Chr_Cp(7);
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       24
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	MOVF        _temperatura+0, 0 
	MOVWF       R0 
	MOVF        _temperatura+1, 0 
	MOVWF       R1 
	MOVF        _temperatura+2, 0 
	MOVWF       R2 
	MOVF        _temperatura+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main43
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main44
L_main43:
;temp_lcd.c,89 :: 		else Lcd_Chr(1,1,' ');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_main44:
;temp_lcd.c,90 :: 		}
	GOTO        L_main33
L_main32:
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main59
	MOVLW       31
	XORWF       _temperaturaInt+0, 0 
L__main59:
	BTFSC       STATUS+0, 2 
	GOTO        L_main34
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main60
	MOVLW       32
	XORWF       _temperaturaInt+0, 0 
L__main60:
	BTFSC       STATUS+0, 2 
	GOTO        L_main35
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main61
	MOVLW       33
	XORWF       _temperaturaInt+0, 0 
L__main61:
	BTFSC       STATUS+0, 2 
	GOTO        L_main36
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main62
	MOVLW       34
	XORWF       _temperaturaInt+0, 0 
L__main62:
	BTFSC       STATUS+0, 2 
	GOTO        L_main37
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main63
	MOVLW       35
	XORWF       _temperaturaInt+0, 0 
L__main63:
	BTFSC       STATUS+0, 2 
	GOTO        L_main38
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main64
	MOVLW       36
	XORWF       _temperaturaInt+0, 0 
L__main64:
	BTFSC       STATUS+0, 2 
	GOTO        L_main39
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main65
	MOVLW       37
	XORWF       _temperaturaInt+0, 0 
L__main65:
	BTFSC       STATUS+0, 2 
	GOTO        L_main40
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main66
	MOVLW       38
	XORWF       _temperaturaInt+0, 0 
L__main66:
	BTFSC       STATUS+0, 2 
	GOTO        L_main41
	GOTO        L_main42
L_main33:
;temp_lcd.c,91 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;temp_lcd.c,92 :: 		switch(temperaturaInt){
	GOTO        L_main45
;temp_lcd.c,93 :: 		case 23: Lcd_Chr_Cp(0); break;
L_main47:
	CLRF        FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main46
;temp_lcd.c,94 :: 		case 24: Lcd_Chr_Cp(1); break;
L_main48:
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main46
;temp_lcd.c,95 :: 		case 25: Lcd_Chr_Cp(2); break;
L_main49:
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main46
;temp_lcd.c,96 :: 		case 26: Lcd_Chr_Cp(3); break;
L_main50:
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main46
;temp_lcd.c,97 :: 		case 27: Lcd_Chr_Cp(4); break;
L_main51:
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main46
;temp_lcd.c,98 :: 		case 28: Lcd_Chr_Cp(5); break;
L_main52:
	MOVLW       5
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main46
;temp_lcd.c,99 :: 		case 29: Lcd_Chr_Cp(6); break;
L_main53:
	MOVLW       6
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main46
;temp_lcd.c,100 :: 		case 30: Lcd_Chr_Cp(7); break;
L_main54:
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main46
;temp_lcd.c,101 :: 		default:
L_main55:
;temp_lcd.c,102 :: 		if(temperatura>=30) Lcd_Chr_Cp(7);
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	MOVF        _temperatura+0, 0 
	MOVWF       R0 
	MOVF        _temperatura+1, 0 
	MOVWF       R1 
	MOVF        _temperatura+2, 0 
	MOVWF       R2 
	MOVF        _temperatura+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main56
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	GOTO        L_main57
L_main56:
;temp_lcd.c,103 :: 		else Lcd_Chr(2,1,' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_main57:
;temp_lcd.c,104 :: 		}
	GOTO        L_main46
L_main45:
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main67
	MOVLW       23
	XORWF       _temperaturaInt+0, 0 
L__main67:
	BTFSC       STATUS+0, 2 
	GOTO        L_main47
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main68
	MOVLW       24
	XORWF       _temperaturaInt+0, 0 
L__main68:
	BTFSC       STATUS+0, 2 
	GOTO        L_main48
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main69
	MOVLW       25
	XORWF       _temperaturaInt+0, 0 
L__main69:
	BTFSC       STATUS+0, 2 
	GOTO        L_main49
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main70
	MOVLW       26
	XORWF       _temperaturaInt+0, 0 
L__main70:
	BTFSC       STATUS+0, 2 
	GOTO        L_main50
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main71
	MOVLW       27
	XORWF       _temperaturaInt+0, 0 
L__main71:
	BTFSC       STATUS+0, 2 
	GOTO        L_main51
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main72
	MOVLW       28
	XORWF       _temperaturaInt+0, 0 
L__main72:
	BTFSC       STATUS+0, 2 
	GOTO        L_main52
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main73
	MOVLW       29
	XORWF       _temperaturaInt+0, 0 
L__main73:
	BTFSC       STATUS+0, 2 
	GOTO        L_main53
	MOVLW       0
	XORWF       _temperaturaInt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main74
	MOVLW       30
	XORWF       _temperaturaInt+0, 0 
L__main74:
	BTFSC       STATUS+0, 2 
	GOTO        L_main54
	GOTO        L_main55
L_main46:
;temp_lcd.c,129 :: 		FloatToStr(temperatura, temperatura_str);
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _temperatura+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _temperatura+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _temperatura_str+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_temperatura_str+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;temp_lcd.c,130 :: 		Lcd_Out(1, 3, "Temp:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_temp_lcd+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_temp_lcd+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;temp_lcd.c,131 :: 		Lcd_Out(2, 3, temperatura_str);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _temperatura_str+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_temperatura_str+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;temp_lcd.c,133 :: 		}
	GOTO        L_main24
;temp_lcd.c,137 :: 		}
	GOTO        $+0
; end of _main
