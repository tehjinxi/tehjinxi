include irvine32.inc
decrease proto c,
	array:PTR dword, arraysize:dword

.data
	userlen dword ?
	useroff dword ?
	count dword 1
	check dword 0

.code
decrease proc c,
	array:PTR dword, arraysize:dword
	mov ecx,10

L1:
	;pushad
	mov esi, array ;address
	mov eax,[esi] ; value
	mov userlen,eax

	add array,4

	mov edi, array ;address
	mov eax,[edi] ; value

	cmp userlen,eax
	jb reset

	inc count
	jmp loop2

	reset:
		mov eax,count

		cmp check,0
		jne store
		
		mov check,eax
		
		store:
		cmp check,eax
		ja loop2

		;mov eax,0
		;mov eax,count
		mov check,eax
		mov count,1

	loop2:
		loop L1

	mov eax,check
	ret
decrease endp
end