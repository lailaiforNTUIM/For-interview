.data


output1: .asciiz " the lcm of (x,y) = "
array :  .word 0:100


.text
main:
	li $v0,5
	syscall
	add $s1,$zero,$v0    #x=s1
	li $v0,5
	syscall
	add $s2,$zero,$v0    #y=s2
	mult $s1,$s2
	mflo $s3             #s3=x*y
	addi $t0, $zero, 2           #t0=i,start from 2
	 
 wloop1:
 		div $t0,$s1  #t=取餘數
 		mfhi $t3
 		beq $t3,$zero,wloop2
 		addi $t0,$t0,1
 		j wloop1


 


wloop2:
		div $t0,$s2 #t4=取餘數
		mfhi $t4
		beq $t4,$zero,out 
		addi $t0,$t0,1
		j wloop1

out:
	li $v0,4
	la $a0,output1
	syscall
	li $v0,1
	move $a0,$t0
	syscall
	li $v0,10
	syscall