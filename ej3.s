main:
	li	$v0,4
	la	$a0,str1
	syscall
	
	li	$v0,5
	syscall
	
	move	$t0,$v0
	
	li	$v0,4
	la	$a0,str6
	syscall	

	li	$v0,4
	la	$a0,str2
	syscall
	
	li	$v0,5
	syscall
	
	move	$t1,$v0

	li	$v0,4
	la	$a0,str6
	syscall	


	li	$v0,4
	la	$a0,str3
	syscall
	
	li	$v0,5
	syscall
	
	move	$t2,$v0

	li	$v0,4
	la	$a0,str6
	syscall	
	
	add $t4,$t0,$t1
	add $t5,$t1,$t2
	add $t6,$t0,$t2

	bge $t2, $t4, TrianguloINV #si el primero es mayor
	bge $t1, $t6, TrianguloINV #si el primero es mayor
	bge $t0, $t5, TrianguloINV #si el primero es mayor
	
	b TrianguloV

	TrianguloV:
	li	$v0,4
	la	$a0,str4
	syscall
	b FIN

	TrianguloINV:
	li	$v0,4
	la	$a0,str5
	syscall
	b FIN

    FIN:
    jr $ra
	

.data
str1:	.asciiz "Ingrese el primer lado del triangulo: "
str2:	.asciiz	"Ingrese el segundo lado del triangulo: "
str3:	.asciiz "Ingrese el tercer lado del triangulo: "
str4:	.asciiz "El triangulo es valido"
str5:	.asciiz "El triangulo no es valido"
str6:	.asciiz "\n"