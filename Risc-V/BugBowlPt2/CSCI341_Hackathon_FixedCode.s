#There are 6 bugs in this code
#The aassumption is that the inputs are positive integers
.data
    .align 2
	values: .space 400	#400 bytes, 100 words
	prompt: .string	"Enter a number to add to the array (0 to stop inputting): "
	
.text
main:
jal ra, firstone			####
addi s0, a0, 0						
addi a1, s0, 0
la a2, values				
addi a3, a1, 0					
jal ra, whatdoesthisdo
jal ra, probablysomethingcool	
addi a0, zero, 10				
addi a7, zero, 11				
ecall	
addi a3, s0, 0
jal ra, lastone	
addi a7, zero, 10				
ecall					
firstone:
add t0, zero, zero			
addi t3, zero, 200				
la t1, values				
Loop1:
la t4, prompt
add a0, zero, t4		
addi a7, zero, 4			
ecall
addi a7, zero, 5			
ecall
add t2, zero, a0			
beqz t2, LoopEnd	
sw t2, 0(t1)			
addi t1, t1, 4			
addi t0, t0, 1			
beq t0, t3, LoopEnd	
jal, zero, Loop1
LoopEnd:
add a0, zero, t0			
jalr zero, ra, 0	
#a2 = address of array
#a3 = size of array
probablysomethingcool:	
addi t0, zero, 0
addi t1, a2, 0 			
Loop2: 
lw t2, 0(t1)
addi a0, t2, 0
addi a7, zero, 1			
ecall		
addi a0, zero, 32		####
addi a7, zero, 11			
ecall			
addi t0, t0, 1
addi t1, t1, 4	
blt t0, a1, Loop2	
jalr zero, ra, 0
whatdoesthisdo:	
sw ra, 0(sp)		
addi t0, zero, 1 
beq a3, t0, return 			
addi t0, a3, -1	 
addi t1, zero, 0 
Loop3: 		
slli t2, t1, 2
add t2, a2, t2 
addi t3, t2, 4 
lw t4, 0(t2)
lw t5, 0(t3)		
bgeu t5, t4, over		
sw t5, 0(t2)
sw t4, 0(t3)		
over:
addi t1, t1, 1			####
blt t1, t0, Loop3		
addi a3, a3, -1 			
jal zero, whatdoesthisdo		
return: 
lw ra, 0(sp)
addi sp, sp, 4
jalr zero, ra, 0
lastone: 
addi t0, zero, 0
addi t1, a2, 0 		
addi t3, zero, 0
Loop4: 
lw t1, 0(a2)			####
add t3, t3, t1		####
addi t0, t0, 1
addi a2, a2, 4		###
blt t0, a3, Loop4	
fcvt.s.w f1, t3
fcvt.s.w f2, a3 
fdiv.s fa0, f1, f2
addi a7, zero, 2
ecall	
jalr zero, ra, 0
		
