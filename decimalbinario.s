.data
	msg1:.asciiz"\nDigite um numero decimal > 1 e <= 1000: "
	msg2:.asciiz"Valor em binario: "
.text
main:

  #  resultado = $t0
  #  valor= $t1
  #  divisao = $t2
  #  resto = $t3
  #  auxiliar =  $t5
  #  auxiliar_binario = $t6

  li $t0, 0   # resultado = 0

  li $t6, 1   # auxiliar_binario = 1

  enquantoInvalido:

    #mostra msg1
    li $v0, 4
    la $a0, msg1
    syscall

    #le o valor digitado
    li $v0, 5
    syscall
    add $t1, $v0, $zero

    # validando
    ble $t1, 1, enquantoInvalido      # se $t1 <= 1, volte pro enquantoInvalido
    bgt $t1, 1000, enquantoInvalido   # se $t1 > 1000, volte pro enquantoInvalido

		faca:
			rem $t3, $t1, 2		        # ($t3 = $t1 % 2) resto = valor % 2
			div $t2, $t1, 2		        # ($t2 = $t1 / 2)	divisao = valor / 2
			add $t1, $t2, $zero		#($t1 = $t2 ) valor = divisao
			mul $t5, $t3, $t6		# ($t5 = $t3 * $ t6) auxiliar = resto * auxiliar_binario
			add $t0, $t0, $t5		# ($t0 = $t0 + $t5) resultado = resultado + auxiliar
			mul $t6, $t6, 10		# ($t6 = $t6 * 10) auxiliar_binario = auxiliar_binario * 10

		enquanto:
		bgt $t2, 0, faca

	#escreve msg2
	li $v0, 4
	la $a0, msg2
	syscall

	#escreve $t0
  	li $v0,1
  	add $a0, $t0, $zero
  	syscall