.data
a: .space 800
new: .space 400
base: .asciz "Please enter the base of the number you are using (0 to exit): "
value: .asciz "Please enter the value: " 
output1: .asciz "The given value in base 10 is: "

error: .asciz "The value entered is not valid for the base entered"
.text
.globl main
main:
addi a7, zero, 4		# ask for base
la a0, base
ecall

addi a7, zero, 5		# get base from user
ecall

add s0, zero, a0		# s0 holds base
add s2, zero, zero		# check variable for zero inputted
beq s2, a0, finish		# check to see if user inputted a zero and finish
jal zero, moveOn

finish:
	li a7, 10			#Set syscall to exit program
	ecall
	
moveOn:
addi t0, zero, 1		# check to see if base is one
beq t0, a0, main		# jump back to main if base is one
addi t0, zero, 37		# temp val at 37
bge a0, t0, main		# jump to main if base is greater than 36
addi t0, zero, 0		# temp val at 0
blt a0, t0, main		# jump to main if base is less than 0

addi a7, zero, 4		# ask for value
la a0, value
ecall

addi a7, zero, 8		# grab value from the user
addi a1, zero, 42
la a0, a				# load the base address into a0
ecall

add s1, zero, a0		# store base address in s1
add s2, zero, zero		
la s3, new				# load the new address into s3
add t3, zero, zero		# ouside loop counter
add s4, zero, zero  #total
add s5, zero, zero
la s6, new				# load new address into s6
add t6, zero, zero
add t2, zero, zero
add s7, zero, zero

loop1:
	lb t0, 0(s1)			# grab characters in the string
	addi t1, zero, 10		# temp var for new line
	beq t1, t0, stoploop	# if new line, then stop this loop
	add t1, zero, zero		
	beq t2, t1, checkNegative	# if this is the first run, then check to see if negative
	addi t1, zero, 45		# negative in ascii
	beq t1, t0, throwError	# if negative any other time, throw error
	addi t1, zero, 123		# '{' in ascii
	bge t0, t1, throwError	# if above z, throw error
	addi t1, zero, 97		# 'a' in ascii
	bge t0, t1, lower		# if a or above, jump to lower
	addi t1, zero, 91		# '[' in ascii
	bge t0, t1, throwError	# if above 'Z', throw error
	addi t1, zero, 65		# 'A' in ascii
	bge t0, t1, upper		# if 'A' or above, jump to upper
	addi t1, zero, 58		# ':' in ascii
	bge t0, t1, throwError	# if above 9, throw error
	addi t1, zero, 48		# '0' in ascii
	bge t0, t1, number		# if 0 or above, jump to number
	jal zero, throwError	# else throw an error
	
throwError:
	addi a7, zero, 4		# throw error message
	la a0, error
	ecall
	
	addi a7, zero, 11		# print two new lines
	addi a0, zero, 10
	ecall
	ecall
	jal zero, main			# return to main
	
checkNegative:
	addi t2, zero, 1		# change value to indicate first runthrough is over
	addi t1, zero, 45
	beq t0, t1, addNegative
	addi t1, zero, 123		# '{' in ascii
	bge t0, t1, throwError	# if above z, throw error
	addi t1, zero, 97		# 'a' in ascii
	bge t0, t1, lower		# if a or above, jump to lower
	addi t1, zero, 91		# '[' in ascii
	bge t0, t1, throwError	# if above 'Z', throw error
	addi t1, zero, 65		# 'A' in ascii
	bge t0, t1, upper		# if 'A' or above, jump to upper
	addi t1, zero, 58		# ':' in ascii
	bge t0, t1, throwError	# if above 9, throw error
	addi t1, zero, 48		# '0' in ascii
	bge t0, t1, number		# if 0 or above, jump to number
	jal zero, throwError	# else throw an error
	
addNegative:
	addi t6, zero, 1		# change negative boolean variable to true
	addi s1, s1, 1			# incremement string base by 1 character
	jal zero, loop1			# return to loop1 for second run
	
lower:
	addi t0, t0, -87		# decrease the integer value to be correct
	sw t0, 0(s6)			# store changed value into array
	addi s6, s6, 4			# incremement array base by 1 word
	addi s1, s1, 1			# incremement string base by 1 character
	addi s5, s5, 1			# increase total length of array
	jal zero, loop1			# return to loop1
	
upper:
	addi t0, t0, -55		# decrease the integer value to be correct
	sw t0, 0(s6)			# store changed value into array
	addi s6, s6, 4			# incremement array base by 1 word
	addi s1, s1, 1			# incremement string base by 1 character
	addi s5, s5, 1			# increase total length of array
	jal zero, loop1			# return to loop1
	
number:
	addi t0, t0, -48		# decrease the integer value to be correct
	sw t0, 0(s6)			# store changed value into array
	addi s6, s6, 4			# incremement array base by 1 word
	addi s1, s1, 1			# incremement string base by 1 character
	addi s5, s5, 1			# increase total length of array
	jal zero, loop1			# return to loop1
	
	
stoploop:
	addi s6, s6, -4			# return base address to last index of array
	add t0, zero, zero		# temp val holding zero
	beq t0, t2, throwError	# if reached on first loop of loop1, throw an error
	
outsideloop:
	add t0, zero, s0		# t0 holds original base
	add t4, zero, zero		# counter for inside loop
	jal zero, insideLoop	# make sure to jump to insideLoop, although not necessary
	
# this function does the base to the power of # of loops
insideLoop:
	beq t3, t4, endLoop		# if the outside loop counter equals inside loop counter, end inside loop
	mul t0, t0, s0			# multiply the base by contents of t0
	addi t4, t4, 1			# increase inside counter
	jal zero, insideLoop	# run insideLoop again
	
endLoop:
	addi t3, t3, 1			# increase outside loop counter
	div t0, t0, s0			# divide by base as we had to do one too many inside loops
	lw t4, 0(s6)			# grab word from new
	mul t0, t0, t4			# multiply the bases to the power of # of loops and the value in the array
	addi s6, s6, -4			# moving backwards in the array so substract 4
	add s4, s4, t0			# add results to the total
	beq t3, s5, negcheck	# if we are done with outside loop, jump to negcheck
	jal zero, outsideloop	# else run outsideloop again
	
negcheck:
	addi t0, zero, 1		# temp val holding 1
	beq t0, t6, neg			# if both are 1, jump to neg
	jal zero, done			# else jump to done

neg:
	addi t0, zero, -1		# temp val holding -1
	mul s4, s4, t0			# multiply total by -1

done:	
	la a0, output1			# load output prompt to a0 and print
	addi a7, zero, 4
	ecall
	
	add a0, zero, s4		# put total into a0 and print
	addi a7, zero, 1
	ecall
	
	addi a7, zero, 11		# print two new lines
	addi a0, zero, 10
	ecall
	ecall
	jal zero, main			# jump back to main to reprompt everything


