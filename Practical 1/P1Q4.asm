.MODEL SMALL
.STACK 64
.DATA
CHAR_A DB 61H
CHAR_B DB 6DH

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

	;-------------------DISPLAY OUTPUT m
	MOV AH,02H;DISPLAY UPPERCASE b
	MOV DL,CHAR_B
	INT 21H

	;------------------------DISPLAY COMMA
	MOV DL,","
	INT 21H
	
    ;---------------------------DISPLAY OUTPUT a
    MOV AH,02H;DISPLAY UPPERCASE a
    MOV DL,CHAR_A
    INT 21H

    ;-------------------TERMINATE
    MOV AX,4C00H
    INT 21H
    
MAIN ENDP
END MAIN