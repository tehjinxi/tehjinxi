.model small
.stack 64
.data
INPUT1 DB ?
prompt1 db "please key in the number:$"
RESULT DB '$$$'
RESULT1 DB '$$$'
.code
main proc
        mov ax,@data
        mov ds,ax
        ;-----------------display prompt1
        mov ah, 09h
        lea dx,PROMPT1
        INT 21H

        ;-----------------------GET USER'S INPUT
        MOV AH,01H
        INT 21H
        MOV INPUT1,AL
        ;-------------------ASCII ADJUSTMENT
        SUB INPUT1, 30H

        ;-------------------------DO MULTIPLICATION
        XOR AX, AX  ;----------------CLEAR REGISTERS
        MOV AL,INPUT1
        MUL INPUT1
        AAM
        MOV RESULT, AH
        ;-------------------------DO MULTIPLICATION
        XOR AX, AX  ;----------------CLEAR REGISTERS
        MOV AL,INPUT1
        MUL INPUT1
        AAM
        MOV RESULT1, AL

       ;--------------------ENTER NEW LINE
       MOV AH,02H
       MOV DL,0AH
       INT 21H
       MOV DL,0DH
       INT 21H

       ;----------------------DISPLAY RESULT
       MOV AH,02H
       MOV DL,RESULT
       ADD DL,30H;-----------------------ASCII ADJUSTMENT
       int 21h
       ;----------------------DISPLAY RESULT
       MOV AH,02H
       MOV DL,RESULT1
       ADD DL,30H;-----------------------ASCII ADJUSTMENT
       int 21h


        ;-----------terminate program
        mov ah,4ch
        int 21h
main endp
end main
