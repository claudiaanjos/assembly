#Receber 10 valores inteiros e apresentar qual foi o maior e qual foi o menor valor digitado.

.data
	msg1:.asciiz"Digite o valor:"
	msg2:.asciiz"O maior valor:"
	msg3:.asciiz"O menor valor: "
	quebra_linha:.asciiz"\n"
.text
main:

	# i = $t1
	#valor = $t2
	#maior = $t3
	#menor = $t4
	
	li $t3, 0
	li $t4, 10000

	li $t1, 0

begin:
	blt $t1, 10, input
	j end

input:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	add $t2, $v0, $zero

	bgt $t2, $t3, maior

fim_maior:

	blt $t2, $t4, menor

fim_menor:

	add $t1, $t1, 1

	j begin

maior:
	add $t3, $t2, $zero
	j fim_maior
menor:
	add $t4, $t2, $zero
	j fim_menor

end:

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 1
	add $a0, $t3, $zero
	syscall

	li $v0, 4
	la $a0, quebra_linha
	syscall

	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 1
	add $a0, $t4, $zero
	syscall