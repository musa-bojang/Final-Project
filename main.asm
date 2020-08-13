
include irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data 
							;0Dh = carriage return
							;0Ah = line feed

	menu BYTE "MUSA BOJANG 1170001 Individual Assignment",0dh,0ah,0dh,0ah,   
	"1. Chapter 6",0dh,0ah,
	"2. Chapter 7",0dh,0ah,
	"3. Exit",0ah,0ah,
	"Choice> ",0
	
.code
main proc
home:
mov edx, OFFSET menu
	call WriteString
	call crlf
	call Readint
cmp eax, 1
je chapter6
cmp eax, 2
je chapter7
cmp eax, 3
je finished




chapter6:
.data
subCat1 BYTE " Sub Category of chapter 6 includes ", 0dh,0ah,0dh,0ah, 
	"1. Boolean and Comparison Instructions", 0dh, 0ah,
	"2. Conditional Jumps", 0dh,0ah,
	"3. Conditional Loop Instructions", 0dh, 0ah,
	"4. Conditional Structures", 0dh,0ah,
	"5. Conditional Control flow Directives", 0dh,0ah,
	"6. Main Menu ",0dh, 0ah,0
	
.code

	mov edx, OFFSET subCat1
	call WriteString
	call crlf
	call ReadInt ; transferred to EAX

	.if(eax ==1)
	je insidebool

	.elseif(eax == 2)
	je insidejumps

	.elseif(eax == 3)
	je insideloop

	.elseif(eax == 4)
	je insidestructures

	.elseif(eax == 5) 
	je insidecontrol
	.elseif(eax == 6) 
	je home
	.else
	jmp home 
	.endif

	jmp chapter6

insidebool:
.data
	boolmenu BYTE " Boolean and Comparison Instructions", 0dh, 0ah,0dh,0ah,
	"1. AND Operations", 0dh,0ah,
	"2. OR Operations", 0dh,0ah,
	"3. XOR Operations", 0dh, 0ah,
	"4. NOT Operations", 0dh, 0ah,
	"5. TEST Operations", 0dh, 0ah,
	"6. CMP Operations",0dh, 0ah,
	"7. Chapter 6 Menu",0dh, 0ah,0
.code

	mov edx, OFFSET boolmenu
	call WriteString
	call crlf
	call ReadInt

	.if(eax ==1)
	je Aoptr
	.elseif(eax==2)
	je Ooptr
	.elseif(eax ==3)
	je Xoptr
	.elseif(eax==4)
	je Notoptr
	.elseif(eax == 5)
	je Testoptr
	.elseif(eax == 6)
	je insidecmp
	.elseif(eax ==7)
	je chapter6
	.endif	
	
	jmp insidebool

Aoptr:
.data
optrAND BYTE "  (AND Operations) Please enter a value to be ANDed with 00110001", 0dh, 0ah,0

.code
	mov edx, OFFSET optrAND
	call WriteString
	call crlf
	call ReadInt 
	AND eax, 00110001
	mov ebx, TYPE BYTE
	call WriteBinB
	jmp insidebool

Ooptr:
.data

optrOR BYTE "  (OR Operations) Please enter a value to be ORed with 00110001", 0dh, 0ah,0
.code 
	mov edx, OFFSET optrOR
	call WriteString
	call crlf
	call ReadInt 
	OR eax, 00110001
	mov ebx, TYPE BYTE
	call WriteBinB
	jmp insidebool

Xoptr:
.data
optrXOR BYTE "  (XOR Operations) Please enter a value to be XORed with 00110001", 0dh, 0ah,0
.code
	mov edx, OFFSET optrXOR
	call WriteString
	call crlf
	call ReadInt 
	XOR eax, 00110001
	mov ebx, TYPE BYTE
	call WriteBinB
	jmp insidebool
Notoptr:
.data
optrNOT BYTE "  (NOT Operations) Please enter a value to be Negated ", 0dh, 0ah,0
.code
	mov edx, OFFSET optrNOT
	call WriteString
	call crlf
	call ReadInt 
	
	neg eax 
	call WriteInt
	jmp insidebool

Testoptr:
.data
optrtest BYTE "  (TEST Operations) The TEST instruction works same as the AND operation, ", 0dh, 0ah,0dh, 0ah,
"but unlike AND instruction,it does not change the first operand. So, if we need to check whether a number ", 0dh, 0ah,
"in a register is even or odd, we can also do this using the TEST instruction without changing the original number.", 0dh, 0ah, 0

.code
	mov edx, OFFSET optrtest
	call WriteString
	call crlf
	mov al, 8h
	TEST al, 1
	jz ValueofTest
	mov edx, OFFSET oddnum
	call WriteString
	jmp insidebool
ValueofTest:
.data
testmsg BYTE "This is an even number",0dh,0ah,0
oddnum BYTE "This is odd", 0dh, 0ah,0
.code
   
	mov edx, OFFSET testmsg
	call WriteString
	call crlf
	jmp insidebool

insidecmp:
.data
cmpmsg BYTE "CMP has already been implemented in the code",0dh, 0ah,0
.code
mov edx, OFFSET cmpmsg
call WriteString
call crlf
jmp insidebool

insidejumps:
.data

jumpmenu BYTE "The following demonstrates jumps",0dh,0ah, 0dh,0ah,
"1. based on Specific",0dh,0ah,
"2. based on Equality", 0dh,0ah,
"3. based on unsigned comparsion", 0dh,0ah,
"4. based on signed comparison", 0dh, 0ah,
"5. Chapter 6 Menu",0dh,0ah,0

.code

mov edx, OFFSET jumpmenu
call WriteString 
call crlf
call ReadInt 

cmp eax, 1
je specf
cmp eax, 2
je equal
cmp eax, 3
je unsig
cmp eax, 4
je sig
cmp eax, 5
je chapter6

jmp insidejumps

specf:
.data
specificflag BYTE " This is a jump based on specific flag. Jump if Zero. Please enter 3",0dh,0ah,0
.code
mov edx, OFFSET specificflag
call WriteString
call crlf
call ReadInt 
SUB eax, 3
mov ebx, TYPE BYTE
jz zerojump
call WriteBinB
jmp insidejumps

zerojump:
.data
zeroj BYTE " This message indicates a zero flag", 0dh, 0ah,0
.code
mov edx, OFFSET zeroj
call WriteString
call crlf
jmp insidejumps

equal:
.data
equality BYTE " This is a jump based on equality. It has been implemented at line 24 or 26",0dh, 0ah,0
.code
mov edx, OFFSET equality
call WriteString
call crlf
jmp insidejumps

unsig:
.data
unsignedcomp BYTE "This is a jump based on unsigned comparison. Please a number greater than 5", 0dh, 0ah,0
.code
mov edx, OFFSET unsignedcomp
call WriteString
call crlf
call ReadInt

cmp eax, 5
ja greater
jmp unsig

greater:
.data
great BYTE "The number you entered is greater than 5", 0dh, 0ah,0
.code
mov edx, OFFSET great
call WriteString
call crlf
jmp insidejumps

sig:
.data
signedcomp BYTE "This is a jump based on signed comparison", 0dh, 0ah,0
.code
mov edx, OFFSET signedcomp
call WriteString
call crlf
call ReadInt

cmp eax, 5
jna lesser
jmp sig

lesser:
.data
less BYTE "The number you entered is less than 5", 0dh, 0ah,0
.code
mov edx, OFFSET less
call WriteString
call crlf
jmp insidejumps

insideloop:
.data
loopmsg  BYTE "This performs a loopnz.", 0dh,0ah,0

array SWORD	-3, -6, -1, -10, 20, 40, 4
sentinel SWORD 0
.code

mov esi, OFFSET array
mov ecx, LENGTHOF array
next:
test WORD PTR [esi], 8000h
pushfd
add esi, TYPE array
popfd
loopnz next
jnz quit
sub esi, TYPE array

quit:
movsx eax,WORD PTR[esi] ; display the value
 call WriteInt
 call crlf
jmp chapter6

;.data
;notfo BYTE "Not found", 0dh, 0ah,0
;.code
;mov edx, OFFSET notfo
;call WriteString
;call crlf
;jmp chapter6

insidestructures:
.data
structuremsg  BYTE "The conditional structures are implemented at lines ....", 0dh, 0ah, 0
.code
mov edx, OFFSET  structuremsg
call WriteString
call crlf
jmp chapter6

insidecontrol:
.data
controlmsg  BYTE "The control Structure is implemented at lines 91 to 103", 0dh, 0ah, 0
.code
mov edx, OFFSET controlmsg
call WriteString
call crlf
jmp home

chapter7:
.data
subCat2 BYTE " Sub Category of chapter 7 includes", 0dh,0ah,0dh,0ah, 
	"1. Shift and Rotate Instructions", 0dh, 0ah,
	"2. Shift and Rotate Applications", 0dh,0ah,
	"3. Multiplication Instructions", 0dh, 0ah,
	"4. Main Menu", 0dh,0ah,0

.code
	mov edx, OFFSET subCat2
	call WriteString
	call crlf
	call ReadInt; transferred to EAX

	cmp eax, 1
	je shiftrotate
	cmp eax, 2
	je shiftapp
	cmp eax, 3
	je multiplication
	cmp eax, 4
	je home

	jmp chapter7


shiftrotate:
.data
shiftmsg1 BYTE "Enter a number to be shifted", 0dh, 0ah, 0
.code
mov edx, OFFSET shiftmsg1
call WriteString
call crlf
call ReadInt

shl eax, 3
mov ebx, TYPE BYTE
call WriteBinB
call crlf
 jmp chapter7
shiftapp:
.data
shiftmsg2 BYTE "This implements the application of shift instruction to do binary multiplication. ", 0dh, 0ah, 0dh, 0ah,
	">> Please enter a number to be multiplied by 36 ",0
.code
mov edx, OFFSET shiftmsg2
call WriteString
call ReadInt
;mov eax, 123
mov ebx, eax
shl eax, 5
shl eax, 2
add eax, ebx
call WriteBin
call crlf
jmp chapter7

multiplication:
.data
multimsg BYTE "Please enter a number to be multipled by 10", 0dh, 0ah,0
.code
mov edx, OFFSET multimsg
call WriteString
call crlf 
call ReadInt
;mov eax, 0002h
mov ecx, 000Ah
mul ecx
call WriteInt
call crlf
jmp chapter7 


	finished:
	invoke ExitProcess,0
main endp
end main