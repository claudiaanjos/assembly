.data
	escreva00:.asciiz"\nDigite um numero natural: "
	escreva01:.asciiz"\nA raiz natural eh : "
.text
main:
	#$s0 = m ; $s1 = n ; $s2 = i
	li $v0, 4
	la $a0, escreva00
	syscall
	
	li $v0, 5
	syscall
	add $s0, $v0, 0
	
	li $s1, 0
	
	bgt $s0, 0 entao
	j fimse

entao:
	li $s2, 1
enquanto:
	sub $s0, $s0, $s2
	add $s2, $s2, 2
	add $s1, $s1, 1
	
	bge $s0, $s2, enquanto

fimse:
	li $v0, 4
	la $a0, escreva01
	syscall
	
	li $v0, 1
	add $a0, $s1, 0
	syscall