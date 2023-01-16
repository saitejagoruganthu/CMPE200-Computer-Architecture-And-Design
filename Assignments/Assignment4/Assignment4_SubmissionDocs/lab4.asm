# $a0 = array base address
# $a1 = n
# $s0 = n!

Main:
    addi $a0, $0, 0x100		# array base address = 0x100
    addi $a1, $0, 0		# i = 0
    addi $t0, $0, 3
    addi $t1, $0, 50		# $t1 = 50

CreateArray_Loop:
    slt $t2, $a1, $t1		# i < 50?
    beq $t2, $0, Exit_Loop	# if not then exit loop
    sll $t2, $a1, 2		# $t2 = i * 4 (byte offset)
    add $t2, $t2, $a0       	# address of array[i]
    mult $a1, $t0
    mflo $t3                	# $t3 = i * 3
    sw $t3, 0($t2)          	# save array[i]
    addi $a1, $a1, 1        	# i = i + 1
    j CreateArray_Loop

Exit_Loop:
    # your code goes in here...
    # arithmetic calculation
    lw $t0, 100($a0)		#load my_array[25] in $t0 i.e., reqaddr = baseaddr + (index)*4 and relative movement is index*4 = 25*4 = 100
    lw $t1, 120($a0)		#load my_array[30] in $t1 i.e., reqaddr = baseaddr + (index)*4 and relative movement is index*4 = 30*4 = 120
    add $t1, $t0, $t1		#add $t0 and $t1 contents
    addi $t0, $0, 30		#initialize $t0 to 30
    divu $t1, $t0		#divide the above added result with $t0(30)
    mflo $a1			#capture the quotient from $lo to $a1
    sw $a1, 0($0)		#store the content of $a1 (n) at 0x00 location
    # factorial computation
    jal factorial           	# call procedure
    add $s0, $v0, $0        	# return value
    sw $s0, 16($0)		#store the content of $s0 (n!) at 0x10 location
    li $v0, 10			#load the $v0 register with value 10
    syscall			#call the syscall to exit the program

factorial:
    addi $sp, $sp, -8       	# make room on the stack
    sw $a1, 4($sp)          	# store $a1
    sw $ra, 0($sp)          	# store $ra
    # your code goes in here
    addi $t0, $0, 2		#initialize $t0 to 2
    slt $t0, $a1, $t0		#check for n<2 => n<=1
    beq $t0, $0, else		#branch to label 'else' if above condition is false
    addi $v0, $0, 1		#initialize $v0 to 1
    addi $sp, $sp, 8		#deallocate the stack
    jr $ra			#jump to the caller using $ra
else:
    addi $a1, $a1, -1		#decrement the n value
    jal factorial		#recursive call to the label 'factorial'
    lw $ra, 0($sp)		#recursively load back the return address from stack
    lw $a1, 4($sp)		#recursively load back the n value from stack
    addi $sp, $sp, 8		#recursively deallocate the stack memory
    mul $v0, $a1, $v0		#recursively multiply the n value to its previous value i.e.,(n-1)
    jr $ra			#jump to the caller using $ra