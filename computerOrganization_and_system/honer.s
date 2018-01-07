.data
 output: .asciiz " hi ,ta "

 .text
  la $a0,output
  li $v0,4
  syscall

