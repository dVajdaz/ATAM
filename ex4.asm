 .global _start

.section .text
_start:

	cmpq $0, head
	je end_HW1	

	movq head, %rdi				#cur_src adress
	movq $0, %r9				#pre_src	

	movq head, %rax				#cur_val adress
	movq $0, %r8				#pre_val 
	
	movl Value, %ebx			#value
	movq Source, %rsi			#src adress



	find_value_HW1:
		movl (%rax), %edx		#cur_val -> value
		cmpl %edx, %ebx			#cur_val -> value =? value
		je find_source_HW1

		cmpq $0, 4(%rax)		#cur_val -> next =? null
		je end_HW1

		movq %rax, %r8			#pre_val = cur_val
		movq 4(%rax), %rax		#cur_val = cur_val -> next

		jmp find_value_HW1

	find_source_HW1: 
		cmp %rsi, %rdi			#src =? cur_src
		je found_HW1

		cmpq $0, 4(%rdi)		#cur_src -> next =? null
		je end_HW1

		movq %rdi, %r9			#pre_src = cur_src
		movq 4(%rdi), %rdi		#cur_src = cur_src -> next

		#movq $head, %rax		#cur_val
		jmp find_source_HW1


	found_HW1:
		cmpq $0, %r9			#pre_src =? null
		je src_is_head_HW1
		movq %rax, 4(%r9)		#pre_src -> next = cur_val
	src_is_head_HW1:
		cmpq $0, %r8			#pre_val =? null
		je val_is_head_HW1
		movq %rdi, 4(%r8)		#pre_val -> next = cur_src
	val_is_head_HW1:
		movq 4(%rdi), %rbx		#tmp1 = cur_src -> next
		movq 4(%rax), %rcx		#tmp2 = cur_val -> next

		movq %rbx, 4(%rax)		#cur_val -> next = tmp1
		movq %rcx, 4(%rdi)		#cur_src -> next = tmp2

		movq head, %rsi

		cmp %rsi, %rax			#cur_val =? head
		jne skip_HW1
		movq %rdi, head 		#cur_src = head		

	skip_HW1:
		cmp %rsi, %rdi
		jne end_HW1
		movq %rax, head			
end_HW1: