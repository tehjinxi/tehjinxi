1.model small
.stack 64
.data

PROMPT1 DB "Divided: $"
PROMPT2 DB "Divisor: $"
PROMPT3 DB "Quotient: $"
PROMPT4 DB "Remainder: $"

divided DB ?
divisor DB ?
quotient DB ?
remainder DB ?

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
        MOV divided,AL

        ;-------------------ASCII ADJUSTMENT
        SUB divided, 30H

        ;--------------------ENTER NEW LINE
        MOV AH,02H
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H

        ;-----------------display prompt2
        mov ah, 09h
        lea dx,PROMPT2
        INT 21H

        ;-----------------------GET USER'S INPUT
        MOV AH,01H
        INT 21H
        MOV divisor,AL

        ;-------------------ASCII ADJUSTMENT
        SUB divisor, 30H

        ;--------------------ENTER NEW LINE
        MOV AH,02H
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H

        ;----------------------Division
        XOR AX, AX  ;----------------CLEAR REGISTERS
        MOV AL,divided
        MOV BL,divisor
        DIV BL
        MOV quotient,AL
        MOV remainder,AH

        ;----------------------DISPLAY PROMPT3
        MOV AH,09H
        lea dx,PROMPT3
        INT 21H

        ;----------------------DISPLAY quotient
        MOV AH,02H
        MOV DL,quotient
        ADD DL,30H;-----------------------ASCII ADJUSTMENT
        INT 21H

        ;--------------------ENTER NEW LINE
        MOV AH,02H
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H

        ;----------------------DISPLAY PROMPT4
        MOV AH,09H
        lea dx,PROMPT4
        INT 21H

        ;----------------------DISPLAY remainder
        MOV AH,02H
        MOV DL,remainder
        ADD DL,30H;-----------------------ASCII ADJUSTMENT
        INT 21H

        ;-----------terminate program
        mov ah,4ch
        int 21h
main endp
end main
