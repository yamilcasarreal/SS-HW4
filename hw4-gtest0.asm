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
a56:	LW $fp, $ra, -4	# offset is -16 bytes
a60:	LW $fp, $s0, -5	# offset is -20 bytes
a64:	LW $fp, $s1, -6	# offset is -24 bytes
a68:	LW $fp, $s2, -7	# offset is -28 bytes
a72:	LW $fp, $s3, -8	# offset is -32 bytes
a76:	LW $fp, $s4, -9	# offset is -36 bytes
a80:	LW $fp, $s5, -10	# offset is -40 bytes
a84:	LW $fp, $s6, -11	# offset is -44 bytes
a88:	LW $fp, $s7, -12	# offset is -48 bytes
a92:	LW $fp, $sp, -1	# offset is -4 bytes
a96:	LW $fp, $fp, -2	# offset is -8 bytes
a100:	ADDI $sp, $sp, 0
a104:	EXIT 
.data 1024
.stack 6144
.end
