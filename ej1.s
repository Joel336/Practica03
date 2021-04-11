main:
	li	$v0,4
	la	$a0,str1
	syscall
	
	li 	$v0,5
	syscall	
	
	move	$t0,$v0

	li	$v0,4
	la	$a0,str2
	syscall

	li	$v0,5
	syscall

	move $t1,$v0

	add $t2,$t0,$t1
	
	li	$v0,4
	la	$a0,str3
	syscall

	li	$v0,1
	move	$a0,$t2
	syscall
	
	li	$v0,4
	la	$a0,str7
	syscall

	sub $t3,$t0,$t1
	
	li	$v0,4
	la	$a0,str4
	syscall

	li	$v0,1
	move	$a0,$t3
	syscall

	li	$v0,4
	la	$a0,str7
	syscall
	
	mul $t4,$t0,$t1
	
	li	$v0,4
	la	$a0,str5
	syscall
	
	
	li	$v0,1
	move	$a0,$t4
	syscall	

	li	$v0,4
	la	$a0,str7
	syscall
	
	
	
	li	$v0,4
	la	$a0,str6
	syscall	
	
	mtc1 $t0, $f2
  	cvt.s.w $f2, $f2
  	mtc1 $t1, $f1
 	cvt.s.w $f1, $f1
	div.s $f12, $f2, $f1 
	li	$v0,2
	syscall	
	
	li	$v0,10
	syscall
.data
str1:	.asciiz	"Ingresa el primer numero: "
str2:	.asciiz	"Ingresa el segundo numero: "
str3:	.asciiz "La Suma es: "
str4:	.asciiz	"La Resta es: "
str5:	.asciiz	"La Multiplicacion es: "
str6:	.asciiz "La division es: " 
str7:	.asciiz "\n"

