.data
	sumPrompt:		.string	"Summation: "
.text
	sum: 
		add t1, zero, zero	# counter variable
		add t2, a0, zero	# address variable
		add t3, a1, zero	# end case for looping
		add s1, zero, zero	# store sum here
		loop1:
		lw t0, 0(t2)		# grab number at index
		add s1, s1, t0		# add number to sum
		addi t1, t1, 1		# increase counter
		addi t2, t2, 4		# increase address by 4
		blt t1, t3 loop1	# check if counter equals end case
		add a0, zero, s1	# add sum to a0
		jalr zero, ra, 0	# return to GraderScript.s
.globl binarySearch
binarySearch:
	add s2, zero, a2	# Address
	add s3, zero, a3	# Start index
	add t4, zero, a4	# End index
	add t5, zero, a5	# Value to find
	addi sp, sp, -4		# give the stack space for return address
	sw ra, 0(sp)		# put return address in stack
	addi s6, zero, 4	
	
	mul s7, s6, s3		
	add s2, s2, s7		# increase starting address of list
	
	sub s7 t4, s3
	add a0 s2, zero		# give starting address for sum
	addi a1 s7, 1		# give number of iterations for sum
	jal ra, sum			# go to sum
	
		mv s1, a0
		la t0, sumPrompt
		add a0, zero, t0			#Copies buffer address to a0
 		li a7, 4				#Sets syscall to print null-terminated string
 		ecall
		mv a0, s1				#Set syscall argument to the integer
		li a7, 1				#Set syscall argument to 1 (print integer)
		ecall
		addi a0, zero, 10			#Set syscall argument to print char
		li a7, 11				#Set syscall argument to 11 (print char)
		ecall
			
	addi t1 zero, 2
	add t6, t4, zero
	sub t6, t6, s3
	div t6 t6 t1
	addi t1 zero, 4
	mul t6, t6, t1
	add s2 s2, t6
	lw t1 0(s2)			# load value to check
	beq t5, t1 done		# check for equivalence in base case
	
	blt t1, t5, right	# jump to right
	blt t5, t1, left	# jump to left
right:
	add t6 s3, t4		
	addi t1 zero, 2
	div t6 t6 t1
	addi a3, t6, 1		# reset starting index
	jal ra, binarySearch	# recurse back to binarySearch
	jal zero, done		# jump out
	
left:
	addi t1 zero, 4
	div t6, t6, t1
	add a4, t6, zero
	addi a4, a4, -1		# resest ending index
	jal ra, binarySearch	# recurse back to binarySearch
	jal zero, done		# jump out
	
done:
	add t2, t4, s3
	addi t1, zero, 2
	div t2, t2, t1
	
	div t6, t6, t1
	add a0, t2, zero	# put our return into a0

	
out:
	addi sp, sp, 4	# reset stack
	lw ra, 0(sp)	# grab return address from stack
	jalr zero, ra, 0	# jump back to old return address
