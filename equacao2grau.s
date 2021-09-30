.data
	escreva00:.asciiz"\nConsiderando uma eq. de 2o grau do tipo ax2 + bx + c\n"
	escreva01:.asciiz"\nDigite a:"
	escreva02:.asciiz"\nDigite b:"
	escreva03:.asciiz"\nDigite c:"
	escreva04:.asciiz"\nRaiz x1:"
	escreva05:.asciiz"\nRaiz x2:"
	escreva06:.asciiz"\nA nao pode ser 0"
	escreva07:.asciiz"\nNao tem raizes reais"
.text
main:
	#$t0 = a ; $t1 = b ; $t2 = c ; $t3 = delta
	#$t4 = b * b ; $t5 = 4 * a * c
	#$t6 = -b ; $t7 = 2 * a ; $t8 = x1 ; $t9 = x2
	#Algoritmo de Pell raiz de delta
	#$s0 = m ; #$s1 = n (Raiz de Delta) ; $s2 = i
	
	li $v0, 4
	la $a0, escreva00
	syscall
	
	li $v0, 4
	la $a0, escreva01
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	beq $t0, 0, entaoazero
	j fimseazero
	
entaoazero:
	li $v0, 4
	la $a0, escreva06
	syscall
	
	j fimseazero
	
fimseazero:
	beq $t0, 0, main
	
	li $v0, 4
	la $a0, escreva02
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	li $v0, 4
	la $a0, escreva03
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0	
	
	#$t3 = delta
	#$t4 = b * b ; $t5 = 4 * a * c
	mul $t4, $t1, $t1
	mul $t5, $t0, 4
	mul $t5, $t5, $t2
	sub $t3, $t4, $t5
	
	bge $t3, 0, entaodeltapositivo
	j senaodeltapositivo

entaodeltapositivo:
	#Algoritmo de Pell raiz de delta
	#$s0 = m ; #$s1 = n (Raiz de Delta) ; $s2 = i
	add $s0, $t3, 0
	li $s1, 0
	
	bgt $s0, 0, entaommaiorzero
	j fimsemmaiorzero
	
	entaommaiorzero:
		li $s2, 1
		enquanto:
			sub $s0, $s0, $s2
			add $s2, $s2, 2
			add $s1, $s1, 1
		bge $s0, $s2, enquanto
	fimsemmaiorzero:
	# $s1 é a raiz de delta
	#$t6 = -b ; $t7 = 2 * a ; $t8 = x1 ; $t9 = x2
	mul $t6, $t1, -1
	mul $t7, $t0, 2
	
	add $t8, $t6, $s1
	div $t8, $t8, $t7
	
	sub $t9, $t6, $s1
	div $t9, $t9, $t7
	
	li $v0, 4
	la $a0, escreva04
	syscall
	
	li $v0, 1
	add $a0, $t8, 0
	syscall
	
	li $v0, 4
	la $a0, escreva05
	syscall
	
	li $v0, 1
	add $a0, $t9, 0
	syscall
	
	j fimsedeltapositivo
	
senaodeltapositivo:
	li $v0, 4
	la $a0, escreva07
	syscall
	
	j fimsedeltapositivo
	
fimsedeltapositivo: