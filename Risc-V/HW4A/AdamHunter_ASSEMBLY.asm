.data
	prompt: .asciz "Please enter a string: "
	output: .asciz "Hash value for the string is: "
	A: .space 22
.text
main:
	addi a7, zero, 4	# display prompt
	la a0, prompt		# print prompt
	ecall
	
	la a0, A			# load a0 with address from A
	addi a7, zero, 8	# set input to read string
	addi a1, zero, 22	# set max characters to 21
	ecall
	
	la t0, A			# initial address
	la t1, A			# initialize counter address for final address
	addi t2, zero, -2	# counter variable 
loop1:
	lb t3, 0(t1)		# load t1 in t3
	addi t1, t1, 1		# increase memory address t1 by one byte
	addi t2, t2, 1      # increase counter
	bne t3, zero, loop1	# condition for end of loop

	add t5, zero, zero	# total variable
	addi t1, t1, -3		# counter variable
	beq t2, zero, Exit	# condition for no input
loop2:
	lb t3, 0(t0)		# load t0 into t3
	lb t4, 0(t1)		# load t1 into t4
	mul t3, t3, t4		# multiply t3 and t4
	add t5, t5, t3		# increase sum by t3*t4
	addi t0, t0, 1		# add one byte to base memory address
	addi t1, t1, -1		# subract one from last memory address
	addi t2, t2, -1		# subract one from counter variable
	bne t2, zero, loop2	# condition for end of loop
	
	addi a7, zero, 4	# display output
	la a0, output
	ecall
	
	addi a7, zero, 1	# display output
	add a0, t5, zero	# put number in a0
	ecall
	addi a7, zero, 11	# add newlines
	addi a0, zero, 10
	ecall
	addi a7, zero, 11
	addi a0, zero, 10
	ecall
	jal t1, main		# return to main
Exit:
	addi a7, zero, 4	# display output
	la a0, output
	ecall
	add a0, zero, zero	# put number in a0
	addi a7, zero, 1
	ecall
	addi a7, zero, 11
	addi a0, zero, 10
	ecall
	addi a7, zero, 10	# exit cleanly
	ecall
