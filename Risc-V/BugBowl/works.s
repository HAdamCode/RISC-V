# Author: Hunter Adam

# Bugs in hack.s:
# Endless loop instead of one time run
# Line 23 should have a 5 instead of an 11
# No return at end of triangle causing it to run right into rectangle
# Triangle shift right is supposed to be 1 bit
# Infinite loop in rectangle as there is no conditional
# Incorrect prompt in rectangle
# Does not divide by 100*100 but just 100. 
# Missing end of program ecall

.data
	typePrompt: .string "Would you like area of Triangle(1), Rectangle(2) or Circle(3)?"
	basePrompt: .string "What is the base?"
	heightPrompt: .string "What is the height?"
	side1Prompt: .string "What is the first side length?"
	side2Prompt: .string "What is the second side length?"
	radiusPrompt: .string "What is the radius?"
	outputPrompt: .string "Area is: "
.text
	.globl main
	main:
		la a0, typePrompt		# Print out the typePrompt
		li a7, 4
		ecall
		
		li a7, 5				# Grab value from terminal
		ecall
		
		addi t0, zero, 1		# Checking variable
		beq t0, a0, step1		# If value from terminal equals checking variable, jump to step1
		addi t0, t0, 1			# increase checking variable
		beq t0, a0, step2		# If value from terminal equals checking variable, jump to step2
		addi t0, t0, 1			# Increase checking variable
		beq t0, a0, step3		# If value from terminal equals checking variable, jump to step3
		jal zero, done			# Else finish program
		
		step1:
		jal ra triangle			# Jump to triangle with a return address
		jal zero, done			# Finish program
		
		step2:
		jal ra rectangle		# Jump to rectangle with a return address
		jal zero, done			# Finish program
		
		step3:
		jal ra circle			# Jump to circle with a return address
		
		done:
		li a7, 10				#Set syscall to exit program
		ecall	
		
	.globl triangle
		triangle:
		la a0, basePrompt		# Load in base prompt
		li a7, 4
		ecall
		
		li a7, 5				# Grab value from terminal
		ecall
		
		add s0, zero, a0		# save this value in s0
		
		la a0, heightPrompt		#Load in height Prompt
		li a7, 4				
		ecall
		
		li a7, 5				# Grab value from terminal
		ecall
		
		add s1, zero, a0		# Save value
		
		mul s0, s0, s1			# Multiply the two terminal values together
		srli s0, s0, 1			# Shift right to divide by two 
		
		la a0, outputPrompt		# Print outputPrompt
		li a7, 4
		ecall
		
		li a7, 1
		add a0, s0, zero
		ecall					# Print area of Triangle
		jalr zero, ra, 0
		
	.globl rectangle
		rectangle:
		la a0, side1Prompt		# Load in side1Prompt
		li a7, 4
		ecall
			
		li a7, 5				# Grab value from terminal
		ecall
		
		add s2, zero, a0		# Save terminal value
		
		la a0, side1Prompt		# Load in side2Prompt
		li a7, 4
		ecall
		
		li a7, 5				# Grab value from terminal
		ecall
		
		add s3, zero, a0		#Save terminal value
		
		add s0, zero, zero		# Initialize total variable
		add s1, zero, zero		# Initialize counter vairable
		loop:
		beq s1, s2, exit		# If counter variable equals side1, exit
		add s0, s0, s3			# s0 = s0 + second terminal value
		addi s1, s1, 1			# Increase counter
		jal zero, loop			# jump back to loop
		
		exit:
		la a0, outputPrompt		# Load outputPrompt
		li a7, 4
		ecall
		
		add a0, s0, zero		# Set a0 to value calculated
		li a7, 1				# Print out rectangle area
		ecall
		jalr zero, ra, 0
		
		
	.globl circle
		circle:
		la a0, radiusPrompt		# Load in radiusPrompt
		li a7, 4
		ecall
		
		li a7, 5				# Grab value from terminal
		ecall
		
		mul a0, a0, a0			# get r^2
		addi t1, zero, 100		# value holding 100
		mul a0, a0, t1			# Multiply r^2 by 100
		
		addi t0, zero, 314		# hold 314 instead of 3.14
		mul a0, a0, t0			# multiply two values together
		mul t1, t1, t1			# Increase 100 to 100*100
		div a0, a0, t1			# Divide to get back into correct units
		
		li a7, 1				# Print out circle area
		ecall
		
		jalr zero, ra, 0
		
		
