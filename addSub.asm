           .data 
msg: .asciiz "------MENU------\n" 
msg1: .asciiz "Enter a to Add\nEnter s to Subtract\nEnter x to Exit a Program\n" 
linebreak: .asciiz "\n" 
msg2: .asciiz "Enter 1st number = " 
msg3: .asciiz "Enter 2nd number = " 
msg4: .asciiz "Addition" 
msg5: .asciiz "Subtraction"
msg6: .asciiz "Invalid Character, Try again\n"
msg7: .asciiz " result = "

	.code
 
main:
Menu:	la $a0,msg 
	syscall $print_string

	la $a0,msg1 
	syscall $print_string

	syscall $read_char
	move $t0,$v0 #read character 

	la $a0,linebreak 
	syscall $print_string

	bne $t0,'a,SkiptoSub
	la $a0,msg4
 	syscall $print_string
	la $a0,linebreak 
	syscall $print_string
	jal addition
	la $a0,msg4 
	syscall $print_string
	la $a0,msg7 
	syscall $print_string
	j disp

SkiptoSub:
	bne $t0,'s,SkiptoExit 
	la $a0,msg5
 	syscall $print_string
	la $a0,linebreak 
	syscall $print_string
	jal subtraction
	la $a0,msg5 
	syscall $print_string
	la $a0,msg7 
	syscall $print_string
	j disp

SkiptoExit:
	beq $t0,'x,exit 

	la $a0,msg6
	syscall $print_string

	j Menu

disp:
	move $a0,$v0 
	syscall $print_int

	la $a0,linebreak 
	syscall $print_string

	la $a0,linebreak 
	syscall $print_string

	j Menu

addition: 

	la $a0,msg2 
	syscall $print_string

	syscall $read_int
	move $t1,$v0 #first number input 

	la $a0,msg3 
	syscall $print_string

	syscall $read_int
	move $t2,$v0 #2nd number input 

	add $v0,$t1,$t2

	jr $ra


subtraction: 

	la $a0,msg2 
	syscall $print_string 

	syscall $read_int
	move $t0,$v0 #first number input 

	la $a0,msg3 
	syscall $print_string

	syscall $read_int
	move $t1,$v0 #2nd number input 

	sub $v0,$t0,$t1 

	jr $ra

exit: 
	syscall $exit