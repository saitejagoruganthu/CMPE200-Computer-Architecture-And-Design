ori $a0, $0, 5			#initialize a0 with value 5
sw $a0, 0($t0)			#store the content in a0 to t0 (0x00 memory location)
ori $t1, $0, 1			#initialize t1 with value 1
while: beq $a0, $0, done	#branch if a0=0 to done else run below code
mult $t1, $a0			#multiply t1 with a0 => f*n
mflo $t1			#assign lo content into t1 again => f=f*n
addi $a0, $a0, -1		#decrement the content of a0
j while				#loop back to while label
done: sw $t1, 16($t0)		#store the content of t1 (final answer) to 0x10 location
lw $s0, 16($t0)			#load the content of 0x10 location to register s0