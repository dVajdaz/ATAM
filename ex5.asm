.global _start

.section .text
_start:
	movq root, %rax						#root adress
	cmpq $0, %rax						#root adress =? null
	jne find_HW1

	movq $new_node, root

	jmp end_HW1
	
	find_HW1:
		movq (%rax), %rbx				#current_node -> value
		movq %rax, %rcx

		cmpq new_node, %rbx				#new_node -> value =? current_node -> value
		je end_HW1
		jg search_left_HW1

	search_right_HW1:
		movq 16(%rax), %rax				#current_node = current_node -> right 
		movq $16, %rsi
		cmpq $0, %rax
		je insert_HW1
		jmp find_HW1

	search_left_HW1:
		movq 8(%rax), %rax				#current_node = current_node -> left
		movq $8, %rsi
		cmpq $0, %rax
		je insert_HW1
		jmp find_HW1

	insert_HW1:
		movq $new_node, %r9
		movq %r9, (%rcx, %rsi) 				#new_node inserted into the tree
	end_HW1: