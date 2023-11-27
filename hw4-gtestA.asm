.text 0
a0:	ADDI $sp, $sp, -4
a4:	LW $gp, $v0, 1	# offset is +4 bytes
a8:	ADDI $sp, $sp, -4
a12:	SW $sp, $v0, 0	# offset is +0 bytes
a16:	ADDI $sp, $sp, -4
a20:	LW $gp, $v0, 0	# offset is +0 bytes
a24:	ADDI $sp, $sp, -4
a28:	SW $sp, $v0, 0	# offset is +0 bytes
a32:	SW $sp, $sp, -1	# offset is -4 bytes
a36:	SW $sp, $fp, -2	# offset is -8 bytes
a40:	ADD $0, $sp, $fp
a44:	ADDI $sp, $sp, -48
a48:	SW $fp, $a0, -3	# offset is -12 bytes
a52:	SW $fp, $ra, -4	# offset is -16 bytes
a56:	SW $fp, $s0, -5	# offset is -20 bytes
a60:	SW $fp, $s1, -6	# offset is -24 bytes
a64:	SW $fp, $s2, -7	# offset is -28 bytes
a68:	SW $fp, $s3, -8	# offset is -32 bytes
a72:	SW $fp, $s4, -9	# offset is -36 bytes
a76:	SW $fp, $s5, -10	# offset is -40 bytes
a80:	SW $fp, $s6, -11	# offset is -44 bytes
a84:	SW $fp, $s7, -12	# offset is -48 bytes
a88:	LW $fp, $ra, -4	# offset is -16 bytes
a92:	LW $fp, $s0, -5	# offset is -20 bytes
a96:	LW $fp, $s1, -6	# offset is -24 bytes
a100:	LW $fp, $s2, -7	# offset is -28 bytes
a104:	LW $fp, $s3, -8	# offset is -32 bytes
a108:	LW $fp, $s4, -9	# offset is -36 bytes
a112:	LW $fp, $s5, -10	# offset is -40 bytes
a116:	LW $fp, $s6, -11	# offset is -44 bytes
a120:	LW $fp, $s7, -12	# offset is -48 bytes
a124:	LW $fp, $sp, -1	# offset is -4 bytes
a128:	LW $fp, $fp, -2	# offset is -8 bytes
a132:	ADDI $sp, $sp, 16
a136:	EXIT 
.data 1024
WORD w0 = 0
WORD w1 = 1
.stack 6152
.end
