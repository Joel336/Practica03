.data
    text_1: .asciiz "\nIngrese la cantidad de numeros: "
	text_2: .asciiz "\nIngrese un numero: "
	text_3: .asciiz "\nLa suma es: "
	text_4: .asciiz "\nEl promedio es: "
	text_5: .asciiz "\nEl mayor es: "
	text_6: .asciiz "\nEl menor es: "

.text
    main:
	
	la $a0, text_1
	syscall
	
	li $v0, 5
	syscall
	
	li $t1, 0
	move $t2, $v0
	#variables
	li $a1, 0
	li $t3, 0
	#while
	
    Loop:
		beq $t2,$t1, Exit
	
		li $v0, 4
		la $a0, text_2
		syscall
	
		li $v0,5 
		syscall 
		move $t5, $v0
		beqz $a1, igual
		igual_else:
			add $t1, $t1, 0
			b end_igual
		igual:
			move $t4, $v0
		end_igual:
			add $t1, $t1, 0
		
		bge $t5, $t3, mayor
		mayor_else:
			add $t1, $t1, 0
			b end_mayor
		mayor:
			move $t3, $t5
		end_mayor:
			add $t1, $t1, 0
		
		ble $t5, $t4, menor
		menor_else:
			add $t1, $t1, 0
			b end_menor
		menor:
			move $t4, $t5
		end_menor:
			add $t1, $t1, 0
		
		move $a2, $v0
		add $a1, $a1, $a2
		add $t1, $t1, 1 

	j Loop
    
    Exit:
		#suma
		li $v0, 4
		la $a0, text_3
		syscall

		move $a0, $a1
		li $v0,1 
		syscall 
		
		#promedio
		li $v0, 4
		la $a0, text_4
		syscall
		
		mtc1 $a1, $f1
		cvt.s.w $f1, $f1
		mtc1 $t2,$f2
		cvt.s.w $f2, $f2
		div.s $f12, $f1, $f2
		li $v0,2
		syscall 
		
		#mayor
		li $v0, 4
		la $a0, text_5
		syscall
		
		move $a0, $t3
		li $v0,1
		syscall
		
		#menor
		li $v0, 4
		la $a0, text_6
		syscall
		move $a0, $t4
		li $v0,1
		syscall
	
    jr $ra