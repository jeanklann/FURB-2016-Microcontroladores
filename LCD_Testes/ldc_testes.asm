
_CustomChar:

;ldc_testes.c,24 :: 		void CustomChar(){
;ldc_testes.c,26 :: 		LCD_Cmd(0x40);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ldc_testes.c,27 :: 		for(i = 0; i<=7; i++) LCD_Chr_Cp(ampulheta[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar0:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar1
	MOVLW       _ampulheta+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_ampulheta+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_ampulheta+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar0
L_CustomChar1:
;ldc_testes.c,28 :: 		for(i = 0; i<=7; i++) LCD_Chr_Cp(pacmanaberto[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar3:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar4
	MOVLW       _pacmanaberto+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_pacmanaberto+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_pacmanaberto+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar3
L_CustomChar4:
;ldc_testes.c,29 :: 		for(i = 0; i<=7; i++) LCD_Chr_Cp(pacmanfechado[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar6:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar7
	MOVLW       _pacmanfechado+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_pacmanfechado+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_pacmanfechado+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar6
L_CustomChar7:
;ldc_testes.c,31 :: 		LCD_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ldc_testes.c,32 :: 		}
	RETURN      0
; end of _CustomChar

_VoltaProComeco:

;ldc_testes.c,34 :: 		void VoltaProComeco(){
;ldc_testes.c,35 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ldc_testes.c,36 :: 		}
	RETURN      0
; end of _VoltaProComeco

_main:

;ldc_testes.c,38 :: 		void main(){
;ldc_testes.c,39 :: 		adcon1 = 0x0f;
	MOVLW       15
	MOVWF       ADCON1+0 
;ldc_testes.c,41 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;ldc_testes.c,42 :: 		CustomChar();
	CALL        _CustomChar+0, 0
;ldc_testes.c,43 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ldc_testes.c,44 :: 		while(1){
L_main9:
;ldc_testes.c,45 :: 		VoltaProComeco();
	CALL        _VoltaProComeco+0, 0
;ldc_testes.c,46 :: 		Delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 0
	BRA         L_main11
	DECFSZ      R12, 1, 0
	BRA         L_main11
	DECFSZ      R11, 1, 0
	BRA         L_main11
	NOP
	NOP
;ldc_testes.c,47 :: 		Lcd_Chr_Cp(1);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;ldc_testes.c,48 :: 		VoltaProComeco();
	CALL        _VoltaProComeco+0, 0
;ldc_testes.c,49 :: 		Delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 0
	BRA         L_main12
	DECFSZ      R12, 1, 0
	BRA         L_main12
	DECFSZ      R11, 1, 0
	BRA         L_main12
	NOP
	NOP
;ldc_testes.c,50 :: 		Lcd_Chr_Cp(2);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;ldc_testes.c,51 :: 		}
	GOTO        L_main9
;ldc_testes.c,55 :: 		}
	GOTO        $+0
; end of _main
