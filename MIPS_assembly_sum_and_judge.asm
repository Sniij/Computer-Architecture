.global main
.data

line_msg : .asciiz "\n"

#	int N;
#	printf("Input Number = \n");
#	scanf("%d", &N);
#	int sum = 0;
#	for (int i = 1; i <= N; i++)
#	{
#		sum += i;
#	}
#	printf("1 ~ %d of Sum = %d", N, sum);
#
#	if (sum % 8 == 0)
#		printf("%d is multiple of eight!\n", sum);
#	else
#		printf("%d is not multiple of eight!\n", sum);

procedure_msg : .asciiz "Select Procedure : "
a_is_msg : .asciiz "a is : "
b_is_msg : .asciiz "b is : "
n_is_msg : .asciiz "n is : "
multi_msg : .asciiz " is multiple of three! "
notmulti_msg : .asciiz " is not multiple of three! "
blank_msg : .asciiz "   "

.text
main:
la $a0 procedure_msg
li $v0 4
syscall 

li $v0 5 # $a1 is first input number 
syscall# completed first input

add $t0 $v0 $zero # $t0 is the value of user input ;

bne $t0 1 aton_seq

deci_multiple :la $a0 a_is_msg
			li $v0 4
			syscall 
			li $v0 5
			syscall
			add $t1 $v0 $zero # $t1 is a
			la $a0 b_is_msg
			li $v0 4
			syscall 
			li $v0 5
			syscall
			
			add $t2 $v0 $zero # $t2 is b
			sub $t3 $t1 $t2 # $t3 is a-b
			add $s0 $t3 $zero # $s0 is a-b
			add $t0 $zero $zero  # $t0 is i equal 0 3 6 9....
			add $t4 $zero $zero # $t4 is j equal 0 1 2 3 4 ... a
			
			loop: beq $t0 $t3 done_multiple
				beq $t4 $t1 done_notmultiple
				addi $t0 $t0 3
				addi $t4 $t4 1
				j loop # if not equal $t0(multiple of three) and $t3(input of a) or keep running
			done_multiple: add $a0 $s0 $zero
						 li $v0 1
						 syscall
						 la $a0 multi_msg
						 li $v0 4
						 syscall
			done_notmultiple: add $a0 $s0 $zero
						 li $v0 1
						 syscall
						 la $a0 notmulti_msg
						 li $v0 4
						 syscall
aton_seq:la $a0 n_is_msg
		 li $v0 4
		 syscall 
		 li $v0 5
		 syscall
		 add $t0 $v0 $zero # $t0 is n
	
		 la $a0 a_is_msg
		 li $v0 4
		 syscall 
		 li $v0 5
		 syscall
		 add $t1 $v0 $zero # $t1 is a
		 
		 addi $t2 $zero 1 # $t2 is T(0), T(1) = 1
		 addi $a0 $t2 0 # T(0), T(1) 
		 li $v0 1
		 syscall 
		 la $a0 blank_msg
		 li $v0 4
		 syscall
		 addi $a0 $t2 0 # T(0),T(1) 
		 li $v0 1
		 syscall  # 1   	1
		 
		 la $a0 blank_msg
		 li $v0 4
		 syscall
		 
		 addi $s0 $t0 1 # s0 = n+1
		 add $s1 $t1 $zero # s1 = a
		 
		 addi $t0 $zero 2# $t0 1 = i
		 addi $t1 $zero 1 # t1 
		 addi $t2 $zero 1
		 
		 loop1 :   beq $t0 $s0 exit # if t0(i) == n+1		 				
		
		print :	add $t3 $t1 $s1 # t1 + a
				add $t3 $t3 $t2 # t3 + t2
				add $a0 $t3 $zero
				li $v0 1
		 		syscall 
		 		la $a0 blank_msg
		 		li $v0 4
		 		syscall 
								
		next :	addi $t0 $t0 1 # i++
				add $t1 $t2 $zero
				add $t2 $t3 $zero
				j loop1

				
exit :li $v0 10

#	for (int n = 0; n < 11; n++) {
#		printf("f(%d) = %d\n", n, fibonacci(n));
#	}



#int fibonacci(int n) {
#	if (n == 1 && n== 0)
#		return 1;
#	else
#		return fibonacci(n - 1) + fibonacci(n - 2);
#}



