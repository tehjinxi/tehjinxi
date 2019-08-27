.MODEL SMALL
.STACK 64
.DATA

val1 DB 6
val2 DB 3
val3 DB 4
result DB 0

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

	;-------------------------adding val1 and val2
	MOV DL,val2
    ADD DL,5
    SUB DL,val1
    ADD DL,val3

    ;---------------------------DISPLAY OUTPUT
    MOV AH,02H
    MOV result,DL
    INT 21H

    ;-------------------TERMINATE
    MOV AX,4C00H
    INT 21H
    
MAIN ENDP
END MAIN
