.data
	msg1:.asciiz"\nDigite um numero >= 0 e <= 10: "
	msg2:.asciiz"\nO valor é: "
.text
main:

	li $t1,1

	enquantoInvalido:

	li $v0,4
	la $a0,msg1
	syscall

	li $v0,5
	syscall
	add $t0,$v0,$zero

	blt $t0,0 enquantoInvalido

	inicioenqto:
	bgt $t0,1,enquanto
	
	li $v0,1
	add $a0, $t1, $zero
	syscall
	j fimenquanto

	enquanto:
	mul $t1,$t1,$t0		
	sub $t0,$t0,1 		
	j inicioenqto		

	fimenquanto: