.data
array:.word 1:101
	output:	.asciiz "Last survivor = "


.text
	main:
	li $v0,5
	syscall   #input n
	add $s0,$v0,$zero     #s0=n
	li $v0,5
	syscall               #input k
	add $s1,$v0,$zero     #$s1=k
	add $t1,$s0,$zero     # lest=t1
	add $t2,$s1,$zero     # t2=count
	addi $s3,$zero,1            #s3=1
	addi $s5,$zero,4            #s5=4
	la  $s4,array         #s4=array address
	li  $t4,-4             #t4=i
	mult $s5,$s0
	mflo $t5               #t5=n*4
	wloop1:
		beq  $t2,$zero,rek
		move $t4,$zero
		li $t4,-4
		forloop1:
			add $t4,$t4,$s5
			lw  $s6,$t4(s4) #s6是值
			beq $s6,$s3,count--
			beq $t1, $s3,output
			beq $t4,$t5,wloop1
			j forloop1
	rek:
		move $t2,$s1
		j wloop1
	count--:
		subi $t2,1
		beq  $t2,$zero,last--
		j forloop1
	last--:
		subi $t1,1            #lest --
		move $s6,$zero
		sw   $s6,$t4($s4)
		beq  $t1,$s3,output   
		add  $t2,$t2,$s1       #count=k 

		j forloop1

	output:
		move $t4,$zero
		sub1 $t4,-4
		forloop2:
			add $t4,$t4,$s5
			lw  $t6,$t4($s4)
			beq $t6,$s3,output2
			j forloop2
	output2:
		li $v0,4
		la $a0,output
		syscall
		add $s7,$zero,$zero
		div $s7,$s4,$s5
		li $v0,1
		move $a0,$s7
		syscall




	li $v0,10
	syscall