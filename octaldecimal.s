# Faça um algoritmo que receba um número octal (1 < número < 10000) e converta para decimal.

.data
  msgInicial: .asciiz "\n--------------------Conversor Octal para Decimal--------------------\n\n"
  msg1: .asciiz "\nDigite um numero em octal: "
  msg2: .asciiz "\nNumero em Decimal: "
  msgErro: .asciiz "\nErro: por favor digite um numero válido!\n\n"
  msgPerg: .asciiz "\n\nDeseja converter outro numero ? (0-Nao / 1-Sim): "
  msgNInv: .asciiz "\n\nErro: esse numero nao e octal!\n"
  pulaLinha: .asciiz "\n"
.text
main:

  # $t0 - num
  # $t1 - vDec
  # $t2 - base
  # $t3 - aux
  # $t4 - resto
  # $t5 - aux2

  # Mensagem principal
  li $v0, 4
  la $a0, msgInicial
  syscall

loopPrincipal:

  li $t0, 0
  li $t1, 0
  li $t2, 1
  li $t3, 0
  li $t4, 0
  li $t5, 0

  # Recebendo numero
  # mensagem
  li $v0, 4
  la $a0, msg1
  syscall

  # recebendo valor
  li $v0, 5
  syscall
  add $t0, $v0, $zero # $t1 <- $v0 + 0

  # aux <- num + 0
  add $t3, $t0, $zero

  # (aux > 1)
  bgt $t3, 1, se
  j senao
  se:
    blt $t3, 10000, se2
    j senao
    se2:
      enquanto:
        # resto <- aux % 10
        rem $t4, $t3, 10

        # se (resto > 7)
        bgt $t4, 7, erro
        j conversao
        erro:
          # Mensagem informando que o numero não é octal
          li $v0, 4
          la $a0, msgNInv
          syscall
          j loopPrincipal
        conversao:
        # aux <- aux / 10
        div $t3, $t3, 10

        # vDec <- vDec + (resto * base)
        mul $t5, $t4, $t2
        add $t1, $t1, $t5

        # base <- base * 8
        mul $t2, $t2, 8

        # (aux > 0)
        bgt $t3, 0, enquanto
      fimEnquanto:
      j fimse
  senao:
    # Mensagem de erro
    li $v0, 4
    la $a0, msgErro
    syscall
    j loopPrincipal
  fimse:
    # Mensagem do resultado
    li $v0, 4
    la $a0, msg2
    syscall
    # Resultado
    li $v0, 1
    add $a0, $t1, 0
    syscall

    repeticaoConversao:

    # Mensagem perguntando se quer converter de novo
    li $v0, 4
    la $a0, msgPerg
    syscall
    # Recebendo valor da escolha
    li $v0, 5
    syscall
    add $t0, $v0, $zero

    beq $t0, 1 se3
    j senao3
    se3:
      j loopPrincipal
    senao3:
      beq $t0, 0 se4
      j senao4
      se4:
        j fimse3
      senao4:
        j repeticaoConversao
    fimse3: