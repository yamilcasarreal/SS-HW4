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
a68:	LW $sp, $a0, 0	# offset is +0 bytes
a72:	ADDI $sp, $sp, 4
a76:	PINT 
a80:	LW $gp, $v0, 1	# offset is +4 bytes
a84:	ADDI $sp, $sp, -4
a88:	SW $sp, $v0, 0	# offset is +0 bytes
a92:	LW $sp, $a0, 0	# offset is +0 bytes
a96:	ADDI $sp, $sp, 4
a100:	PINT 
a104:	ADD $0, $fp, $a0
a108:	SW $sp, $sp, -1	# offset is -4 bytes
a112:	SW $sp, $fp, -2	# offset is -8 bytes
a116:	ADD $0, $sp, $fp
a120:	ADDI $sp, $sp, -48
a124:	SW $fp, $a0, -3	# offset is -12 bytes
a128:	SW $fp, $ra, -4	# offset is -16 bytes
a132:	SW $fp, $s0, -5	# offset is -20 bytes
a136:	SW $fp, $s1, -6	# offset is -24 bytes
a140:	SW $fp, $s2, -7	# offset is -28 bytes
a144:	SW $fp, $s3, -8	# offset is -32 bytes
a148:	SW $fp, $s4, -9	# offset is -36 bytes
a152:	SW $fp, $s5, -10	# offset is -40 bytes
a156:	SW $fp, $s6, -11	# offset is -44 bytes
a160:	SW $fp, $s7, -12	# offset is -48 bytes
a164:	LW $gp, $v0, 0	# offset is +0 bytes
a168:	ADDI $sp, $sp, -4
a172:	SW $sp, $v0, 0	# offset is +0 bytes
a176:	LW $sp, $a0, 0	# offset is +0 bytes
a180:	ADDI $sp, $sp, 4
a184:	PINT 
a188:	LW $gp, $v0, 1	# offset is +4 bytes
a192:	ADDI $sp, $sp, -4
a196:	SW $sp, $v0, 0	# offset is +0 bytes
a200:	LW $sp, $a0, 0	# offset is +0 bytes
a204:	ADDI $sp, $sp, 4
a208:	PINT 
a212:	LW $fp, $ra, -4	# offset is -16 bytes
a216:	LW $fp, $s0, -5	# offset is -20 bytes
a220:	LW $fp, $s1, -6	# offset is -24 bytes
a224:	LW $fp, $s2, -7	# offset is -28 bytes
a228:	LW $fp, $s3, -8	# offset is -32 bytes
a232:	LW $fp, $s4, -9	# offset is -36 bytes
a236:	LW $fp, $s5, -10	# offset is -40 bytes
a240:	LW $fp, $s6, -11	# offset is -44 bytes
a244:	LW $fp, $s7, -12	# offset is -48 bytes
a248:	LW $fp, $sp, -1	# offset is -4 bytes
a252:	LW $fp, $fp, -2	# offset is -8 bytes
a256:	ADDI $sp, $sp, 24
a260:	LW $fp, $ra, -4	# offset is -16 bytes
a264:	LW $fp, $s0, -5	# offset is -20 bytes
a268:	LW $fp, $s1, -6	# offset is -24 bytes
a272:	LW $fp, $s2, -7	# offset is -28 bytes
a276:	LW $fp, $s3, -8	# offset is -32 bytes
a280:	LW $fp, $s4, -9	# offset is -36 bytes
a284:	LW $fp, $s5, -10	# offset is -40 bytes
a288:	LW $fp, $s6, -11	# offset is -44 bytes
a292:	LW $fp, $s7, -12	# offset is -48 bytes
a296:	LW $fp, $sp, -1	# offset is -4 bytes
a300:	LW $fp, $fp, -2	# offset is -8 bytes
a304:	ADDI $sp, $sp, 0
a308:	EXIT 
.data 1024
WORD w0 = 340
WORD w1 = 2
.stack 6152
.end
