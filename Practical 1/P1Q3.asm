.MODEL SMALL
.STACK 64
.DATA
CHAR_A DB 61H

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;---------------------------DISPLAY OUTPUT
    MOV AH,02H;DISPLAY UPPERCASE a
    MOV DL,CHAR_A
    INT 21H

	;------------------------DISPLAY COMMA
	MOV DL,","
	INT 21H

	;-------------------------CONVERT LOWER CASE TO UPPER CASE
	SUB CHAR_A,20H
	
	;-------------------DISPLAY UPPER CASE A
	MOV DL,CHAR_A
	INT 21H

    ;-------------------TERMINATE
    MOV AX,4C00H
    INT 21H
    
MAIN ENDP
END MAIN