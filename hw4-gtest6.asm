.text 0
a0:	ADDI $sp, $sp, -4
a4:	LW $gp, $v0, 0	# offset is +0 bytes
a8:	ADDI $sp, $sp, -4
a12:	SW $sp, $v0, 0	# offset is +0 bytes
a16:	SW $sp, $sp, -1	# offset is -4 bytes
a20:	SW $sp, $fp, -2	# offset is -8 bytes
a24:	ADD $0, $sp, $fp
a28:	ADDI $sp, $sp, -48
a32:	SW $fp, $a0, -3	# offset is -12 bytes
a36:	SW $fp, $ra, -4	# offset is -16 bytes
a40:	SW $fp, $s0, -5	# offset is -20 bytes
a44:	SW $fp, $s1, -6	# offset is -24 bytes
a48:	SW $fp, $s2, -7	# offset is -28 bytes
a52:	SW $fp, $s3, -8	# offset is -32 bytes
a56:	SW $fp, $s4, -9	# offset is -36 bytes
a60:	SW $fp, $s5, -10	# offset is -40 bytes
a64:	SW $fp, $s6, -11	# offset is -44 bytes
a68:	SW $fp, $s7, -12	# offset is -48 bytes
a72:	LW $gp, $v0, 1	# offset is +4 bytes
a76:	ADDI $sp, $sp, -4
a80:	SW $sp, $v0, 0	# offset is +0 bytes
a84:	LW $sp, $v0, 0	# offset is +0 bytes
a88:	ADDI $sp, $sp, 4
a92:	ADD $0, $fp, $t9
a96:	SW $t9, $v0, 1	# offset is +4 bytes
a100:	ADD $0, $fp, $t9
a104:	LW $t9, $v0, 0	# offset is +0 bytes
a108:	ADDI $sp, $sp, -4
a112:	SW $sp, $v0, 0	# offset is +0 bytes
a116:	LW $sp, $a0, 0	# offset is +0 bytes
a120:	ADDI $sp, $sp, 4
a124:	PINT 
a128:	ADD $0, $fp, $t9
a132:	LW $t9, $v0, 1	# offset is +4 bytes
a136:	ADDI $sp, $sp, -4
a140:	SW $sp, $v0, 0	# offset is +0 bytes
a144:	LW $sp, $a0, 0	# offset is +0 bytes
a148:	ADDI $sp, $sp, 4
a152:	PINT 
a156:	LW $fp, $ra, -4	# offset is -16 bytes
a160:	LW $fp, $s0, -5	# offset is -20 bytes
a164:	LW $fp, $s1, -6	# offset is -24 bytes
a168:	LW $fp, $s2, -7	# offset is -28 bytes
a172:	LW $fp, $s3, -8	# offset is -32 bytes
a176:	LW $fp, $s4, -9	# offset is -36 bytes
a180:	LW $fp, $s5, -10	# offset is -40 bytes
a184:	LW $fp, $s6, -11	# offset is -44 bytes
a188:	LW $fp, $s7, -12	# offset is -48 bytes
a192:	LW $fp, $sp, -1	# offset is -4 bytes
a196:	LW $fp, $fp, -2	# offset is -8 bytes
a200:	ADDI $sp, $sp, 0
a204:	EXIT 
.data 1024
WORD w0 = 3
WORD w1 = 4
.stack 6152
.end
