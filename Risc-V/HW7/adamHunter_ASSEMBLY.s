.data

.text

	.globl printPaths
printPaths:
	addi sp, sp, -28
	sw ra, 0(sp)		# store return address in stack
	sw a2, 4(sp)		# store a2 in stack
	sw a3, 8(sp)		# store a3 in stack
	sw a4, 12(sp)		# store a4 in stack
	sw a5, 16(sp)		# store a5 in stack
	sw a6, 20(sp)		# store a6 in stack
	sw a7, 24(sp)		# store a7 in stack
	
	lw ra, 0(sp)		# load ra from stack
	lw s2, 4(sp)		# load a2 from stack
	lw s3, 8(sp)		# load a3 from stack
	lw s4, 12(sp)		# load a4 from stack
	lw s5, 16(sp)		# load a5 from stack
	lw s6, 20(sp)		# load a6 from stack
	lw s7, 24(sp)		# load a7 from stack
	add a2, s2, zero	# reset a registers
	add a3, s3, zero	# reset a registers
	add a4, s4, zero	# reset a registers
	add a5, s5, zero	# reset a registers
	add a6, s6, zero	# reset a registers
	add a7, s7, zero	# reset a registers
	mul t0, s6, s3		
	add t0, t0, s5		# Actual current index in array
	add s0, t0, zero	# save current index
	
	
	mul t1, s3, s4
	addi t1, t1, -1		# Actual last index
	
	add a2, zero, s7	# add length of values to a2
	add t2, s2, zero	# temp variable for t2
	addi t3, zero, 4	# temp variable for val 4
	mul t3, t0, t3		# multiplying actual index by 4
	add t2, t2, t3		# add that value to address
	lw t2, 0(t2)		# load in value at address
	add a3, t2, zero	# put value in a3
	jal ra, addValueToStack	# goto addValueToStack

	mul t1, s3, s4		# multiply xmax and ymax
	addi t1, t1, -1		# subtract one
	add t0, s0, zero	# hold current index
	add a2, s2, zero	# reset a2 to be xmax
	add a3, s3, zero	# reset a3 to be ymax
	add t2, t0, s3		# add xmax to get future move
	bge t1, t2, down	# jump down
	addi t2, s5, 1		# add one to current x to get future move
	blt t2, s3, right	# check right
	bge t2, s3, check	# if future move is greater than xmax check
	addi t2, s6, 1		# add one to current y
	blt t2, s4, diagonal	# if current y + 1 less than ymax goto diagonal
	jal zero, done		# else done
check:
	lw ra, 0(sp)		
	lw s2, 4(sp)
	lw s3, 8(sp)
	lw s4, 12(sp)
	lw s5, 16(sp)
	lw s6, 20(sp)
	lw s7, 24(sp)

	mul t6, s3, s6		# temp val of xmax * current y
	add t6, t6, s5		# temp val of current index
	mul t1, s3, s4		#	temp val
	addi t1, t1, -1		# temp val of max index
	beq t1, t6, print	# if max = current, print values
	jal ra, done		# else done
down:
	# reload after recursion
	lw ra, 0(sp)
	lw s2, 4(sp)
	lw s3, 8(sp)
	lw s4, 12(sp)
	lw s5, 16(sp)
	lw s6, 20(sp)
	lw s7, 24(sp)
	add a2, s2, zero	# reset a registers
	add a3, s3, zero
	add a4, s4, zero
	add a5, s5, zero
	addi a7, s7, 1		# increase stack counter
	addi a6, s6, 1		# increase current y index
	jal ra, printPaths	# recurse back to top
	# reload after recursion
	lw ra, 0(sp)		
	lw s2, 4(sp)
	lw s3, 8(sp)
	lw s4, 12(sp)
	lw s5, 16(sp)
	lw s6, 20(sp)
	lw s7, 24(sp)
	addi t2, s5, 1		# add one to current x
	blt t2, s3, right	# jump to right if possible
	addi t2, s5, 1		# add one to current x
	bge t2, s3, check	# if current x >= max x, jumpt to check
	addi t3, s6, 1		# add one to current y
	blt t3, s4, diagonal	# if current y < ymax, jump to diagonal
	jal zero, check		# else check
	
	
right:
	# reload after recursion
	lw ra, 0(sp)
	lw s2, 4(sp)
	lw s3, 8(sp)
	lw s4, 12(sp)
	lw s5, 16(sp)
	lw s6, 20(sp)
	lw s7, 24(sp)
	add a2, s2, zero	# reset a registers
	add a3, s3, zero
	add a4, s4, zero
	add a6, s6, zero
	addi a7, s7, 1		# add one to stack counter
	addi a5, s5, 1		# add one to current x
	jal ra, printPaths	# jump back to top
	# reload after recursion
	lw ra, 0(sp)
	lw s2, 4(sp)
	lw s3, 8(sp)
	lw s4, 12(sp)
	lw s5, 16(sp)
	lw s6, 20(sp)
	lw s7, 24(sp)
	add a2, s2, zero	# reset a registers
	add a3, s3, zero
	add a4, s4, zero
	add a5, s5, zero
	add a6, s6, zero
	add a7, s7, zero
	addi t2, s5, 1		# add one to current x
	bge t2, s3, check	# if current x >= max x, jumpt to check
	addi t3, s6, 1		# add one to current y
	blt t3, s4, diagonal	# if current y < ymax, jump to diagonal
	jal zero, check		# jump to check
	
diagonal:
	# reload after recursion
	lw ra, 0(sp)
	lw s2, 4(sp)
	lw s3, 8(sp)
	lw s4, 12(sp)
	lw s5, 16(sp)
	lw s6, 20(sp)
	lw s7, 24(sp)
	add a2, s2, zero	# reset a registers
	add a3, s3, zero
	add a4, s4, zero
	addi a7, s7, 1		# add one to stack counter
	addi a5, s5, 1		# add one to current x
	addi a6, s6, 1		# add one to current y
	jal ra, printPaths	# jump back to top
	# reload after recursion
	lw ra, 0(sp)
	lw s2, 4(sp)
	lw s3, 8(sp)
	lw s4, 12(sp)
	lw s5, 16(sp)
	lw s6, 20(sp)
	lw s7, 24(sp)
	add a2, s2, zero	# reset a registers
	add a3, s3, zero
	add a4, s4, zero
	add a5, s5, zero
	add a6, s6, zero
	add a7, s7, zero
	jal zero, check		# jump to check
print:
	# reload after recursion
	lw ra, 0(sp)
	lw s2, 4(sp)
	lw s3, 8(sp)
	lw s4, 12(sp)
	lw s5, 16(sp)
	lw s6, 20(sp)
	lw s7, 24(sp)
	add a2, s2, zero	# reset a registers
	add a3, s3, zero
	add a4, s4, zero
	add a5, s5, zero
	add a6, s6, zero
	addi a2, s7, 1		# add stack counter plus one to a2
	jal ra, printStack	# jump to printStack
done:
	# reload after recursion
	lw ra, 0(sp)
	lw s2, 4(sp)
	lw s3, 8(sp)
	lw s4, 12(sp)
	lw s5, 16(sp)
	lw s6, 20(sp)
	lw s7, 24(sp)
	add a2, s2, zero	# reset a registers
	add a3, s3, zero
	add a4, s4, zero
	add a5, s5, zero
	add a6, s6, zero
	add a7, s7, zero
	addi sp, sp, 28		# reset stack
	jalr zero, ra, 0	# recurse back
	