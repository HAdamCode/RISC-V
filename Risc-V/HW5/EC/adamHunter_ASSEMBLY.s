## Author: Hunter Adam

.text 
	.globl min
	min:
		addi t1, zero, 1	# counter variable
		add t2, a2, zero	# address variable
		add t3, a3, zero	# end case for looping
		lw t0, 0(t2)		# load first number
		add s4, t0, zero	# set min to first number
		loop4:
		lw t0, 4(t2)		# load in numbers
		blt t0, s4, check1	# if number is less than to min, branch
		back1:
		addi t1, t1, 1		# increase counter
		addi t2, t2, 4		# increase address by 4
		bne t1, t3 loop4	# check if counter equals end case
		jal zero Exit1		# skip rest of code, branch to Exit
		check1:
		add s4, t0, zero	# change min to current number
		jal zero back1		# jump back to finish loop
		Exit1:
		add a0, zero, s4	# add min to a0
		jalr zero, ra, 0	# return to GraderScript.s