# There are 8 bugs with this program
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
		la a0, typePrompt
		li a7, 4
		ecall
		
		li a7, 11
		ecall
		
		addi t0, zero, 1
		beq t0, a0, step1
		addi t0, t0, 1
		beq t0, a0, step2
		addi t0, t0, 1
		beq t0, a0, step3
		
		
		step1:
		jal ra dope
		
		step2:
		jal ra cool
		
		step3:
		jal ra rad
		
		
		li a7, 10				#Set syscall to exit program
			
	.globl dope
		dope:
		la a0, basePrompt
		li a7, 4
		ecall
		
		li a7, 5
		ecall
		
		add s0, zero, a0
		
		la a0, heightPrompt
		li a7, 4
		ecall
		
		li a7, 5
		ecall
		
		add s1, zero, a0
		
		mul s0, s0, s1
		srli s0, s0, 2
		
		la a0, outputPrompt
		li a7, 4
		ecall
		
		li a7, 1
		add a0, s0, zero
		ecall
		
	.globl cool
		cool:
		la a0, side1Prompt
		li a7, 4
		ecall
		
		li a7, 5
		ecall
		
		add s2, zero, a0
		
		la a0, radiusPrompt
		li a7, 4
		ecall
		
		li a7, 5
		ecall
		
		add s3, zero, a0
		
		add s0, zero, zero
		add s1, zero, zero
		loop:
		add s0, s0, s3
		addi s1, s1, 1
		jal zero, loop
		
		exit:
		la a0, outputPrompt
		li a7, 4
		ecall
		
		add a0, s0, zero
		li a7, 1
		ecall
		
		jalr zero, ra, 0
		
		
	.globl rad
		rad:
		la a0, radiusPrompt
		li a7, 4
		ecall
		
		li a7, 5
		ecall
		
		mul a0, a0, a0
		addi t1, zero, 100
		mul a0, a0, t1
		
		addi t0, zero, 314
		mul a0, a0, t0
		div a0, a0, t1
		
		li a7, 1
		ecall
		
		jalr zero, ra, 0
		
		
