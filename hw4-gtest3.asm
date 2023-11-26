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
a56:	ADD $0, $fp, $t9
a60:	LW $t9, $v0, 0	# offset is +0 bytes
a64:	ADDI $sp, $sp, -4
a68:	SW $sp, $v0, 0	# offset is +0 bytes
a72:	LW $sp, $a0, 0	# offset is +0 bytes
a76:	ADDI $sp, $sp, 4
a80:	PINT 
a84:	LW $fp, $ra, -4	# offset is -16 bytes
a88:	LW $fp, $s0, -5	# offset is -20 bytes
a92:	LW $fp, $s1, -6	# offset is -24 bytes
a96:	LW $fp, $s2, -7	# offset is -28 bytes
a100:	LW $fp, $s3, -8	# offset is -32 bytes
a104:	LW $fp, $s4, -9	# offset is -36 bytes
a108:	LW $fp, $s5, -10	# offset is -40 bytes
a112:	LW $fp, $s6, -11	# offset is -44 bytes
a116:	LW $fp, $s7, -12	# offset is -48 bytes
a120:	LW $fp, $sp, -1	# offset is -4 bytes
a124:	LW $fp, $fp, -2	# offset is -8 bytes
a128:	ADDI $sp, $sp, 0
a132:	EXIT 
.data 1024
.stack 6144
.end
