.text 0
a0:	SW $sp, $sp, -1	# offset is -4 bytes
a4:	SW $sp, $fp, -2	# offset is -8 bytes
a8:	ADD $0, $sp, $fp
a12:	ADDI $sp, $sp, -48
a16:	SW $fp, $a0, -3	# offset is -12 bytes
a20:	SW $fp, $ra, -4	# offset is -16 bytes
a24:	SW $fp, $s0, -5	# offset is -20 bytes
a28:	SW $fp, $s1, -6	# offset is -24 bytes
a32:	SW $fp, $s2, -7	# offset is -28 bytes
a36:	SW $fp, $s3, -8	# offset is -32 bytes
a40:	SW $fp, $s4, -9	# offset is -36 bytes
a44:	SW $fp, $s5, -10	# offset is -40 bytes
a48:	SW $fp, $s6, -11	# offset is -44 bytes
a52:	SW $fp, $s7, -12	# offset is -48 bytes
a56:	LW $gp, $v0, 0	# offset is +0 bytes
a60:	ADDI $sp, $sp, -4
a64:	SW $sp, $v0, 0	# offset is +0 bytes
a68:	LW $gp, $v0, 1	# offset is +4 bytes
a72:	ADDI $sp, $sp, -4
a76:	SW $sp, $v0, 0	# offset is +0 bytes
a80:	LW $sp, $at, 0	# offset is +0 bytes
a84:	ADDI $sp, $sp, 4
a88:	LW $sp, $v0, 0	# offset is +0 bytes
a92:	ADDI $sp, $sp, 4
a96:	SUB $v0, $at, $v0
a100:	BLTZ $v0, 2	# offset is +8 bytes
a104:	ADD $0, $0, $at
a108:	BEQ $0, $0, 1	# offset is +4 bytes
a112:	ADDI $0, $at, 1
a116:	ADDI $sp, $sp, -4
a120:	SW $sp, $at, 0	# offset is +0 bytes
a124:	LW $sp, $v0, 0	# offset is +0 bytes
a128:	ADDI $sp, $sp, 4
a132:	BEQ $v0, $0, 6	# offset is +24 bytes
a136:	LW $gp, $v0, 2	# offset is +8 bytes
a140:	ADDI $sp, $sp, -4
a144:	SW $sp, $v0, 0	# offset is +0 bytes
a148:	LW $sp, $a0, 0	# offset is +0 bytes
a152:	ADDI $sp, $sp, 4
a156:	PINT 
a160:	JMP 6	# target is byte address 24
a164:	LW $gp, $v0, 3	# offset is +12 bytes
a168:	ADDI $sp, $sp, -4
a172:	SW $sp, $v0, 0	# offset is +0 bytes
a176:	LW $sp, $a0, 0	# offset is +0 bytes
a180:	ADDI $sp, $sp, 4
a184:	PINT 
a188:	LW $fp, $ra, -4	# offset is -16 bytes
a192:	LW $fp, $s0, -5	# offset is -20 bytes
a196:	LW $fp, $s1, -6	# offset is -24 bytes
a200:	LW $fp, $s2, -7	# offset is -28 bytes
a204:	LW $fp, $s3, -8	# offset is -32 bytes
a208:	LW $fp, $s4, -9	# offset is -36 bytes
a212:	LW $fp, $s5, -10	# offset is -40 bytes
a216:	LW $fp, $s6, -11	# offset is -44 bytes
a220:	LW $fp, $s7, -12	# offset is -48 bytes
a224:	LW $fp, $sp, -1	# offset is -4 bytes
a228:	LW $fp, $fp, -2	# offset is -8 bytes
a232:	ADDI $sp, $sp, 0
a236:	EXIT 
.data 1024
WORD w0 = 4
WORD w1 = 3
WORD w2 = 10
WORD w3 = 11
.stack 6160
.end
