.data

.text
	.globl mult
	mult:
		addi t5, zero, 1
		slli t5, t5, 31
		add t0, zero, zero		# counter variable
		addi t3, zero, 32		# end counter
		addi t1, zero, 1		# register holding value of 1 for anding
		add s0, zero, zero		# holds left half of 64 bit register
		add s1, zero, zero		# holds right half of 64 bit register
	check:
		and t2, a1, t1			# check to see if there is a one in LSB
		beq t2, t1, run			# if there is a one, jump to run
		jal zero, noNum			# else jump to noNum
		
	run:
		add s0, s0, a2			# add left half register to multiplicand
		and t4, t1, s0			# if lsb is a one, jump to addOne
		beq t1, t4, addOne		# jump to addOne
		srli s0, s0, 1			# shift left half register right by one
		srli s1, s1, 1			# shift right half register right by one
		addi t0, t0, 1			# increase counter
		srli a1, a1, 1			# shift multiplier right by one
		beq t0, t3, exit		# if we have reached max number, exit
		jal zero, check			# else check
		
	addOne:
		srli s0, s0, 1			# shift left half register right by one
		srli s1, s1, 1			# shift right half register right by one
		add s1, s1, t5		# add a one to msb
		addi t0, t0, 1			# increase counter
		srli a1, a1, 1			# shift multiplier right by one
		beq t0, t3, exit		# if we have reached max number, exit
		jal zero, check			# else check
		
	noNum:
		and t4, t1, s0			# if lsb is a one, jump to addOne
		beq t1, t4, addOne		# jump to addOne
		srli s0, s0, 1			# shift left half register right by one
		srli s1, s1, 1			# shift right half register right by one
		addi t0, t0, 1			# increase counter
		srli a1, a1, 1			# shift multiplier right by one
		beq t0, t3, exit		# if we have reached max number, exit
		jal zero, check			# else check
	
	exit:
		add a0, s1, zero		# put total in a0
		jalr zero, ra, 0		# return to main function
