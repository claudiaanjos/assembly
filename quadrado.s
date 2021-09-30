.data 
	escreva00: .asciiz"Quadrado = "
.text 
main: 
	li $v0, 4
	la $a0, escreva00
	syscall

	li $v0, 5
	syscall
	add $t0, $v0, 0
	mul $t1, $t0, $t0	

	li $v0, 4
	la $a0, escreva00
	syscall #Interrupção

	li $v0, 1
	add $a0, $t1, 0
	syscall