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
a72:	ADD $0, $fp, $t9
a76:	LW $t9, $v0, 0	# offset is +0 bytes
a80:	ADDI $sp, $sp, -4
a84:	SW $sp, $v0, 0	# offset is +0 bytes
a88:	LW $sp, $a0, 0	# offset is +0 bytes
a92:	ADDI $sp, $sp, 4
a96:	PINT 
a100:	ADD $0, $fp, $t9
a104:	LW $t9, $v0, 0	# offset is +0 bytes
a108:	ADDI $sp, $sp, -4
a112:	SW $sp, $v0, 0	# offset is +0 bytes
a116:	LW $gp, $v0, 1	# offset is +4 bytes
a120:	ADDI $sp, $sp, -4
a124:	SW $sp, $v0, 0	# offset is +0 bytes
a128:	LW $gp, $v0, 1	# offset is +4 bytes
a132:	ADDI $sp, $sp, -4
a136:	SW $sp, $v0, 0	# offset is +0 bytes
a140:	LW $sp, $at, 0	# offset is +0 bytes
a144:	ADDI $sp, $sp, 4
a148:	LW $sp, $v0, 0	# offset is +0 bytes
a152:	ADDI $sp, $sp, 4
a156:	MUL $v0, $at
a160:	MFLO $v0
a164:	ADDI $sp, $sp, -4
a168:	SW $sp, $v0, 0	# offset is +0 bytes
a172:	LW $gp, $v0, 1	# offset is +4 bytes
a176:	ADDI $sp, $sp, -4
a180:	SW $sp, $v0, 0	# offset is +0 bytes
a184:	LW $gp, $v0, 1	# offset is +4 bytes
a188:	ADDI $sp, $sp, -4
a192:	SW $sp, $v0, 0	# offset is +0 bytes
a196:	LW $sp, $at, 0	# offset is +0 bytes
a200:	ADDI $sp, $sp, 4
a204:	LW $sp, $v0, 0	# offset is +0 bytes
a208:	ADDI $sp, $sp, 4
a212:	MUL $v0, $at
a216:	MFLO $v0
a220:	ADDI $sp, $sp, -4
a224:	SW $sp, $v0, 0	# offset is +0 bytes
a228:	LW $sp, $at, 0	# offset is +0 bytes
a232:	ADDI $sp, $sp, 4
a236:	LW $sp, $v0, 0	# offset is +0 bytes
a240:	ADDI $sp, $sp, 4
a244:	DIV $v0, $at
a248:	MFLO $v0
a252:	ADDI $sp, $sp, -4
a256:	SW $sp, $v0, 0	# offset is +0 bytes
a260:	LW $sp, $at, 0	# offset is +0 bytes
a264:	ADDI $sp, $sp, 4
a268:	LW $sp, $v0, 0	# offset is +0 bytes
a272:	ADDI $sp, $sp, 4
a276:	DIV $v0, $at
a280:	MFLO $v0
a284:	ADDI $sp, $sp, -4
a288:	SW $sp, $v0, 0	# offset is +0 bytes
a292:	LW $sp, $v0, 0	# offset is +0 bytes
a296:	ADDI $sp, $sp, 4
a300:	ADD $0, $fp, $t9
a304:	SW $t9, $v0, 1	# offset is +4 bytes
a308:	ADD $0, $fp, $t9
a312:	LW $t9, $v0, 1	# offset is +4 bytes
a316:	ADDI $sp, $sp, -4
a320:	SW $sp, $v0, 0	# offset is +0 bytes
a324:	LW $gp, $v0, 2	# offset is +8 bytes
a328:	ADDI $sp, $sp, -4
a332:	SW $sp, $v0, 0	# offset is +0 bytes
a336:	LW $sp, $at, 0	# offset is +0 bytes
a340:	ADDI $sp, $sp, 4
a344:	LW $sp, $v0, 0	# offset is +0 bytes
a348:	ADDI $sp, $sp, 4
a352:	SUB $v0, $at, $v0
a356:	BGTZ $v0, 2	# offset is +8 bytes
a360:	ADD $0, $0, $at
a364:	BEQ $0, $0, 1	# offset is +4 bytes
a368:	ADDI $0, $at, 1
a372:	ADDI $sp, $sp, -4
a376:	SW $sp, $at, 0	# offset is +0 bytes
a380:	LW $sp, $v0, 0	# offset is +0 bytes
a384:	ADDI $sp, $sp, 4
a388:	BEQ $v0, $0, 75	# offset is +300 bytes
a392:	ADD $0, $fp, $t9
a396:	LW $t9, $v0, 1	# offset is +4 bytes
a400:	ADDI $sp, $sp, -4
a404:	SW $sp, $v0, 0	# offset is +0 bytes
a408:	LW $sp, $a0, 0	# offset is +0 bytes
a412:	ADDI $sp, $sp, 4
a416:	PINT 
a420:	ADD $0, $fp, $t9
a424:	LW $t9, $v0, 1	# offset is +4 bytes
a428:	ADDI $sp, $sp, -4
a432:	SW $sp, $v0, 0	# offset is +0 bytes
a436:	LW $sp, $v0, 0	# offset is +0 bytes
a440:	ADDI $sp, $sp, 4
a444:	BEQ $v0, $0, 40	# offset is +160 bytes
a448:	LW $gp, $v0, 3	# offset is +12 bytes
a452:	ADDI $sp, $sp, -4
a456:	SW $sp, $v0, 0	# offset is +0 bytes
a460:	ADD $0, $fp, $t9
a464:	LW $t9, $v0, 1	# offset is +4 bytes
a468:	ADDI $sp, $sp, -4
a472:	SW $sp, $v0, 0	# offset is +0 bytes
a476:	LW $sp, $at, 0	# offset is +0 bytes
a480:	ADDI $sp, $sp, 4
a484:	LW $sp, $v0, 0	# offset is +0 bytes
a488:	ADDI $sp, $sp, 4
a492:	MUL $v0, $at
a496:	MFLO $v0
a500:	ADDI $sp, $sp, -4
a504:	SW $sp, $v0, 0	# offset is +0 bytes
a508:	LW $gp, $v0, 2	# offset is +8 bytes
a512:	ADDI $sp, $sp, -4
a516:	SW $sp, $v0, 0	# offset is +0 bytes
a520:	LW $sp, $at, 0	# offset is +0 bytes
a524:	ADDI $sp, $sp, 4
a528:	LW $sp, $v0, 0	# offset is +0 bytes
a532:	ADDI $sp, $sp, 4
a536:	ADD $v0, $at, $v0
a540:	ADDI $sp, $sp, -4
a544:	SW $sp, $v0, 0	# offset is +0 bytes
a548:	LW $gp, $v0, 4	# offset is +16 bytes
a552:	ADDI $sp, $sp, -4
a556:	SW $sp, $v0, 0	# offset is +0 bytes
a560:	LW $sp, $at, 0	# offset is +0 bytes
a564:	ADDI $sp, $sp, 4
a568:	LW $sp, $v0, 0	# offset is +0 bytes
a572:	ADDI $sp, $sp, 4
a576:	DIV $v0, $at
a580:	MFLO $v0
a584:	ADDI $sp, $sp, -4
a588:	SW $sp, $v0, 0	# offset is +0 bytes
a592:	LW $sp, $v0, 0	# offset is +0 bytes
a596:	ADDI $sp, $sp, 4
a600:	ADD $0, $fp, $t9
a604:	SW $t9, $v0, 1	# offset is +4 bytes
a608:	BNE $v0, $0, 19	# offset is +76 bytes
a612:	ADD $0, $fp, $t9
a616:	LW $t9, $v0, 1	# offset is +4 bytes
a620:	ADDI $sp, $sp, -4
a624:	SW $sp, $v0, 0	# offset is +0 bytes
a628:	LW $gp, $v0, 4	# offset is +16 bytes
a632:	ADDI $sp, $sp, -4
a636:	SW $sp, $v0, 0	# offset is +0 bytes
a640:	LW $sp, $at, 0	# offset is +0 bytes
a644:	ADDI $sp, $sp, 4
a648:	LW $sp, $v0, 0	# offset is +0 bytes
a652:	ADDI $sp, $sp, 4
a656:	DIV $v0, $at
a660:	MFLO $v0
a664:	ADDI $sp, $sp, -4
a668:	SW $sp, $v0, 0	# offset is +0 bytes
a672:	LW $sp, $v0, 0	# offset is +0 bytes
a676:	ADDI $sp, $sp, 4
a680:	ADD $0, $fp, $t9
a684:	SW $t9, $v0, 1	# offset is +4 bytes
a688:	BNE $v0, $0, -95	# offset is -380 bytes
a692:	ADD $0, $fp, $t9
a696:	LW $t9, $v0, 1	# offset is +4 bytes
a700:	ADDI $sp, $sp, -4
a704:	SW $sp, $v0, 0	# offset is +0 bytes
a708:	ADD $0, $fp, $t9
a712:	LW $t9, $v0, 0	# offset is +0 bytes
a716:	ADDI $sp, $sp, -4
a720:	SW $sp, $v0, 0	# offset is +0 bytes
a724:	ADD $0, $fp, $t9
a728:	LW $t9, $v0, 0	# offset is +0 bytes
a732:	ADDI $sp, $sp, -4
a736:	SW $sp, $v0, 0	# offset is +0 bytes
a740:	LW $sp, $at, 0	# offset is +0 bytes
a744:	ADDI $sp, $sp, 4
a748:	LW $sp, $v0, 0	# offset is +0 bytes
a752:	ADDI $sp, $sp, 4
a756:	SUB $v0, $at, $v0
a760:	ADDI $sp, $sp, -4
a764:	SW $sp, $v0, 0	# offset is +0 bytes
a768:	LW $gp, $v0, 5	# offset is +20 bytes
a772:	ADDI $sp, $sp, -4
a776:	SW $sp, $v0, 0	# offset is +0 bytes
a780:	LW $gp, $v0, 6	# offset is +24 bytes
a784:	ADDI $sp, $sp, -4
a788:	SW $sp, $v0, 0	# offset is +0 bytes
a792:	LW $gp, $v0, 2	# offset is +8 bytes
a796:	ADDI $sp, $sp, -4
a800:	SW $sp, $v0, 0	# offset is +0 bytes
a804:	LW $sp, $at, 0	# offset is +0 bytes
a808:	ADDI $sp, $sp, 4
a812:	LW $sp, $v0, 0	# offset is +0 bytes
a816:	ADDI $sp, $sp, 4
a820:	ADD $v0, $at, $v0
a824:	ADDI $sp, $sp, -4
a828:	SW $sp, $v0, 0	# offset is +0 bytes
a832:	LW $sp, $at, 0	# offset is +0 bytes
a836:	ADDI $sp, $sp, 4
a840:	LW $sp, $v0, 0	# offset is +0 bytes
a844:	ADDI $sp, $sp, 4
a848:	SUB $v0, $at, $v0
a852:	ADDI $sp, $sp, -4
a856:	SW $sp, $v0, 0	# offset is +0 bytes
a860:	LW $gp, $v0, 7	# offset is +28 bytes
a864:	ADDI $sp, $sp, -4
a868:	SW $sp, $v0, 0	# offset is +0 bytes
a872:	LW $sp, $at, 0	# offset is +0 bytes
a876:	ADDI $sp, $sp, 4
a880:	LW $sp, $v0, 0	# offset is +0 bytes
a884:	ADDI $sp, $sp, 4
a888:	MUL $v0, $at
a892:	MFLO $v0
a896:	ADDI $sp, $sp, -4
a900:	SW $sp, $v0, 0	# offset is +0 bytes
a904:	LW $sp, $at, 0	# offset is +0 bytes
a908:	ADDI $sp, $sp, 4
a912:	LW $sp, $v0, 0	# offset is +0 bytes
a916:	ADDI $sp, $sp, 4
a920:	ADD $v0, $at, $v0
a924:	ADDI $sp, $sp, -4
a928:	SW $sp, $v0, 0	# offset is +0 bytes
a932:	LW $sp, $at, 0	# offset is +0 bytes
a936:	ADDI $sp, $sp, 4
a940:	LW $sp, $v0, 0	# offset is +0 bytes
a944:	ADDI $sp, $sp, 4
a948:	ADD $v0, $at, $v0
a952:	ADDI $sp, $sp, -4
a956:	SW $sp, $v0, 0	# offset is +0 bytes
a960:	LW $sp, $a0, 0	# offset is +0 bytes
a964:	ADDI $sp, $sp, 4
a968:	PINT 
a972:	LW $fp, $ra, -4	# offset is -16 bytes
a976:	LW $fp, $s0, -5	# offset is -20 bytes
a980:	LW $fp, $s1, -6	# offset is -24 bytes
a984:	LW $fp, $s2, -7	# offset is -28 bytes
a988:	LW $fp, $s3, -8	# offset is -32 bytes
a992:	LW $fp, $s4, -9	# offset is -36 bytes
a996:	LW $fp, $s5, -10	# offset is -40 bytes
a1000:	LW $fp, $s6, -11	# offset is -44 bytes
a1004:	LW $fp, $s7, -12	# offset is -48 bytes
a1008:	LW $fp, $sp, -1	# offset is -4 bytes
a1012:	LW $fp, $fp, -2	# offset is -8 bytes
a1016:	ADDI $sp, $sp, 0
a1020:	EXIT 
.data 1028
WORD w0 = 7
WORD w1 = 100
WORD w2 = 1
WORD w3 = 3
WORD w4 = 2
WORD w5 = 6
WORD w6 = 5
WORD w7 = 3402
.stack 6184
.end
