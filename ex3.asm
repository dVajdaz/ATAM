.global _start

.section .text
_start:
#your code here
mov $0, %rax #index of array1
mov $0, %rbx #index of array2
mov $0, %rdi #arr index
mov $0, %r10d #last entry

Merge_Loop_HW1:
	movl array1(,%rax,4),%r8d #arr1 entry in r8d
	movl array2(,%rbx,4),%r9d #arr1 entry in r9d
	
	cmp $0x0, %r8d #check for the end of array1
	je Copy_Arr2_HW1
	cmp $0x0, %r9d #check for the end of array2
	je Copy_Arr1_HW1
	cmp %r8d,%r9d
	jl Copy_Arr1_HW1 #arr1>=arr2
	jmp Copy_Arr2_HW1 #arr1<arr2
	
Copy_Arr1_HW1:
	cmp array1(,%eax,4),%r10d
	je Duplicate_Arr1_HW1
	movl %r8d, mergedArray(,%rdi,4)
	movl %r8d, %r10d
	inc %rdi
Duplicate_Arr1_HW1:
	inc %rax
	jmp Merge_Loop_HW1

Copy_Arr2_HW1:
	cmp $0x0, %r9d
	je END_HW1

	cmp array2(,%ebx,4),%r10d
	je Duplicate_Arr2_HW1
	movl %r9d,mergedArray(,%rdi,4) 
	movl mergedArray(,%rdi,4), %r10d
	inc %rdi
Duplicate_Arr2_HW1:
	inc %rbx
	jmp Merge_Loop_HW1

END_HW1:
	movl $0x0, mergedArray(,%rdi,4)

