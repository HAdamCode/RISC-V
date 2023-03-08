.data

.text
	.globl branchPredictionSim
	branchPredictionSim:
	add t2, zero, a2		# load in the starting address for array
	add t3, zero, a3		# load in the length of array
	add t4, zero, zero		# counter variable for main looop
	add t5, zero, zero		# counter variable to determine current state
	la s1, predictions		# load in the predictions base address
	la a0, predictions		# let a0 return predictions base address
	add a1, zero, t3		# return length of array 
loop:	
	addi t4, t4, 1			# increase counter variable
	lw t6, 0(t2)			# load in numbers
	addi t2, t2, 4			# shift register to next number
	add t0, zero, zero		# temporary variable for branch check
	beq t5, t0, count0		# if count is 0 branch
	addi t0, t0, 1
	beq t5, t0, count1		# if count is 1 branch
	addi t0, t0, 1
	beq t5, t0, count2		# if count is 2 branch
	addi t0, t0, 1
	beq t5, t0, count3		# if count is 3 branch
return:
	blt t4, a3, loop		# loop until all numbers have been loaded
	jalr zero, ra, 0		# return to main

# These methods branch depending on the current state
count0:
	addi t0, zero, 1		# temporary branch variable
	beq t0, t6, count01		# if the loaded in number is a 1 branch
	addi t0, zero, 2
	beq t0, t6, count02		# if the loaded in number is a 2 branch

# these next three methods are the same structure as count0
count1:
	addi t0, zero, 1
	beq t0, t6, count11
	addi t0, zero, 2
	beq t0, t6, count12

count2:
	addi t0, zero, 1
	beq t0, t6, count21
	addi t0, zero, 2
	beq t0, t6, count22

count3:
	addi t0, zero, 1
	beq t0, t6, count31
	addi t0, zero, 2
	beq t0, t6, count32

# these methods add the desired value to the array and make sure the state is reset to correct value
count01:
	addi t0, zero, 1		# holds value of 1
	sw t0, 0(s1)			# store the value 1 in the global array
	addi s1, s1, 4			# shift the register to next position
	add t5, zero, zero		# reset counter
	jal zero, return		# return to loop
	
count02:
	addi t0, zero, 1		# holds value of 1
	sw t0, 0(s1)			# store the value 1 in the global array
	addi s1, s1, 4			# shift the register to next position
	addi t5, zero, 1		# reset counter
	jal zero, return		# return to loop
	
# these next 6 methods have the same structure as count01 and count 02
count11:
	addi t0, zero, 1
	sw t0, 0(s1)
	addi s1, s1, 4
	add t5, zero, zero
	jal zero, return
	
count12:
	addi t0, zero, 1
	sw t0, 0(s1)
	addi s1, s1, 4
	addi t5, zero, 2
	jal zero, return
	
count21:
	addi t0, zero, 2
	sw t0, 0(s1)
	addi s1, s1, 4
	addi t5, zero, 1
	jal zero, return
	
count22:
	addi t0, zero, 2
	sw t0, 0(s1)
	addi s1, s1, 4
	addi t5, zero, 3
	jal zero, return
	
count31:
	addi t0, zero, 2
	sw t0, 0(s1)
	addi s1, s1, 4
	addi t5, zero, 2
	jal zero, return
	
count32:
	addi t0, zero, 2
	sw t0, 0(s1)
	addi s1, s1, 4
	addi t5, zero, 3
	jal zero, return
	
	
	