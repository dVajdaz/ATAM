.global _start

.section .text
_start:
		movq num, %rbx

shift_HW1:
		shr $1, %rbx
		jb isOne_HW1
		cmpq $0, %rbx
		je end_HW1
		jmp shift_HW1

isOne_HW1:
		incb Bool
		jmp shift_HW1
end_HW1:
