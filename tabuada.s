.data 
	escreva00: .asciiz"Digite um numero inteiro\n" 
	escreva01: .asciiz"\n"
.text 
main: 
	li $v0, 4
	la $a0, escreva00
	syscall

	li $v0, 5
	syscall
	add $t0, $v0, 0

	li $t1, 0

enquanto:
	mul $t2, $t0, $t1

	li $v0, 1
	add $a0, $t2, 0
	syscall

	li $v0, 4
	la $a0, escreva01
	syscall	

	add $t1, $t1, 1

	ble $t1, 10, enquanto