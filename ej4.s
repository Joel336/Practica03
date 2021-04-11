.data
    string1: .asciiz "\nIngrese un numero: "
    string2: .asciiz "\nEl numero  "
    string2a: .asciiz " es multiplo de "
    string2b: .asciiz " no es multiplo de "

.text
    main:
    li $t1, 1                    
    li $t2, 21

    li $v0, 4
	la $a0, string1
	syscall
    li $v0,5 
    syscall 

    move $a1, $v0

    LoopMultiplo:
    beq $t2, $t1, Exit

    div		$t1, $a1			# $t1 / $a1
    mfhi	$t3					# $t3 = $t1 mod $a1 
    
    beq $t3, 0, Multiplo

    NoMultiplo:

    li $v0, 4
	la $a0, string2
	syscall

    move $a0 $t1
    li $v0, 1 
    syscall 

    move $t1 $a0
    li $v0, 4
	la $a0, string2b
	syscall

    move $a0 $a1
    li $v0, 1 
    syscall

    move $a1 $a0
    add $t1, $t1, 1 
    j LoopMultiplo

    Multiplo: 

    li $v0, 4
	la $a0, string2
	syscall

    move $a0 $t1
    li $v0, 1 
    syscall 

    move $t1 $a0
    li $v0, 4
	la $a0, string2a
	syscall

    move $a0 $a1
    li $v0, 1 
    syscall

    move $a1 $a0
    add $t1, $t1, 1 
    j LoopMultiplo
    
    Exit:

    jr $ra
