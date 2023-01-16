ori $a0, $0, 0x8000		#store value into variable a
ori $a1, $0, 0x00A9		#store value into variable b
ori $s0, $0, 1974		#store value into variable c
multu $a0, $a0			#multiply a with itself
mflo $s1			#store in s1 register (no overflow condition)
addi $t0, $0, 0x20		#store base address in temporary register t0
sw $s1, 0($t0)			#store x to location 0x20
multu $s1, $a1			#multiply x with b
mfhi $s2			#move hi content to y
sw $s1, 4($t0)			#store lo content to [y](ask doubt on what to store in memory location for y i.e, y.hi or y.lo)
sw $s2, 8($t0)			#store hi content to [y+4]
srl $s2, $s1, 16		#right shift y.lo value
jal compute			#jump to compute label to calculate the given formula
sw $s0, 12($t0)			#store c value to 0x2c location
addi $t3, $0, 1			#store value '1' in t2 register for future beq comparison
while: slti $t1, $s0, 1665	#check if c<1665 => t1 =1 else t1=0
beq $t1, $t3, done		#branch if t1==t2 to done since we should come out of the while loop
jal compute			#jump to compute label to calculate the given formula
j while				#loop back to while
compute: divu $s2, $s0		#divide y with c and store in temporary t1
mflo $t1			#move the quotient of previous result to t1 register
add $t1, $s0, $t1		#add c to previous result and store in temporary t1
srl $s0, $t1, 1			#right shift by amount '1' to essentially divide by 2
jr $ra				#jump to return address given by ra register
done:sll $s0, $s0, 8		#logic left shift c value by 8 and store it back in c (s0)
sw $s0, 16($t0)			#store c value to 0x30 location