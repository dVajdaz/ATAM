
.global _start

.section .text
_start:
    	movl num, %ecx

    	cmpl $0, %ecx
    	je   end_HW1

    	movq $0, %rdx	#counter of bytes passed set to 0
    	cmp $0, %ecx	
    	jl isNegative_HW1

    	movq $source, %rbx
    	movq $destination, %rax
    	cmp %rbx, %rax

    	jg copyDataReversed_HW1

copyData_HW1: 
		movb (%rbx, %rdx), %dil #pass a byte into dil
		leaq (%rax, %rdx), %rsi
		
		inc %rdx
		movb %dil, (%rsi) #pass a byte 
		
		loop copyData_HW1 #Loop in case ecx is not zero
		
		jmp end_HW1

copyDataReversed_HW1:
		movb -1(%rbx, %rcx), %dil #pass a byte into dil
		leaq -1(%rax, %rcx), %rsi 
		
		movb %dil, (%rsi) #pass a byte 
		
		loop copyDataReversed_HW1 #Loop in case ecx is not zero
		
		jmp end_HW1		

isNegative_HW1:
  		movl %ecx, destination  # move the contents of %eax into the destination memory location
end_HW1:
