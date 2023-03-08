## Author: Hunter Adam

.text 
	.globl sum
	sum: 
		add t1, zero, zero	# counter variable
		add t2, a2, zero	# address variable
		add t3, a3, zero	# end case for looping
		add s1, zero, zero	# store sum here
		loop1:
		lw t0, 0(t2)		# grab number at index
		add s1, s1, t0		# add number to sum
		addi t1, t1, 1		# increase counter
		addi t2, t2, 4		# increase address by 4
		bne t1, t3 loop1	# check if counter equals end case
		add a0, zero, s1	# add sum to a0
		jalr zero, ra, 0	# return to GraderScript.s
		
	 
	.globl prod
	prod:
		addi t1, zero, 2	# counter variable
		add t2, a2, zero	# address variable
		add t3, a3, zero	# end case for looping
		lw t4, 0(t2)		# load first number
		lw t5, 4(t2)		# load second number
		mul s1, t4, t5		# multiply first two numbers together
		loop2:
		lw t0, 8(t2)		# load numbers
		mul s1, s1, t0		# multiply numbers together
		addi t1, t1, 1		# increase counter
		addi t2, t2, 4		# increase address by 4
		bne t1, t3 loop2	# check if counter equals end case
		add a0, zero, s1	# add product to a0
		jalr zero, ra, 0	# return to GraderScript.s
		
		
	.globl max
	max:
		addi t1, zero, 1	# counter variable
		add t2, a2, zero	# address variable
		add t3, a3, zero	# end case for looping
		lw t0, 0(t2)		# load first number
		add s4, t0, zero	# set max to first number
		loop3:
		lw t0, 4(t2)		# load in numbers
		bge t0, s4, check	# if number is greater than or equal to max, branch
		back:
		addi t1, t1, 1		# increase counter
		addi t2, t2, 4		# increase address by 4
		bne t1, t3 loop3	# check if counter equals end case
		jal zero Exit		# skip rest of code, branch to Exit
		check:
		add s4, t0, zero	# change max to current number
		jal zero back		# jump back to finish loop
		Exit:
		add a0, zero, s4	# add max to a0
		jalr zero, ra, 0	# return to GraderScript.s
		
		
	
