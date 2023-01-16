main: 	addi $t0, $0, 0x0F
	lw $t1, 0x0900($0)
	lw $t2, 0x0904($0)
	sll $0, $0, 0
	sll $0, $0, 0
	sw $t1, 0x0800($0)
	sw $t2, 0x0804($0)
poll: 	lw $t3, 0x0808($0)
	sll $0, $0, 0
	sll $0, $0, 0
	sll $0, $0, 0
	beq $t3, $0, poll
	srl $t4, $t3, 1
	lw $t5, 0x080C($0)
	sll $0, $0, 0
	sll $0, $0, 0
	sw $t4, 0x0908($0)
	sw $t5, 0x090C($0)