.data 
	escreva00: .asciiz"Digite um numero inteiro\n" 
	escreva01: .asciiz"Numero Par\n"
	escreva02: .asciiz"Numero impar\n"
.text 
main: 
	li $v0, 4
	la $a0, escreva00
	syscall

	li $v0, 5
	syscall
	add $t0, $v0, 0

	rem $t1, $t0, 2

	beq $t1, 0, entao
	j senao

entao:
	li $v0, 4
	la $a0, escreva01
	syscall
	j fimse

senao:
	li $v0, 4
	la $a0, escreva02
	syscall
	j fimse

fimse: