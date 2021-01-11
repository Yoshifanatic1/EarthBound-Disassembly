
;#############################################################################################################
;#############################################################################################################

macro EBBankC0Macros(StartBank, EndBank)
%BANK_START(<StartBank>)
label_C00000:
	STZ.w $280C
	LDX.w #$280C
	LDY.w #$280D
	LDA.w #$003B
	MVN $7E,$7E
	LDA.w #$280C
	RTS

;--------------------------------------------------------------------

label_C00013:
	REP.b #$31
	LDA.w #$0009
	JSL.l label_C08D79
	LDY.w #$0000
	LDX.w #$3800
	LDA.w #$0001
	JSL.l label_C08D9E
	LDY.w #$2000
	LDX.w #$5800
	LDA.w #$0001
	JSL.l label_C08DDE
	LDY.w #$6000
	LDX.w #$7C00
	LDA.w #$0000
	JSL.l label_C08E1C
	LDA.w #$0062
	JSL.l label_C08D92
	RTL

;--------------------------------------------------------------------

label_C0004B:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w #$7F0000
	STA.b $06
	LDA.w #$7F0000>>16
	STA.b $08
	JSL.l label_C00013
	LDA.w #$0000
	STA.b [$06]
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$0000
	TYX
	SEP.b #$20
	LDA.b #$03
	JSL.l label_C08616
	LDA.w #$FFFF
	STA.w $4370
	STA.w $436E
	PLD
	RTL

;--------------------------------------------------------------------

label_C00085:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE2
	TCD
	STZ.w $4472
	LDA.w $4372
	ASL
	ASL
	STA.b $1C
	LDA.w #DATA_EF121B
	STA.b $0A
	LDA.w #DATA_EF121B>>16
	STA.b $0C
	LDA.b $1C
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $18
	LDA.b $08
	STA.b $1A
	LDA.b [$06]
	AND.w #$00FF
	BNE.b label_C000C6
	JMP.w label_C00170

label_C000C6:
	LDA.w #DATA_EF11CB
	STA.b $0A
	LDA.w #DATA_EF11CB>>16
	STA.b $0C
	LDA.b $1C
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$C000
	STA.b $12
	LDA.w #$007E
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.b $18
	STA.b $06
	LDA.b $1A
	STA.b $08
	LDA.b [$06]
	AND.w #$00FF
	STA.w $4472
	STA.b $02
	INC.b $06
	LDY.w #$0000
	STY.b $16
	BRA.b label_C0016B

label_C00114:
	TYA
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$43DC
	TAX
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b [$0A]
	AND.w #$00FF
	STA.w $0000,X
	SEP.b #$20
	LDY.w #$0001
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	STA.w $000A,X
	STA.w $0002,X
	LDY.w #$0002
	LDA.b [$06],Y
	STA.w $0004,X
	LDY.w #$0004
	LDA.b [$06],Y
	STA.w $000E,X
	STA.w $0006,X
	LDY.w #$0006
	LDA.b [$06],Y
	STA.w $0008,X
	STZ.w $000C,X
	LDA.w #$0008
	CLC
	ADC.b $06
	STA.b $06
	LDY.b $16
	INY
	STY.b $16
label_C0016B:
	TYA
	CMP.b $02
	BCC.b label_C00114
label_C00170:
	PLD
	RTS

;--------------------------------------------------------------------

label_C00172:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE8
	TCD
	LDA.w #$43DC
	STA.b $16
	STZ.b $14
	JMP.w label_C00231

label_C00184:
	LDA.b $16
	CLC
	ADC.w #$000A
	TAX
	LDA.w $0000,X
	DEC
	STA.w $0000,X
	BEQ.b label_C00197
	JMP.w label_C00227

label_C00197:
	LDY.w #$0002
	LDA.b ($16),Y
	STA.w $0000,X
	LDA.b $16
	CLC
	ADC.w #$000C
	TAX
	LDA.w $0000,X
	CMP.b ($16)
	BNE.b label_C001BD
	LDA.w #$0000
	STA.w $0000,X
	LDY.w #$0006
	LDA.b ($16),Y
	LDY.w #$000E
	STA.b ($16),Y
label_C001BD:
	LDA.b $16
	STA.b $04
	INC.b $04
	INC.b $04
	INC.b $04
	INC.b $04
	LDA.b $16
	CLC
	ADC.w #$000E
	STA.b $02
	STA.b $12
	LDA.w #$C000
	STA.b $06
	LDA.w #$007E
	STA.b $08
	LDX.b $02
	LDA.w $0000,X
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$0008
	LDA.b ($16),Y
	TAY
	LDX.b $04
	LDA.w $0000,X
	TAX
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDX.b $04
	LDA.w $0000,X
	PHA
	LDX.b $02
	LDA.w $0000,X
	PLY
	STY.b $02
	CLC
	ADC.b $02
	LDX.b $12
	STX.b $02
	STA.w $0000,X
	LDA.b $16
	CLC
	ADC.w #$000C
	TAX
	LDA.w $0000,X
	INC
	STA.w $0000,X
label_C00227:
	LDA.b $16
	CLC
	ADC.w #$0010
	STA.b $16
	INC.b $14
label_C00231:
	LDA.w $4472
	CMP.b $14
	BEQ.b label_C0023D
	BCC.b label_C0023D
	JMP.w label_C00184

label_C0023D:
	PLD
	RTL

;--------------------------------------------------------------------

label_C0023F:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE8
	TCD
	STZ.w $4474
	LDX.w $02A0
	BNE.b label_C00252
	JMP.w label_C0030D

label_C00252:
	LDA.w #$DFE4E1
	STA.b $06
	LDA.w #$DFE4E1>>16
	STA.b $08
	TXA
	DEC
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $0A
	STY.b $0C
	SEP.b #$20
	LDY.w #$0004
	LDA.b [$0A],Y
	REP.b #$20
	AND.w #$00FF
	BNE.b label_C00282
	JMP.w label_C0030D

label_C00282:
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$B800
	STA.b $12
	LDA.w #$007E
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #$0000
	STA.b $16
	BRA.b label_C002BD

label_C002B3:
	ASL
	TAX
	STZ.w $4460,X
	LDA.b $16
	INC
	STA.b $16
label_C002BD:
	CMP.w #$0009
	BCC.b label_C002B3
	LDA.w #$0005
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.w #$0000
	STA.b $16
	BRA.b label_C002EA

label_C002D9:
	ASL
	TAX
	LDA.b [$06]
	AND.w #$00FF
	STA.w $4460,X
	INC.b $06
	LDA.b $16
	INC
	STA.b $16
label_C002EA:
	SEP.b #$20
	LDY.w #$0004
	LDA.b [$0A],Y
	REP.b #$20
	AND.w #$00FF
	STA.b $02
	LDA.b $16
	CMP.b $02
	BCC.b label_C002D9
	LDA.w $4460
	STA.w $445C
	LDA.w #$0001
	STA.w $4474
	STA.w $445E
label_C0030D:
	PLD
	RTS

;--------------------------------------------------------------------

label_C0030F:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w $445C
	DEC
	STA.w $445C
	BNE.b label_C00359
	LDX.w #$445E
	STX.b $0E
	LDA.w $0000,X
	ASL
	TAX
	LDA.w $4460,X
	BNE.b label_C00337
	LDA.w #$0000
	LDX.b $0E
	STA.w $0000,X
label_C00337:
	LDX.w #$445E
	STX.b $0E
	LDA.w $0000,X
	ASL
	TAX
	LDA.w $4460,X
	STA.w $445C
	LDX.b $0E
	LDA.w $0000,X
	JSL.l $C0A1F2
	LDX.b $0E
	LDA.w $0000,X
	INC
	STA.w $0000,X
label_C00359:
	PLD
	RTL

;--------------------------------------------------------------------

label_C0035B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	LDA.w #$7F8000
	STA.b $06
	LDA.w #$7F8000>>16
	STA.b $08
	LDA.b $0E
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	TXA
	ASL
	STA.b $02
	TYA
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	PLD
	RTL

;--------------------------------------------------------------------

label_C00391:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	STA.b $18
	STZ.b $16
	STZ.b $14
	LDA.w #$0000
	STA.b $04
	TAY
	STY.b $12
	LDA.b $18
	DEC
	DEC
	STA.b $02
	STA.b $10
	LDX.w #$0000
	STX.b $0E
	BRA.b label_C00405

label_C003B8:
	LDA.b $10
	STA.b $02
	INC.b $02
	INC.b $02
	LDA.b $02
	STA.b $10
	LDX.b $02
	LDA.w $0000,X
	STA.b $18
	AND.w #$7FFF
	BEQ.b label_C00400
	LDA.b $18
	AND.w #$001F
	STA.b $02
	LDA.b $04
	CLC
	ADC.b $02
	STA.b $04
	LDA.b $18
	AND.w #$03E0
	LSR
	LSR
	LSR
	LSR
	LSR
	CLC
	ADC.b $14
	STA.b $14
	LDA.b $18
	AND.w #$7C00
	XBA
	AND.w #$00FF
	LSR
	LSR
	CLC
	ADC.b $16
	STA.b $16
	INY
	STY.b $12
label_C00400:
	LDX.b $0E
	INX
	STX.b $0E
label_C00405:
	CPX.w #$0060
	BCC.b label_C003B8
	LDA.b $04
	ASL
	ASL
	ASL
	JSL.l label_C0915B
	STA.w $43D0
	LDY.b $12
	LDA.b $14
	ASL
	ASL
	ASL
	JSL.l label_C0915B
	STA.w $43D2
	LDY.b $12
	LDA.b $16
	ASL
	ASL
	ASL
	JSL.l label_C0915B
	STA.w $43D4
	PLD
	RTS

;--------------------------------------------------------------------

label_C00434:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STX.b $02
	STA.b $0E
	CMP.b $02
	BNE.b label_C0044A
	LDA.b $02
	BRA.b label_C0047E

label_C0044A:
	CMP.b $02
	BCC.b label_C00466
	BEQ.b label_C00466
	SEC
	SBC.b $02
	CMP.w #$0006
	BCC.b label_C00462
	BEQ.b label_C00462
	LDA.b $0E
	SEC
	SBC.w #$0006
	STA.b $02
label_C00462:
	LDA.b $02
	BRA.b label_C0047E

label_C00466:
	STA.b $04
	LDA.b $02
	SEC
	SBC.b $04
	CMP.w #$0006
	BCC.b label_C0047C
	BEQ.b label_C0047C
	LDA.b $0E
	CLC
	ADC.w #$0006
	STA.b $02
label_C0047C:
	LDA.b $02
label_C0047E:
	PLD
	RTS

;--------------------------------------------------------------------

label_C00480:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFDE
	TCD
	LDA.w #$7E0240
	JSR.w label_C00391
	LDY.w $43D6
	LDA.w $43D0
	XBA
	AND.w #$FF00
	JSL.l label_C0915B
	STA.b $20
	LDY.w $43D8
	LDA.w $43D2
	XBA
	AND.w #$FF00
	JSL.l label_C0915B
	STA.b $1E
	LDY.w $43DA
	LDA.w $43D4
	XBA
	AND.w #$FF00
	JSL.l label_C0915B
	STA.b $1C
	LDY.w #$0003
	LDA.b $20
	CLC
	ADC.b $1E
	CLC
	ADC.b $1C
	JSL.l label_C0915B
	STA.b $1A
	LDA.b $20
	CMP.w #$0100
	BEQ.b label_C004DB
	BCC.b label_C004DB
	JMP.w label_C005E5

label_C004DB:
	LDA.b $1E
	CMP.w #$0100
	BEQ.b label_C004E7
	BCC.b label_C004E7
	JMP.w label_C005E5

label_C004E7:
	LDA.b $1C
	CMP.w #$0100
	BEQ.b label_C004F3
	BCC.b label_C004F3
	JMP.w label_C005E5

label_C004F3:
	LDA.w #$0080
	STA.b $18
	JMP.w label_C005D9

;--------------------------------------------------------------------

label_C004FB:
	LDA.b $18
	ASL
	TAX
	LDA.w $0200,X
	TAX
	AND.w #$001F
	STA.b $16
	TAY
	STY.b $14
	TXA
	AND.w #$03E0
	LSR
	LSR
	LSR
	LSR
	LSR
	STA.b $02
	STA.b $12
	LDA.b $02
	STA.b $10
	TXA
	AND.w #$7C00
	XBA
	AND.w #$00FF
	LSR
	LSR
	STA.b $04
	STA.b $0E
	LDA.b $16
	CMP.b $02
	BNE.b label_C00562
	LDA.b $02
	CMP.b $04
	BNE.b label_C00562
	LDA.b $16
	STA.b $02
	LDA.b $04
	CMP.b $02
	BNE.b label_C00562
	LDY.b $1A
	LDA.b $16
	JSL.l label_C09032
	STA.b $16
	LDY.b $1A
	LDA.b $12
	STA.b $02
	JSL.l label_C09032
	STA.b $02
	LDY.b $1A
	LDA.b $04
	JSL.l label_C09032
	STA.b $04
	BRA.b label_C00582

label_C00562:
	LDY.b $20
	LDA.b $16
	JSL.l label_C09032
	STA.b $16
	LDY.b $1E
	LDA.b $12
	STA.b $02
	JSL.l label_C09032
	STA.b $02
	LDY.b $1C
	LDA.b $04
	JSL.l label_C09032
	STA.b $04
label_C00582:
	LDA.b $16
	XBA
	AND.w #$00FF
	AND.w #$001F
	TAX
	LDY.b $14
	TYA
	JSR.w label_C00434
	TAY
	STY.b $14
	LDA.b $02
	XBA
	AND.w #$00FF
	AND.w #$001F
	TAX
	LDA.b $10
	JSR.w label_C00434
	STA.b $02
	LDA.b $04
	XBA
	AND.w #$00FF
	AND.w #$001F
	TAX
	LDA.b $0E
	JSR.w label_C00434
	STA.b $0E
	LDA.b $18
	ASL
	TAX
	LDY.b $14
	LDA.b $02
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $04
	LDA.b $0E
	XBA
	AND.w #$FF00
	ASL
	ASL
	ORA.b $04
	STY.b $02
	ORA.b $02
	STA.w $0200,X
	INC.b $18
label_C005D9:
	LDA.b $18
	CMP.w #$0100
	BCS.b label_C005E5
	BEQ.b label_C005E5
	JMP.w label_C004FB

label_C005E5:
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Routine that loads the night Onett palette?

label_C005E7:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEC
	TCD
	LDA.l DATA_EF10FF
	STA.b $06
	LDA.l DATA_EF10FF+$02
	STA.b $08
	LDY.w #$7E0240
	STY.b $12
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #EB_NighttimeOnettBGPalette-EB_DaytimeOnettBGPalette
	TYA
	JSL.l label_C08ED2
	LDY.b $12
	TYA
	JSR.w label_C00391
	LDA.w $43D0
	STA.w $43D6
	LDA.w $43D2
	STA.w $43D8
	LDA.w $43D4
	STA.w $43DA
	PLD
	RTL

;--------------------------------------------------------------------

label_C0062A:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	LDA.w #DATA_EF117B
	STA.b $06
	LDA.w #DATA_EF117B>>16
	STA.b $08
	LDA.b $0E
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $0A
	STY.b $0C
	LDA.w #$7FF800
	STA.b $06
	LDA.w #$7FF800>>16
	STA.b $08
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C00677

label_C00666:
	LDA.b [$0A]
	STA.b [$06]
	INC.b $0A
	INC.b $0A
	INC.b $06
	INC.b $06
	LDA.b $0E
	INC
	STA.b $0E
label_C00677:
	CMP.w #$03C0
	BCC.b label_C00666
	PLD
	RTS

;--------------------------------------------------------------------

label_C0067E:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TXY
	STA.b $0E
	LDA.w #$8000
	STA.b $06
	LDA.w #$007F
	STA.b $08
	LDA.b $0E
	ASL
	ASL
	ASL
	ASL
	ASL
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	TYA
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDX.w #$0000
	BRA.b label_C006C6

label_C006B9:
	LDA.b [$06]
	STA.b [$0A]
	INC.b $06
	INC.b $06
	INC.b $0A
	INC.b $0A
	INX
label_C006C6:
	CPX.w #$0010
	BCC.b label_C006B9
	LDA.w #$7FF800
	STA.b $0A
	LDA.w #$7FF800>>16
	STA.b $0C
	LDA.b $0E
	ASL
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	TYA
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	STA.b [$06]
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to events?

label_C006F2:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $10
	LDA.w #DATA_D015C0&$0000
	STA.b $06
	LDA.w #DATA_D015C0>>16
	STA.b $08
	LDA.b $10
	ASL
	TAX
	LDA.l DATA_D01598,X
	CLC
	ADC.b $06
	STA.b $06
label_C00715:
	LDA.b [$06]
	BEQ.b label_C00776
	AND.w #$7FFF
	JSL.l label_C21628
	STA.b $0E
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	STY.b $10
	LDX.w #$0000
	LDA.b [$06]
	CMP.w #$8000
	BCC.b label_C00737
	LDX.w #$0001
label_C00737:
	STX.b $02
	LDA.b $0E
	CMP.b $02
	BNE.b label_C00768
	LDA.w #$0004
	CLC
	ADC.b $06
	STA.b $06
	BRA.b label_C00761

label_C00749:
	LDY.w #$0002
	LDA.b [$06],Y
	TAX
	LDA.b [$06]
	JSR.w label_C0067E
	LDA.w #$0004
	CLC
	ADC.b $06
	STA.b $06
	LDY.b $10
	DEY
	STY.b $10
label_C00761:
	CPY.w #$0000
	BNE.b label_C00749
	BRA.b label_C00715

label_C00768:
	TYA
	ASL
	ASL
	INC
	INC
	INC
	INC
	CLC
	ADC.b $06
	STA.b $06
	BRA.b label_C00715

label_C00776:
	PLD
	RTL

;--------------------------------------------------------------------

label_C00778:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDX.w #$0240
	LDA.w $0040,X
	BEQ.b label_C007B4
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$0200
	TAX
	STX.b $10
	LDA.w #$0040
	STA.b $0E
	BRA.b label_C007AF

label_C0079B:
	ASL
	PHA
	LDA.w $0000,X
	PLX
	STA.w $0300,X
	LDX.b $10
	INX
	INX
	STX.b $10
	LDA.b $0E
	INC
	STA.b $0E
label_C007AF:
	CMP.w #$0050
	BCC.b label_C0079B
label_C007B4:
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to loading palettes

label_C007B6:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE0
	TCD
	PLA
	STA.b $1E
	LDY.w #$7E0240
	STY.b $1C
	LDA.w #DATA_EF10FB
	STA.b $06
	LDA.w #DATA_EF10FB>>16
	STA.b $08
	LDA.b $1E
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	TXA
	LDY.w #$00C0
	JSL.l label_C08FF7
	CLC
	ADC.b $06
	STA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.w $B4EF
	BNE.b label_C00863
label_C007FE:
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$00C0
	LDY.b $1C
	TYA
	JSL.l label_C08ED2
	LDY.b $1C
	LDA.w $0000,Y
	BNE.b label_C00822
	JMP.w label_C008C1			; Note: If the first color is #$0000, return

label_C00822:
	AND.w #$7FFF
	JSL.l label_C21628
	STA.b $1A
	LDX.w #$0000
	LDY.b $1C
	LDA.w $0000,Y
	CMP.w #$8000
	BCC.b label_C0083D
	BEQ.b label_C0083D
	LDX.w #$0001
label_C0083D:
	STX.b $02
	LDA.b $1A
	CMP.b $02
	BEQ.b label_C00848
	JMP.w label_C008C1

label_C00848:
	LDA.l DATA_EF10FB
	STA.b $06
	LDA.l DATA_EF10FB+$02
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.w $0020,Y
	STA.b $16
	BRA.b label_C007FE

label_C00863:
	LDA.w #$0000
	STA.b $06
	LDA.w #$007F
	STA.b $08
	LDA.w #$E1374A
	STA.b $0E
	LDA.w #$E1374A>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.w $B4F1
	LDY.w #$003E
	JSL.l label_C08FF7
	CLC
	ADC.w #$0006
	TAX
	LDA.l $E12F8A,X
	STA.b $06
	STZ.b $08
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$00C0
	LDY.b $1C
	TYA
	JSL.l label_C08ED2
label_C008C1:
	PLD
	RTL

;--------------------------------------------------------------------

label_C008C3:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE4
	TCD
	PLA
	STA.b $1A
	LDA.w $438A
	ORA.w $438C
	BEQ.b label_C008E9
	LDA.w $438A
	LSR
	LSR
	LSR
	LSR
	LSR
	STA.b $1A
	LDA.w $438C
	LSR
	LSR
	LSR
	LSR
	TAX
label_C008E9:
	LDA.b $1A
	STA.b $02
	TXA
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.l DATA_D7A800,X
	AND.w #$00FF
	STA.b $1A
	AND.w #$0007
	STA.b $18
	LDA.b $1A
	LSR
	LSR
	LSR
	STA.b $04
	ASL
	TAX
	LDA.l DATA_EF101B,X
	TAY
	STY.b $16
	TYA
	ASL
	ASL
	STA.b $02
	LDA.w #DATA_EF10AB
	STA.b $0A
	LDA.w #DATA_EF10AB>>16
	STA.b $0C
	LDA.b $02
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$8000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDY.b $16
	TYA
	JSR.w label_C0062A
	LDY.b $16
	TYA
	JSL.l label_C006F2
	JSL.l label_C005E7
	LDA.w #FileSelectScreenSpritePalettes
	STA.b $0E
	LDA.w #FileSelectScreenSpritePalettes>>16
	STA.b $10
	LDX.w #$0100
	LDA.w #$0300
	JSL.l label_C08ED2
	LDA.b $04
	CMP.w $436E
	BEQ.b label_C009EE
	LDY.b $16
	STY.w $4372
	LDA.w #DATA_EF105B
	STA.b $0A
	LDA.w #DATA_EF105B>>16
	STA.b $0C
	LDA.b $02
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
label_C009B1:
	LDA.w $0028
	AND.w #$00FF
	BNE.b label_C009B1
	LDA.w $B4EF
	BNE.b label_C009D7
	LDA.w #$0000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$0000
	LDX.w #$7000
	SEP.b #$20
	TYA
	JSL.l label_C085B7
	BRA.b label_C009EE

label_C009D7:
	LDA.w #$0000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$0000
	LDX.w #$4000
	SEP.b #$20
	TYA
	JSL.l label_C085B7
label_C009EE:
	LDA.w $0028
	AND.w #$00FF
	BNE.b label_C009EE
	LDX.b $18
	LDA.b $04
	JSL.l label_C007B6
	JSL.l label_C00480
	JSL.l label_C00778
	LDA.w $B4EF
	BNE.b label_C00A15
	JSL.l label_C4B26B
	JSR.w label_C00085
	JSR.w label_C0023F
label_C00A15:
	LDA.w $B4EF
	BNE.b label_C00A30
	LDA.w $436C
	BEQ.b label_C00A25
	JSL.l $EFD9F3
	BRA.b label_C00A29

label_C00A25:
	JSL.l label_C47F87
label_C00A29:
	LDA.w #$0000
	JSL.l label_C0856B
label_C00A30:
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.w #$0040
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$01C0
	LDA.w #$4476
	JSL.l label_C08ED2
	LDA.w $4676
	BEQ.b label_C00A75
	JSL.l label_C496F9
	SEP.b #$20
	LDA.b #$FF
	STA.b $0E
	LDX.w #$0200
	REP.b #$20
	LDA.w #$0200
	JSL.l label_C08EFC
	STZ.w $4676
label_C00A75:
	LDA.w $B4EF
	BEQ.b label_C00A8E
	JSL.l label_C496F9
	SEP.b #$20
	STZ.b $0E
	LDX.w #$01E0
	REP.b #$20
	LDA.w #$0220
	JSL.l label_C08EFC
label_C00A8E:
	LDA.w #$0018
	JSL.l label_C0856B
	LDA.b $04
	STA.w $436E
	LDA.b $18
	STA.w $4370
	PLD
	RTS

;--------------------------------------------------------------------

label_C00AA1:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF2
	TCD
	PLA
	XBA
	AND.w #$00FF
	STA.b $02
	TXA
	AND.w #$FF80
	LSR
	LSR
	CLC
	ADC.b $02
	ASL
	TAX
	LDA.l $D7B200,X
	STA.w $438E
	PLD
	RTL

;--------------------------------------------------------------------

label_C00AC5:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	STA.b $18
	TXA
	LSR
	LSR
	STA.b $04
	LDA.b $18
	AND.w #$8000
	BEQ.b label_C00AE9
	LDA.b $18
	LSR
	LSR
	ORA.w #$E000
	TAY
	STY.b $16
	BRA.b label_C00AF0

label_C00AE9:
	LDA.b $18
	LSR
	LSR
	TAY
	STY.b $16
label_C00AF0:
	TYA
	AND.w #$000F
	TAX
	STX.b $18
	TYA
	SEP.b #$20
	STA.w $4390,X
	REP.b #$20
	LDA.b $04
	AND.w #$000F
	STA.b $14
	TAX
	LDA.b $04
	SEP.b #$20
	STA.w $43A0,X
	REP.b #$20
	TYA
	LSR
	LSR
	LSR
	STA.b $02
	LDA.b $04
	AND.w #$FFFC
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	SEP.b #$20
	LDA.l DATA_D7A800,X
	LSR
	LSR
	LSR
	REP.b #$20
	AND.w #$00FF
	STA.b $12
	LDA.b $14
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$F000
	STA.b $14
	LDA.b $04
	CMP.w #$0140
	BCC.b label_C00B49
	JMP.w label_C00BC2

label_C00B49:
	LDX.b $18
	STX.b $02
	LDA.b $02
	STA.b $10
	STZ.b $0E
	BRA.b label_C00BB9

label_C00B55:
	TYA
	AND.w #$0007
	BNE.b label_C00B7D
	TYA
	LSR
	LSR
	LSR
	STA.b $02
	LDA.b $04
	AND.w #$FFFC
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	SEP.b #$20
	LDA.l DATA_D7A800,X
	LSR
	LSR
	LSR
	REP.b #$20
	AND.w #$00FF
	STA.b $12
label_C00B7D:
	CPY.w #$0100
	BCS.b label_C00B9D
	LDA.w $436E
	CMP.b $12
	BNE.b label_C00B9D
	LDX.b $04
	TYA
	JSR.w label_C0A156
	STA.b $18
	LDA.b $10
	STA.b $02
	ASL
	TAY
	LDA.b $18
	STA.b ($14),Y
	BRA.b label_C00BA8

label_C00B9D:
	LDA.b $10
	STA.b $02
	ASL
	TAY
	LDA.w #$0000
	STA.b ($14),Y
label_C00BA8:
	LDA.b $02
	INC
	AND.w #$000F
	STA.b $02
	STA.b $10
	LDY.b $16
	INY
	STY.b $16
	INC.b $0E
label_C00BB9:
	LDA.b $0E
	CMP.w #$0010
	BCC.b label_C00B55
	BRA.b label_C00BDA

label_C00BC2:
	LDA.w #$0000
	STA.b $18
	BRA.b label_C00BD5

label_C00BC9:
	ASL
	TAY
	LDA.w #$0000
	STA.b ($14),Y
	LDA.b $18
	INC
	STA.b $18
label_C00BD5:
	CMP.w #$0010
	BCC.b label_C00BC9
label_C00BDA:
	PLD
	RTS

;--------------------------------------------------------------------

label_C00BDC:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE4
	TCD
	PLA
	LSR
	LSR
	STA.b $04
	TXA
	AND.w #$8000
	BEQ.b label_C00BFB
	TXA
	LSR
	LSR
	ORA.w #$E000
	TAY
	STY.b $1A
	BRA.b label_C00C01

label_C00BFB:
	TXA
	LSR
	LSR
	TAY
	STY.b $1A
label_C00C01:
	LDA.b $04
	AND.w #$000F
	STA.b $18
	TAX
	LDA.b $04
	SEP.b #$20
	STA.w $43B0,X
	REP.b #$20
	TYA
	AND.w #$000F
	TAX
	STX.b $16
	TYA
	SEP.b #$20
	STA.w $43C0,X
	REP.b #$20
	LDA.b $04
	LSR
	LSR
	LSR
	STA.b $02
	TYA
	AND.w #$FFFC
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	SEP.b #$20
	LDA.l DATA_D7A800,X
	LSR
	LSR
	LSR
	REP.b #$20
	AND.w #$00FF
	STA.b $14
	LDA.b $18
	ASL
	CLC
	ADC.w #$F000
	STA.b $12
	LDA.b $04
	CMP.w #$0100
	BCC.b label_C00C56
	JMP.w label_C00CD5

label_C00C56:
	LDX.b $16
	TXA
	ASL
	ASL
	ASL
	ASL
	STA.b $02
	STA.b $10
	STZ.b $0E
	BRA.b label_C00CCC

label_C00C65:
	TYA
	AND.w #$0003
	BNE.b label_C00C8D
	LDA.b $04
	LSR
	LSR
	LSR
	STA.b $02
	TYA
	AND.w #$FFFC
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	SEP.b #$20
	LDA.l DATA_D7A800,X
	LSR
	LSR
	LSR
	REP.b #$20
	AND.w #$00FF
	STA.b $14
label_C00C8D:
	CPY.w #$0140
	BCS.b label_C00CAD
	LDA.w $436E
	CMP.b $14
	BNE.b label_C00CAD
	TYX
	LDA.b $04
	JSR.w label_C0A156
	STA.b $18
	LDA.b $10
	STA.b $02
	ASL
	TAY
	LDA.b $18
	STA.b ($12),Y
	BRA.b label_C00CB8

label_C00CAD:
	LDA.b $10
	STA.b $02
	ASL
	TAY
	LDA.w #$0000
	STA.b ($12),Y
label_C00CB8:
	LDA.b $02
	CLC
	ADC.w #$0010
	AND.w #$00FF
	STA.b $02
	STA.b $10
	LDY.b $1A
	INY
	STY.b $1A
	INC.b $0E
label_C00CCC:
	LDA.b $0E
	CMP.w #$0010
	BCC.b label_C00C65
	BRA.b label_C00CF1

label_C00CD5:
	LDA.w #$0000
	STA.b $18
	BRA.b label_C00CEC

label_C00CDC:
	ASL
	ASL
	ASL
	ASL
	ASL
	TAY
	LDA.w #$0000
	STA.b ($12),Y
	LDA.b $18
	INC
	STA.b $18
label_C00CEC:
	CMP.w #$0010
	BCC.b label_C00CDC
label_C00CF1:
	PLD
	RTS

;--------------------------------------------------------------------

label_C00CF3:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	TXA
	STA.b $12
	LSR
	LSR
	AND.w #$000F
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$F000
	STA.b $02
	LDA.b $12
	AND.w #$003F
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$E000
	TAX
	STX.b $10
	LDA.b $12
	AND.w #$0003
	ASL
	ASL
	STA.b $04
	LDY.w #$0000
	STY.b $0E
	BRA.b label_C00D77

label_C00D32:
	LDX.b $02
	LDA.w $0000,X
	ASL
	TAX
	LDA.l $7FF800,X
	STA.b $12
	INC.b $02
	INC.b $02
	LDA.w #DATA_D80000
	STA.b $06
	LDA.w #DATA_D80000>>16
	STA.b $08
	LDA.b $12
	CLC
	ADC.b $04
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b [$0A]
	LDX.b $10
	STA.w $0000,X
	LDY.w #$0002
	LDA.b [$06],Y
	STA.w $0002,X
	INX
	INX
	INX
	INX
	STX.b $10
	LDY.b $0E
	INY
	STY.b $0E
label_C00D77:
	CPY.w #$0010
	BCC.b label_C00D32
	PLD
	RTS

;--------------------------------------------------------------------

label_C00D7E:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STA.b $12
	LSR
	LSR
	AND.w #$000F
	ASL
	CLC
	ADC.w #$F000
	STA.b $02
	LDA.b $12
	AND.w #$003F
	CLC
	ADC.w #$E000
	TAX
	STX.b $10
	LDA.b $12
	AND.w #$0003
	STA.b $04
	LDY.w #$0000
	STY.b $0E
	BRA.b label_C00E0F

label_C00DB0:
	LDX.b $02
	LDA.w $0000,X
	ASL
	TAX
	LDA.l $7FF800,X
	STA.b $12
	LDA.b $02
	CLC
	ADC.w #$0020
	STA.b $02
	LDA.w #DATA_D80000
	STA.b $06
	LDA.w #DATA_D80000>>16
	STA.b $08
	LDA.b $12
	CLC
	ADC.b $04
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	SEP.b #$20
	LDA.b [$0A]
	LDX.b $10
	STA.w $0000,X
	LDY.w #$0004
	LDA.b [$06],Y
	STA.w $0040,X
	LDY.w #$0008
	LDA.b [$06],Y
	STA.w $0080,X
	LDY.w #$000C
	LDA.b [$06],Y
	STA.w $00C0,X
	REP.b #$20
	TXA
	CLC
	ADC.w #$0100
	TAX
	STX.b $10
	LDY.b $0E
	INY
	STY.b $0E
label_C00E0F:
	CPY.w #$0010
	BCC.b label_C00DB0
	PLD
	RTS

;--------------------------------------------------------------------

label_C00E16:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFDE
	TCD
	PLA
	STX.b $04
	TAY
	STY.b $20
	LDA.w $436C
	BEQ.b label_C00E31
	LDX.b $04
	TYA
	JSL.l $EFDFC4
label_C00E31:
	LDA.w #$0100
	JSL.l label_C086DE
	STA.b $1E
	CLC
	ADC.w #$0080
	STA.b $1C
	LDY.b $20
	TYA
	DEC
	STA.b $20
	LDA.b $04
	LSR
	LSR
	AND.w #$000F
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$F000
	STA.b $1A
	LDA.b $20
	AND.w #$0003
	PHA
	LDA.b $04
	AND.w #$0003
	ASL
	ASL
	STA.b $02
	LDA.b $20
	LSR
	LSR
	AND.w #$000F
	ASL
	TAY
	LDA.b ($1A),Y
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	PLY
	STY.b $02
	CLC
	ADC.b $02
	TAY
	STY.b $18
	LDA.b $20
	AND.w #$003F
	TAX
	STX.b $16
	LDA.w #$0000
	STA.b $02
	STA.b $14
	BRA.b label_C00F04

label_C00E93:
	LDA.b $20
	AND.w #$0003
	BNE.b label_C00EB8
	LDA.b $04
	AND.w #$0003
	ASL
	ASL
	STA.b $02
	LDA.b $20
	LSR
	LSR
	AND.w #$000F
	ASL
	TAY
	LDA.b ($1A),Y
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAY
	STY.b $18
label_C00EB8:
	LDY.b $18
	TYA
	ASL
	TAX
	LDA.l $7F8000,X
	STA.b $12
	LDX.b $16
	TXA
	ASL
	TAY
	LDA.b $12
	STA.b ($1E),Y
	LDY.b $18
	INY
	STY.b $18
	LDA.b $12
	AND.w #$03FF
	CMP.w #$0180
	BCS.b label_C00EE4
	LDA.b $12
	ORA.w #$2000
	STA.b $12
	BRA.b label_C00EE6

label_C00EE4:
	STZ.b $12
label_C00EE6:
	TXA
	ASL
	TAY
	LDA.b $12
	STA.b ($1C),Y
	INX
	TXA
	AND.w #$003F
	TAX
	STX.b $16
	LDA.b $20
	INC
	STA.b $20
	LDA.b $14
	STA.b $02
	INC.b $02
	LDA.b $02
	STA.b $14
label_C00F04:
	LDA.b $02
	CMP.w #$0022
	BCS.b label_C00F10
	BEQ.b label_C00F10
	JMP.w label_C00E93

label_C00F10:
	LDA.b $04
	AND.w #$001F
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $02
	LDA.b $1E
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$3800
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.b $1E
	CLC
	ADC.w #$0040
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$3C00
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w $B4EF
	BNE.b label_C00FC9
	LDA.b $1C
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$5800
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.b $1C
	CLC
	ADC.w #$0040
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$5C00
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
label_C00FC9:
	PLD
	RTS

;--------------------------------------------------------------------

label_C00FCB:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFDE
	TCD
	PLA
	TXY
	STY.b $20
	STA.b $04
	LDA.w $436C
	BEQ.b label_C00FE6
	TYX
	LDA.b $04
	JSL.l label_EFE07C
label_C00FE6:
	LDA.w #$0080
	JSL.l label_C086DE
	STA.b $1E
	CLC
	ADC.w #$0040
	STA.b $1C
	LDY.b $20
	TYA
	DEC
	STA.b $20
	LDA.b $04
	LSR
	LSR
	AND.w #$000F
	ASL
	CLC
	ADC.w #$F000
	STA.b $1A
	LDA.b $04
	AND.w #$0003
	PHA
	LDA.b $20
	AND.w #$0003
	ASL
	ASL
	STA.b $02
	LDA.b $20
	LSR
	LSR
	AND.w #$000F
	ASL
	ASL
	ASL
	ASL
	ASL
	TAY
	LDA.b ($1A),Y
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	PLY
	STY.b $02
	CLC
	ADC.b $02
	TAY
	STY.b $18
	LDA.b $20
	AND.w #$001F
	TAX
	STX.b $16
	LDA.w #$0000
	STA.b $02
	STA.b $14
	BRA.b label_C010BC

label_C01048:
	LDA.b $20
	AND.w #$0003
	BNE.b label_C0106F
	LDA.b $04
	AND.w #$0003
	STA.b $02
	LDA.b $20
	LSR
	LSR
	AND.w #$000F
	ASL
	ASL
	ASL
	ASL
	ASL
	TAY
	LDA.b ($1A),Y
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAY
	STY.b $18
label_C0106F:
	TYA
	ASL
	TAX
	LDA.l $7F8000,X
	STA.b $12
	LDX.b $16
	TXA
	ASL
	TAY
	LDA.b $12
	STA.b ($1E),Y
	LDA.b $12
	AND.w #$03FF
	CMP.w #$0180
	BCS.b label_C01094
	LDA.b $12
	ORA.w #$2000
	STA.b $12
	BRA.b label_C01096

label_C01094:
	STZ.b $12
label_C01096:
	TXA
	ASL
	TAY
	LDA.b $12
	STA.b ($1C),Y
	LDY.b $18
	INY
	INY
	INY
	INY
	STY.b $18
	INX
	TXA
	AND.w #$001F
	TAX
	STX.b $16
	LDA.b $20
	INC
	STA.b $20
	LDA.b $14
	STA.b $02
	INC.b $02
	LDA.b $02
	STA.b $14
label_C010BC:
	LDA.b $02
	CMP.w #$001E
	BCS.b label_C010C8
	BEQ.b label_C010C8
	JMP.w label_C01048

label_C010C8:
	LDA.b $04
	AND.w #$003F
	STA.b $02
	CMP.w #$001F
	BEQ.b label_C010D6
	BCS.b label_C01128
label_C010D6:
	LDA.b $1E
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$3800
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$1B
	JSL.l label_C08616
	LDA.b $1C
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$5800
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$1B
	JSL.l label_C08616
	BRA.b label_C0117F

label_C01128:
	LDA.b $02
	AND.w #$001F
	STA.b $02
	LDA.b $1E
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$3C00
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$1B
	JSL.l label_C08616
	LDA.b $1C
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$5C00
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$1B
	JSL.l label_C08616
label_C0117F:
	PLD
	RTS

;--------------------------------------------------------------------

label_C01181:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STX.b $02
	LDA.w #$0040
	JSL.l label_C086DE
	TAY
	STY.b $12
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0040
	REP.b #$20
	TYA
	JSL.l label_C08EFC
	LDA.b $02
	AND.w #$001F
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $02
	LDY.b $12
	TYA
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$3800
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$3C00
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$5800
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$5C00
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	PLD
	RTS

;--------------------------------------------------------------------

label_C0122A:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STA.b $02
	LDA.w #$0040
	JSL.l label_C086DE
	TAY
	STY.b $12
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0040
	REP.b #$20
	TYA
	JSL.l label_C08EFC
	LDA.b $02
	AND.w #$003F
	STA.b $02
	CMP.w #$001F
	BEQ.b label_C0125C
	BCS.b label_C012A1
label_C0125C:
	LDY.b $12
	TYA
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$3800
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$1B
	JSL.l label_C08616
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$5800
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$1B
	JSL.l label_C08616
	BRA.b label_C012EB

label_C012A1:
	LDA.b $02
	AND.w #$001F
	STA.b $02
	LDY.b $12
	TYA
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$3C00
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$1B
	JSL.l label_C08616
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$5C00
	TAY
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$1B
	JSL.l label_C08616
label_C012EB:
	PLD
	RTS

;--------------------------------------------------------------------

org $C013F6
label_C013F6:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	STX.b $16
	STA.b $14
	JSL.l label_C02194
	LDA.b $14
	STA.w $4380
	STA.w $437C
	LDX.b $16
	STX.w $4382
	STX.w $437E
	LSR
	LSR
	LSR
	STA.b $02
	TXA
	LSR
	LSR
	LSR
	TAY
	STY.b $12
	TYA
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA.b $02
	LSR
	LSR
	LSR
	LSR
	LSR
	JSR.w label_C008C3
	LDA.w $B4EF
	BNE.b label_C0143D
	JSL.l label_C00013
label_C0143D:
	LDA.b $02
	SEC
	SBC.w #$0010
	STA.b $10
	LDY.b $12
	TYA
	SEC
	SBC.w #$000E
	STA.b $14
	LDA.b $02
	SEC
	SBC.w #$0020
	STA.b $04
	TYA
	SEC
	SBC.w #$0020
	STA.b $02
	STA.b $0E
	LDX.w #$0000
	BRA.b label_C01475

label_C01464:
	SEP.b #$20
	LDA.b #$FF
	STA.w $43C0,X
	STA.w $43B0,X
	STA.w $43A0,X
	STA.w $4390,X
	INX
label_C01475:
	CPX.w #$0010
	BCC.b label_C01464
	LDY.w #$0000
	STY.b $12
	BRA.b label_C01497

label_C01481:
	REP.b #$20
	LDA.b $0E
	STA.b $02
	STY.b $02
	CLC
	ADC.b $02
	TAX
	LDA.b $04
	JSR.w label_C00AC5
	LDY.b $12
	INY
	STY.b $12
label_C01497:
	CPY.w #$003C
	BCC.b label_C01481
	LDY.w #$0000
	STY.b $12
	BRA.b label_C014B9

label_C014A3:
	REP.b #$20
	LDA.b $0E
	STA.b $02
	STY.b $02
	CLC
	ADC.b $02
	TAX
	LDA.b $04
	JSR.w label_C00CF3
	LDY.b $12
	INY
	STY.b $12
label_C014B9:
	CPY.w #$003C
	BCC.b label_C014A3
label_C014BE:
	REP.b #$20
	LDA.w $0028
	AND.w #$00FF
	BNE.b label_C014BE
	LDA.w $B4EF
	BNE.b label_C014D4
	SEP.b #$20
	LDA.b #$17
	STA.w $001A
label_C014D4:
	REP.b #$20
	LDA.w $4A58
	BEQ.b label_C014E1
	LDA.w #$0001
	STA.w $4A58
label_C014E1:
	LDA.w $4380
	SEC
	SBC.w #$0080
	STA.w $0035
	STA.w $0031
	LDA.w $4382
	SEC
	SBC.w #$0070
	STA.w $0037
	STA.w $0033
	LDY.w #$FFFF
	STY.b $12
	BRA.b label_C0151C

label_C01502:
	TYA
	CLC
	ADC.b $14
	STA.b $02
	LDX.b $02
	LDA.b $10
	JSR.w label_C00E16
	LDX.b $02
	LDA.b $10
	JSL.l label_C0255C
	LDY.b $12
	INY
	STY.b $12
label_C0151C:
	CPY.w #$001F
	BNE.b label_C01502
	LDY.w #$FFF8
	STY.b $12
	BRA.b label_C0153C

label_C01528:
	TYA
	CLC
	ADC.b $14
	TAX
	LDA.b $10
	SEC
	SBC.w #$0008
	JSL.l label_C02A6B
	LDY.b $12
	INY
	STY.b $12
label_C0153C:
	CPY.w #$0028
	BNE.b label_C01528
	LDA.w $4A58
	BEQ.b label_C0154C
	LDA.w #$FFFF
	STA.w $4A58
label_C0154C:
	LDA.b $10
	STA.w $4374
	LDA.b $14
	STA.w $4376
	PLD
	RTL

;--------------------------------------------------------------------

label_C01558:
	REP #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	STX.b $14
	STA.b $12
	STA.w $0035
	LDA.b $12
	STA.w $0031
	LDA.b $14
	STA.w $0037
	LDA.b $14
	STA.w $0033
	LDA.b $12
	AND.w #$8000
	BEQ.b label_C0158B
	LDA.b $12
	LSR
	LSR
	LSR
	ORA.w #$E000
	STA.b $04
	BRA.b label_C01592

label_C0158B:
	LDA.b $12
	LSR
	LSR
	LSR
	STA.b $04
label_C01592:
	LDA.b $14
	AND.w #$8000
	BEQ.b label_C015A6
	LDA.b $14
	LSR
	LSR
	LSR
	ORA.w #$E000
	STA.b $02
	JMP.w label_C0165D

label_C015A6:
	LDA.b $14
	LSR
	LSR
	LSR
	STA.b $02
	JMP.w label_C0165D

label_C015B0:
	AND.w #$8000
	BEQ.b label_C0160C
	LDA.w $4374
	INC
	STA.b $10
	STA.w $4374
	LDA.b $02
	SEC
	SBC.w #$0010
	TAY
	STY.b $0E
	TYX
	LDA.b $10
	CLC
	ADC.w #$0029
	JSR.w label_C00BDC
	LDY.b $0E
	TYX
	LDA.w $4374
	CLC
	ADC.w #$0029
	JSR.w label_C00D7E
	LDX.b $02
	LDA.w $4374
	CLC
	ADC.w #$0020
	JSR.w label_C00FCB
	LDX.b $02
	DEX
	LDA.w $4374
	CLC
	ADC.w #$0022
	JSL.l label_C025CF
	LDA.b $02
	SEC
	SBC.w #$0008
	TAX
	LDA.w $4374
	CLC
	ADC.w #$0028
	JSL.l label_C02B55
	BRA.b label_C0165D

label_C0160C:
	LDA.w $4374
	DEC
	STA.b $0E
	STA.w $4374
	LDA.b $02
	SEC
	SBC.w #$0010
	TAY
	STY.b $10
	TYX
	LDA.b $0E
	SEC
	SBC.w #$0010
	JSR.w label_C00BDC
	LDY.b $10
	TYX
	LDA.w $4374
	SEC
	SBC.w #$0010
	JSR.w label_C00D7E
	LDX.b $02
	LDA.w $4374
	DEC
	JSR.w label_C00FCB
	LDX.b $02
	DEX
	LDA.w $4374
	DEC
	DEC
	DEC
	JSL.l label_C025CF
	LDA.b $02
	SEC
	SBC.w #$0008
	TAX
	LDA.w $4374
	SEC
	SBC.w #$0008
	JSL.l label_C02B55
label_C0165D:
	LDA.w $4374
	SEC
	SBC.b $04
	BEQ.b label_C01668
	JMP.w label_C015B0

label_C01668:
	JMP.w label_C0171A

label_C0166B:
	AND.w #$8000
	BEQ.b label_C016CA
	LDA.w $4376
	INC
	STA.b $10
	STA.w $4376
	LDA.b $04
	SEC
	SBC.w #$0010
	TAY
	STY.b $0E
	LDA.b $10
	CLC
	ADC.w #$0029
	TAX
	TYA
	JSR.w label_C00AC5
	LDA.w $4376
	CLC
	ADC.w #$0029
	TAX
	LDY.b $0E
	TYA
	JSR.w label_C00CF3
	LDA.w $4376
	CLC
	ADC.w #$001C
	TAX
	LDA.b $04
	JSR.w label_C00E16
	LDA.w $4376
	CLC
	ADC.w #$001D
	TAX
	LDA.b $04
	JSL.l label_C0255C
	LDA.w $4376
	CLC
	ADC.w #$0024
	TAX
	LDA.b $04
	SEC
	SBC.w #$0008
	JSL.l label_C02A6B
	BRA.b label_C0171A

label_C016CA:
	LDA.w $4376
	DEC
	STA.b $10
	STA.w $4376
	LDA.b $04
	SEC
	SBC.w #$0010
	TAY
	STY.b $0E
	LDA.b $10
	SEC
	SBC.w #$0010
	TAX
	TYA
	JSR.w label_C00AC5
	LDA.w $4376
	SEC
	SBC.w #$0010
	TAX
	LDY.b $0E
	TYA
	JSR.w label_C00CF3
	LDX.w $4376
	DEX
	LDA.b $04
	JSR.w label_C00E16
	LDX.w $4376
	DEX
	LDA.b $04
	JSL.l label_C0255C
	LDA.w $4376
	SEC
	SBC.w #$0008
	TAX
	LDA.b $04
	SEC
	SBC.w #$0008
	JSL.l label_C02A6B
label_C0171A:
	LDA.w $4376
	SEC
	SBC.b $02
	BEQ.b label_C01725
	JMP.w label_C0166B

label_C01725:
	LDA.b $12
	STA.w $4386
	LDA.b $14
	STA.w $4388
	PLD
	RTS

;--------------------------------------------------------------------

label_C01731:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STX.b $04
	TAY
	STY.b $10
	STY.w $0035
	STY.w $0031
	LDA.b $04
	STA.w $0037
	LDA.b $04
	STA.w $0033
	TYA
	AND.w #$8000
	BEQ.b label_C01761
	TYA
	LSR
	LSR
	LSR
	ORA.w #$E000
	STA.b $0E
	BRA.b label_C01767

label_C01761:
	TYA
	LSR
	LSR
	LSR
	STA.b $0E
label_C01767:
	LDA.b $04
	AND.w #$8000
	BEQ.b label_C0177A
	LDA.b $04
	LSR
	LSR
	LSR
	ORA.w #$E000
	STA.b $02
	BRA.b label_C017A7

label_C0177A:
	LDA.b $04
	LSR
	LSR
	LSR
	STA.b $02
	BRA.b label_C017A7

label_C01783:
	AND.w #$8000
	BEQ.b label_C0179A
	LDA.w $4374
	INC
	STA.w $4374
	LDX.b $02
	CLC
	ADC.w #$0020
	JSR.w label_C0122A
	BRA.b label_C017A7

label_C0179A:
	LDA.w $4374
	DEC
	STA.w $4374
	LDX.b $02
	DEC
	JSR.w label_C0122A
label_C017A7:
	LDA.w $4374
	SEC
	SBC.b $0E
	BNE.b label_C01783
	BRA.b label_C017D6

label_C017B1:
	AND.w #$8000
	BEQ.b label_C017C9
	LDA.w $4376
	INC
	STA.w $4376
	CLC
	ADC.w #$001C
	TAX
	LDA.b $0E
	JSR.w label_C01181
	BRA.b label_C017D6

label_C017C9:
	LDX.w $4376
	DEX
	STX.w $4376
	DEX
	LDA.b $0E
	JSR.w label_C01181
label_C017D6:
	LDA.w $4376
	SEC
	SBC.b $02
	BNE.b label_C017B1
	LDY.b $10
	STY.w $4386
	LDA.b $04
	STA.w $4388
	PLD
	RTL

;--------------------------------------------------------------------

org $C018F3
label_C018F3:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w #$FFFF
	STA.w $4370
	STA.w $436E
	LDA.w $4380
	AND.w #$FFF8
	STA.w $4380
	LDA.w $4382
	AND.w #$FFF8
	STA.w $4382
	JSL.l label_C08726
	LDA.w #$FFFF
	STA.w $5DD4
	LDA.w #$9877
	STA.b $04
	LDA.w #$987B
	STA.b $02
	LDX.b $02
	LDA.w $0000,X
	TAX
	STX.b $10
	LDX.b $04
	LDA.w $0000,X
	LDX.b $10
	JSL.l label_C068F4
	LDA.w #$0009
	JSL.l label_C08D79
	LDY.w #$0000
	LDX.w #$3800
	LDA.w #$0001
	JSL.l label_C08D9E
	LDY.w #$2000
	LDX.w #$5800
	LDA.w #$0001
	JSL.l label_C08DDE
	LDY.w #$6000
	LDX.w #$7C00
	LDA.w #$0000
	JSL.l label_C08E1C
	LDA.w #$0062
	JSL.l label_C08D92
	LDX.b $02
	LDA.w $0000,X
	TAX
	STX.b $0E
	LDX.b $04
	LDA.w $0000,X
	LDX.b $0E
	JSL.l $C012ED
	LDA.w $9883
	CMP.w #$0003
	BNE.b label_C01996
	LDA.w #$0052
	JSL.l label_C4FBBD
	BRA.b label_C0199A

label_C01996:
	JSL.l label_C069AF
label_C0199A:
	SEP.b #$20
	LDA.b #$17
	STA.w $001A
	REP.b #$20
	LDA.w $436C
	BEQ.b label_C019AC
	JSL.l $EFD9F3
label_C019AC:
	JSL.l label_C08744
	PLD
	RTL

;--------------------------------------------------------------------

org $C01A69
label_C01A69:
	REP.b #$31
	LDY.w #$0000
	BRA.b label_C01A80

label_C01A70:
	TYA
	ASL
	TAX
	STZ.w $2B32,X
	LDA.w #$FFFF
	STA.w $289E,X
	STA.w $2C9A,X
	INY

label_C01A80:
	CPY.w #$001E
	BCC.b label_C01A70
	RTL

;--------------------------------------------------------------------

label_C01A86:
	REP.b #$31
	LDX.w #$0000
	BRA.b label_C01A95

label_C01A8D:
	SEP.b #$20
	LDA.b #$FF
	STA.w $467E,X
	INX

label_C01A95:
	CPX.w #$0380
	BCC.b label_C01A8D
	REP.b #$20
	RTL

;--------------------------------------------------------------------

label_C01A9D:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $02
	LDX.w #$0000
	STX.b $10
	LDA.b $02
	STA.w $4A6A
	BRA.b label_C01AC8

label_C01AB5:
	LDA.w $4682,X
	AND.w #$00FF
	CMP.w #$00FF
	BEQ.b label_C01AD2
	TXA
	CLC
	ADC.w #$0005
	TAX
	STX.b $10
label_C01AC8:
	CPX.w #$0380
	BCC.b label_C01AB5
	LDA.w #$FF01
	BRA.b label_C01B13

label_C01AD2:
	TXA
	CLC
	ADC.b $02
	CMP.w #$0380
	BCS.b label_C01B10
	TXA
	STA.b $0E
	BRA.b label_C01AFF

label_C01AE0:
	TAX
	LDA.w $4682,X
	AND.w #$00FF
	CMP.w #$00FF
	BEQ.b label_C01AF7
	LDA.b $0E
	CLC
	ADC.w #$0005
	TAX
	STX.b $10
	BRA.b label_C01AC8

label_C01AF7:
	LDA.b $0E
	CLC
	ADC.w #$0005
	STA.b $0E
label_C01AFF:
	LDX.b $10
	TXA
	CLC
	ADC.b $02
	STA.b $04
	LDA.b $0E
	CMP.b $04
	BCC.b label_C01AE0
	TXA
	BRA.b label_C01B13

label_C01B10:
	LDA.w #$FF02
label_C01B13:
	PLD
	RTL

;--------------------------------------------------------------------

label_C01B15:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	CMP.w #$467E
	BCC.b label_C01B94
	CMP.w #$49FE
	BEQ.b label_C01B2B
	BCS.b label_C01B94
label_C01B2B:
	SEC
	SBC.w #$467E
	STA.b $10
	LDA.w #$0000
	STA.b $02
	BRA.b label_C01B8D

label_C01B38:
	LDA.b $10
	CLC
	ADC.w #$4682
	TAX
	STX.b $0E
	LDA.w $0000,X
	AND.w #$00FF
	TAY
	LDA.b $10
	TAX
	SEP.b #$20
	LDA.b #$FF
	STA.w $467E,X
	REP.b #$20
	LDA.b $10
	TAX
	SEP.b #$20
	LDA.b #$FF
	STA.w $467F,X
	REP.b #$20
	LDA.b $10
	TAX
	SEP.b #$20
	LDA.b #$FF
	STA.w $4680,X
	REP.b #$20
	LDA.b $10
	TAX
	SEP.b #$20
	LDA.b #$FF
	STA.w $4681,X
	LDX.b $0E
	STA.w $0000,X
	REP.b #$20
	LDA.b $10
	CLC
	ADC.w #$0005
	STA.b $10
	TYA
	AND.w #$0080
	BEQ.b label_C01B38
	INC.b $02
label_C01B8D:
	LDA.b $02
	CMP.w #$0002
	BCC.b label_C01B38
label_C01B94:
	PLD
	RTL

;--------------------------------------------------------------------

label_C01B96:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STX.b $04
	STA.b $02
	STA.b $12
	LDY.w #$0000
	BRA.b label_C01BF9

label_C01BAB:
	LDA.w #$0000
	STA.b $10
	BRA.b label_C01BC6

label_C01BB2:
	STA.b $02
	TYA
	CLC
	ADC.b $02
	TAX
	LDA.w $4A00,X
	AND.w #$00FF
	BNE.b label_C01BF7
	LDA.b $10
	INC
	STA.b $10
label_C01BC6:
	LDX.b $12
	STX.b $02
	CMP.b $02
	BCC.b label_C01BB2
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C01BEC

label_C01BD5:
	STA.b $02
	TYA
	CLC
	ADC.b $02
	TAX
	LDA.b $04
	SEP.b #$20
	ORA.b #$80
	STA.w $4A00,X
	REP.b #$20
	LDA.b $0E
	INC
	STA.b $0E
label_C01BEC:
	LDX.b $12
	STX.b $02
	CMP.b $02
	BCC.b label_C01BD5
	TYA
	BRA.b label_C01C0F

label_C01BF7:
	TXY
	INY
label_C01BF9:
	LDA.b $12
	STA.b $02
	LDA.w #$0058
	SEC
	SBC.b $02
	STA.b $02
	TYA
	CMP.b $02
	BCC.b label_C01BAB
	BEQ.b label_C01BAB
	LDA.w #$FF03
label_C01C0F:
	PLD
	RTL

;--------------------------------------------------------------------

label_C01C11:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TXY
	STA.b $0E
	LDX.w #$0000
	BRA.b label_C01C49

label_C01C23:
	REP.b #$20
	LDA.b $0E
	REP.b #$20
	AND.w #$00FF
	ORA.w #$0080
	STA.b $02
	LDA.w $4A00,X
	AND.w #$00FF
	CMP.b $02
	BEQ.b label_C01C42
	LDA.b $0E
	CMP.w #$8000
	BNE.b label_C01C48
label_C01C42:
	TYA
	SEP.b #$20
	STA.w $4A00,X
label_C01C48:
	INX
label_C01C49:
	CPX.w #$0058
	BCC.b label_C01C23
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C01C52:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE2
	TCD
	PLA
	STY.b $1C
	STX.b $1A
	STA.b $04
	INC
	AND.w #$FFFE
	STA.b $02
	LDA.b $1A
	INC
	AND.w #$FFFE
	STA.b $18
	LDY.b $18
	LDA.b $02
	JSL.l label_C09032
	LSR
	LSR
	STA.b $16
	LDY.b $1C
	TYX
	LDA.b $16
	JSL.l label_C01B96
	STA.b $14
	CMP.w #$7FFF
	BCC.b label_C01C93
	BEQ.b label_C01C93
	LDA.b $14
	JMP.w label_C01D36

label_C01C93:
	LDA.b $02
	CMP.b $04
	BNE.b label_C01CA2
	LDA.b $18
	CMP.b $1A
	BNE.b label_C01CA2
	JMP.w label_C01D34

label_C01CA2:
	LDA.b $14
	STA.b $04
	BRA.b label_C01D20

label_C01CA8:
	LDA.b $04
	CLC
	ADC.w #$0008
	AND.w #$00F8
	SEC
	SBC.b $04
	STA.b $18
	LDA.b $12
	SEC
	SBC.b $04
	CMP.b $18
	BCS.b label_C01CC1
	STA.b $18
label_C01CC1:
	LDA.b $18
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $02
	LDA.w #DATA_C40BE8
	STA.b $06
	LDA.w #DATA_C40BE8>>16
	STA.b $08
	LDA.w #DATA_C42F8C
	STA.b $0A
	LDA.w #DATA_C42F8C>>16
	STA.b $0C
	LDA.b $04
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b [$0A]
	CLC
	ADC.w #$4000
	TAY
	LDX.b $02
	SEP.b #$20
	LDA.b #$03
	JSL.l label_C08616
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b [$0A]
	CLC
	ADC.w #$4100
	TAY
	LDX.b $02
	SEP.b #$20
	LDA.b #$03
	JSL.l label_C08616
	LDA.b $04
	CLC
	ADC.b $18
	STA.b $04
label_C01D20:
	LDA.b $14
	CLC
	ADC.b $16
	STA.b $12
	STA.b $02
	LDA.b $04
	CMP.b $02
	BCS.b label_C01D34
	BEQ.b label_C01D34
	JMP.w label_C01CA8

label_C01D34:
	LDA.b $14
label_C01D36:
	PLD
	RTL

;--------------------------------------------------------------------

label_C01D38:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	STY.b $18
	STX.b $04
	TAX
	LDA.b $28
	STA.b $06
	LDA.b $2A
	STA.b $08
	LDA.b [$06]
	AND.w #$00FF
	STA.b $02
	STA.b $16
	INC.b $06
	INC.b $06
	LDY.w #$0000
	STY.b $14
	JMP.w label_C01DE1

label_C01D64:
	LDA.w #$0000
	STA.b $12
	BRA.b label_C01DD4

label_C01D6B:
	SEP.b #$20
	LDA.b [$06]
	STA.w $467E,X
	INX
	STX.b $10
	REP.b #$20
	LDA.b $12
	STA.b $02
	LDA.b $04
	CLC
	ADC.b $02
	ASL
	TAX
	LDA.l DATA_C4303C,X
	STA.b $0E
	SEP.b #$20
	LDX.b $10
	STA.w $467E,X
	INX
	REP.b #$20
	LDA.b $0E
	XBA
	AND.w #$00FF
	SEP.b #$20
	STA.b $00
	REP.b #$20
	LDA.b $18
	SEP.b #$20
	STA.b $01
	LDY.w #$0002
	LDA.b [$06],Y
	AND.b #$FE
	ORA.b $01
	ORA.b $00
	STA.w $467E,X
	INX
	LDY.w #$0003
	LDA.b [$06],Y
	STA.w $467E,X
	INX
	LDY.w #$0004
	LDA.b [$06],Y
	STA.w $467E,X
	INX
	REP.b #$20
	LDA.w #$0005
	CLC
	ADC.b $06
	STA.b $06
	LDA.b $12
	INC
	STA.b $12
label_C01DD4:
	LDY.b $16
	STY.b $02
	CMP.b $02
	BCC.b label_C01D6B
	LDY.b $14
	INY
	STY.b $14
label_C01DE1:
	CPY.w #$0002
	BCS.b label_C01DEB
	BEQ.b label_C01DEB
	JMP.w label_C01D64

label_C01DEB:
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to the name entry screen character sprites

label_C01DED:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	LDA.w #DATA_EF133F
	STA.b $0A
	LDA.w #DATA_EF133F>>16
	STA.b $0C
	LDA.b $0E
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	SEP.b #$20
	LDY.w #$0001
	LDA.b [$06],Y
	LSR
	LSR
	LSR
	LSR
	REP.b #$20
	AND.w #$00FF
	STA.w $467A
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b [$0A]
	AND.w #$00FF
	STA.w $467C
	SEP.b #$20
	LDY.w #$0002
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	PLD
	RTS

label_C01E49:							; Note: Main entry
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFCF
	TCD
	PLA
	STY.b $04
	PHA
	LDA.b $04
	STA.b $2F
	PLA
	STX.b $2D
	STA.b $2B
	LDY.b $41
	STY.b $29
	LDX.b $3F
	STX.b $27
	LDA.w $436C
	BEQ.b label_C01E79
	LDA.b $2B
	CMP.w #$FFFF
	BNE.b label_C01E79
	LDA.w #$0000
	JMP.w label_C020EF

label_C01E79:
	LDA.w #DATA_EF133F
	STA.b $0A
	LDA.w #DATA_EF133F>>16
	STA.b $0C
	LDA.b $2B
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $23
	LDA.b $08
	STA.b $25
	LDA.b $2B
	JSR.w label_C01DED
	STA.b $02
	LDY.b $04
	LDX.w $467C
	LDA.w $467A
	JSL.l label_C01C52
	STA.b $21
label_C01EB5:
	LDA.b $21
	CMP.w #$7FFF
	BEQ.b label_C01EBE
	BCS.b label_C01EB5
label_C01EBE:
	LDA.w #DATA_C42B0D
	STA.b $06
	LDA.w #DATA_C42B0D>>16
	STA.b $08
	LDA.b $02
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $0A
	STY.b $0C
	LDA.b [$0A]
	AND.w #$00FF
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	JSL.l label_C01A9D
	STA.b $1F
label_C01EEF:
	LDA.b $1F
	CMP.w #$7FFF
	BEQ.b label_C01EF8
	BCS.b label_C01EEF
label_C01EF8:
	LDA.w #$0001
	STA.w $0A4A
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $23
	STA.b $06
	LDA.b $25
	STA.b $08
	SEP.b #$20
	LDY.w #$0003
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	TAY
	LDX.b $21
	LDA.b $1F
	JSR.w label_C01D38
	LDA.b $2F
	STA.b $04
	CMP.w #$FFFF
	BEQ.b label_C01F4C
	LDA.b $04
	STA.w $0A4C
	LDA.b $04
	INC
	STA.w $0A4E
	LDY.b $29
	LDX.b $27
	LDA.b $2D
	JSL.l label_C09321
	STA.b $02
	BRA.b label_C01F6C

label_C01F4C:
	STZ.w $0A4C
	LDA.w #$0016
	STA.w $0A4E
	LDY.b $29
	LDX.b $27
	LDA.b $2D
	JSL.l label_C09321
	STA.b $02
	ORA.w #$0080
	TAX
	LDA.w #$FFFF
	JSL.l label_C01C11
label_C01F6C:
	LDA.b $02
	ASL
	TAY
	STY.b $1D
	LDA.b $1F
	CLC
	ADC.w #$467E
	STA.w $112E,Y
	LDA.w #$007E
	STA.w $116A,Y
	LDA.b [$0A]
	AND.w #$00FF
	STA.b $04
	ASL
	ASL
	ADC.b $04
	STA.w $2916,Y
	LDA.b $21
	STA.w $2952,Y
	TYA
	CLC
	ADC.w #$298E
	TAX
	STX.b $1B
	LDA.b $21
	ASL
	TAX
	LDA.l DATA_C42F8C,X
	CLC
	ADC.w #$4000
	LDX.b $1B
	STA.w $0000,X
	SEP.b #$20
	LDY.w #$0001
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	ASL
	LDY.b $1D
	STA.w $2A7E,Y
	LDA.b [$06]
	AND.w #$00FF
	STA.w $2ABA,Y
	LDA.b $23
	STA.b $06
	LDA.b $25
	STA.b $08
	SEP.b #$20
	LDY.w #$0008
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	LDY.b $1D
	STA.w $2A42,Y
	LDA.w #DATA_EF133F
	STA.b $06
	LDA.w #DATA_EF133F>>16
	STA.b $08
	LDA.b $2B
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.b $2B
	LDY.b $1D
	STA.w $2CD6,Y
	LDA.b $14
	STA.w $2A06,Y
	LDA.b $12
	CLC
	ADC.w #$0009
	STA.w $29CA,Y
	LDA.w $467C
	AND.w #$0001
	BEQ.b label_C0202E
	LDA.w $0000,X
	CLC
	ADC.w #$0100
	STA.w $0000,X
label_C0202E:
	LDA.b $02
	ASL
	TAX
	STX.b $1B
	LDA.b $23
	STA.b $06
	LDA.b $25
	STA.b $08
	INC.b $06
	INC.b $06
	LDA.b $06
	STA.b $17
	LDA.b $08
	STA.b $19
	LDA.b [$17]
	AND.w #$00FF
	STA.w $2B6E,X
	LDA.b $23
	STA.b $06
	LDA.b $25
	STA.b $08
	SEP.b #$20
	LDY.w #$0004
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	STA.w $3366,X
	SEP.b #$20
	LDY.w #$0005
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	STA.w $33A2,X
	SEP.b #$20
	LDY.w #$0006
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	STA.w $33DE,X
	SEP.b #$20
	LDY.w #$0007
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	STA.w $1A4A,X
	LDA.b [$17]
	AND.w #$00FF
	ASL
	TAX
	LDA.l DATA_C42AEB,X
	LDX.b $1B
	STA.w $332A,X
	SEP.b #$20
	LDY.w #$0001
	LDA.b [$0A],Y
	STA.b $16
	STA.b $00
	LDA.b [$0A]
	SEC
	SBC.b $00
	REP.b #$20
	AND.w #$00FF
	STA.b $04
	LDA.b $16
	AND.w #$00FF
	XBA
	AND.w #$FF00
	ORA.b $04
	STA.w $2BE6,X
	LDA.w #$FFFF
	STA.w $2D4E,X
	STA.w $2D12,X
	STA.w $2C9A,X
	STA.w $289E,X
	STZ.w $2BAA,X
	STZ.w $2DC6,X
	STZ.w $2D8A,X
	STZ.w $2C5E,X
	STZ.w $2B32,X
	STZ.w $2AF6,X
	STZ.w $28DA,X
	LDA.b $02
label_C020EF:
	PLD
	RTL

;--------------------------------------------------------------------

label_C020F1:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w $1A42
	STA.b $02
	ASL
	TAY
	STY.b $0E
	LDA.w $112E,Y
	JSL.l label_C01B15
	LDX.w #$0000
	LDA.b $02
	JSL.l label_C01C11
	LDY.b $0E
	LDA.w $2C9A,Y
	AND.w #$F000
	CMP.w #$8000
	BNE.b label_C02122
	DEC.w $4A5C
label_C02122:
	LDA.b $02
	ASL
	TAX
	LDA.w $2D12,X
	CMP.w #$00E1
	BNE.b label_C02131
	STZ.w $4A60
label_C02131:
	LDA.b $02
	ASL
	TAX
	LDA.w #$FFFF
	STA.w $2CD6,X
	STA.w $2C9A,X
	PLD
	RTL

;--------------------------------------------------------------------

label_C02140:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $02
	ASL
	TAY
	STY.b $0E
	LDA.w $112E,Y
	JSL.l label_C01B15
	LDX.w #$0000
	LDA.b $02
	JSL.l label_C01C11
	LDY.b $0E
	LDA.w $2C9A,Y
	AND.w #$F000
	CMP.w #$8000
	BNE.b label_C02170
	DEC.w $4A5C
label_C02170:
	LDA.b $02
	ASL
	TAX
	LDA.w $2D12,X
	CMP.w #$00E1
	BNE.b label_C0217F
	STZ.w $4A60
label_C0217F:
	LDA.b $02
	ASL
	TAX
	LDA.w #$FFFF
	STA.w $2CD6,X
	STA.w $2C9A,X
	LDA.b $02
	JSL.l label_C09C35
	PLD
	RTL

;--------------------------------------------------------------------

label_C02194:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	STZ.w $4A60
	STZ.w $4A68
	STZ.w $4A5C
	LDX.w #$0000
	STX.b $10
	BRA label_C021C6

label_C021AC:
	TXA
	ASL
	TAX
	LDA.w $0A62,X
	INC
	CMP.w #$0006
	BCC.b label_C021C1
	BEQ.b label_C021C1
	LDX.b $10
	TXA
	JSL.l label_C02140
label_C021C1:
	LDX.b $10
	INX
	STX.b $10
label_C021C6:
	CPX.w #$001E
	BNE.b label_C021AC
	LDA.w #$0000
	STA.b $0E
	BRA label_C021DF

label_C021D2:
	ASL
	TAX
	LDA.w #$FFFF
	STA.w $289E,X
	LDA.b $0E
	INC
	STA.b $0E
label_C021DF:
	CMP.w #$001E
	BCC.b label_C021D2
	PLD
	RTL

;--------------------------------------------------------------------

label_C021E6:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	STZ.w $4A60
	STZ.w $4A68
	STZ.w $4A5C
	LDX.w #$0000
	STX.b $0E
	BRA.b label_C0221D

label_C021FE:
	TXA
	ASL
	TAX
	LDA.w $0A62,X
	INC
	CMP.w #$0002
	BCC.b label_C02218
	BEQ.b label_C02218
	LDX.b $0E
	CPX.w #$0017
	BEQ.b label_C02218
	TXA
	JSL.l label_C02140
label_C02218:
	LDX.b $0E
	INX
	STX.b $0E
label_C0221D:
	CPX.w #$001E
	BNE.b label_C021FE
	LDA.w #$0017
	JSL.l label_C09C35
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Routine that spawns in sprites/NPCs.

label_C0222B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFD6
	TCD
	PLA
	STX.b $28
	STA.b $04
	STA.b $26
	LDA.b $04
	CMP.w #$0020
	BCC.b label_C02245
	JMP.w label_C0255A

label_C02245:
	LDA.b $28
	CMP.w #$0028
	BCC.b label_C0224F
	JMP.w label_C0255A

label_C0224F:
	LDA.b $04
	ASL
	STA.b $02
	LDA.b $28
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.l DATA_CF61E7,X
	BNE.b label_C02269
	JMP.w label_C0255A

label_C02269:
	STA.b $06
	STZ.b $08
	CLC
	LDA.b $06
	ADC.w #$0000
	STA.b $06
	LDA.b $08
	ADC.w #DATA_CF61E7>>16
	STA.b $08
	LDA.b [$06]
	STA.b $24
	INC.b $06
	INC.b $06
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	STZ.b $22
	JMP.w label_C02551

label_C02291:
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b [$06]
	STA.b $20
	SEP.b #$20
	LDY.w #$0003
	LDA.b [$0A],Y
	REP.b #$20
	AND.w #$00FF
	TAX
	STX.b $1E
	SEP.b #$20
	LDY.w #$0002
	LDA.b [$0A],Y
	REP.b #$20
	AND.w #$00FF
	TAY
	STY.b $1C
	LDA.w #$0004
	CLC
	ADC.b $0A
	STA.b $0A
	TXA
	LSR
	LSR
	LSR
	STA.b $02
	LDA.b $26
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	STA.b $1A
	TYA
	LSR
	LSR
	LSR
	STA.b $02
	LDA.b $28
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	STA.b $02
	LDA.b $1A
	LSR
	LSR
	LSR
	LSR
	LSR
	PHA
	LDA.b $02
	LSR
	LSR
	LSR
	LSR
	ASL
	ASL
	ASL
	ASL
	ASL
	PLY
	STY.b $02
	CLC
	ADC.b $02
	TAX
	LDA.l DATA_D7A800,X
	AND.w #$00FF
	LSR
	LSR
	LSR
	CMP.w $436E
	BEQ.b label_C02315
	JMP.w label_C0254F

label_C02315:
	LDA.b $20
	JSL.l label_C0A21C
	CMP.w #$0000
	BEQ.b label_C02323
	JMP.w label_C0254F

label_C02323:
	LDX.b $1E
	STX.b $02
	LDA.b $04
	XBA
	AND.w #$FF00
	CLC
	ADC.b $02
	STA.b $02
	STA.b $18
	LDY.b $1C
	STY.b $02
	LDA.b $28
	XBA
	AND.w #$FF00
	CLC
	ADC.b $02
	TAY
	STY.b $16
	LDA.b $18
	STA.b $02
	SEC
	SBC.w $0031
	STA.b $1A
	TYA
	SEC
	SBC.w $0033
	TAX
	LDA.w $436C
	BEQ.b label_C0237A
	LDA.w $0065
	AND.w #$0030
	BNE.b label_C02367
	LDA.w $4A58
	DEC
	BEQ.b label_C02391
label_C02367:
	LDA.b $1A
	CMP.w #$0100
	BCS.b label_C02391
	CPX.w #$00E0
	BCS.b label_C02378
	BEQ.b label_C02378
	JMP.w label_C0254F

label_C02378:
	BRA.b label_C02391

label_C0237A:
	LDA.w $4A58
	DEC
	BEQ.b label_C02391
	LDA.b $1A
	CMP.w #$0100
	BCS.b label_C02391
	CPX.w #$00E0
	BCS.b label_C02391
	BEQ.b label_C02391
	JMP.w label_C0254F

label_C02391:
	LDA.b $1A
	STA.b $02
	LDA.w #$FFC0
	CLC
	SBC.b $02
	BVS.b label_C023A2
	BMI.b label_C023A7
	JMP.w label_C0254F

label_C023A2:
	BPL.b label_C023A7
	JMP.w label_C0254F

label_C023A7:
	LDA.b $1A
	STA.b $02
	LDA.w #$0140
	CLC
	SBC.b $02
	BVC.b label_C023B8
	BMI.b label_C023BD
	JMP.w label_C0254F

label_C023B8:
	BPL.b label_C023BD
	JMP.w label_C0254F

label_C023BD:
	STX.b $02
	LDA.w #$FFC0
	CLC
	SBC.b $02
	BVS.b label_C023CC
	BMI.b label_C023D1
	JMP.w label_C0254F

label_C023CC:
	BPL.b label_C023D1
	JMP.w label_C0254F

label_C023D1:
	STX.b $02
	LDA.w #$0140
	CLC
	SBC.b $02
	BVC.b label_C023E0
	BMI.b label_C023E5
	JMP.w label_C0254F

label_C023E0:
	BPL.b label_C023E5
	JMP.w label_C0254F

label_C023E5:
	LDA.w #DATA_CF8985
	STA.b $06
	LDA.w #DATA_CF8985>>16
	STA.b $08
	LDA.b $20
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	CLC
	ADC.b $06
	STA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDX.w #$FFFF
	STX.b $1A
	LDA.w $B4EF
	BEQ.b label_C02411
	JMP.w label_C024FB

label_C02411:
	LDA.w $436C
	BEQ.b label_C0244A
	SEP.b #$20
	LDY.w #$0008
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	STA.b $1C
	BEQ.b label_C02473
	JSL.l label_EFE6CF
	CMP.w #$0000
	BEQ.b label_C02473
	LDY.w #$0006
	LDA.b [$06],Y
	JSL.l label_C21628
	STA.b $02
	LDA.b $1C
	DEC
	DEC
	EOR.b $02
	AND.w #$0001
	BNE.b label_C02448
	JMP.w label_C0254F

label_C02448:
	BRA.b label_C02473

label_C0244A:
	SEP.b #$20
	LDY.w #$0008
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	STA.b $1E
	BEQ.b label_C02473
	LDY.w #$0006
	LDA.b [$06],Y
	JSL.l label_C21628
	STA.b $02
	LDA.b $1E
	DEC
	DEC
	EOR.b $02
	AND.w #$0001
	BNE.b label_C02473
	JMP.w label_C0254F

label_C02473:
	LDA.w $436C
	BEQ.b label_C024BF
	LDA.w $4A66
	BEQ.b label_C0248A
	LDA.b [$06]
	AND.w #$00FF
	CMP.w #$0003
	BEQ.b label_C0248A
	JMP.w label_C02529

label_C0248A:
	LDA.b $12
	STA.b $06
	LDA.b $14
	STA.b $08
	LDY.w #$0004
	LDA.b [$06],Y
	JSL.l label_EFE6E2
	STA.b $1E
	LDA.b $18
	STA.b $02
	STA.b $0E
	LDY.b $16
	STY.b $10
	LDY.w #$FFFF
	STY.b $1A
	LDA.b $1E
	TAX
	LDY.w #$0001
	LDA.b [$06],Y
	LDY.b $1A
	JSL.l label_C01E49
	TAX
	STX.b $1A
	BRA.b label_C02529

label_C024BF:
	LDA.w $4A66
	BEQ.b label_C024CE
	LDA.b [$06]
	AND.w #$00FF
	CMP.w #$0003
	BNE.b label_C02529
label_C024CE:
	LDA.b $18
	STA.b $02
	STA.b $0E
	LDY.b $16
	STY.b $10
	LDY.w #$FFFF
	STY.b $1C
	LDA.b $12
	STA.b $06
	LDA.b $14
	STA.b $08
	LDY.w #$0004
	LDA.b [$06],Y
	TAX
	LDY.w #$0001
	LDA.b [$06],Y
	LDY.b $1C
	JSL.l label_C01E49
	TAX
	STX.b $1A
	BRA.b label_C02529

label_C024FB:
	SEP.b #$20
	LDY.w #$0008
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	BNE.b label_C02529
	LDA.b $18
	STA.b $02
	STA.b $0E
	LDY.b $16
	STY.b $10
	LDY.w #$FFFF
	STY.b $1A
	LDX.w #$031F
	LDY.w #$0001
	LDA.b [$06],Y
	LDY.b $1A
	JSL.l label_C01E49
	TAX
	STX.b $1A
label_C02529:
	LDX.b $1A
	CPX.w #$FFFF
	BEQ.b label_C0254F
	TXA
	ASL
	TAX
	LDA.b $12
	STA.b $06
	LDA.b $14
	STA.b $08
	SEP.b #$20
	LDY.w #$0003
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	STA.w $2AF6,X
	LDA.b $20
	STA.w $2C9A,X
label_C0254F:
	INC.b $22
label_C02551:
	LDA.b $22
	CMP.b $24
	BEQ.b label_C0255A
	JMP.w label_C02291

label_C0255A:
	PLD
	RTL

;--------------------------------------------------------------------

label_C0255C:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	STA.b $04
	LDA.w #$8000
	STA.b $14
	LDA.w $4A58
	BEQ.b label_C025CD
	LDY.b $12
	CPY.w #$8000
	BCS.b label_C025CD
	TXA
	LSR
	LSR
	LSR
	LSR
	LSR
	STA.b $10
	LDA.b $04
	DEC
	DEC
	STA.b $02
	STA.b $0E
	BRA.b label_C025BD

label_C0258B:
	LDA.b $0E
	STA.b $02
	CMP.w #$8000
	BCS.b label_C025B3
	LDA.b $02
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	STY.b $12
	LDA.b $14
	STA.b $02
	TYA
	CMP.b $02
	BEQ.b label_C025B3
	LDX.b $10
	TYA
	JSL.l label_C0222B
	LDY.b $12
	TYA
	STA.b $14
label_C025B3:
	LDA.b $0E
	STA.b $02
	INC.b $02
	LDA.b $02
	STA.b $0E
label_C025BD:
	LDA.b $04
	CLC
	ADC.w #$0024
	PHA
	LDA.b $02
	PLY
	STY.b $02
	CMP.b $02
	BNE.b label_C0258B
label_C025CD:
	PLD
	RTL

;--------------------------------------------------------------------

label_C025CF:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STX.b $04
	STA.b $12
	LDX.w #$8000
	LDA.w $4A58
	BEQ.b label_C0263B
	LDY.b $10
	CPY.w #$8000
	BCS.b label_C0263B
	LDA.b $12
	LSR
	LSR
	LSR
	LSR
	LSR
	STA.b $0E
	LDA.b $04
	STA.b $02
	STA.b $10
	BRA.b label_C0262B

label_C025FD:
	LDA.b $10
	STA.b $02
	CMP.w #$8000
	BCS.b label_C02621
	LDA.b $02
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	STY.b $12
	STX.b $02
	TYA
	CMP.b $02
	BEQ.b label_C02621
	TYX
	LDA.b $0E
	JSL.l label_C0222B
	LDY.b $12
	TYX
label_C02621:
	LDA.b $10
	STA.b $02
	INC.b $02
	LDA.b $02
	STA.b $10
label_C0262B:
	LDA.b $04
	CLC
	ADC.w #$0020
	PHA
	LDA.b $02
	PLY
	STY.b $02
	CMP.b $02
	BNE.b label_C025FD
label_C0263B:
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to enemy placement?

label_C0263D:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF2
	TCD
	PLA
	CMP.w #$0080
	BCS.b label_C02663
	CPX.w #$00A0
	BCS.b label_C02663
	ASL
	STA.b $02
	TXA
	XBA
	AND.w #$FF00
	CLC
	ADC.b $02
	TAX
	LDA.l EB_EnemyPlacementData,X
	BRA.b label_C02666

label_C02663:
	LDA.w #$0000
label_C02666:
	PLD
	RTL

;--------------------------------------------------------------------

label_C02668:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFCE
	TCD
	PLA
	STY.b $30
	STX.b $2E
	STA.b $2C
	LDA.w $436C
	BEQ.b label_C0269E
	JSL.l label_EFE759
	CMP.w #$0000
	BEQ.b label_C0269E
	JSL.l label_C08E9A
	CMP.w #$0010
	BCS.b label_C0269E
	STZ.b $2A
	LDA.w #DATA_D0D52D
	STA.b $0A
	LDA.w #DATA_D0D52D>>16
	STA.b $0C
	JMP.w label_C02A50

label_C0269E:
	LDA.w $4A7A
	INC
	STA.w $4A7A
	AND.w #$000F
	BEQ.b label_C026AD
	JMP.w label_C02752

label_C026AD:
	LDA.b $2C
	ASL
	ASL
	ASL
	LSR
	LSR
	LSR
	LSR
	LSR
	ASL
	STA.b $04
	LDA.b $2E
	ASL
	ASL
	ASL
	LSR
	LSR
	LSR
	LSR
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $04
	TAX
	LDA.l DATA_D7B200,X
	AND.w #$0007
	BEQ.b label_C026F1
	CMP.w #$0001
	BEQ.b label_C026FA
	CMP.w #$0002
	BEQ.b label_C02703
	CMP.w #$0003
	BEQ.b label_C0270C
	CMP.w #$0004
	BEQ.b label_C02715
	CMP.w #$0005
	BEQ.b label_C0271E
	BRA.b label_C02725

label_C026F1:
	LDA.w #$0002
	STA.b $02
	STA.b $28
	BRA.b label_C02725

label_C026FA:
	LDA.w #$0000
	STA.b $02
	STA.b $28
	BRA.b label_C02725

label_C02703:
	LDA.w #$0001
	STA.b $02
	STA.b $28
	BRA.b label_C02725

label_C0270C:
	LDA.w #$0000
	STA.b $02
	STA.b $28
	BRA.b label_C02725

label_C02715:
	LDA.w #$0005
	STA.b $02
	STA.b $28
	BRA.b label_C02725

label_C0271E:
	LDA.w #$0001
	STA.b $02
	STA.b $28
label_C02725:
	JSL.l label_C08E9A
	LDX.b $28
	STX.b $02
	LDY.w #$0064
	JSL.l label_C09231
	CMP.b $02
	BCC.b label_C0273B
	JMP.w label_C02A69

label_C0273B:
	LDA.w #$01E1
	STA.b $2A
	STA.w $4A72
	LDA.l DATA_D0D515
	STA.b $0A
	LDA.l DATA_D0D515+$02
	STA.b $0C
	JMP.w label_C02A50

label_C02752:
	LDY.b $30
	BNE.b label_C02759
	JMP.w label_C02A69

label_C02759:
	LDA.b $2C
	ASL
	ASL
	ASL
	LSR
	LSR
	LSR
	LSR
	LSR
	STA.b $02
	LDA.b $2E
	ASL
	ASL
	ASL
	LSR
	LSR
	LSR
	LSR
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.l DATA_D7A800,X
	AND.w #$00FF
	LSR
	LSR
	LSR
	CMP.w $436E
	BEQ.b label_C02789
	JMP.w label_C02A69

label_C02789:
	STY.w $4A6C
	LDA.w #EB_EnemyPlacementGroupDataPtrs
	STA.b $06
	LDA.w #EB_EnemyPlacementGroupDataPtrs>>16
	STA.b $08
	TYA
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $0A
	STY.b $0C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b [$06]
	STA.b $26
	LDA.w #$0004
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	STA.b $22
	LDA.b $08
	STA.b $24
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	INC.b $06
	INC.b $06
	LDA.b $06
	STA.b $1E
	LDA.b $08
	STA.b $20
	LDA.b [$1E]
	AND.w #$00FF
	STA.w $4A70
	LDX.w #$0000
	STX.b $1C
	LDA.b $26
	BEQ.b label_C02815
	JSL.l label_C21628
	CMP.w #$0000
	BEQ.b label_C02815
	SEP.b #$20
	LDY.w #$0003
	LDA.b [$0A],Y
	REP.b #$20
	AND.w #$00FF
	STA.w $4A70
	LDA.b [$1E]
	AND.w #$00FF
	BEQ.b label_C02815
	LDX.w #$0008
	STX.b $1C
label_C02815:
	LDY.w $4A70
	STY.b $26
	LDA.w $B539
	BNE.b label_C02839
	JSL.l label_C08E9A
	LDY.b $26
	STY.b $02
	LDY.w #$0064
	JSL.l label_C08FF7
	XBA
	AND.w #$00FF
	CMP.b $02
	BCC.b label_C02839
	JMP.w label_C02A69

label_C02839:
	JSL.l label_C08E9A
	AND.w #$0007
	STA.b $02
	LDX.b $1C
	TXA
	CLC
	ADC.b $02
	STA.b $1A
	LDX.w #$0000
label_C0284D:
	LDA.b $22
	STA.b $06
	LDA.b $24
	STA.b $08
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b [$0A]
	AND.w #$00FF
	STA.b $02
	TXA
	CLC
	ADC.b $02
	TAX
	STX.b $02
	LDA.b $1A
	CMP.b $02
	BCC.b label_C02881
	LDA.w #$0003
	CLC
	ADC.b $06
	STA.b $06
	STA.b $22
	LDA.b $08
	STA.b $24
	BRA.b label_C0284D

label_C02881:
	LDY.w #$0001
	LDA.b [$06],Y
	STA.b $2A
	STA.w $4A72
	LDA.w #EB_EnemyBattleGroupDataPtrs
	STA.b $06
	LDA.w #EB_EnemyBattleGroupDataPtrs>>16
	STA.b $08
	LDA.b $2A
	ASL
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $0A
	STY.b $0C
	LDA.b $2E
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $2C
	STA.b $1C
	LDY.w #$0000
	BRA.b label_C028DF

label_C028BE:
	TYA
	ASL
	TAX
	LDA.w $0A62,X
	CMP.w #$FFFF
	BEQ.b label_C028DE
	LDA.b $2A
	CLC
	ADC.w #$8000
	CMP.w $2C9A,X
	BNE.b label_C028DE
	LDA.b $1C
	CMP.w $2D4E,X
	BNE.b label_C028DE
	JMP.w label_C02A69

label_C028DE:
	INY
label_C028DF:
	CPY.w #$0017
	BNE.b label_C028BE
	JMP.w label_C02A50

label_C028E7:
	LDY.w #$0001
	LDA.b [$0A],Y
	STA.b $18
	LDA.w #DATA_D59589
	STA.b $06
	LDA.w #DATA_D59589>>16
	STA.b $08
	LDA.b $06
	STA.b $22
	LDA.b $08
	STA.b $24
	LDA.b $18
	LDY.w #$005E
	JSL.l label_C08FF7
	STA.b $16
	INC
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	STA.w $4A76
	LDA.b $16
	CLC
	ADC.w #$001E
	LDX.b $22
	STX.b $06
	LDX.b $24
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	STA.b $26
	STA.w $4A74
	LDA.b $16
	CLC
	ADC.w #$002B
	LDX.b $22
	STX.b $06
	LDX.b $24
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	STA.b $16
	BEQ.b label_C0294F
	JMP.w label_C02A3A

label_C0294F:
	LDA.w #$0013
	STA.b $16
	JMP.w label_C02A3A

label_C02957:
	LDA.b $18
	CMP.w #$00E1
	BNE.b label_C02966
	LDA.w $4A60
	BEQ.b label_C02966
	JMP.w label_C02A3A

label_C02966:
	LDA.w $4A5C
	CMP.w $4A5E
	BNE.b label_C02974
	INC.w $4A68
	JMP.w label_C02A3A

label_C02974:
	STZ.w $4A68
	STZ.b $0E
	STZ.b $10
	LDY.w #$FFFF
	LDX.b $16
	LDA.b $26
	JSL.l label_C01E49
	STA.b $14
	STZ.b $1C
	BRA.b label_C029E2

label_C0298C:
	JSL.l label_C08E9A
	LDY.w $4A62
	JSL.l label_C09231
	STA.b $02
	LDA.b $2C
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	ASL
	ASL
	ASL
	STA.b $04
	JSL.l label_C08E9A
	LDY.w $4A64
	JSL.l label_C09231
	STA.b $02
	LDA.b $2E
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	ASL
	ASL
	ASL
	STA.b $02
	LDY.b $14
	LDX.b $02
	LDA.b $04
	JSL.l label_C05F33
	STA.b $12
	AND.w #$00D0
	BNE.b label_C029E0
	LDY.b $18
	LDX.b $14
	LDA.b $12
	JSL.l label_C05DE7
	CMP.w #$0000
	BEQ.b label_C029F1
label_C029E0:
	INC.b $1C
label_C029E2:
	LDA.b $1C
	CMP.w #$0014
	BNE.b label_C0298C
	LDA.b $14
	JSL.l label_C02140
	BRA.b label_C02A3A

label_C029F1:
	LDA.b $14
	ASL
	TAX
	STX.b $1C
	LDA.b $04
	STA.w $0B8E,X
	LDA.b $02
	STA.w $0BCA,X
	LDA.b $2A
	CLC
	ADC.w #$8000
	STA.w $2C9A,X
	LDA.b $18
	STA.w $2D12,X
	LDA.b $2E
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $2C
	STA.w $2D4E,X
	STZ.w $2C5E,X
	JSL.l label_C08E9A
	LDX.b $1C
	STA.w $3186,X
	INC.w $4A5C
	LDA.b $18
	CMP.w #$00E1
	BNE.b label_C02A3A
	LDA.w #$0001
	STA.w $4A60
label_C02A3A:
	LDX.w $4A6E
	DEC.w $4A6E
	CPX.w #$0000
	BEQ.b label_C02A48
	JMP.w label_C02957

label_C02A48:
	LDA.w #$0003
	CLC
	ADC.b $0A
	STA.b $0A
label_C02A50:
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b [$06]
	AND.w #$00FF
	TAX
	STX.w $4A6E
	CPX.w #$00FF
	BEQ.b label_C02A69
	JMP.w label_C028E7

label_C02A69:
	PLD
	RTS

;--------------------------------------------------------------------

label_C02A6B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	STX.b $18
	TAY
	STY.b $16
	LDA.w #$000B
	JSL.l label_C21628
	CMP.w #$0000
	BEQ.b label_C02A89
	JMP.w label_C02B53

label_C02A89:
	LDA.w #$0049
	JSL.l label_C21628
	CMP.w #$0000
	BEQ.b label_C02A98
	JMP.w label_C02B53

label_C02A98:
	LDA.w $4A5A
	BNE.b label_C02AA0
	JMP.w label_C02B53

label_C02AA0:
	LDX.b $18
	TXA
	AND.w #$0007
	BEQ.b label_C02AAB
	JMP.w label_C02B53

label_C02AAB:
	CPX.w #$FFF0
	BCC.b label_C02AB3
	LDX.w #$0000
label_C02AB3:
	CPX.w #$0500
	BCC.b label_C02ABB
	JMP.w label_C02B53

label_C02ABB:
	LDY.b $16
	TYA
	ASL
	PHP
	LSR
	LSR
	LSR
	LSR
	PLP
	BCC.b label_C02ACA
	ORA.w #$F000
label_C02ACA:
	STA.b $14
	TXA
	ASL
	PHP
	LSR
	LSR
	LSR
	LSR
	PLP
	BCC.b label_C02AD9
	ORA.w #$F000
label_C02AD9:
	STA.b $12
	LDA.b $14
	STA.b $04
	BRA.b label_C02B42

label_C02AE1:
	LDA.b $04
	STA.b $10
	LDA.w #$0008
	STA.w $4A62
	STA.w $4A64
	LDA.w #$0001
	STA.b $02
label_C02AF3:
	LDX.b $12
	LDA.b $04
	JSL.l label_C0263D
	STA.b $16
	LDY.b $04
	INY
	STY.b $0E
	LDX.b $12
	TYA
	JSL.l label_C0263D
	TAX
	LDA.b $16
	BEQ.b label_C02B34
	CPX.b $16
	BNE.b label_C02B34
	LDA.w $4A62
	CLC
	ADC.w #$0008
	STA.w $4A62
	LDY.b $0E
	STY.b $04
	INC.b $02
	LDA.b $02
	CMP.w #$0006
	BNE.b label_C02AF3
	BRA.b label_C02B34

label_C02B2B:
	LDY.b $16
	LDX.b $12
	LDA.b $10
	JSR.w label_C02668
label_C02B34:
	LDX.b $02
	LDA.b $02
	DEC
	STA.b $02
	CPX.w #$0000
	BNE.b label_C02B2B
	INC.b $04
label_C02B42:
	LDA.b $14
	CLC
	ADC.w #$0005
	CLC
	SBC.b $04
	BVS.b label_C02B51
	BPL.b label_C02AE1
	BRA.b label_C02B53

label_C02B51:
	BMI.b label_C02AE1
label_C02B53:
	PLD
	RTL

;--------------------------------------------------------------------

label_C02B55:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	TXY
	STY.b $18
	TAX
	STX.b $16
	LDA.w #$000B
	JSL.l label_C21628
	CMP.w #$0000
	BEQ.b label_C02B74
	JMP.w label_C02C3C

label_C02B74:
	LDA.w #$0049
	JSL.l label_C21628
	CMP.w #$0000
	BEQ.b label_C02B83
	JMP.w label_C02C3C

label_C02B83:
	LDA.w $4A5A
	BNE.b label_C02B8B
	JMP.w label_C02C3C

label_C02B8B:
	LDX.b $16
	TXA
	AND.w #$0007
	BEQ.b label_C02B96
	JMP.w label_C02C3C

label_C02B96:
	CPX.w #$FFF0
	BCC.b label_C02B9E
	LDX.w #$0000
label_C02B9E:
	CPX.w #$0400
	BCC.b label_C02BA6
	JMP.w label_C02C3C

label_C02BA6:
	TXA
	ASL
	PHP
	LSR
	LSR
	LSR
	LSR
	PLP
	BCC.b label_C02BB3
	ORA.w #$F000
label_C02BB3:
	STA.b $14
	LDY.b $18
	TYA
	ASL
	PHP
	LSR
	LSR
	LSR
	LSR
	PLP
	BCC.b label_C02BC4
	ORA.w #$F000
label_C02BC4:
	STA.b $12
	STA.b $04
	BRA.b label_C02C2B

label_C02BCA:
	LDA.b $04
	STA.b $10
	LDA.w #$0008
	STA.w $4A62
	STA.w $4A64
	LDA.w #$0001
	STA.b $02
label_C02BDC:
	LDX.b $04
	LDA.b $14
	JSL.l label_C0263D
	STA.b $18
	LDY.b $04
	INY
	STY.b $0E
	TYX
	LDA.b $14
	JSL.l label_C0263D
	TAX
	LDA.b $18
	BEQ.b label_C02C1D
	CPX.b $18
	BNE.b label_C02C1D
	LDA.w $4A64
	CLC
	ADC.w #$0008
	STA.w $4A64
	LDY.b $0E
	STY.b $04
	INC.b $02
	LDA.b $02
	CMP.w #$0006
	BNE.b label_C02BDC
	BRA.b label_C02C1D

label_C02C14:
	LDY.b $18
	LDX.b $10
	LDA.b $14
	JSR.w label_C02668
label_C02C1D:
	LDX.b $02
	LDA.b $02
	DEC
	STA.b $02
	CPX.w #$0000
	BNE.b label_C02C14
	INC.b $04
label_C02C2B:
	LDA.b $12
	CLC
	ADC.w #$0005
	CLC
	SBC.b $04
	BVS.b label_C02C3A
	BPL.b label_C02BCA
	BRA.b label_C02C3C

label_C02C3A:
	BMI.b label_C02BCA
label_C02C3C:
	PLD
	RTL

;--------------------------------------------------------------------

label_C02C3E:
	REP.b #$31
	LDA.w $9891
	AND.w #$00FF
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99DC
	TAX
	LDA.w $0001,X
	AND.w #$00FF
	CMP.w #$0001
	BNE.b label_C02C7F
	LDA.w #$0001
	STA.w $5DA0
	LDA.w $5D9C
	BNE.b label_C02C71
	LDA.w #$0708
	STA.w $5D9C
	STZ.w $5D9E
label_C02C71:
	LDA.w $9883
	CMP.w #$0003
	BNE.b label_C02C82
	JSL.l label_C03CFD
	BRA.b label_C02C82

label_C02C7F:
	STZ.w $5DA0
label_C02C82:
	RTL

;--------------------------------------------------------------------

org $C02C89
label_C02C89:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w $5D9C
	BNE.b label_C02CAC
	LDA.w #$0708
	STA.w $5D9C
	LDX.w #$7E5D9E
	LDA.w $0000,X
	INC
	STA.w $0000,X
	AND.w #$0003
	STA.w $0000,X
label_C02CAC:
	DEC.w $5D9C
	LDA.w $5D9E
	STA.b $0E
	BEQ.b label_C02D27
	LDA.w $0081
	BNE.b label_C02D27
	LDA.w $006D
	XBA
	AND.w #$00FF					; Optimization: Unnecessary AND
	AND.w #$000F
	TAY
	LDA.w $0065
	XBA
	AND.w #$00FF					; Optimization: Unnecessary AND
	AND.w #$000F
	TAX
	LDA.w #DATA_C3E178
	STA.b $06
	LDA.w #DATA_C3E178>>16
	STA.b $08
	LDA.b $0E
	DEC
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $0E
	TYA
	ASL
	STA.b $04
	LDA.b $0E
	CLC
	ADC.b $04
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	STA.b $02
	LDA.w $006D
	AND.w #$F0FF
	ORA.b $02
	STA.w $006D
	TXA
	ASL
	STA.b $04
	LDA.b $0E
	CLC
	ADC.b $04
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	STA.b $02
	LDA.w $0065
	AND.w #$F0FF
	ORA.b $02
	STA.w $0065
label_C02D27:
	PLD
	RTS

;--------------------------------------------------------------------

label_C02D29:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w #$0001
	STA.w $2B9C
	LDA.w #$FFFF
	STA.w $9F6B
	STZ.w $987D
	STZ.w $98A5
	STZ.w $98A7
	STZ.w $98A9
	SEP.b #$20
	STZ.w $9840
	REP.b #$20
	LDA.w #$0018
	STA.w $9889
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C02D6F

label_C02D5D:
	TAX
	SEP.b #$20
	STZ.w $988B,X
	REP.b #$20
	ASL
	TAX
	STZ.w $5D8C,X
	LDA.b $0E
	INC
	STA.b $0E
label_C02D6F:
	CMP.w #$0006
	BCC.b label_C02D5D
	SEP.b #$20
	LDA.b #$00
	STA.w $98A4
	STA.w $98A3
	JSL.l label_C430EC
	LDA.l DATA_C30186
	JSL.l label_C21628
	STA.w $9F71
	PLD
	RTL

;--------------------------------------------------------------------

label_C02D8F:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	TAY
	LDA.b $22
	STA.b $06
	LDA.b $24
	STA.b $08
	LDA.b $06
	STA.b $10
	LDA.b $08
	STA.b $12
	TXA
	AND.w #$000C
	CMP.w #$0008
	BEQ.b label_C02DBE
	CMP.w #$000C
	BNE.b label_C02DBB
	JMP.w label_C02E59

label_C02DBB:
	JMP.w label_C02EF4

label_C02DBE:
	TYA
	ASL
	ASL
	STA.b $02
	LDA.w $9883
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$4DD6
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C02DED
	DEC.b $09
label_C02DED:
	REP.b #$20
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.w #$8000
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	JSL.l label_C09086
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $10
	STA.b $06
	LDA.b $12
	STA.b $08
	PHA
	LDA.b $06
	PHA
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C02E39
	DEC.b $09
label_C02E39:
	REP.b #$20
	PLA
	STA.b $0A
	PLA
	STA.b $0C
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	JMP.w label_C03015

label_C02E59:
	TYA
	ASL
	ASL
	STA.b $02
	LDA.w $9883
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$4DD6
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C02E88
	DEC.b $09
label_C02E88:
	REP.b #$20
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.w #$547A
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	JSL.l label_C09086
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $10
	STA.b $06
	LDA.b $12
	STA.b $08
	PHA
	LDA.b $06
	PHA
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C02ED4
	DEC.b $09
label_C02ED4:
	REP.b #$20
	PLA
	STA.b $0A
	PLA
	STA.b $0C
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	JMP.w label_C03015

label_C02EF4:
	LDA.w $0081
	BEQ.b label_C02F30
	TYA
	ASL
	ASL
	STA.b $02
	LDA.w $9883
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$4DD6
	TAY
	LDA.w $0000,Y
	STA.b $0A
	LDA.w $0002,Y
	STA.b $0C
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	JMP.w label_C03015

label_C02F30:
	LDA.w $9840
	AND.w #$00FF
	CMP.w #$0003
	BEQ.b label_C02F3E
	JMP.w label_C02FE1

label_C02F3E:
	LDA.w $9883
	STA.b $0E
	BEQ.b label_C02F48
	JMP.w label_C02FE1

label_C02F48:
	TYA
	ASL
	ASL
	STA.b $02
	LDA.b $0E
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$4DD6
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C02F76
	DEC.b $09
label_C02F76:
	REP.b #$20
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.w #$8000
	STA.b $0A
	LDA.w #$0001
	STA.b $0C
	JSL.l label_C09086
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $10
	STA.b $06
	LDA.b $12
	STA.b $08
	PHA
	LDA.b $06
	PHA
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C02FC2
	DEC.b $09
label_C02FC2:
	REP.b #$20
	PLA
	STA.b $0A
	PLA
	STA.b $0C
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	BRA.b label_C03015

label_C02FE1:
	TYA
	ASL
	ASL
	STA.b $02
	LDA.w $9883
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$4DD6
	TAY
	LDA.w $0000,Y
	STA.b $0A
	LDA.w $0002,Y
	STA.b $0C
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
label_C03015:
	PLD
	RTS

;--------------------------------------------------------------------

label_C03017:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	TAY
	LDA.b $22
	STA.b $06
	LDA.b $24
	STA.b $08
	LDA.b $06
	STA.b $10
	LDA.b $08
	STA.b $12
	TXA
	AND.w #$000C
	CMP.w #$0008
	BEQ.b label_C03046
	CMP.w #$000C
	BNE.b label_C03043
	JMP.w label_C030E1

label_C03043:
	JMP.w label_C0317C

label_C03046:
	TYA
	ASL
	ASL
	STA.b $02
	LDA.w $9883
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$4F96
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C03075
	DEC.b $09
label_C03075:
	REP.b #$20
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.w #$8000
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	JSL.l label_C09086
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $10
	STA.b $06
	LDA.b $12
	STA.b $08
	PHA
	LDA.b $06
	PHA
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C030C1
	DEC.b $09
label_C030C1:
	REP.b #$20
	PLA
	STA.b $0A
	PLA
	STA.b $0C
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	JMP.w label_C0329D

label_C030E1:
	TYA
	ASL
	ASL
	STA.b $02
	LDA.w $9883
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$4F96
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C03110
	DEC.b $09
label_C03110:
	REP.b #$20
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.w #$547A
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	JSL.l label_C09086
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $10
	STA.b $06
	LDA.b $12
	STA.b $08
	PHA
	LDA.b $06
	PHA
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C0315C
	DEC.b $09
label_C0315C:
	REP.b #$20
	PLA
	STA.b $0A
	PLA
	STA.b $0C
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	JMP.w label_C0329D

label_C0317C:
	LDA.w $0081
	BEQ.b label_C031B8
	TYA
	ASL
	ASL
	STA.b $02
	LDA.w $9883
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$4F96
	TAY
	LDA.w $0000,Y
	STA.b $0A
	LDA.w $0002,Y
	STA.b $0C
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	JMP.w label_C0329D

label_C031B8:
	LDA.w $9840
	AND.w #$00FF
	CMP.w #$0003
	BEQ.b label_C031C6
	JMP.w label_C03269

label_C031C6:
	LDA.w $9883
	STA.b $0E
	BEQ.b label_C031D0
	JMP.w label_C03269

label_C031D0:
	TYA
	ASL
	ASL
	STA.b $02
	LDA.b $0E
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$4F96
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C031FE
	DEC.b $09
label_C031FE:
	REP.b #$20
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.w #$8000
	STA.b $0A
	LDA.w #$0001
	STA.b $0C
	JSL.l label_C09086
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $10
	STA.b $06
	LDA.b $12
	STA.b $08
	PHA
	LDA.b $06
	PHA
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C0324A
	DEC.b $09
label_C0324A:
	REP.b #$20
	PLA
	STA.b $0A
	PLA
	STA.b $0C
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	BRA.b label_C0329D

label_C03269:
	TYA
	ASL
	ASL
	STA.b $02
	LDA.w $9883
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$4F96
	TAY
	LDA.w $0000,Y
	STA.b $0A
	LDA.w $0002,Y
	STA.b $0C
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
label_C0329D:
	PLD
	RTS

;--------------------------------------------------------------------

org $C032EC
label_C032EC:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE7
	TCD
	LDY.w #$0000
	BRA.b label_C032FA

label_C032F9:
	INY
label_C032FA:
	LDA.w $986F,Y
	AND.w #$00FF
	BEQ.b label_C03315
	AND.w #$00FF
	STA.b $02
	LDA.w #$0005
	CLC
	SBC.b $02
	BVS.b label_C03313
	BPL.b label_C032F9
	BRA.b label_C03315

label_C03313:
	BMI.b label_C032F9
label_C03315:
	TYA
	SEP.b #$20
	STA.w $98A4
	REP.b #$20
	LDA.w #$7E983A
	STA.b $04
	LDX.b $04
	SEP.b #$20
	LDA.w $0000,X
	STA.b $00
	STA.b $18
	REP.b #$20
	TYA
	CLC
	ADC.w #$986F
	STA.b $16
	SEP.b #$20
	LDA.b ($16)
	STA.b $15
	STA.b $01
	LDA.b $00
	CMP.b $01
	BNE.b label_C03347
	JMP.w label_C03499

label_C03347:
	REP.b #$20
	LDA.w #$7E983B
	STA.b $02
	LDX.b $02
	SEP.b #$20
	LDA.w $0000,X
	STA.b $01
	LDA.b $15
	STA.b $00
	LDA.b $01
	CMP.b $00
	BNE.b label_C033A6
	LDA.b $01
	LDX.b $04
	STA.w $0000,X
	LDX.w #$7E983E
	STX.b $13
	REP.b #$20
	LDA.w $0000,X
	STA.w $983C
	SEP.b #$20
	LDA.w $9870,Y
	LDX.b $02
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	ASL
	TAX
	INX
	LDA.l DATA_D58F23,X
	AND.w #$00FF
	LDY.w #$005E
	JSL.l label_C08FF7
	CLC
	ADC.w #$0021
	TAX
	LDA.l DATA_D59589,X
	LDX.b $13
	STA.w $0000,X
	JMP.w label_C034D2

label_C033A6:
	LDA.b $18
	STA.b $00
	CMP.w $9870,Y
	BNE.b label_C033F3
	LDA.b $00
	LDX.b $02
	STA.w $0000,X
	LDX.w #$7E983C
	STX.b $13
	REP.b #$20
	LDA.w $0000,X
	STA.w $983E
	SEP.b #$20
	LDA.b ($16)
	LDX.b $04
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	ASL
	TAX
	INX
	LDA.l DATA_D58F23,X
	AND.w #$00FF
	LDY.w #$005E
	JSL.l label_C08FF7
	CLC
	ADC.w #$0021
	TAX
	LDA.l DATA_D59589,X
	LDX.b $13
	STA.w $0000,X
	JMP.w label_C034D2

label_C033F3:
	LDA.b $15
	LDX.b $04
	STA.w $0000,X
	TYX
	INX
	REP.b #$20
	LDA.w #DATA_D59589
	STA.b $0A
	LDA.w #DATA_D59589>>16
	STA.b $0C
	LDA.w #DATA_D58F23
	STA.b $06
	LDA.w #DATA_D58F23>>16
	STA.b $08
	LDA.b $06
	STA.b $0F
	LDA.b $08
	STA.b $11
	LDA.b $15
	AND.w #$00FF
	ASL
	INC
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	LDY.w #$005E
	JSL.l label_C08FF7
	CLC
	ADC.w #$0021
	LDY.b $0A
	STY.b $06
	LDY.b $0C
	STY.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	STA.w $983C
	SEP.b #$20
	LDA.w $986F,X
	STA.b $0E
	STA.b $00
	LDX.b $02
	LDA.w $0000,X
	CMP.b $00
	BEQ.b label_C034D2
	LDA.b $0E
	LDX.b $02
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	ASL
	INC
	LDX.b $0F
	STX.b $06
	LDX.b $11
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	LDY.w #$005E
	JSL.l label_C08FF7
	CLC
	ADC.w #$0021
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	STA.w $983E
	BRA.b label_C034D2

label_C03499:
	INY
	LDX.w #$7E983B
	LDA.w $986F,Y
	STA.b $0E
	STA.b $00
	LDA.w $0000,X
	CMP.b $00
	BEQ.b label_C034D2
	LDA.b $0E
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	ASL
	TAX
	INX
	LDA.l DATA_D58F23,X
	AND.w #$00FF
	LDY.w #$005E
	JSL.l label_C08FF7
	CLC
	ADC.w #$0021
	TAX
	LDA.l DATA_D59589,X
	STA.w $983E
label_C034D2:
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C034D6:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFB2
	TCD
	LDA.w $98A3
	AND.w #$00FF
	STA.b $4C
	LDA.w #$0000
	STA.b $4A
	BRA.b label_C0350B

label_C034ED:
	ASL
	PHA
	LDA.b $4A
	TAX
	LDA.w $9891,X
	AND.w #$00FF
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $9A0B,X
	PLX
	STA.b $0E,X
	LDA.b $4A
	INC
	STA.b $4A
label_C0350B:
	CMP.b $4C
	BCC.b label_C034ED
	LDY.w #$0000
	STY.b $48
	BRA.b label_C03570

label_C03516:
	LDA.w $988B,Y
	AND.w #$00FF
	STA.b $46
	CMP.w #$0005
	BCC.b label_C0352B
	CLC
	ADC.w #$0300
	STA.b $46
	BRA.b label_C03557

label_C0352B:
	TYA
	ASL
	TAX
	LDA.w $9897,X
	ASL
	TAX
	LDA.w $0E9A,X
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99DC,X
	AND.w #$00FF
	TAX
	CPX.w #$0001
	BEQ.b label_C0354F
	CPX.w #$0002
	BNE.b label_C03557
label_C0354F:
	LDA.b $46
	CLC
	ADC.w #$0100
	STA.b $46
label_C03557:
	LDY.b $48
	TYA
	ASL
	TAX
	LDA.b $46
	STA.b $1A,X
	LDA.w $9897,X
	STA.b $26,X
	LDA.w $9891,Y
	AND.w #$00FF
	STA.b $32,X
	INY
	STY.b $48
label_C03570:
	CPY.b $4C
	BCC.b label_C03516
	STZ.b $44
	JMP.w label_C0360D

label_C03579:
	STZ.b $42
	JMP.w label_C035FF

label_C0357E:
	LDA.b $42
	ASL
	STA.b $02
	TDC
	CLC
	ADC.w #$001A
	CLC
	ADC.b $02
	TAY
	LDA.w $0000,Y
	STA.b $46
	LDA.b $02
	STA.b $04
	INC.b $04
	INC.b $04
	TDC
	CLC
	ADC.w #$001A
	CLC
	ADC.b $04
	TAX
	LDA.w $0000,X
	STA.b $4A
	LDA.b $46
	CMP.b $4A
	BCC.b label_C035FD
	BEQ.b label_C035FD
	LDA.b $4A
	STA.w $0000,Y
	LDA.b $46
	STA.w $0000,X
	TDC
	CLC
	ADC.w #$0026
	CLC
	ADC.b $02
	TAY
	LDA.w $0000,Y
	STA.b $40
	TDC
	CLC
	ADC.w #$0026
	CLC
	ADC.b $04
	TAX
	LDA.w $0000,X
	STA.w $0000,Y
	LDA.b $40
	STA.w $0000,X
	TDC
	CLC
	ADC.w #$0032
	CLC
	ADC.b $02
	TAY
	LDA.w $0000,Y
	STA.b $4A
	TDC
	CLC
	ADC.w #$0032
	CLC
	ADC.b $04
	TAX
	LDA.w $0000,X
	STA.w $0000,Y
	LDA.b $4A
	STA.w $0000,X
label_C035FD:
	INC.b $42
label_C035FF:
	LDA.b $4C
	DEC
	CMP.b $42
	BEQ.b label_C0360B
	BCC.b label_C0360B
	JMP.w label_C0357E

label_C0360B:
	INC.b $44
label_C0360D:
	LDA.b $4C
	DEC
	CMP.b $44
	BEQ.b label_C03619
	BCC.b label_C03619
	JMP.w label_C03579

label_C03619:
	LDA.w #$0000
	STA.b $46
	BRA.b label_C03683

label_C03620:
	CLC
	ADC.w #$97F5
	TAY
	LDA.b $46
	ASL
	STA.b $04
	LDX.b $04
	SEP.b #$20
	LDA.b $1A,X
	STA.w $0096,Y
	REP.b #$20
	LDA.b $04
	CLC
	ADC.w #$9897
	TAX
	STX.b $3E
	LDX.b $04
	LDA.b $26,X
	LDX.b $3E
	STA.w $0000,X
	TDC
	CLC
	ADC.w #$0032
	CLC
	ADC.b $04
	STA.b $02
	LDX.b $02
	SEP.b #$20
	LDA.w $0000,X
	STA.w $009C,Y
	LDX.b $02
	REP.b #$20
	LDA.w $0000,X
	LDY.w #$005F
	JSL.l label_C08FF7
	PHA
	LDX.b $04
	LDA.b $0E,X
	PLX
	STA.w $9A0B,X
	LDX.b $3E
	LDA.w $0000,X
	ASL
	TAX
	LDA.b $04
	STA.w $0F8A,X
	LDA.b $46
	INC
	STA.b $46
label_C03683:
	CMP.b $4C
	BCC.b label_C03620
	LDA.w $9897
	STA.w $9889
	JSL.l label_C032EC
	JSL.l label_C02C3E
	JSL.l label_C47F87
	PLD
	RTL

;--------------------------------------------------------------------

label_C0369B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE4
	TCD
	PLA
	TAY
	STY.b $1A
	LDX.w #$0000
	STX.b $18
	CPY.w #$0005
	BCC.b label_C036CB
label_C036B2:
	LDA.w $988B,X
	AND.w #$00FF
	BEQ.b label_C03713
	AND.w #$00FF
	STA.b $02
	TYA
	CMP.b $02
	BCC.b label_C03713
	BEQ.b label_C03713
	INX
	STX.b $18
	BRA.b label_C036B2

label_C036CB:
	LDA.w $988B,X
	AND.w #$00FF
	BEQ.b label_C03713
	AND.w #$00FF
	STA.b $16
	STA.b $02
	LDA.w #$0005
	CLC
	SBC.b $02
	BVC.b label_C036E6
	BPL.b label_C03713
	BRA.b label_C036E8

label_C036E6:
	BMI.b label_C03713
label_C036E8:
	LDY.b $1A
	STY.b $02
	LDA.b $16
	CMP.b $02
	BEQ.b label_C036F4
	BCS.b label_C03713
label_C036F4:
	ASL
	TAX
	LDA.w $0E9A,X
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99DC,X
	AND.w #$00FF
	CMP.w #$0001
	BEQ.b label_C03713
	LDX.b $18
	INX
	STX.b $18
	BRA.b label_C036CB

label_C03713:
	LDX.b $18
	LDA.w $988B,X
	AND.w #$00FF
	BEQ.b label_C03770
	LDA.w #$0005
	STA.b $14
	BRA.b label_C03764

label_C03724:
	CLC
	ADC.w #$97F5
	STA.b $12
	LDA.b $14
	DEC
	STA.b $04
	CLC
	ADC.w #$97F5
	STA.b $02
	LDX.b $02
	SEP.b #$20
	LDA.w $0096,X
	LDY.w #$0096
	STA.b ($12),Y
	REP.b #$20
	LDA.b $14
	ASL
	PHA
	LDA.b $04
	ASL
	TAX
	LDA.w $9897,X
	PLX
	STA.w $9897,X
	LDX.b $02
	SEP.b #$20
	LDA.w $009C,X
	LDY.w #$009C
	STA.b ($12),Y
	REP.b #$20
	LDA.b $04
	STA.b $14
label_C03764:
	LDX.b $18
	TXA
	DEC
	STA.b $02
	LDA.b $14
	CMP.b $02
	BNE.b label_C03724
label_C03770:
	LDY.b $1A
	TYA
	SEP.b #$20
	STA.w $988B,X
	REP.b #$20
	LDA.w #$7E98A3
	PHA
	TAX
	SEP.b #$20
	LDA.w $0000,X
	INC
	PLX
	STA.w $0000,X
	REP.b #$20
	TYA
	DEC
	STA.b $12
	STA.w $0A38
	LDA.b $12
	ASL
	ASL
	ASL
	CLC
	ADC.w #$0006
	TAX
	LDA.l DATA_C3E012,X
	STA.b $1A
	ASL
	TAX
	LDA.w $0A62,X
	CMP.w #$FFFF
	BEQ.b label_C037AE
	INC.b $1A
label_C037AE:
	LDX.b $18
	TXA
	ASL
	TAX
	LDA.b $1A
	STA.w $9897,X
	LDA.b $1A
	STA.w $0A3A
	SEC
	SBC.w #$0018
	STA.w $0A3A
	SEP.b #$20
	LDA.w $0A3A
	LDX.b $18
	STA.w $9891,X
	REP.b #$20
	LDA.w $98A3
	AND.w #$00FF
	CMP.w #$0001
	BNE.b label_C037EE
	LDA.w $0A3A
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $987D
	STA.w $9A0B,X
	BRA.b label_C03823

label_C037EE:
	CPX.w #$0000
	BNE.b label_C037FA
	LDA.w $987D
	STA.b $16
	BRA.b label_C03813

label_C037FA:
	TXA
	DEC
	ASL
	TAX
	LDA.w $9897,X
	ASL
	TAX
	LDA.w $0E9A,X
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $9A0B,X
	STA.b $16
label_C03813:
	LDA.w $0A3A
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.b $16
	STA.w $9A0B,X
label_C03823:
	LDA.w $0A3A
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $9A0B,X
	BEQ.b label_C03837
	TAX
	DEX
	BRA.b label_C0383A

label_C03837:
	LDX.w #$00FF
label_C0383A:
	TXA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	TAX
	LDA.w $5156,X
	STA.b $04
	LDA.w $5158,X
	STA.b $02
	LDA.w $9887
	CMP.w #$0003
	BEQ.b label_C03863
	LDA.b $12
	ASL
	ASL
	ASL
	TAX
	LDA.l DATA_C3E012,X
	STA.b $18
	BRA.b label_C03871

label_C03863:
	LDA.b $12
	ASL
	ASL
	ASL
	TAX
	INX
	INX
	LDA.l DATA_C3E012,X
	STA.b $18
label_C03871:
	LDA.w #DATA_C3E012
	STA.b $06
	LDA.w #DATA_C3E012>>16
	STA.b $08
	LDA.b $04
	STA.b $0E
	LDA.b $02
	STA.b $10
	LDY.b $1A
	LDA.b $12
	ASL
	ASL
	ASL
	INC
	INC
	INC
	INC
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	TAX
	LDA.b $18
	JSL.l label_C01E49
	LDA.b $1A
	ASL
	TAX
	STX.b $14
	LDA.b $04
	SEC
	SBC.w $0031
	STA.w $0B16,X
	LDA.b $02
	SEC
	SBC.w $0033
	STA.w $0B52,X
	LDY.w #$9889
	STY.b $18
	LDA.w $988B
	AND.w #$00FF
	DEC
	ASL
	ASL
	ASL
	CLC
	ADC.w #$0006
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	STA.w $0000,Y
	JSL.l label_C09CD7
	JSL.l label_C032EC
	LDA.w $9897
	LDY.b $18
	STA.w $0000,Y
	JSL.l label_C034D6
	LDA.b $04
	STA.w $9E2D
	LDA.b $02
	STA.w $9E2F
	LDX.b $14
	LDA.w $2AF6,X
	STA.w $9E31
	LDA.b $1A
	PLD
	RTL

;--------------------------------------------------------------------

org $C039E5
label_C039E5:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDY.w #$0000
	STY.b $10
	BRA.b label_C03A1D

label_C039F4:
	LDA.w $988B,Y
	AND.w #$00FF
	BEQ.b label_C03A18
	TYA
	ASL
	TAX
	LDA.w $9897,X
	STA.b $0E
	ASL
	TAX
	LDA.w $9877
	STA.w $0B8E,X
	LDA.w $987B
	STA.w $0BCA,X
	LDA.b $0E
	JSL.l label_C0A254
label_C03A18:
	LDY.b $10
	INY
	STY.b $10
label_C03A1D:
	CPY.w #$0006
	BCC.b label_C039F4
	PLD
	RTL

;--------------------------------------------------------------------

label_C03A24:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	SEP.b #$20
	LDA.b #$00
	STA.w $98A4
	STA.w $98A3
	REP.b #$20
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C03A5A

label_C03A3F:
	CLC
	ADC.w #$97F5
	TAX
	SEP.b #$20
	STZ.w $0096,X
	STZ.w $009C,X
	REP.b #$20
	LDA.b $0E
	ASL
	TAX
	STZ.w $9897,X
	LDA.b $0E
	INC
	STA.b $0E
label_C03A5A:
	CMP.w #$0006
	BCC.b label_C03A3F
	LDA.w #$0001
	STA.w $5D7E
	LDX.w #$0000
	STX.b $0E
	BRA.b label_C03A80

label_C03A6C:
	LDA.w $986F,X
	AND.w #$00FF
	BEQ.b label_C03A85
	AND.w #$00FF
	JSL.l label_C0369B
	LDX.b $0E
	INX
	STX.b $0E
label_C03A80:
	CPX.w #$0006
	BCC.b label_C03A6C
label_C03A85:
	STZ.w $5D7E
	LDA.w $9887
	ASL
	STA.w $289A
	STZ.w $289C
	PLD
	RTL

;--------------------------------------------------------------------

label_C03A94:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE0
	TCD
	PLA
	STA.b $1E
	LDA.w $438A
	ORA.w $438C
	BEQ.b label_C03AB9
	LDA.w $438A
	ASL
	ASL
	ASL
	STA.b $1C
	LDA.w $438C
	ASL
	ASL
	ASL
	TAX
	BRA.b label_C03AC1

label_C03AB9:
	LDA.w $9877
	STA.b $1C
	LDX.w $987B
label_C03AC1:
	LDA.b $1C
	JSL.l label_C00AA1
	AND.w #$0007
	STA.b $1A
	STA.w $9887
	ASL
	STA.w $289A
	STZ.w $289C
	LDA.b $1A
	CMP.w #$0003
	BEQ.b label_C03AE2
	STZ.w $9883
	BRA.b label_C03AE8

label_C03AE2:
	LDA.w #$000A
	STA.w $9883
label_C03AE8:
	LDA.w $1A42
	STA.b $18
	LDA.w #$FFFF
	STA.w $1A42
	STZ.b $16
	JMP.w label_C03BD7

label_C03AF8:
	LDY.w #$988B
	LDA.b ($16),Y
	AND.w #$00FF
	TAX
	BNE.b label_C03B06
	JMP.w label_C03BD5

label_C03B06:
	TXA
	DEC
	STA.b $04
	LDA.b $16
	ASL
	TAY
	LDA.w $9897,Y
	STA.b $02
	ASL
	TAX
	LDA.w $0E5E,X
	STA.w $0A38
	LDA.w $0E9A,X
	STA.w $0A3A
	STY.w $0A42
	LDA.w $116A,X
	STA.b $14
	LDA.w $10B6,X
	STA.b $1A
	LDA.b $02
	JSL.l label_C02140
	LDA.b $02
	STA.w $9F73
	LDA.w $9887
	CMP.w #$0003
	BEQ.b label_C03B7F
	LDA.b $16
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	TAY
	LDX.w #$0000
	LDA.b $04
	JSL.l label_C0780F
	STA.b $1C
	LDA.w $9877
	STA.b $0E
	LDA.w $987B
	STA.b $10
	LDY.b $02
	LDA.b $04
	ASL
	ASL
	ASL
	TAX
	INX
	INX
	INX
	INX
	LDA.l DATA_C3E012,X
	TAX
	LDA.b $1C
	JSL.l label_C01E49
	STA.b $12
	BRA.b label_C03BBB

label_C03B7F:
	LDA.b $16
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	TAY
	LDX.w #$000A
	LDA.b $04
	JSL.l label_C0780F
	STA.b $1C
	LDA.w $9877
	STA.b $0E
	LDA.w $987B
	STA.b $10
	LDY.b $02
	LDA.b $04
	ASL
	ASL
	ASL
	TAX
	INX
	INX
	INX
	INX
	LDA.l DATA_C3E012,X
	TAX
	LDA.b $1C
	JSL.l label_C01E49
	STA.b $12
label_C03BBB:
	ASL
	TAX
	LDA.b $14
	STA.w $116A,X
	LDA.b $1A
	STA.w $10B6,X
	LDA.b $1E
	STA.w $2AF6,X
	STZ.w $10F2,X
	LDA.b $12
	JSL.l label_C0A780
label_C03BD5:
	INC.b $16
label_C03BD7:
	LDA.b $16
	CMP.w #$0006
	BCS.b label_C03BE3
	BEQ.b label_C03BE3
	JMP.w label_C03AF8

label_C03BE3:
	LDA.b $18
	STA.w $1A42
	JSL.l label_C039E5
	LDA.w #$FFFF
	STA.w $5DA8
	LDA.w $5D9A
	STA.b $02
	STZ.w $5D9A
	LDA.w #$0004
	STA.b $0E
	LDY.w $9889
	LDX.w $987B
	LDA.w $9877
	JSL.l label_C05B7B
	LDA.b $02
	STA.w $5D9A
	LDA.w $5DA8
	CMP.w #$FFFF
	BEQ.b label_C03C23
	LDX.w $5DAA
	LDA.w $5DA8
	JSL.l label_C07526
label_C03C23:
	PLD
	RTL

;--------------------------------------------------------------------

label_C03C25:
	REP.b #$31
	LDA.w #$0001
	STA.w $5DDA
	LDX.w $987B
	LDA.w $9877
	JSL.l label_C068F4
	LDA.w $5DD6
	CMP.w $5DD4
	BEQ.b label_C03C47
	JSL.l label_C08756
	JSL.l label_C069AF
label_C03C47:
	STZ.w $5DDA
	RTS

;--------------------------------------------------------------------

org $C03CFD
label_C03CFD:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w $9883
	CMP.w #$0003
	BEQ.b label_C03D10
	JMP.w label_C03DA8

label_C03D10:
	LDA.w #$0001
	JSL.l label_C4FD45
	LDA.w $4DC2
	BNE.b label_C03D25
	LDA.w $5D9A
	BNE.b label_C03D25
	JSL.l label_C06A07
label_C03D25:
	LDA.w #$0018
	JSL.l label_C02140
	STZ.w $9887
	STZ.w $9883
	STZ.w $9A0B
	STZ.w $987D
	LDA.w $5D9A
	BNE.b label_C03D4D
	JSL.l label_C088B1
	JSL.l label_C09466
	JSL.l label_C08B26
	JSL.l label_C08756
label_C03D4D:
	STZ.w $0A38
	STZ.w $0A3A
	LDA.w $0BBE
	STA.b $0E
	LDA.w $0BFA
	STA.b $10
	LDY.w #$0018
	LDX.w #$0002
	LDA.w #$0001
	JSL.l label_C01E49
	STZ.w $1122
	LDA.w $987F
	STA.w $2B26
	LDX.w #$7E1032
	LDA.w $0000,X
	ORA.w #$9000
	STA.w $0000,X
	LDA.w $5D9A
	BEQ.b label_C03D9F
	LDX.w #$7E10E6
	LDA.w $0000,X
	ORA.w #$C000
	STA.w $0000,X
	JSL.l label_C08756
	JSL.l label_C08756
	LDA.w #$0018
	JSL.l label_C0A780
label_C03D9F:
	STZ.w $5DBA
	LDA.w #$0002
	STA.w $5D74
label_C03DA8:
	PLD
	RTL

;--------------------------------------------------------------------

label_C03DAA:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w $1A42
	STA.b $02
	ASL
	TAY
	STY.b $0E
	LDA.w #$FFFF
	STA.w $3456,Y
	TYA
	CLC
	ADC.w #$0F12
	STA.b $04
	LDA.w #$0008
	LDX.b $04
	STA.w $0000,X
	JSL.l label_C08E9A
	AND.w #$000F
	LDY.b $0E
	STA.w $0ED6,Y
	LDA.b $02
	JSL.l label_C0A780
	LDY.b $0E
	LDA.w $0E9A,Y
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	TAX
	LDA.b $02
	STA.w $003B,X
	LDY.b $0E
	LDA.w $0E5E,Y
	STA.w $0035,X
	STZ.w $0039,X
	LDA.w #$FFFF
	STA.w $005C,X
	LDA.w $000E,X
	AND.w #$00FF
	CMP.w #$0001
	BNE.b label_C03E1C
	LDA.w #$0010
	LDX.b $04
	STA.w $0000,X
label_C03E1C:
	LDA.w $9889
	ASL
	STA.w $2898
	PLD
	RTL

;--------------------------------------------------------------------

org $C03E5A
label_C03E5A:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	LDX.w #$0000
	BRA.b label_C03E6C

label_C03E6B:
	INX
label_C03E6C:
	LDA.b $0E
	STA.b $02
	INC.b $02
	LDA.w $988B,X
	AND.w #$00FF
	CMP.b $02
	BNE.b label_C03E6B
	CPX.w #$0000
	BNE.b label_C03E86
	LDA.w #$FFFF
	BRA.b label_C03E9B

label_C03E86:
	TXA
	DEC
	ASL
	TAX
	LDA.w $9897,X
	ASL
	TAX
	LDA.w $0E9A,X
	ASL
	TAX
	LDA.w $4DC8,X
	TAX
	LDA.w $003D,X
label_C03E9B:
	PLD
	RTS

;--------------------------------------------------------------------

label_C03E9D:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	JSR.w label_C03E5A
	STA.b $0E
	LDX.w $4DC6
	LDA.w $003D,X
	STA.b $02
	LDA.b $0E
	CMP.b $02
	BCS.b label_C03EBE
	CLC
	ADC.w #$0100
label_C03EBE:
	SEC
	SBC.b $02
	PLD
	RTL

;--------------------------------------------------------------------

label_C03EC3:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STY.b $0E
	STX.b $02
	TAX
	LDA.b $1E
	STA.b $04
	TXA
	JSL.l label_C03E9D
	CMP.b $02
	BNE.b label_C03EF8
	LDY.b $0E
	INY
	STY.b $0E
	LDA.w $1A42
	ASL
	CLC
	ADC.w #$1002
	TAX
	LDA.w $0000,X
	AND.w #$EFFF
	STA.w $0000,X
	BRA.b label_C03F19

label_C03EF8:
	CMP.b $02
	BCC.b label_C03F19
	BEQ.b label_C03F19
	LDY.b $0E
	TYA
	CLC
	ADC.b $04
	TAY
	STY.b $0E
	LDA.w $1A42
	ASL
	CLC
	ADC.w #$1002
	TAX
	LDA.w $0000,X
	ORA.w #$1000
	STA.w $0000,X
label_C03F19:
	LDY.b $0E
	TYA
	PLD
	RTL

;--------------------------------------------------------------------

label_C03F1E:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF2
	TCD
	STZ.w $987D
	LDX.w #$7E5156
	LDY.w #$0002
label_C03F2F:
	LDA.w $9877
	STA.w $0000,X
	LDA.w $987B
	STA.w $0002,X
	LDA.w $987F
	STA.w $0008,X
	LDA.w $9883
	STA.w $0006,X
	LDA.w $9881
	STA.w $0004,X
	STZ.w $5D56
	STZ.w $000A,X
	TXA
	CLC
	ADC.w #$0BF4
	TAX
	DEY
	BNE.b label_C03F2F
	LDY.w #$0000
	BRA.b label_C03F9A

label_C03F61:
	LDA.w $9891,Y
	AND.w #$00FF
	ASL
	TAX
	LDA.w $4DC8,X
	TAX
	STZ.w $003D,X
	LDA.w #$FFFF
	STA.w $0041,X
	STA.w $0037,X
	TYA
	ASL
	TAX
	LDA.w $9897,X
	ASL
	TAX
	LDA.w $9877
	STA.w $0B8E,X
	LDA.w $987B
	STA.w $0BCA,X
	LDA.w $987F
	STA.w $2AF6,X
	LDA.w $9881
	STA.w $2BAA,X
	INY
label_C03F9A:
	LDA.w $98A3
	AND.w #$00FF
	STA.b $02
	TYA
	CMP.b $02
	BCC.b label_C03F61
	PLD
	RTL

;--------------------------------------------------------------------

label_C03FA9:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STY.b $02
	STA.b $0E
	STA.w $9877
	STX.w $987B
	LDA.b $02
	STA.w $987F
	LDY.w $9889
	LDA.b $0E
	JSL.l label_C05F33
	STA.w $9881
	LDA.b $02
	JSL.l label_C03A94
	JSL.l label_C03F1E
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C03FEC

label_C03FDF:
	ASL
	TAX
	LDA.w #$FFFF
	STA.w $3486,X
	LDA.b $0E
	INC
	STA.b $0E
label_C03FEC:
	CMP.w #$0006
	BCC.b label_C03FDF
	LDA.w #$FFFF
	STA.w $9F6B
	STZ.w $438C
	STZ.w $438A
	LDA.l DATA_C30186
	JSL.l label_C21628
	STA.w $9F71
	JSL.l label_C07B52
	PLD
	RTL

;--------------------------------------------------------------------

label_C0400E:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	TXA
	SEC
	SBC.w #$0070
	TAX
	LDA.b $0E
	SEC
	SBC.w #$0080
	JSR.w label_C01558
	PLD
	RTL

;--------------------------------------------------------------------

org $C0404F
label_C0404F:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $10
	LDX.w #$FFFF
	STX.b $0E
	LDA.w $5D9A
	BEQ.b label_C04069
	TXA
	JMP.w label_C04114

label_C04069:
	LDA.b $10
	ASL
	TAX
	LDA.l DATA_C3E12C,X
	STA.b $10
	LDA.w $0065
	AND.w #$0F00
	CMP.w #$0800
	BEQ.b label_C040A3
	CMP.w #$0900
	BEQ.b label_C040B1
	CMP.w #$0100
	BEQ.b label_C040BF
	CMP.w #$0500
	BEQ.b label_C040CD
	CMP.w #$0400
	BEQ.b label_C040DB
	CMP.w #$0600
	BEQ.b label_C040E9
	CMP.w #$0200
	BEQ.b label_C040F7
	CMP.w #$0A00
	BEQ.b label_C04105
	BRA.b label_C04111

label_C040A3:
	LDA.b $10
	AND.w #$0001
	BEQ.b label_C04111
	LDX.w #$0000
	STX.b $0E
	BRA.b label_C04111

label_C040B1:
	LDA.b $10
	AND.w #$0002
	BEQ.b label_C04111
	LDX.w #$0001
	STX.b $0E
	BRA.b label_C04111

label_C040BF:
	LDA.b $10
	AND.w #$0004
	BEQ.b label_C04111
	LDX.w #$0002
	STX.b $0E
	BRA.b label_C04111

label_C040CD:
	LDA.b $10
	AND.w #$0008
	BEQ.b label_C04111
	LDX.w #$0003
	STX.b $0E
	BRA.b label_C04111

label_C040DB:
	LDA.b $10
	AND.w #$0010
	BEQ.b label_C04111
	LDX.w #$0004
	STX.b $0E
	BRA.b label_C04111

label_C040E9:
	LDA.b $10
	AND.w #$0020
	BEQ.b label_C04111
	LDX.w #$0005
	STX.b $0E
	BRA.b label_C04111

label_C040F7:
	LDA.b $10
	AND.w #$0040
	BEQ.b label_C04111
	LDX.w #$0006
	STX.b $0E
	BRA.b label_C04111

label_C04105:
	LDA.b $10
	AND.w #$0080
	BEQ.b label_C04111
	LDX.w #$0007
	STX.b $0E
label_C04111:
	LDX.b $0E
	TXA
label_C04114:
	PLD
	RTL

;--------------------------------------------------------------------

label_C04116:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	STA.b $16
	ASL
	TAX
	LDA.l DATA_C3E148,X
	CLC
	ADC.w $9877
	STA.b $14
	LDA.l DATA_C3E158,X
	CLC
	ADC.w $987B
	STA.b $04
	LDA.w $5D58
	STA.b $12
	LDA.w #$0001
	STA.w $5D58
label_C04143:
	LDA.w #$7E9889
	STA.b $02
	LDX.b $02
	LDA.w $0000,X
	TAY
	LDX.b $04
	LDA.b $14
	JSL.l label_C05FF6
	STA.b $10
	CMP.w #$8000
	BCS.b label_C0416C
	ASL
	TAX
	LDA.w $2C9A,X
	STA.w $5D62
	LDA.b $10
	STA.w $5D64
	BRA.b label_C041C6

label_C0416C:
	LDA.b $16
	STA.b $0E
	LDX.b $02
	LDA.w $0000,X
	TAY
	LDX.b $04
	LDA.b $14
	JSL.l label_C05CD7
	AND.w #$0082
	CMP.w #$0082
	BNE.b label_C041C6
	LDA.b $16
	ASL
	TAX
	LDA.l DATA_C3E148,X
	BEQ.b label_C041A3
	AND.w #$8000
	BEQ.b label_C0419A
	LDX.w #$FFF8
	BRA.b label_C0419D

label_C0419A:
	LDX.w #$0008
label_C0419D:
	TXA
	CLC
	ADC.b $14
	STA.b $14
label_C041A3:
	LDA.b $16
	ASL
	TAX
	LDA.l DATA_C3E158,X
	BEQ.b label_C04143
	AND.w #$8000
	BEQ.b label_C041B7
	LDX.w #$FFF8
	BRA.b label_C041BA

label_C041B7:
	LDX.w #$0008
label_C041BA:
	STX.b $02
	LDA.b $04
	CLC
	ADC.b $02
	STA.b $04
	JMP.w label_C04143

label_C041C6:
	LDA.b $12
	STA.w $5D58
	LDA.w $5D62
	CMP.w #$FFFF
	BEQ.b label_C041D8
	LDA.w $5D62
	BNE.b label_C041DE
label_C041D8:
	LDA.b $16
	JSL.l label_C4334A
label_C041DE:
	LDA.w $5D62
	PLD
	RTS

;--------------------------------------------------------------------

label_C041E3:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w $987F
	AND.w #$FFFE
	TAY
	STY.b $10
	TYX
	STX.b $0E
	TXA
	JSR.w label_C04116
	CMP.w #$FFFF
	BEQ.b label_C0420A
	CMP.w #$0000
	BEQ.b label_C0420A
	LDX.b $0E
	TXA
	BRA.b label_C04277

label_C0420A:
	LDX.b $0E
	TXA
	INC
	INC
	AND.w #$0007
	TAX
	STX.b $0E
	STX.w $987F
	TXA
	JSR.w label_C04116
	CMP.w #$FFFF
	BEQ.b label_C0422B
	CMP.w #$0000
	BEQ.b label_C0422B
	LDX.b $0E
	TXA
	BRA.b label_C04277

label_C0422B:
	LDX.b $0E
	TXA
	INC
	INC
	INC
	INC
	AND.w #$0007
	TAX
	STX.b $0E
	STX.w $987F
	TXA
	JSR.w label_C04116
	CMP.w #$FFFF
	BEQ.b label_C0424E
	CMP.w #$0000
	BEQ.b label_C0424E
	LDX.b $0E
	TXA
	BRA.b label_C04277

label_C0424E:
	LDX.b $0E
	TXA
	DEC
	DEC
	AND.w #$0007
	TAX
	STX.b $0E
	STX.w $987F
	TXA
	JSR.w label_C04116
	CMP.w #$FFFF
	BEQ.b label_C0426F
	CMP.w #$0000
	BEQ.b label_C0426F
	LDX.b $0E
	TXA
	BRA.b label_C04277

label_C0426F:
	LDY.b $10
	STY.w $987F
	LDA.w #$FFFF
label_C04277:
	PLD
	RTS

;--------------------------------------------------------------------

label_C04279:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w #$FFFF
	STA.w $5D62
	STA.w $5D64
	JSR.w label_C041E3
	STA.b $10
	CMP.w #$FFFF
	BEQ.b label_C042BD
	LDX.w #$7E9889
	STX.b $0E
	LDA.w $0000,X
	ASL
	TAX
	LDA.b $10
	CMP.w $2AF6,X
	BEQ.b label_C042BD
	STA.w $987F
	LDX.b $0E
	LDA.w $0000,X
	ASL
	TAX
	LDA.b $10
	STA.w $2AF6,X
	LDX.b $0E
	LDA.w $0000,X
	JSL.l label_C0A780
label_C042BD:
	LDA.w $5D62
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to interacting with objects (ie. Pressing L).

org $C042EF
label_C042EF:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE4
	TCD
	PLA
	STA.b $1A
	ASL
	TAX
	LDA.l DATA_C3E148,X
	STA.b $18
	LDA.l DATA_C3E158,X
	STA.b $16
	LDA.w $9877
	CLC
	ADC.b $18
	STA.b $14
	LDA.w $987B
	CLC
	ADC.b $16
	STA.b $04
	LDA.w $5D58
	STA.b $12
	LDA.w #$0001
	STA.w $5D58
label_C04324:
	LDA.w #$7E9889
	STA.b $02
	LDX.b $02
	LDA.w $0000,X
	TAY
	LDX.b $04
	LDA.b $14
	JSL.l label_C05FF6
	STA.b $10
	CMP.w #$8000
	BCS.b label_C0434D
	ASL
	TAX
	LDA.w $2C9A,X
	STA.w $5D62
	LDA.b $10
	STA.w $5D64
	BRA.b label_C0439F

label_C0434D:
	LDA.b $1A
	STA.b $0E
	LDX.b $02
	LDA.w $0000,X
	TAY
	LDX.b $04
	LDA.b $14
	JSL.l label_C05CD7
	AND.w #$0082
	CMP.w #$0082
	BNE.b label_C0439F
	LDA.b $18
	BEQ.b label_C04380
	LDA.b $18
	AND.w #$8000
	BEQ.b label_C04377
	LDX.w #$FFF8
	BRA.b label_C0437A

label_C04377:
	LDX.w #$0008
label_C0437A:
	TXA
	CLC
	ADC.b $14
	STA.b $14
label_C04380:
	LDA.b $16
	BEQ.b label_C04324
	LDA.b $16
	AND.w #$8000
	BEQ.b label_C04390
	LDX.w #$FFF8
	BRA.b label_C04393

label_C04390:
	LDX.w #$0008
label_C04393:
	STX.b $02
	LDA.b $04
	CLC
	ADC.b $02
	STA.b $04
	JMP.w label_C04324

label_C0439F:
	LDA.b $12
	STA.w $5D58
	LDA.w $5D62
	BEQ.b label_C043B1
	LDA.w $5D62
	CMP.w #$FFFF
	BNE.b label_C043B7
label_C043B1:
	LDA.b $1A
	JSL.l label_C065C2
label_C043B7:
	LDA.w $5D62
	PLD
	RTS

label_C043BC:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w $987F
	AND.w #$FFFE
	TAY
	STY.b $10
	TYX
	STX.b $0E
	TXA
	JSR.w label_C042EF
	CMP.w #$FFFF
	BEQ.b label_C043E3
	CMP.w #$0000
	BEQ.b label_C043E3
	LDX.b $0E
	TXA
	BRA.b label_C04450

label_C043E3:
	LDX.b $0E
	TXA
	INC
	INC
	AND.w #$0007
	TAX
	STX.b $0E
	STX.w $987F
	TXA
	JSR.w label_C042EF
	CMP.w #$FFFF
	BEQ.b label_C04404
	CMP.w #$0000
	BEQ.b label_C04404
	LDX.b $0E
	TXA
	BRA.b label_C04450

label_C04404:
	LDX.b $0E
	TXA
	INC
	INC
	INC
	INC
	AND.w #$0007
	TAX
	STX.b $0E
	STX.w $987F
	TXA
	JSR.w label_C042EF
	CMP.w #$FFFF
	BEQ.b label_C04427
	CMP.w #$0000
	BEQ.b label_C04427
	LDX.b $0E
	TXA
	BRA.b label_C04450

label_C04427:
	LDX.b $0E
	TXA
	DEC
	DEC
	AND.w #$0007
	TAX
	STX.b $0E
	STX.w $987F
	TXA
	JSR.w label_C042EF
	CMP.w #$FFFF
	BEQ.b label_C04448
	CMP.w #$0000
	BEQ.b label_C04448
	LDX.b $0E
	TXA
	BRA.b label_C04450

label_C04448:
	LDY.b $10
	STY.w $987F
	LDA.w #$FFFF
label_C04450:
	PLD
	RTS

label_C04452:							; Note: Main entry
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w #$FFFF
	STA.w $5D62
	STA.w $5D64
	JSR.w label_C043BC
	STA.b $10
	CMP.w #$FFFF
	BEQ.b label_C04496
	LDX.w #$7E9889
	STX.b $0E
	LDA.w $0000,X
	ASL
	TAX
	LDA.b $10
	CMP.w $2AF6,X
	BEQ.b label_C04496
	STA.w $987F
	LDX.b $0E
	LDA.w $0000,X
	ASL
	TAX
	LDA.b $10
	STA.w $2AF6,X
	LDX.b $0E
	LDA.w $0000,X
	JSL.l label_C0A780
label_C04496:
	LDA.w $5D62
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to being able to move around. Putting an RTS here prevented me from moving Ness

label_C0449B:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFDA
	TCD
	STZ.w $9885
	LDA.w $5DA0
	BEQ.b label_C044AE
	JSR.w label_C02C89
label_C044AE:
	LDX.w #$9883
	STX.b $24
	LDA.w $0000,X
	JSL.l label_C0404F
	STA.b $02
	LDA.w $5D60
	BEQ.b label_C044E3
	LDX.w $5D60
	DEX
	STX.w $5D60
	BEQ.b label_C044DA
	LDY.w $9889
	LDX.w $987B
	LDA.w $9877
	JSL.l label_C05FF6
	JMP.w label_C0476B

label_C044DA:
	LDA.w #$FFFF
	STA.w $4DC2
	JMP.w label_C0476B

label_C044E3:
	LDA.b $02
	CMP.w #$FFFF
	BNE.b label_C044FA
	LDY.w $9889
	LDX.w $987B
	LDA.w $9877
	JSL.l label_C05FF6
	JMP.w label_C0476B

label_C044FA:
	LDX.b $24
	LDA.w $0000,X
	CMP.w #$000D
	BNE.b label_C0455B
	LDA.w $5DC4
	CMP.w #$0100
	BEQ.b label_C04514
	LDA.w $5DC4
	CMP.w #$0200
	BNE.b label_C0452B
label_C04514:
	LDA.b $02
	CMP.w #$0003
	BEQ.b label_C0451D
	BCS.b label_C04524
label_C0451D:
	LDA.w #$0001
	STA.b $02
	BRA.b label_C04544

label_C04524:
	LDA.w #$0005
	STA.b $02
	BRA.b label_C04544

label_C0452B:
	LDA.b $02
	DEC
	AND.w #$0007
	CMP.w #$0003
	BEQ.b label_C04538
	BCS.b label_C0453F
label_C04538:
	LDA.w #$0003
	STA.b $02
	BRA.b label_C04544

label_C0453F:
	LDA.w #$0007
	STA.b $02
label_C04544:
	LDA.b $02
	CMP.w #$0004
	BCS.b label_C04553
	LDA.w #$0002
	STA.w $987F
	BRA.b label_C04568

label_C04553:
	LDA.w #$0006
	STA.w $987F
	BRA.b label_C04568

label_C0455B:
	LDA.w $5D56
	AND.w #$0001
	BNE.b label_C04568
	LDA.b $02
	STA.w $987F
label_C04568:
	INC.w $2890
	LDX.w #$7E9885
	LDA.w $0000,X
	INC
	STA.w $0000,X
	LDA.w $9881
	STA.b $22
	LDA.w #$7E9875
	STA.b $20
	LDY.b $20
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $06
	STA.b $1C
	LDA.b $08
	STA.b $1E
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.w #$7E9879
	STA.b $1A
	LDY.b $1A
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.b $1C
	STA.b $06
	LDA.b $1E
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.b $22
	LDA.b $02
	JSR.w label_C02D8F
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.b $22
	LDA.b $02
	JSR.w label_C03017
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.w #$FFFF
	STA.w $5DA8
	LDA.w $5D56
	AND.w #$0002
	BNE.b label_C04662
	LDA.b $02
	STA.b $0E
	LDY.w $9889
	LDX.b $18
	LDA.b $14
	JSL.l label_C05B7B
	STA.b $04
	LDA.b $02
	CMP.w $5DA6
	BEQ.b label_C0467D
	LDY.b $20
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.b $22
	LDA.w $5DA6
	JSR.w label_C02D8F
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDY.b $1A
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.b $22
	LDA.w $5DA6
	JSR.w label_C03017
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	BRA.b label_C0467D

label_C04662:
	LDA.w $0081
	BNE.b label_C04678
	LDY.w $9889
	LDX.b $18
	LDA.b $14
	JSR.w label_C05FD1
	AND.w #$003F
	STA.b $04
	BRA.b label_C0467D

label_C04678:
	LDA.w #$0000
	STA.b $04
label_C0467D:
	LDA.b $04
	STA.w $9881
	LDA.w #$0001
	STA.b $02
	LDY.w $9889
	LDX.b $18
	LDA.b $14
	JSL.l label_C05FF6
	LDA.w $28CC
	CMP.w #$FFFF
	BEQ.b label_C0469F
	LDA.w #$0000
	STA.b $02
label_C0469F:
	LDA.b $04
	AND.w #$00C0
	BEQ.b label_C046AB
	LDA.w #$0000
	STA.b $02
label_C046AB:
	LDA.w $5DA8
	CMP.w #$FFFF
	BEQ.b label_C046C1
	LDX.w $5DAA
	LDA.w $5DA8
	JSL.l label_C07526
	STA.b $02
	BRA.b label_C046D1

label_C046C1:
	LDX.w $9883
	CPX.w #$0007
	BEQ.b label_C046CE
	CPX.w #$0008
	BNE.b label_C046D1
label_C046CE:
	STZ.w $9883
label_C046D1:
	LDA.b $02
	BEQ.b label_C046FB
	LDA.b $12
	STA.b $06
	LDA.b $14
	STA.b $08
	LDA.b $06
	STA.w $9875
	LDA.b $08
	STA.w $9877
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b $06
	STA.w $9879
	LDA.b $08
	STA.w $987B
	BRA.b label_C046FE

label_C046FB:
	STZ.w $9885
label_C046FE:
	LDA.w $0002
	AND.w #$00FF					; Optimization: Unnecessary AND
	AND.w #$0001
	BNE.b label_C04715
	LDA.w $5E3C
	BEQ.b label_C04715
	LDA.w #$0000
	JSL.l label_C073C0
label_C04715:
	LDA.w $0002
	AND.w #$00FF					; Optimization: Unnecessary AND
	AND.w #$0001
	BEQ.b label_C0472C
	LDA.w $5E4A
	BEQ.b label_C0472C
	LDA.w #$0001
	JSL.l label_C073C0
label_C0472C:
	LDX.w $9883
	CPX.w #$0007
	BEQ.b label_C04739
	CPX.w #$0008
	BNE.b label_C04746
label_C04739:
	LDA.w $5DA8
	ASL
	ASL
	ASL
	CLC
	ADC.w #$0008
	STA.w $9877
label_C04746:
	LDA.w $436C
	BEQ.b label_C0476B
	LDA.w $0065
	AND.w #$0040
	BEQ.b label_C0476B
	LDX.w #$7E9877
	LDA.w $0000,X
	AND.w #$FFF8
	STA.w $0000,X
	LDX.w #$7E987B
	LDA.w $0000,X
	AND.w #$FFF8
	STA.w $0000,X
label_C0476B:
	PLD
	RTS

;--------------------------------------------------------------------

label_C0476D:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w #$0000
	STA.b $04
	LDA.w $9E33
	ASL
	TAX
	LDY.w $0B8E,X
	LDA.w $0BCA,X
	STA.b $0E
	LDA.w $0C42,X
	STA.b $02
	LDA.w $0C7E,X
	TAX
	CPY.w $9877
	BNE.b label_C047A8
	LDA.b $0E
	CMP.w $987B
	BNE.b label_C047A8
	LDA.b $02
	CMP.w $9875
	BNE.b label_C047A8
	CPX.w $9879
	BEQ.b label_C047AD
label_C047A8:
	LDA.w #$0001
	STA.b $04
label_C047AD:
	STY.w $9877
	LDA.b $0E
	STA.w $987B
	LDA.b $02
	STA.w $9875
	STX.w $9879
	LDA.w $9E33
	ASL
	TAX
	LDA.w $2AF6,X
	STA.w $987F
	LDA.b $04
	STA.w $9885
	PLD
	RTS

;--------------------------------------------------------------------

org $C047CF
label_C047CF:

;--------------------------------------------------------------------

org $C048D3
label_C048D3:

;--------------------------------------------------------------------

org $C04A7B
label_C04A7B:
	REP.b #$31
	LDA.w $5D7A
	STA.w $98A5
	JSL.l label_C0D19B
	RTL

;--------------------------------------------------------------------

org $C04AAD
label_C04AAD:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDX.w $5D7C
	DEX
	STX.w $5D7C
	BNE.b label_C04AC1
	JMP.w label_C04B4D

label_C04AC1:
	LDA.w $9883
	JSL.l label_C0404F
	STA.b $04
	STA.b $10
	LDA.b $04
	CMP.w #$FFFF
	BNE.b label_C04AD6
	JMP.w label_C04B51

label_C04AD6:
	LDA.w #$0018
	STA.b $02
	BRA.b label_C04B3B

label_C04ADD:
	LDA.b $02
	ASL
	TAX
	LDA.w $0A62,X
	CMP.w #$FFFF
	BEQ.b label_C04B39
	TXA
	CLC
	ADC.w #$2AF6
	TAY
	STY.b $0E
	LDA.b $10
	STA.b $04
	LDA.w $0000,Y
	CMP.b $04
	BEQ.b label_C04B39
	LDA.w $0E9A,X
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	TAX
	STX.w $4DC6
	LDA.w $003D,X
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	CLC
	ADC.w #$5156
	TAX
	LDA.w $0006,X
	CMP.w #$0008
	BEQ.b label_C04B39
	CMP.w #$0007
	BEQ.b label_C04B39
	LDA.b $10
	STA.b $04
	LDY.b $0E
	STA.w $0000,Y
	LDA.b $02
	JSL.l label_C0A780
label_C04B39:
	INC.b $02
label_C04B3B:
	LDA.b $02
	CMP.w #$001D
	BCC.b label_C04ADD
	BEQ.b label_C04ADD
	LDA.b $10
	STA.b $04
	STA.w $987F
	BRA.b label_C04B51

label_C04B4D:
	JSL.l label_C04A7B
label_C04B51:
	PLD
	RTS

;--------------------------------------------------------------------

label_C04B53:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEC
	TCD
	LDX.w $9883
	STX.b $12
	CPX.w #$000D
	BEQ.b label_C04B6C
	LDA.w $987F
	STA.b $10
	BRA.b label_C04B71

label_C04B6C:
	LDA.w $5DCA
	STA.b $10
label_C04B71:
	LDA.w #$7E98A5
	STA.b $02
	LDX.b $02
	LDA.w $0000,X
	AND.w #$00FF
	CMP.w #$0001
	BEQ.b label_C04B96
	CMP.w #$0002
	BNE.b label_C04B8B
	JMP.w label_C04C3B

label_C04B8B:
	CMP.w #$0003
	BNE.b label_C04B93
	JMP.w label_C04C40

label_C04B93:
	JMP.w label_C04C43

label_C04B96:
	LDY.w #$7E9875
	STY.b $0E
	LDA.b $10
	ASL
	ASL
	STA.b $04
	LDX.b $12
	TXA
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $04
	STA.b $10
	CLC
	ADC.w #$4DD6
	TAY
	LDA.w $0000,Y
	STA.b $0A
	LDA.w $0002,Y
	STA.b $0C
	LDY.b $0E
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDY.w #$7E9879
	STY.b $12
	LDA.b $10
	CLC
	ADC.w #$4F96
	TAY
	LDA.w $0000,Y
	STA.b $0A
	LDA.w $0002,Y
	STA.b $0C
	LDY.b $12
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDX.w #$7E98A7
	LDA.w $0000,X
	DEC
	STA.w $0000,X
	BNE.b label_C04C33
	LDA.w #$0000
	LDX.b $02
	STA.w $0000,X
	LDA.w $98A9
	STA.w $9883
label_C04C33:
	LDA.w #$0001
	STA.w $9885
	BRA.b label_C04C43

label_C04C3B:
	JSR.w label_C0476D
	BRA.b label_C04C43

label_C04C40:
	JSR.w label_C04AAD
label_C04C43:
	PLD
	RTS

;--------------------------------------------------------------------

label_C04C45:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDX.w #$7E9885
	LDA.w $0000,X
	STA.b $14
	LDA.w #$0000
	STA.w $0000,X
	LDA.w $5D58
	BEQ.b label_C04C67
	JSL.l label_C07C5B
	DEC.w $5D58
label_C04C67:
	LDA.w $436C
	BEQ.b label_C04C82
	LDA.w $0065
	AND.w #$0040
	BEQ.b label_C04C82
	LDA.w $0002
	AND.w #$00FF				; Optimization: Unnecessary AND
	AND.w #$000F
	BEQ.b label_C04C82
	JMP.w label_C04D76

label_C04C82:
	LDA.w $9889
	ASL
	TAX
	LDA.w $0E9A,X
	ASL
	TAX
	LDA.w $4DC8,X
	TAX
	LDA.w $987D
	STA.w $003D,X
	LDA.w $98A5
	BEQ.b label_C04CA0
	JSR.w label_C04B53
	BRA.b label_C04CBE

label_C04CA0:
	LDA.w $9883
	CMP.w #$000C
	BEQ.b label_C04CAF
	CMP.w #$0003
	BEQ.b label_C04CB4
	BRA.b label_C04CBB

label_C04CAF:
	JSR.w label_C047CF
	BRA.b label_C04CBE

label_C04CB4:
	LDA.b $14
	JSR.w label_C048D3
	BRA.b label_C04CBE

label_C04CBB:
	JSR.w label_C0449B
label_C04CBE:
	LDA.w #$7E987D
	STA.b $14
	LDA.b ($14)
	STA.b $12
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	CLC
	ADC.w #$5156
	STA.b $10
	LDA.w #$7E9877
	STA.b $04
	LDA.w #$7E987B
	STA.b $02
	LDY.w $9889
	LDX.b $02
	LDA.w $0000,X
	TAX
	STX.b $0E
	LDX.b $04
	LDA.w $0000,X
	LDX.b $0E
	JSL.l label_C05F82
	STA.w $9881
	LDA.w $9885
	BEQ.b label_C04D30
	LDX.b $04
	LDA.w $0000,X
	STA.b ($10)
	LDX.b $02
	LDA.w $0000,X
	LDY.w #$0002
	STA.b ($10),Y
	LDA.b $12
	INC
	AND.w #$00FF
	STA.b ($14)
	LDX.b $02
	LDA.w $0000,X
	TAX
	STX.b $0E
	LDX.b $04
	LDA.w $0000,X
	LDX.b $0E
	JSL.l label_C0400E
	LDA.w #$0001
	STA.w $4DD4
	BRA.b label_C04D33

label_C04D30:
	STZ.w $4DD4
label_C04D33:
	LDX.w #$7E9881
	LDA.w $0000,X
	LDY.w #$0004
	STA.b ($10),Y
	LDA.w $9883
	LDY.w #$0006
	STA.b ($10),Y
	LDA.w $987F
	LDY.w #$0008
	STA.b ($10),Y
	LDY.w #$7E289C
	LDA.w #$0000
	STA.w $0000,Y
	LDA.w $0000,X
	STA.b $14
	AND.w #$0008
	BEQ.b label_C04D76
	LDA.b $14
	AND.w #$0004
	BEQ.b label_C04D70
	LDA.w #$0010
	STA.w $0000,Y
	BRA.b label_C04D76

label_C04D70:
	LDA.w #$0012
	STA.w $0000,Y
label_C04D76:
	PLD
	RTL

;--------------------------------------------------------------------

label_C04D78:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE2
	TCD
	LDA.w $98A5
	CMP.w #$0003
	BNE.b label_C04D8B
	JMP.w label_C04EEE

label_C04D8B:
	LDA.w $5D60
	BEQ.b label_C04D93
	JMP.w label_C04EEE

label_C04D93:
	LDA.w $4DBA
	BEQ.b label_C04D9B
	JMP.w label_C04EEE

label_C04D9B:
	LDA.w $4DC2
	BEQ.b label_C04DA3
	JMP.w label_C04EEE

label_C04DA3:
	LDA.w $1A42
	STA.b $04
	STA.b $1C
	LDA.b $04
	ASL
	TAX
	STX.b $1A
	LDA.w $0E5E,X
	STA.b $18
	LDA.w $0E9A,X
	ASL
	TAX
	LDY.w $4DC8,X
	STY.w $4DC6
	LDA.w $003D,Y
	STA.b $16
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	CLC
	ADC.w #$5156
	STA.b $14
	LDY.w #$0008
	LDA.b ($14),Y
	LDX.b $1A
	STA.w $2AF6,X
	LDY.w #$0004
	LDA.b ($14),Y
	STA.w $2BAA,X
	LDA.b $14
	CLC
	ADC.w #$0006
	STA.b $02
	LDY.w $1A42
	LDX.b $02
	LDA.w $0000,X
	TAX
	LDA.b $18
	JSL.l label_C07A56
	LDA.w $9885
	BNE.b label_C04E0D
	LDX.b $02
	LDA.w $0000,X
	CMP.w #$000C
	BEQ.b label_C04E0D
	JMP.w label_C04EEE

label_C04E0D:
	LDA.b $1C
	STA.b $04
	ASL
	TAX
	LDA.b ($14)
	STA.w $0B8E,X
	LDY.w #$0002
	LDA.b ($14),Y
	STA.w $0BCA,X
	LDX.w #$0000
	STX.b $1C
	LDA.w $988B
	AND.w #$00FF
	STA.b $02
	LDA.b $18
	INC
	CMP.b $02
	BEQ.b label_C04E87
	LDY.w #$0006
	LDA.b ($14),Y
	AND.w #$00FF
	CMP.w #$0007
	BEQ.b label_C04E52
	CMP.w #$0008
	BEQ.b label_C04E52
	CMP.w #$000C
	BEQ.b label_C04E59
	CMP.w #$000D
	BEQ.b label_C04E6C
	BRA.b label_C04E73

label_C04E52:
	LDA.w #$001E
	STA.b $12
	BRA.b label_C04E87

label_C04E59:
	LDA.w $9883
	BNE.b label_C04E65
	LDX.w #$0001
	STX.b $1C
	BRA.b label_C04E87

label_C04E65:
	LDA.w #$001E
	STA.b $12
	BRA.b label_C04E87

label_C04E6C:
	LDA.w #$0018
	STA.b $12
	BRA.b label_C04E87

label_C04E73:
	LDA.w $9887
	CMP.w #$0003
	BNE.b label_C04E82
	LDA.w #$0008
	STA.b $12
	BRA.b label_C04E87

label_C04E82:
	LDA.w #$000C
	STA.b $12
label_C04E87:
	LDA.w $1A42
	ASL
	TAX
	LDA.w $0E5E,X
	ASL
	TAX
	LDA.l DATA_C3E09A,X
	CLC
	ADC.b $12
	STA.b $10
	LDY.w #$0006
	LDA.b ($14),Y
	LDX.w $4DC6
	STA.w $0041,X
	LDA.w $988B
	AND.w #$00FF
	STA.b $02
	LDA.b $18
	INC
	CMP.b $02
	BEQ.b label_C04ECC
	LDX.b $1C
	BNE.b label_C04ECC
	LDA.w #$0002
	STA.b $0E
	LDY.b $16
	LDA.b $10
	TAX
	LDA.b $18
	JSL.l label_C03EC3
	STA.b $1A
	BRA.b label_C04EE3

label_C04ECC:
	LDA.b $16
	INC
	STA.b $1A
	LDA.w $1A42
	ASL
	CLC
	ADC.w #$1002
	TAX
	LDA.w $0000,X
	AND.w #$EFFF
	STA.w $0000,X
label_C04EE3:
	LDA.b $1A
	AND.w #$00FF
	LDX.w $4DC6
	STA.w $003D,X
label_C04EEE:
	PLD
	RTL

;--------------------------------------------------------------------

label_C04EF0:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w $1A42
	ASL
	TAY
	LDA.w $0E9A,Y
	ASL
	TAX
	LDA.w $4DC8,X
	TAX
	STX.w $4DC6
	LDA.w $003D,X
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	CLC
	ADC.w #$5156
	TAX
	STX.b $0E
	LDA.w $0008,X
	STA.w $2AF6,Y
	LDA.w $1A42
	ASL
	PHA
	LDA.w $0004,X
	PLX
	STA.w $2BAA,X
	LDY.w $1A42
	LDX.b $0E
	LDA.w $0006,X
	TAX
	STX.b $0E
	LDA.w $1A42
	ASL
	TAX
	LDA.w $0E5E,X
	LDX.b $0E
	JSL.l label_C07A56
	PLD
	RTL

;--------------------------------------------------------------------

org $C04F47
label_C04F47:
	REP.b #$31
	LDA.w $5D72
	STA.w $0200
	SEP.b #$20
	LDA.b #$17
	STA.w $001A
	REP.b #$20
	LDA.w #$0008
	JSL.l label_C0856B
	RTL

;--------------------------------------------------------------------

label_C04F60:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w $5D60
	BNE.b label_C04F9D
	LDA.w $4DBA
	BNE.b label_C04F9D
	LDA.w $0200
	STA.w $5D72
	LDA.w #$001F
	STA.w $0200
	SEP.b #$20
	STZ.w $001A
	REP.b #$20
	LDA.w #$0008
	JSL.l label_C0856B
	LDA.w #label_C04F47
	STA.b $0E
	LDA.w #label_C04F47>>16
	STA.b $10
	LDA.w #$0001
	JSL.l label_C0DBE6
label_C04F9D:
	PLD
	RTS

;--------------------------------------------------------------------

label_C04F9F:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TAY
	STY.b $10
	LDA.w $9891,Y
	AND.w #$00FF
	ASL
	TAX
	LDA.w $4DC8,X
	TAX
	STX.b $0E
	LDY.w #$0064
	LDA.w $000A,X
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	ASL
	JSL.l label_C0915B
	CMP.w $0045,X
	BCC.b label_C04FF4
	BEQ.b label_C04FF4
	LDY.b $10
	TYA
	ASL
	TAX
	LDA.w $5D8C,X
	BNE.b label_C04FE7
	LDX.b $0E
	LDA.w $0035,X
	INC
	JSL.l label_C1DBBB
label_C04FE7:
	LDY.b $10
	TYA
	ASL
	TAX
	LDA.w #$0001
	STA.w $5D8C,X
	BRA.b label_C04FFC

label_C04FF4:
	LDY.b $10
	TYA
	ASL
	TAX
	STZ.w $5D8C,X
label_C04FFC:
	PLD
	RTS

;--------------------------------------------------------------------

label_C04FFE:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE8
	TCD
	LDA.w $98A5
	CMP.w #$0002
	BNE.b label_C05014
	LDA.w #$0001
	JMP.w label_C051FE

label_C05014:
	LDA.w $5D98
	BEQ.b label_C0501F
	LDA.w #$0001
	JMP.w label_C051FE

label_C0501F:
	STZ.b $16
	STZ.b $14
	LDA.w #$0000
	STA.b $04
	STA.b $02
	STA.b $12
	JMP.w label_C051C0

label_C0502F:
	LDA.w $009C,X
	AND.w #$00FF
	ASL
	TAX
	LDA.w $4DC8,X
	STA.w $4DC6
	TAX
	LDA.w $000E,X
	AND.w #$00FF
	TAY
	STY.b $10
	CPY.w #$0001
	BNE.b label_C0504F
	JMP.w label_C051B6

label_C0504F:
	CPY.w #$0002
	BNE.b label_C05057
	JMP.w label_C051B6

label_C05057:
	CPY.w #$0005
	BNE.b label_C050A9
	LDA.b $02
	ASL
	CLC
	ADC.w #$5D66
	TAX
	LDA.w $0000,X
	BEQ.b label_C050A0
	DEC
	STA.w $0000,X
	BEQ.b label_C05072
	JMP.w label_C0513D

label_C05072:
	INC.b $04
	LDA.w $4DC6
	CLC
	ADC.w #$0045
	TAX
	LDA.w $0000,X
	SEC
	SBC.w #$000A
	STA.w $0000,X
	LDA.w $4DC6
	CLC
	ADC.w #$0047
	TAX
	LDA.w $0000,X
	SEC
	SBC.w #$000A
	STA.w $0000,X
	LDA.b $02
	JSR.w label_C04F9F
	JMP.w label_C0513D

label_C050A0:
	LDA.w #$0078
	STA.w $0000,X
	JMP.w label_C0513D

label_C050A9:
	CPY.w #$0004
	BCC.b label_C050B5
	CPY.w #$0007
	BCC.b label_C050C3
	BEQ.b label_C050C3
label_C050B5:
	LDA.w $9881
	AND.w #$000C
	CMP.w #$000C
	BEQ.b label_C050C3
	JMP.w label_C0513D

label_C050C3:
	LDA.b $02
	ASL
	CLC
	ADC.w #$5D66
	TAX
	LDA.w $0000,X
	BEQ.b label_C0512A
	DEC
	STA.w $0000,X
	BNE.b label_C0513D
	INC.b $04
	CPY.w #$0004
	BNE.b label_C05103
	LDA.w $4DC6
	CLC
	ADC.w #$0045
	TAX
	LDA.w $0000,X
	SEC
	SBC.w #$000A
	STA.w $0000,X
	LDA.w $4DC6
	CLC
	ADC.w #$0047
	TAX
	LDA.w $0000,X
	SEC
	SBC.w #$000A
	STA.w $0000,X
	BRA.b label_C05123

label_C05103:
	LDA.w $4DC6
	CLC
	ADC.w #$0045
	TAX
	LDA.w $0000,X
	DEC
	DEC
	STA.w $0000,X
	LDA.w $4DC6
	CLC
	ADC.w #$0047
	TAX
	LDA.w $0000,X
	DEC
	DEC
	STA.w $0000,X
label_C05123:
	LDA.b $02
	JSR.w label_C04F9F
	BRA.b label_C0513D

label_C0512A:
	CPY.w #$0004
	BNE.b label_C05137
	LDA.w #$0078
	STA.w $0000,X
	BRA.b label_C0513D

label_C05137:
	LDA.w #$00F0
	STA.w $0000,X
label_C0513D:
	LDX.w $4DC6
	LDA.w $0045,X
	CMP.w #$8000
	BEQ.b label_C0514A
	BCS.b label_C0514F
label_C0514A:
	CMP.w #$0000
	BNE.b label_C051AA
label_C0514F:
	LDY.b $10
	CPY.w #$0001
	BEQ.b label_C051B6
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C05170

label_C0515D:
	LDA.b $0E
	CLC
	ADC.w $4DC6
	TAX
	SEP.b #$20
	STZ.w $000E,X
	REP.b #$20
	LDA.b $0E
	INC
	STA.b $0E
label_C05170:
	STA.b $02
	LDA.w #$0006
	CLC
	SBC.b $02
	BVS.b label_C0517E
	BPL.b label_C0515D
	BRA.b label_C05180

label_C0517E:
	BMI.b label_C0515D
label_C05180:
	SEP.b #$20
	LDA.b #$01
	LDX.w $4DC6
	STA.w $000E,X
	LDX.w $4DC6
	REP.b #$20
	STZ.w $0047,X
	LDX.w $4DC6
	STZ.w $0045,X
	LDX.w $4DC6
	LDA.w $003B,X
	ASL
	TAX
	LDA.w #$0010
	STA.w $0F12,X
	INC.b $16
	BRA.b label_C051B6

label_C051AA:
	LDY.b $10
	CPY.w #$0002
	BEQ.b label_C051B6
	CLC
	ADC.b $14
	STA.b $14
label_C051B6:
	LDA.b $12
	STA.b $02
	INC.b $02
	LDA.b $02
	STA.b $12
label_C051C0:
	LDA.b $02
	CLC
	ADC.w #$97F5
	TAX
	LDA.w $0096,X
	AND.w #$00FF
	BEQ.b label_C051E2
	AND.w #$00FF
	CLC
	SBC.w #$0004
	BVC.b label_C051DD
	BMI.b label_C051E2
	JMP.w label_C0502F

label_C051DD:
	BPL.b label_C051E2
	JMP.w label_C0502F

label_C051E2:
	LDA.b $04
	BEQ.b label_C051E9
	JSR.w label_C04F60
label_C051E9:
	LDA.b $16
	BEQ.b label_C051FC
	STZ.w $4DC4
	JSL.l label_C034D6
	JSL.l label_C07B52
	JSL.l label_C09451
label_C051FC:
	LDA.b $14
label_C051FE:
	PLD
	RTL

;--------------------------------------------------------------------

label_C05200:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w $4DC2
	BEQ.b label_C05210
	JMP.w label_C052A8

label_C05210:
	LDA.w $9F6F
	BEQ.b label_C05223
	LDA.w $9F6B
	CMP.w #$FFFF
	BNE.b label_C0522F
	JSL.l label_C07716
	BRA.b label_C0522F

label_C05223:
	LDA.w $9F6B
	CMP.w #$FFFF
	BEQ.b label_C0522F
	JSL.l label_C0777A
label_C0522F:
	LDA.w $4472
	BEQ.b label_C05238
	JSL.l label_C00172
label_C05238:
	LDA.w $4474
	BEQ.b label_C05241
	JSL.l label_C0030F
label_C05241:
	LDA.w $9F2A
	BEQ.b label_C0524A
	JSL.l label_C48FC4
label_C0524A:
	JSL.l label_C04C45
	LDA.w $9877
	XBA
	AND.w #$00FF
	STA.b $0E
	LDA.w $987B
	XBA
	AND.w #$00FF
	TAX
	LDA.b $0E
	EOR.w $5D5C
	BNE.b label_C0526C
	TXA
	EOR.w $5D5E
	BEQ.b label_C0527C
label_C0526C:
	LDA.b $0E
	STA.w $5D5C
	STX.w $5D5E
	LDA.w $B549
	BEQ.b label_C0527C
	JSR.w label_C03C25
label_C0527C:
	LDA.w $9E54
	BNE.b label_C0528D
	LDA.w $98A5
	CMP.w #$0002
	BEQ.b label_C0528D
	JSL.l label_C0DCC6
label_C0528D:
	STZ.w $9F6F
	LDA.w $987F
	STA.w $5D76
	LDA.w $9889
	ASL
	STA.w $5D78
	LDA.w $9885
	BEQ.b label_C052A8
	LDA.w #$0001
	STA.w $0A34
label_C052A8:
	PLD
	RTL

;--------------------------------------------------------------------

org $C052D4
label_C052D4:

;--------------------------------------------------------------------

org $C054C9
label_C054C9:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STX.b $10
	STA.b $0E
	AND.w #$003F
	STA.b $02
	TXA
	AND.w #$003F
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.w $E000,X
	AND.w #$00FF
	TAY
	AND.w #$0010
	BEQ.b label_C05500
	LDA.b $0E
	STA.w $5DA8
	LDX.b $10
	STX.w $5DAA
label_C05500:
	TYA
	PLD
	RTS

;--------------------------------------------------------------------

label_C05503:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	TAY
	LDA.w $5DA4
	STA.b $14
	TXA
	ASL
	TAX
	LDA.l DATA_C42AA7,X
	STA.b $12
	LDA.w $5DAE
	LSR
	LSR
	LSR
	STA.b $04
	TYA
	LSR
	LSR
	LSR
	AND.w #$003F
	STA.b $02
	LDA.b $04
	AND.w #$003F
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.w $E000,X
	AND.w #$00FF
	STA.b $02
	LDA.b $14
	ORA.b $02
	STA.b $02
	STA.b $10
	TYA
	CLC
	ADC.w #$0007
	LSR
	LSR
	LSR
	TAX
	STX.b $14
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C05591

label_C0555E:
	TXA
	AND.w #$003F
	STA.b $02
	LDA.b $04
	AND.w #$003F
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.w $E000,X
	AND.w #$00FF
	PHA
	LDA.b $10
	STA.b $02
	PLY
	STY.b $02
	ORA.b $02
	STA.b $02
	STA.b $10
	LDX.b $14
	INX
	STX.b $14
	LDA.b $0E
	INC
	STA.b $0E
label_C05591:
	CMP.b $12
	BCC.b label_C0555E
	LDA.b $02
	STA.w $5DA4
	PLD
	RTS

;--------------------------------------------------------------------

label_C0559C:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STA.b $12
	LDY.w $5DA4
	TXA
	ASL
	TAX
	LDA.l DATA_C42AA7,X
	STA.b $04
	LDA.l DATA_C42AC9,X
	ASL
	ASL
	ASL
	CLC
	ADC.w $5DAE
	DEC
	LSR
	LSR
	LSR
	STA.b $02
	STA.b $10
	LDA.b $12
	LSR
	LSR
	LSR
	AND.w #$003F
	PHA
	LDA.b $02
	AND.w #$003F
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	PLX
	STX.b $02
	CLC
	ADC.b $02
	TAX
	LDA.w $E000,X
	AND.w #$00FF
	STA.b $02
	TYA
	ORA.b $02
	TAY
	LDA.b $12
	CLC
	ADC.w #$0007
	LSR
	LSR
	LSR
	TAX
	STX.b $12
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C05630

label_C05601:
	TXA
	AND.w #$003F
	PHA
	LDA.b $10
	STA.b $02
	AND.w #$003F
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	PLX
	STX.b $02
	CLC
	ADC.b $02
	TAX
	LDA.w $E000,X
	AND.w #$00FF
	STA.b $02
	TYA
	ORA.b $02
	TAY
	LDX.b $12
	INX
	STX.b $12
	LDA.b $0E
	INC
	STA.b $0E
label_C05630:
	CMP.b $04
	BCC.b label_C05601
	STY.w $5DA4
	PLD
	RTS

;--------------------------------------------------------------------

label_C05639:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	TAY
	TXA
	ASL
	TAX
	LDA.l DATA_C42AC9,X
	STA.b $14
	LDA.w $5DA4
	STA.b $12
	LDA.w $5DAC
	LSR
	LSR
	LSR
	STA.b $04
	AND.w #$003F
	STA.b $02
	TYA
	LSR
	LSR
	LSR
	AND.w #$003F
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.w $E000,X
	AND.w #$00FF
	STA.b $02
	LDA.b $12
	ORA.b $02
	STA.b $02
	STA.b $10
	TYA
	CLC
	ADC.w #$0007
	LSR
	LSR
	LSR
	TAX
	STX.b $12
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C056C5

label_C05692:
	LDA.b $04
	AND.w #$003F
	STA.b $02
	TXA
	AND.w #$003F
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.w $E000,X
	AND.w #$00FF
	PHA
	LDA.b $10
	STA.b $02
	PLY
	STY.b $02
	ORA.b $02
	STA.b $02
	STA.b $10
	LDX.b $12
	INX
	STX.b $12
	LDA.b $0E
	INC
	STA.b $0E
label_C056C5:
	CMP.b $14
	BCC.b label_C05692
	LDA.b $02
	STA.w $5DA4
	PLD
	RTS

;--------------------------------------------------------------------

label_C056D0:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STA.b $12
	LDY.w $5DA4
	TXA
	ASL
	TAX
	LDA.l DATA_C42AC9,X
	STA.b $04
	LDA.l DATA_C42AA7,X
	ASL
	ASL
	ASL
	CLC
	ADC.w $5DAC
	DEC
	LSR
	LSR
	LSR
	STA.b $02
	STA.b $10
	LDA.b $02
	AND.w #$003F
	STA.b $02
	LDA.b $12
	LSR
	LSR
	LSR
	AND.w #$003F
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.w $E000,X
	AND.w #$00FF
	STA.b $02
	TYA
	ORA.b $02
	TAY
	LDA.b $12
	CLC
	ADC.w #$0007
	LSR
	LSR
	LSR
	TAX
	STX.b $12
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C05760

label_C05733:
	LDA.b $10
	STA.b $02
	AND.w #$003F
	STA.b $02
	TXA
	AND.w #$003F
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.w $E000,X
	AND.w #$00FF
	STA.b $02
	TYA
	ORA.b $02
	TAY
	LDX.b $12
	INX
	STX.b $12
	LDA.b $0E
	INC
	STA.b $0E
label_C05760:
	CMP.b $04
	BCC.b label_C05733
	STY.w $5DA4
	PLD
	RTS

;--------------------------------------------------------------------

label_C05769:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	STA.b $04
	LDY.w #$0000
	STY.b $14
	STY.b $02
	LDA.b $02
	STA.b $12
	BRA.b label_C057D2

label_C05782:
	LDA.b $04
	AND.w #$0001
	BEQ.b label_C057C3
	TYA
	ASL
	STA.b $10
	TAX
	LDA.l DATA_C200C5,X
	CLC
	ADC.w $5DAE
	LSR
	LSR
	LSR
	TAX
	STX.b $0E
	LDA.b $10
	TAX
	LDA.l DATA_C200B9,X
	CLC
	ADC.w $5DAC
	LSR
	LSR
	LSR
	LDX.b $0E
	JSR.w label_C054C9
	STA.b $0E
	ORA.b $12
	STA.b $12
	LDA.b $0E
	AND.w #$00C0
	BEQ.b label_C057C3
	LDA.b $02
	ORA.w #$0040
	STA.b $02
label_C057C3:
	LDA.b $02
	LSR
	STA.b $02
	LDA.b $04
	LSR
	STA.b $04
	LDY.b $14
	INY
	STY.b $14
label_C057D2:
	CPY.w #$0006
	BCC.b label_C05782
	LDA.w $5DB4
	CMP.w #$0001
	BNE.b label_C057E4
	LDA.b $12
	STA.w $5DA4
label_C057E4:
	LDA.b $02
	PLD
	RTS

;--------------------------------------------------------------------

org $C057E8
label_C057E8:
	REP.b #$31
	STZ.w $5DA4
	INC.w $5DB4
	LDA.w #$0007
	JSR.w label_C05769
	STA.w $5DB6
	CMP.w #$0007
	BEQ.b label_C05803
	CMP.w #$0002
	BNE.b label_C05808
label_C05803:
	LDA.w #$FF00
	BRA.b label_C0583B

label_C05808:
	CMP.w #$0000
	BNE.b label_C05812
	LDA.w #$FFFF
	BRA.b label_C0583B

label_C05812:
	CMP.w #$0001
	BNE.b label_C0581C
	LDA.w #$0001
	BRA.b label_C0583B

label_C0581C:
	CMP.w #$0004
	BNE.b label_C05826
	LDA.w #$0007
	BRA.b label_C0583B

label_C05826:
	CMP.w #$0006
	BNE.b label_C05838
	LDA.w $5DAC
	AND.w #$0007
	BNE.b label_C05838
	LDA.w #$0007
	BRA.b label_C0583B

label_C05838:
	LDA.w #$FFFF
label_C0583B:
	RTS

;--------------------------------------------------------------------

org $C0583C
label_C0583C:
	REP.b #$31
	STZ.w $5DA4
	INC.w $5DB4
	LDA.w #$0038
	JSR.w label_C05769
	STA.w $5DB6
	CMP.w #$0007
	BEQ.b label_C05857
	CMP.w #$0010
	BNE.b label_C0585C
label_C05857:
	LDA.w #$FF00
	BRA.b label_C0588F

label_C0585C:
	CMP.w #$0000
	BNE.b label_C05866
	LDA.w #$FFFF
	BRA.b label_C0588F

label_C05866:
	CMP.w #$0008
	BNE.b label_C05870
	LDA.w #$0003
	BRA.b label_C0588F

label_C05870:
	CMP.w #$0020
	BNE.b label_C0587A
	LDA.w #$0005
	BRA.b label_C0588F

label_C0587A:
	CMP.w #$0030
	BNE.b label_C0588C
	LDA.w $5DAC
	AND.w #$0007
	BNE.b label_C0588C
	LDA.w #$0005
	BRA.b label_C0588F

label_C0588C:
	LDA.w #$FFFF
label_C0588F:
	RTS

;--------------------------------------------------------------------

org $C05890
label_C05890:

;--------------------------------------------------------------------

org $C059EF
label_C059EF:

;--------------------------------------------------------------------

org $C05B4E
label_C05B4E:

;--------------------------------------------------------------------

org $C05B7B
label_C05B7B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	STX.b $04
	TAY
	LDX.b $24
	STX.b $14
	STZ.w $5DB8
	STZ.w $5DB4
	STZ.w $5DA4
	LDA.b $14
	STA.w $5DA6
	LDA.b $14
	STA.w $5DA2
	STY.w $5DAC
	LDA.b $04
	STA.w $5DAE
	LDA.b $14
	BEQ.b label_C05BE6
	CMP.w #$0004
	BNE.b label_C05BB3
	JMP.w label_C05C2D

label_C05BB3:
	CMP.w #$0006
	BNE.b label_C05BBB
	JMP.w label_C05C73

label_C05BBB:
	CMP.w #$0002
	BNE.b label_C05BC3
	JMP.w label_C05C7C

label_C05BC3:
	CMP.w #$0007
	BNE.b label_C05BCB
	JMP.w label_C05C85

label_C05BCB:
	CMP.w #$0001
	BNE.b label_C05BD3
	JMP.w label_C05C85

label_C05BD3:
	CMP.w #$0005
	BNE.b label_C05BDB
	JMP.w label_C05C85

label_C05BDB:
	CMP.w #$0003
	BNE.b label_C05BE3
	JMP.w label_C05C85

label_C05BE3:
	JMP.w label_C05C9B

label_C05BE6:
	JSR.w label_C057E8
	STA.b $02
	STA.b $12
	LDA.b $02
	CMP.w #$FFFF
	BEQ.b label_C05BF7
	JMP.w label_C05C9B

label_C05BF7:
	LDX.w $5DA8
	STX.b $10
	LDA.w $5DAE
	AND.w #$0007
	CMP.w #$0005
	BCS.b label_C05C26
	DEC.w $5DAE
	DEC.w $5DAE
	DEC.w $5DAE
	DEC.w $5DAE
	JSR.w label_C057E8
	STA.b $0E
	AND.w #$FF00
	CMP.w #$FF00
	BEQ.b label_C05C26
	LDA.b $0E
	STA.b $02
	STA.b $12
label_C05C26:
	LDX.b $10
	STX.w $5DA8
	BRA.b label_C05C9B

label_C05C2D:
	JSR.w label_C0583C
	STA.b $02
	STA.b $12
	LDA.b $02
	CMP.w #$FFFF
	BNE.b label_C05C9B
	LDX.w $5DA8
	STX.b $10
	LDA.w $5DAE
	AND.w #$0007
	CMP.w #$0003
	BCC.b label_C05C6C
	BEQ.b label_C05C6C
	INC.w $5DAE
	INC.w $5DAE
	INC.w $5DAE
	INC.w $5DAE
	JSR.w label_C0583C
	STA.b $0E
	AND.w #$FF00
	CMP.w #$FF00
	BEQ.b label_C05C6C
	LDA.b $0E
	STA.b $02
	STA.b $12
label_C05C6C:
	LDX.b $10
	STX.w $5DA8
	BRA.b label_C05C9B

label_C05C73:
	JSR.w label_C05890
	STA.b $02
	STA.b $12
	BRA.b label_C05C9B

label_C05C7C:
	JSR.w label_C059EF
	STA.b $02
	STA.b $12
	BRA.b label_C05C9B

label_C05C85:
	LDA.b $14
	JSR.w label_C05B4E
	STA.b $02
	STA.b $12
	LDA.b $02
	CMP.w #$FF00
	BEQ.b label_C05C9B
	LDA.b $14
	STA.b $02
	STA.b $12
label_C05C9B:
	LDA.w $5D9A
	BEQ.b label_C05CA6
	LDA.w #$FFFF
	STA.w $5DA8
label_C05CA6:
	LDA.b $12
	STA.b $02
	CMP.w #$FFFF
	BEQ.b label_C05CB6
	LDA.b $02
	CMP.w #$FF00
	BNE.b label_C05CBB
label_C05CB6:
	LDA.w $5DA4
	BRA.b label_C05CD5

label_C05CBB:
	LDX.w #$0000
	LDA.b $02
	CMP.b $14
	BEQ.b label_C05CC7
	LDX.w #$0001
label_C05CC7:
	STX.w $5DB8
	LDA.b $02
	STA.w $5DA6
	LDA.w $5DA4
	AND.w #$003F
label_C05CD5:
	PLD
	RTL

;--------------------------------------------------------------------

label_C05CD7:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STX.b $04
	STA.b $12
	LDX.b $22
	STX.b $10
	STZ.w $5DA4
	TYA
	ASL
	TAX
	LDA.w $2B6E,X
	STA.b $02
	ASL
	STA.b $0E
	LDX.b $0E
	LDA.b $12
	SEC
	SBC.l DATA_C42A1F,X
	TAY
	STY.w $5DAC
	LDX.b $0E
	LDA.b $04
	SEC
	SBC.l DATA_C42A41,X
	LDX.b $0E
	CLC
	ADC.l DATA_C42AEB,X
	STA.b $0E
	STA.w $5DAE
	LDX.b $10
	TXA
	CMP.w #$0001
	BEQ.b label_C05D46
	CMP.w #$0000
	BEQ.b label_C05D4D
	CMP.w #$0003
	BEQ.b label_C05D57
	CMP.w #$0002
	BEQ.b label_C05D5D
	CMP.w #$0005
	BEQ.b label_C05D67
	CMP.w #$0004
	BEQ.b label_C05D6E
	CMP.w #$0007
	BEQ.b label_C05D78
	CMP.w #$0006
	BEQ.b label_C05D7E
	BRA.b label_C05D86

label_C05D46:
	LDX.b $02
	LDA.b $0E
	JSR.w label_C056D0
label_C05D4D:
	LDX.b $02
	LDA.w $5DAC
	JSR.w label_C05503
	BRA.b label_C05D86

label_C05D57:
	LDX.b $02
	TYA
	JSR.w label_C0559C
label_C05D5D:
	LDX.b $02
	LDA.w $5DAE
	JSR.w label_C056D0
	BRA.b label_C05D86

label_C05D67:
	LDX.b $02
	LDA.b $0E
	JSR.w label_C05639
label_C05D6E:
	LDX.b $02
	LDA.w $5DAC
	JSR.w label_C0559C
	BRA.b label_C05D86

label_C05D78:
	LDX.b $02
	TYA
	JSR.w label_C05503
label_C05D7E:
	LDX.b $02
	LDA.w $5DAE
	JSR.w label_C05639
label_C05D86:
	LDA.w $5DA4
	PLD
	RTL

;--------------------------------------------------------------------

org $C05DE7
label_C05DE7:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF2
	TCD
	PLA
	LDX.w #$0000
	AND.w #$000C
	BEQ.b label_C05E0A
	CMP.w #$0004
	BEQ.b label_C05E0F
	CMP.w #$0008
	BEQ.b label_C05E14
	CMP.w #$000C
	BEQ.b label_C05E14
	BRA.b label_C05E17

label_C05E0A:
	LDX.w #$0004
	BRA.b label_C05E17

label_C05E0F:
	LDX.w #$0002
	BRA.b label_C05E17

label_C05E14:
	LDX.w #$0001
label_C05E17:
	STX.b $02
	TYA
	LDY.w #$005E
	JSL.l label_C08FF7
	CLC
	ADC.w #$0020
	TAX
	LDA.l DATA_D59589,X
	AND.w #$00FF
	AND.b $02
	BEQ.b label_C05E36
	LDA.w #$0000
	BRA.b label_C05E39

label_C05E36:
	LDA.w #$0080
label_C05E39:
	PLD
	RTL

;--------------------------------------------------------------------

label_C05E3B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $10
	JSL.l label_C09EFF
	TAX
	BNE.b label_C05E53
	LDA.w #$FF00
	BRA.b label_C05E74

label_C05E53:
	LDA.b $10
	ASL
	STA.b $02
	LDX.b $02
	LDA.w $2AF6,X
	STA.b $0E
	LDA.b $10
	TAY
	LDX.w $284A
	LDA.w $2848
	JSL.l label_C05CD7
	AND.w #$00D0
	LDX.b $02
	STA.w $28DA,X
label_C05E74:
	PLD
	RTS

;--------------------------------------------------------------------

label_C05E76:
	REP.b #$31
	LDA.w $1A42
	JSR.w label_C05E3B
	AND.w #$00FF
	RTL

;--------------------------------------------------------------------

org $C05F33
label_C05F33:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STX.b $12
	STA.b $10
	TYA
	ASL
	TAX
	LDY.w $2B6E,X
	STY.b $0E
	STZ.w $5DA4
	TYA
	ASL
	STA.b $02
	LDX.b $02
	LDA.b $10
	SEC
	SBC.l DATA_C42A1F,X
	STA.w $5DAC
	LDX.b $12
	TXA
	LDX.b $02
	SEC
	SBC.l DATA_C42A41,X
	LDX.b $02
	CLC
	ADC.l DATA_C42AEB,X
	STA.w $5DAE
	TYX
	JSR.w label_C05639
	LDY.b $0E
	TYX
	LDA.w $5DAE
	JSR.w label_C056D0
	LDA.w $5DA4
	PLD
	RTL

;--------------------------------------------------------------------

label_C05F82:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STX.b $12
	STA.b $10
	STZ.w $5DA4
	TYA
	ASL
	TAX
	LDY.w $2B6E,X
	STY.b $0E
	TYA
	ASL
	STA.b $02
	LDX.b $12
	TXA
	LDX.b $02
	SEC
	SBC.l DATA_C42A41,X
	LDX.b $02
	CLC
	ADC.l DATA_C42AEB,X
	STA.w $5DAE
	LDX.b $02
	LDA.b $10
	SEC
	SBC.l DATA_C42A1F,X
	STA.w $5DAC
	TYX
	JSR.w label_C05503
	LDY.b $0E
	TYX
	LDA.w $5DAC
	JSR.w label_C0559C
	LDA.w $5DA4
	PLD
	RTL

;--------------------------------------------------------------------

label_C05FD1:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	STZ.w $5DA4
	TXA
	INC
	INC
	INC
	INC
	LSR
	LSR
	LSR
	TAX
	LDA.b $0E
	LSR
	LSR
	LSR
	JSR.w label_C054C9
	STA.w $5DA4
	PLD
	RTS

;--------------------------------------------------------------------

label_C05FF6:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE2
	TCD
	PLA
	STX.b $1C
	STA.b $02
	LDA.w #$FFFF
	STA.b $1A
	TYA
	ASL
	TAX
	LDA.w $332A,X
	BNE.b label_C06014
	JMP.w label_C06133

label_C06014:
	LDA.w $5D56
	AND.w #$0002
	BEQ.b label_C0601F
	JMP.w label_C06133

label_C0601F:
	LDA.w $9883
	CMP.w #$000C
	BNE.b label_C0602A
	JMP.w label_C06133

label_C0602A:
	LDA.w $0081
	BEQ.b label_C06032
	JMP.w label_C06133

label_C06032:
	LDA.w $2AF6,X
	CMP.w #$0002
	BEQ.b label_C0603F
	CMP.w #$0006
	BNE.b label_C0604E
label_C0603F:
	TYA
	ASL
	TAX
	LDA.w $33DE,X
	STA.b $18
	LDA.w $1A4A,X
	STA.b $04
	BRA.b label_C06058

label_C0604E:
	LDA.w $3366,X
	STA.b $18
	LDA.w $33A2,X
	STA.b $04
label_C06058:
	LDA.b $18
	PHA
	LDA.b $02
	PLY
	STY.b $02
	SEC
	SBC.b $02
	STA.b $16
	LDA.b $18
	ASL
	STA.b $14
	LDA.b $1C
	SEC
	SBC.b $04
	STA.b $1C
	LDA.w #$0000
	STA.b $02
	STA.b $12
	JMP.w label_C06129

label_C0607B:
	LDA.b $02
	ASL
	TAX
	LDA.w $0A62,X
	CMP.w #$FFFF
	BNE.b label_C0608A
	JMP.w label_C0611F

label_C0608A:
	LDA.w $289E,X
	CMP.w #$8000
	BNE.b label_C06095
	JMP.w label_C0611F

label_C06095:
	LDA.w $5D58
	BEQ.b label_C060A6
	LDA.w $2C9A,X
	INC
	CMP.w #$8001
	BCC.b label_C060A6
	JMP.w label_C0611F

label_C060A6:
	LDA.b $02
	ASL
	TAX
	LDA.w $332A,X
	BEQ.b label_C0611F
	LDA.w $2AF6,X
	CMP.w #$0002
	BEQ.b label_C060BC
	CMP.w #$0006
	BNE.b label_C060CA
label_C060BC:
	LDA.b $02
	ASL
	TAX
	LDY.w $33DE,X
	LDA.w $1A4A,X
	STA.b $10
	BRA.b label_C060D2

label_C060CA:
	LDY.w $3366,X
	LDA.w $33A2,X
	STA.b $10
label_C060D2:
	LDA.b $02
	ASL
	TAX
	LDA.b $10
	STA.b $02
	LDA.w $0BCA,X
	SEC
	SBC.b $02
	STA.b $0E
	SEC
	SBC.b $04
	CMP.b $1C
	BCS.b label_C0611F
	LDA.b $10
	CLC
	ADC.b $0E
	CMP.b $1C
	BCC.b label_C0611F
	BEQ.b label_C0611F
	STY.b $02
	LDA.w $0B8E,X
	SEC
	SBC.b $02
	STA.b $0E
	TYA
	ASL
	TAX
	LDA.b $0E
	SEC
	SBC.b $14
	CMP.b $16
	BCS.b label_C0611F
	STX.b $02
	LDA.b $0E
	CLC
	ADC.b $02
	CMP.b $16
	BCC.b label_C0611F
	BEQ.b label_C0611F
	LDA.b $12
	STA.b $02
	STA.b $1A
	BRA.b label_C06133

label_C0611F:
	LDA.b $12
	STA.b $02
	INC.b $02
	LDA.b $02
	STA.b $12
label_C06129:
	LDA.b $02
	CMP.w #$0017
	BEQ.b label_C06133
	JMP.w label_C0607B

label_C06133:
	LDA.b $1A
	STA.w $28CC
	LDA.b $1A
	PLD
	RTL

;--------------------------------------------------------------------

org $C064D4
label_C064D4:
	REP.b #$31
	STZ.w $5E04
	STZ.w $5E02
	LDA.w #$FFFF
	STA.w $5DC0
	RTL

;--------------------------------------------------------------------

org $C064E3
label_C064E3:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	LDA.b $1E
	STA.b $06
	LDA.b $20
	STA.b $08
	LDA.b $0E
	CMP.w $5DC0
	BEQ.b label_C06535
	LDA.w $5E04
	STA.b $04
	ASL
	ADC.b $04
	ASL
	TAX
	LDA.b $0E
	STA.w $5DEA,X
	LDA.w $5E04
	STA.b $04
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.w #$5DEC
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.w $5E04
	INC
	AND.w #$0003
	STA.w $5E04
	LDA.w #$0001
	STA.w $5D9A
label_C06535:
	PLD
	RTL

;--------------------------------------------------------------------

org $C06578
label_C06578:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STX.b $10
	STA.b $0E
	LDA.w $5E36
	ASL
	ASL
	TAX
	LDA.b $0E
	STA.w $5E06,X
	LDX.b $10
	PHX
	LDA.w $5E36
	ASL
	ASL
	TAX
	PLA
	STA.w $5E08,X
	INC.w $5E36
	PLD
	RTL

;--------------------------------------------------------------------

label_C065A3:
	REP.b #$31
	BRA.b label_C065BC

label_C065A7:
	LDA.w $5E36
	DEC
	STA.w $5E36
	ASL
	ASL
	TAY
	LDA.w $5E08,Y
	TAX
	LDA.w $5E06,Y
	JSL.l label_C46507
label_C065BC:
	LDA.w $5E36
	BNE.b label_C065A7
	RTL

;--------------------------------------------------------------------

label_C065C2:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $10
	ASL
	TAX
	LDA.w $9877
	LSR
	LSR
	LSR
	CLC
	ADC.l DATA_C3E230,X
	TAY
	STY.b $0E
	LDA.w $987B
	LSR
	LSR
	LSR
	CLC
	ADC.l DATA_C3E240,X
	STA.b $02
	LDA.b $10
	CMP.w #$0006
	BNE.b label_C065F5
	DEY
	STY.b $0E
label_C065F5:
	LDX.b $02
	TYA
	JSL.l label_C07477
	REP.b #$20
	AND.w #$00FF
	TAX
	CPX.w #$00FF
	BNE.b label_C06617
	LDX.b $02
	LDY.b $0E
	TYA
	INC
	JSL.l label_C07477
	REP.b #$20
	AND.w #$00FF
	TAX
label_C06617:
	CPX.w #$00FF
	BEQ.b label_C06660
	CPX.w #$0006
	BNE.b label_C06660
	LDA.w #EB_DoorDestinationTable
	STA.b $06
	LDA.w #EB_DoorDestinationTable>>16
	STA.b $08
	LDA.w $5DBC
	AND.w #$7FFF
	CLC
	ADC.b $06
	STA.b $06
	LDA.w $5DBE
	STA.w $5DDC
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.w $5DDE
	LDA.b $08
	STA.w $5DE0
	LDA.w #$FFFE
	STA.w $5D62
label_C06660:
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to screen transitions

label_C06662:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFDF
	TCD
	PLA
	TXY
	STY.b $1F
	STA.b $1D
	LDA.w #DATA_D01400
	STA.b $06
	LDA.w #DATA_D01400>>16
	STA.b $08
	LDA.b $1D
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	STA.b $19
	LDA.b $08
	STA.b $1B
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b [$0A]
	AND.w #$00FF
	STA.b $02
	CMP.w #$00FF
	BNE.b label_C066A8
	LDA.w #$0384
	STA.b $02
label_C066A8:
	SEP.b #$20
	LDY.w #$0004
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	ASL
	ASL
	TAX
	LDY.w #$0005
	LDA.b [$06],Y
	JSL.l label_C42631
	LDY.b $1F
	CPY.w #$0001
	BEQ.b label_C066CA
	JMP.w label_C067D2

label_C066CA:
	JSL.l label_C0943C
	LDA.w #$0002
	JSL.l label_C0DD2C
	SEP.b #$20
	LDY.w #$0001
	LDA.b [$06],Y
	STA.b $18
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C066FD
	SEP.b #$20
	LDY.w #$0002
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	TAX
	INX
	INX
	LDA.b $18
	AND.w #$00FF
	JSL.l label_C4A67E
label_C066FD:
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.w #$007E
	STA.b $14
	LDA.b $12
	STA.b $06
	LDA.b $14
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $19
	STA.b $06
	LDA.b $1B
	STA.b $08
	SEP.b #$20
	LDY.w #$0003
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	JSL.l label_C4954C
	LDX.w #$FFFF
	LDA.b $02
	JSL.l label_C496E7
	LDA.w #$0000
	STA.b $16
	BRA.b label_C06782

label_C06751:
	LDA.w $0030
	AND.w #$00FF
	BEQ.b label_C0675D
	JSL.l label_C08756
label_C0675D:
	JSL.l label_C426ED
	JSL.l label_C088B1
	JSL.l label_C4268A
	JSL.l label_C426C7
	JSL.l label_C09466
	JSL.l label_C08B26
	JSL.l label_C4A7B0
	JSL.l label_C08756
	LDA.b $16
	INC
	STA.b $16
label_C06782:
	CMP.b $02
	BCC.b label_C06751
	SEP.b #$20
	LDY.w #$0003
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	STA.b $02
	LDA.w #$0032
	CLC
	SBC.b $02
	BVC.b label_C067A0
	BPL.b label_C067A8
	BRA.b label_C067A2

label_C067A0:
	BMI.b label_C067A8
label_C067A2:
	JSL.l label_C08726
	BRA.b label_C067CB

label_C067A8:
	SEP.b #$20
	LDA.b #$FF
	STA.b $0E
	LDX.w #$0200
	REP.b #$20
	LDA.w #$0200
	JSL.l label_C08EFC
	LDA.w #$0018
	JSL.l label_C0856B
	JSL.l label_C08756
	LDA.w #$0001
	STA.w $4676
label_C067CB:
	JSL.l $C09451
	JMP.w label_C06897

label_C067D2:
	LDX.w #$0000
	SEP.b #$20
	LDY.w #$0003
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	STA.b $02
	LDA.w #$0032
	CLC
	SBC.b $02
	BVC.b label_C067EF
	BPL.b label_C067F4
	BRA.b label_C067F1

label_C067EF:
	BMI.b label_C067F4
label_C067F1:
	LDX.w #$0001
label_C067F4:
	TXY
	STY.b $1D
	BEQ.b label_C06803
	LDX.w #$0001
	TXA
	JSL.l label_C0886C
	BRA.b label_C06816

label_C06803:
	LDX.w #$FFFF
	SEP.b #$20
	LDY.w #$0008
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	JSL.l label_C496E7
label_C06816:
	SEP.b #$20
	LDY.w #$0009
	LDA.b [$06],Y
	STA.b $18
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C0683C
	SEP.b #$20
	LDY.w #$000A
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	TAX
	LDA.b $18
	AND.w #$00FF
	JSL.l $C4A67E
label_C0683C:
	LDA.w #$0000
	STA.b $16
	BRA.b label_C0687B

label_C06843:
	LDY.b $1D
	BNE.b label_C06857
	LDA.w $0030
	AND.w #$00FF
	BEQ.b label_C06853
	JSL.l label_C08756
label_C06853:
	JSL.l $C426ED
label_C06857:
	JSL.l label_C088B1
	JSL.l label_C09466
	JSL.l $C4A7B0
	JSL.l label_C08B26
	JSL.l label_C08756
	LDA.b $16
	CMP.w #$0001
	BNE.b label_C06876
	JSL.l $C0943C
label_C06876:
	LDA.b $16
	INC
	STA.b $16
label_C0687B:
	SEP.b #$20
	LDY.w #$0008
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	STA.b $02
	LDA.b $16
	CMP.b $02
	BCC.b label_C06843
	LDY.b $1D
	BNE.b label_C06897
	JSL.l $C49740
label_C06897:
	LDA.w $A97A
	CMP.w #$0004
	BCS.b label_C068A3
	JSL.l label_C2EAAA
label_C068A3:
	JSL.l $C09451
	STZ.w $5DAA
	STZ.w $5DA8
	PLD
	RTL

;--------------------------------------------------------------------

label_C068AF:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	LDA.w #DATA_D01400
	STA.b $06
	LDA.w #DATA_D01400>>16
	STA.b $08
	LDA.b $0E
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	CPX.w #$0000
	BNE.b label_C068E6
	SEP.b #$20
	LDY.w #$000B
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	BRA.b label_C068F2

label_C068E6:
	SEP.b #$20
	LDY.w #$0007
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
label_C068F2:
	PLD
	RTL

;--------------------------------------------------------------------

label_C068F4:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $10
	LDA.w $5DD8
	BEQ.b label_C06908
	JMP.w label_C069AD

label_C06908:
	LDA.b $10
	XBA
	AND.w #$00FF
	STA.b $02
	LDY.w #$0080
	TXA
	JSL.l label_C0915B
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.l DATA_DCD637,X
	AND.w #$00FF
	STA.b $10
	LDA.w #EB_DoorDestinationTable
	STA.b $0A
	LDA.w #EB_DoorDestinationTable>>16
	STA.b $0C
	LDA.b $10
	ASL
	TAX
	LDA.l DATA_CF58EF,X
	AND.w #$7FFF
	CLC
	ADC.b $0A
	STA.b $0A
label_C06944:
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b [$06]
	BEQ.b label_C0697A
	AND.w #$7FFF
	JSL.l label_C21628
	STA.b $0E
	LDX.w #$0000
	LDA.b [$06]
	CMP.w #$8000
	BCC.b label_C06968
	BEQ.b label_C06968
	LDX.w #$0001
label_C06968:
	STX.b $02
	LDA.b $0E
	CMP.b $02
	BEQ.b label_C0697A
	LDA.w #$0004
	CLC
	ADC.b $0A
	STA.b $0A
	BRA.b label_C06944

label_C0697A:
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.w $5E38
	LDA.b $08
	STA.w $5E3A
	SEP.b #$20
	LDY.w #$0002
	LDA.b [$0A],Y
	REP.b #$20
	AND.w #$00FF
	TAX
	STX.w $5DD6
	LDA.w $5DDA
	BNE.b label_C069AD
	CPX.w $5DD4
	BEQ.b label_C069AD
	LDA.w #$0002
	JSL.l label_C0AC0C
label_C069AD:
	PLD
	RTL

;--------------------------------------------------------------------

label_C069AF:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF2
	TCD
	LDA.w $5DD8
	BNE.b label_C069EB
	LDA.w $5E38
	STA.b $06
	LDA.w $5E3A
	STA.b $08
	LDA.w $5DD6
	CMP.w $5DD4
	BEQ.b label_C069EB
	LDA.w $5DD6
	STA.w $5DD4
	LDA.w $5DD6
	JSL.l label_C4FBBD
	SEP.b #$20
	LDY.w #$0003
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	JSL.l label_C0AC0C
label_C069EB:
	PLD
	RTL

;--------------------------------------------------------------------

org $C069F7
label_C069F7:
	REP.b #$31
	LDX.w $987B
	LDA.w $9877
	JSL.l label_C068F4
	LDA.w $5DD6
	RTL

;--------------------------------------------------------------------

label_C06A07:
	REP.b #$31
	LDX.w $987B
	LDA.w $9877
	JSL.l label_C068F4
	LDA.w $5DD6
	JSL.l label_C4FBBD
	RTL

;--------------------------------------------------------------------

label_C06A1B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	AND.w #$7FFF
	STA.b $14
	LDA.w #EB_DoorDestinationTable
	STA.b $0A
	LDA.w #EB_DoorDestinationTable>>16
	STA.b $0C
	LDA.b $14
	CLC
	ADC.b $0A
	STA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b [$06]
	AND.w #$7FFF
	JSL.l label_C21628
	TAX
	LDA.w #$0000
	STA.b $12
	LDA.b [$06]
	CMP.w #$8000
	BCC.b label_C06A5E
	BEQ.b label_C06A5E
	LDA.w #$0001
	STA.b $12
label_C06A5E:
	LDA.b $12
	STA.b $02
	TXA
	CMP.b $02
	BNE.b label_C06A89
	LDY.w #$0002
	LDA.b [$0A],Y
	PHA
	INY
	INY
	LDA.b [$0A],Y
	STA.b $08
	PLA
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0000
	JSL.l label_C064E3
	STZ.w $5DAA
	STZ.w $5DA8
label_C06A89:
	PLD
	RTS

;--------------------------------------------------------------------

label_C06A8B:
	REP.b #$31
	RTS

;--------------------------------------------------------------------

label_C06A8E:
	REP.b #$31
	RTS

;--------------------------------------------------------------------

label_C06A91:
	REP.b #$31
	TAY
	LDX.w #$9883
	LDA.w $0000,X
	CMP.w #$0007
	BEQ.b label_C06AC9
	CMP.w #$0008
	BEQ.b label_C06AC9
	CPY.w #$0000
	BNE.b label_C06AB1
	LDA.w #$0007
	STA.w $0000,X
	BRA.b label_C06AB7

label_C06AB1:
	LDA.w #$0008
	STA.w $0000,X
label_C06AB7:
	LDX.w #$7E987F
	LDA.w $0000,X
	AND.w #$FFFE
	STA.w $0000,X
	LDA.w #$FFFF
	STA.w $5DC4
label_C06AC9:
	RTS

;--------------------------------------------------------------------

label_C06ACA:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STA.b $12
	LDA.w $0A34
	BEQ.b label_C06B1F
	LDA.w $98A5
	CMP.w #$0002
	BEQ.b label_C06B1F
	LDA.w $5D9A
	BNE.b label_C06B1F
	LDA.w $4DBA
	ORA.w $5D60
	BNE.b label_C06B1F
	LDA.b $12
	AND.w #$7FFF
	STA.b $12
	LDA.w #$0001
	STA.w $5DC2
	LDA.w #EB_DoorDestinationTable
	STA.b $06
	LDA.w #EB_DoorDestinationTable>>16
	STA.b $08
	LDA.b $12
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0002
	JSL.l label_C064E3
	JSL.l label_C07C5B
label_C06B1F:
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to being after a screen transition? Possibly the delivery service stuff?

label_C06B21:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w #DATA_C5EA35
	STA.b $0E
	LDA.w #DATA_C5EA35>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
	JSL.l label_EF0EE8
	PLD
	RTL

;--------------------------------------------------------------------

label_C06B3D:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDX.w #$0000
	STX.b $14
	TXY
	STY.b $12
	BRA.b label_C06B84

label_C06B4F:
	JSL.l $C06537
	CMP.w #$000A
	BNE.b label_C06B75
	JSL.l $C0654E
	LDY.b $12
	TYA
	ASL
	ASL
	CLC
	ADC.w #$5E58
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDY.b $12
	INY
	STY.b $12
label_C06B75:
	LDA.w $5E02
	INC
	AND.w #$0003
	STA.w $5E02
	LDX.b $14
	INX
	STX.b $14
label_C06B84:
	STX.b $02
	LDA.w #$0004
	CLC
	SBC.b $02
	BVC.b label_C06B92
	BPL.b label_C06B9C
	BRA.b label_C06B94

label_C06B92:
	BMI.b label_C06B9C
label_C06B94:
	LDA.w $5E02
	CMP.w $5E04
	BNE.b label_C06B4F
label_C06B9C:
	LDA.w #$0000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	LDY.b $12
	TYA
	ASL
	ASL
	CLC
	ADC.w #$5E58
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDX.w #$0000
	STX.b $14
	BRA.b label_C06BD5

label_C06BC1:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$000A
	JSL.l $C064E3
	LDX.b $14
	INX
	STX.b $14
label_C06BD5:
	TXA
	ASL
	ASL
	CLC
	ADC.w #$5E58
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.w #$0000
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	LDA.b $08
	CMP.b $0C
	BNE.b label_C06BFB
	LDA.b $06
	CMP.b $0A
label_C06BFB:
	BNE.b label_C06BC1
	PLD
	RTL

;--------------------------------------------------------------------

label_C06BFF:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE6
	TCD
	LDA.b $28
	STA.b $0A
	LDA.b $2A
	STA.b $0C
	LDA.b $0A
	STA.b $16
	LDA.b $0C
	STA.b $18
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.w #$0000
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	LDA.b $08
	CMP.b $0C
	BNE.b label_C06C3F
	LDA.b $06
	CMP.b $0A
label_C06C3F:
	BEQ.b label_C06C4D
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l label_C10004
label_C06C4D:
	STZ.w $5DAA
	STZ.w $5DA8
	LDA.w #$0004
	LDX.b $16
	STX.b $0A
	LDX.b $18
	STX.b $0C
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	BEQ.b label_C06C95
	AND.w #$7FFF
	JSL.l label_C21628
	STA.b $14
	LDX.w #$0000
	LDA.b [$06]
	CMP.w #$8000
	BCC.b label_C06C87
	BEQ.b label_C06C87
	LDX.w #$0001
label_C06C87:
	STX.b $02
	LDA.b $14
	CMP.b $02
	BEQ.b label_C06C95
	STZ.w $5DC2
	JMP.w label_C06E00

label_C06C95:
	LDY.w #$0001
	STY.b $12
	BRA.b label_C06CA9

label_C06C9C:
	LDX.w #$0000
	TYA
	JSL.l label_C2165E
	LDY.b $12
	INY
	STY.b $12
label_C06CA9:
	CPY.w #$000A
	BCC.b label_C06C9C
	BEQ.b label_C06C9C
	JSL.l label_C06B3D
	JSL.l label_C07C5B
	LDA.w #$FFFF
	STA.w $B4A8
	STZ.w $5D58
	LDA.w #$000A
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDX.w #$0001
	LDA.b [$06]
	AND.w #$00FF
	JSL.l label_C068AF
	JSL.l label_C0ABE0
	LDA.w $B4B6
	BEQ.b label_C06CF0
	LDX.w #$0001
	TXA
	JSL.l label_C0887A
	BRA.b label_C06CFC

label_C06CF0:
	LDX.w #$0001
	LDA.b [$06]
	AND.w #$00FF
	JSL.l label_C06662
label_C06CFC:
	LDY.w #$0008
	LDA.b [$0A],Y
	ASL
	ASL
	ASL
	STA.b $02
	LDY.w #$0006
	LDA.b [$0A],Y
	STA.b $14
	AND.w #$3FFF
	ASL
	ASL
	ASL
	STA.b $04
	SEP.b #$20
	LDA.b #$0E
	SEP.b #$10
	TAY
	REP.b #$20
	LDA.b $14
	JSL.l label_C09251
	ASL
	REP.b #$10
	TAX
	LDA.l DATA_C3E1D8,X
	CMP.w #$0002
	BEQ.b label_C06D39
	LDA.b $02
	CLC
	ADC.w #$0008
	STA.b $02
label_C06D39:
	LDA.w $436C
	BEQ.b label_C06D65
	LDA.w $B559
	CMP.w #$0006
	BEQ.b label_C06D4E
	LDX.b $04
	LDA.b $02
	JSL.l label_C068F4
label_C06D4E:
	LDA.w $B567
	BNE.b label_C06D6D
	SEP.b #$20
	LDY.w #$000A
	LDA.b [$0A],Y
	REP.b #$20
	AND.w #$00FF
	JSL.l label_EFE895
	BRA.b label_C06D6D

label_C06D65:
	LDX.b $04
	LDA.b $02
	JSL.l label_C068F4
label_C06D6D:
	LDX.b $04
	LDA.b $02
	JSL.l label_C013F6
	STZ.w $2890
	STZ.w $9883
	SEP.b #$20
	LDA.b #$0E
	PHA
	REP.b #$20
	LDY.w #$0006
	LDA.b [$0A],Y
	SEP.b #$10
	PLY
	JSL.l label_C09251
	ASL
	REP.b #$10
	TAX
	LDA.l DATA_C3E1D8,X
	TAY
	LDX.b $04
	LDA.b $02
	JSL.l label_C03FA9
	LDA.w $436C
	BEQ.b label_C06DAD
	LDA.w $B567
	BNE.b label_C06DAD
	JSL.l label_EFE771
label_C06DAD:
	JSL.l label_C069AF
	JSL.l label_C065A3
	LDA.w #$000A
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDX.w #$0000
	LDA.b [$06]
	AND.w #$00FF
	JSL.l label_C068AF
	JSL.l label_C0ABE0
	LDA.w $B4B6
	BEQ.b label_C06DE4
	LDX.w #$0001
	TXA
	JSL.l label_C0886C
	BRA.b label_C06DF0

label_C06DE4:
	LDX.w #$0000
	LDA.b [$06]
	AND.w #$00FF
	JSL.l label_C06662
label_C06DF0:
	LDA.w #$FFFF
	STA.w $5DC4
	STZ.w $0A34
	JSL.l label_C06B21
	STZ.w $5DC2
label_C06E00:
	PLD
	RTS

;--------------------------------------------------------------------

org $C06E6E
label_C06E6E:

;--------------------------------------------------------------------

org $C070CB
label_C070CB:

;--------------------------------------------------------------------

; Note: Something related to selecting Continue on the file select

org $C07213
label_C07213:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF1
	TCD
	LDA.w #$0000
	STA.b $02
	JMP.w label_C072C1

label_C07223:
	LDA.b $02
	CLC
	ADC.w #$97F5
	TAY
	SEP.b #$20
	LDA.w $00C8,Y
	STA.b $0E
	REP.b #$20
	AND.w #$00FF
	BNE.b label_C0723B
	JMP.w label_C072BF

label_C0723B:
	LDA.b $02
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.w #$5E3C
	TAX
	LDA.w #DATA_D5F2FB
	STA.b $06
	LDA.w #DATA_D5F2FB>>16
	STA.b $08
	LDA.w $00CA,Y
	AND.w #$00FF
	ASL
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDA.b $0E
	AND.w #$00FF
	STA.w $0000,X
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b [$0A]
	ASL
	ASL
	ASL
	STA.w $0002,X
	LDY.w #$0004
	LDA.b [$06],Y
	ASL
	ASL
	ASL
	STA.w $0006,X
	LDY.w #$0002
	LDA.b [$06],Y
	ASL
	ASL
	ASL
	STA.w $0004,X
	LDY.w #$0006
	LDA.b [$06],Y
	ASL
	ASL
	ASL
	STA.w $0008,X
	LDA.b $02
	ASL
	ASL
	CLC
	ADC.w #$98C1
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	TXA
	CLC
	ADC.w #$000A
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
label_C072BF:
	INC.b $02
label_C072C1:
	LDA.b $02
	CMP.w #$0002
	BCS.b label_C072CD
	BEQ.b label_C072CD
	JMP.w label_C07223

label_C072CD:
	PLD
	RTL

;--------------------------------------------------------------------

org $C073C0
label_C073C0:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	STA.b $04
	STA.b $14
	LDA.w $5E04
	EOR.w $5E04
	BEQ.b label_C073D9
	JMP.w label_C07473

label_C073D9:
	LDA.w $9F3F
	BEQ.b label_C073E1
	JMP.w label_C07473

label_C073E1:
	LDA.b $04
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.w #$5E3C
	TAY
	LDA.w $0000,Y
	STA.b $12
	LDX.w $9877
	LDA.w $987B
	STA.b $02
	LDA.b $12
	CMP.w #$0001
	BNE.b label_C07425
	TXA
	CMP.w $0002,Y
	BCC.b label_C07443
	TXA
	CMP.w $0006,Y
	BEQ.b label_C07413
	BCS.b label_C07443
label_C07413:
	LDA.b $02
	CMP.w $0004,Y
	BCC.b label_C07443
	LDA.b $02
	CMP.w $0008,Y
	BEQ.b label_C07423
	BCS.b label_C07443
label_C07423:
	BRA.b label_C07473

label_C07425:
	TXA
	CMP.w $0002,Y
	BCC.b label_C07473
	BEQ.b label_C07473
	TXA
	CMP.w $0006,Y
	BCS.b label_C07473
	LDA.b $02
	CMP.w $0004,Y
	BCC.b label_C07473
	BEQ.b label_C07473
	LDA.b $02
	CMP.w $0008,Y
	BCS.b label_C07473
label_C07443:
	LDA.w #$0000
	STA.w $0000,Y
	TYA
	CLC
	ADC.w #$000A
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0009
	JSL.l label_C064E3
	LDA.b $14
	STA.b $04
	LDX.b $04
	SEP.b #$20
	STZ.w $98BD,X
label_C07473:
	REP #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C07477:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TXY
	STY.b $10
	STA.b $0E
	LDA.w #DATA_D00000
	STA.b $0A
	LDA.w #DATA_D00000>>16
	STA.b $0C
	LDA.b $0E
	LSR
	LSR
	LSR
	LSR
	LSR
	STA.b $02
	TYA
	AND.w #$FFE0
	CLC
	ADC.b $02
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b [$06]
	TAX
	BNE.b label_C074BE
	SEP.b #$20
	LDA.b #$FF
	BRA.b label_C07524

label_C074BE:
	INC.b $06
	INC.b $06
	LDA.b $0E
	AND.w #$001F
	STA.b $02
	LDY.b $10
	TYA
	AND.w #$001F
	STA.b $0E
	BRA.b label_C0751B

label_C074D3:
	SEP.b #$20
	LDY.w #$0001
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	CMP.b $02
	BNE.b label_C07512
	LDA.b $0E
	STA.b $04
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b [$0A]
	AND.w #$00FF
	CMP.b $04
	BNE.b label_C07512
	LDY.w #$0003
	LDA.b [$06],Y
	STA.w $5DBC
	INC.b $06
	INC.b $06
	LDA.b [$06]
	AND.w #$00FF
	STA.w $5DBE
	SEP.b #$20
	LDA.b [$06]
	BRA.b label_C07524

label_C07512:
	LDA.w #$0005
	CLC
	ADC.b $06
	STA.b $06
	DEX
label_C0751B:
	CPX.w #$0000
	BNE.b label_C074D3
	SEP.b #$20
	LDA.b #$FF
label_C07524:
	PLD
	RTL

;--------------------------------------------------------------------

label_C07526:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TXY
	STY.b $10
	STA.b $02
	TYX
	LDA.b $02
	JSL.l label_C07477
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C07568
	CMP.w #$0001
	BEQ.b label_C07577
	CMP.w #$0002
	BEQ.b label_C07586
	CMP.w #$0003
	BEQ.b label_C07595
	CMP.w #$0004
	BEQ.b label_C075A8
	CMP.w #$0005
	BEQ.b label_C075BB
	CMP.w #$0007
	BEQ.b label_C075BB
	CMP.w #$0006
	BEQ.b label_C075CA
	BRA.b label_C075D7

label_C07568:
	LDA.w $5DBC
	JSR.w label_C06A1B
	LDA.w #$0000
	STA.b $04
	STA.b $0E
	BRA.b label_C075D7

label_C07577:
	LDA.w $5DBC
	JSR.w label_C06A91
	LDA.w #$0001
	STA.b $04
	STA.b $0E
	BRA.b label_C075D7

label_C07586:
	LDA.w $5DBC
	JSR.w label_C06ACA
	LDA.w #$0000
	STA.b $04
	STA.b $0E
	BRA.b label_C075D7

label_C07595:
	LDY.b $10
	LDX.b $02
	LDA.w $5DBC
	JSR.w label_C06E6E
	LDA.w #$0000
	STA.b $04
	STA.b $0E
	BRA.b label_C075D7

label_C075A8:
	LDY.b $10
	LDX.b $02
	LDA.w $5DBC
	JSR.w label_C070CB
	LDA.w #$0001
	STA.b $04
	STA.b $0E
	BRA.b label_C075D7

label_C075BB:
	LDA.w $5DBC
	JSR.w label_C06A8B
	LDA.w #$0000
	STA.b $04
	STA.b $0E
	BRA.b label_C075D7

label_C075CA:
	LDA.w $5DBC
	JSR.w label_C06A8E
	LDA.w #$0000
	STA.b $04
	STA.b $0E
label_C075D7:
	LDA.b $0E
	STA.b $04
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to the intro cutscene?

label_C075DD:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEC
	TCD
	LDA.w $5E02
	STA.b $04
	ASL
	ADC.b $04
	ASL
	TAX
	LDA.w $5DEA,X
	STA.b $12
	TXA
	CLC
	ADC.w #$5DEC
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $12
	STA.w $5DC0
	LDA.w $5E02
	INC
	AND.w #$0003
	STA.w $5E02
	LDA.w $5D58
	AND.w #$FFFE
	STA.w $5D58
	JSL.l label_C07C5B
	LDA.b $12
	CMP.w #$0002
	BEQ.b label_C0763D
	CMP.w #$000A
	BEQ.b label_C0764A
	CMP.w #$0000
	BEQ.b label_C07677
	CMP.w #$0008
	BEQ.b label_C07677
	CMP.w #$0009
	BEQ.b label_C07677
	BRA.b label_C07683

label_C0763D:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C06BFF
	BRA.b label_C07683

label_C0764A:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l label_C10004
	LDA.w #DATA_C7D33E
	STA.b $0A
	LDA.w #DATA_C7D33E>>16
	STA.b $0C
	LDA.b $08
	CMP.b $0C
	BNE.b label_C0766A
	LDA.b $06
	CMP.b $0A
label_C0766A:
	BNE.b label_C07683
	LDA.w #$0697
	STA.w $9E54
	STZ.w $9E56
	BRA.b label_C07683

label_C07677:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l label_C10004
label_C07683:
	LDX.w #$0000
	LDA.w $5E02
	CMP.w $5E04
	BEQ.b label_C07691
	LDX.w #$0001
label_C07691:
	STX.w $5D9A
	LDA.w #$FFFF
	STA.w $5DC0
	PLD
	RTL

;--------------------------------------------------------------------

org $C07716
label_C07716:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w $9889
	ASL
	TAX
	LDA.w $10B6,X
	AND.w #$C000
	BNE.b label_C07778
	LDA.w $116A,X
	AND.w #$8000
	BNE.b label_C07778
	LDA.w $98A5
	CMP.w #$0002
	BEQ.b label_C07778
	STZ.b $0E
	STZ.b $10
	LDY.w #$FFFF
	LDX.w #$0312
	LDA.w #$0108
	JSL.l label_C01E49
	STA.w $9F6B
	ASL
	TAX
	LDA.w #$FFFF
	STA.w $10F2,X
	LDA.w $9F6B
	ASL
	TAX
	LDA.w #$FF00
	STA.w $0B52,X
	LDA.w $9F6B
	ASL
	TAX
	LDA.w #$FF00
	STA.w $0BCA,X
	LDA.w $9F6B
	ASL
	TAX
	LDA.w #$FF00
	STA.w $0B8E,X
label_C07778:
	PLD
	RTL

;--------------------------------------------------------------------

label_C0777A:
	REP.b #$31
	LDA.w $9F6B
	JSL.l label_C02140
	LDA.w #$FFFF
	STA.w $9F6B
	RTL

;--------------------------------------------------------------------

org $C0780F
label_C0780F:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STY.b $04
	STX.b $12
	STA.b $10
	LDY.w #$0000
	LDA.w $9F73
	STA.b $02
	LDA.b $10
	BNE.b label_C0783B
	LDA.w $B4B6
	BNE.b label_C0783B
	LDA.w $9F71
	BEQ.b label_C0783B
	LDA.w #$01B5
	JMP.w label_C079EA

label_C0783B:
	LDA.b $02
	CMP.w #$FFFF
	BEQ.b label_C07849
	LDA.b $02
	ASL
	TAX
	STZ.w $2E7A,X
label_C07849:
	LDA.w $9840
	AND.w #$00FF
	CMP.w #$0001
	BNE.b label_C07868
	LDA.w $9887
	CMP.w #$0003
	BEQ.b label_C07862
	LDA.w #$000D
	JMP.w label_C079EA

label_C07862:
	LDA.w #$0025
	JMP.w label_C079EA

label_C07868:
	LDX.b $04
	LDA.w $000E,X
	AND.w #$00FF
	CMP.w #$0001
	BEQ.b label_C07881
	CMP.w #$0002
	BEQ.b label_C07886
	CMP.w #$0004
	BEQ.b label_C0789A
	BRA.b label_C078B2

label_C07881:
	LDY.w #$0001
	BRA.b label_C078B2

label_C07886:
	LDA.w $9887
	CMP.w #$0003
	BEQ.b label_C07894
	LDA.w #$000C
	JMP.w label_C079EA

label_C07894:
	LDA.w #$0024
	JMP.w label_C079EA

label_C0789A:
	LDA.b $02
	CMP.w #$FFFF
	BEQ.b label_C078B2
	LDA.b $02
	ASL
	CLC
	ADC.w #$2E7A
	TAX
	LDA.w $0000,X
	ORA.w #$8000
	STA.w $0000,X
label_C078B2:
	LDX.b $04
	LDA.w $000F,X
	AND.w #$00FF
	CMP.w #$0001
	BEQ.b label_C078C6
	CMP.w #$0002
	BEQ.b label_C078E0
	BRA.b label_C078E3

label_C078C6:
	LDA.b $02
	CMP.w #$FFFF
	BEQ.b label_C078E3
	LDA.b $02
	ASL
	CLC
	ADC.w #$2E7A
	TAX
	LDA.w $0000,X
	ORA.w #$4000
	STA.w $0000,X
	BRA.b label_C078E3

label_C078E0:
	INC.w $9F6F
label_C078E3:
	LDA.w $9887
	CMP.w #$0006
	BEQ.b label_C078F2
	CMP.w #$0004
	BEQ.b label_C078F8
	BRA.b label_C07905

label_C078F2:
	LDA.w #$0007
	JMP.w label_C079EA

label_C078F8:
	LDX.b $04
	LDA.w $0035,X
	BNE.b label_C07905
	LDA.w #$0006
	JMP.w label_C079EA

label_C07905:
	CPY.w #$0000
	BNE.b label_C0793B
	LDA.b $12
	BEQ.b label_C07929
	CMP.w #$000C
	BEQ.b label_C07929
	CMP.w #$000D
	BEQ.b label_C07929
	CMP.w #$0004
	BEQ.b label_C0792E
	CMP.w #$0007
	BEQ.b label_C07933
	CMP.w #$0008
	BEQ.b label_C07938
	BRA.b label_C0793B

label_C07929:
	LDY.w #$0000
	BRA.b label_C0793B

label_C0792E:
	LDY.w #$0001
	BRA.b label_C0793B

label_C07933:
	LDY.w #$0002
	BRA.b label_C0793B

label_C07938:
	LDY.w #$0003
label_C0793B:
	LDX.w $9887
	CPX.w #$0003
	BNE.b label_C07950
	INY
	INY
	INY
	INY
	LDA.b $02
	ASL
	TAX
	STZ.w $2E7A,X
	BRA.b label_C07960

label_C07950:
	CPX.w #$0005
	BNE.b label_C07960
	CPY.w #$0000
	BNE.b label_C07960
	TYA
	CLC
	ADC.w #$0006
	TAY
label_C07960:
	LDA.w $9840
	AND.w #$00FF
	CMP.w #$0003
	BNE.b label_C07977
	LDA.b $02
	ASL
	TAX
	LDA.w #$0005
	STA.w $0F12,X
	BRA.b label_C079C1

label_C07977:
	LDX.b $04
	LDA.w $000E,X
	AND.w #$00FF
	CMP.w #$0001
	BNE.b label_C07990
	LDA.b $02
	ASL
	TAX
	LDA.w #$0010
	STA.w $0F12,X
	BRA.b label_C079C1

label_C07990:
	LDA.b $02
	ASL
	TAX
	LDA.w $2BAA,X
	STA.b $0E
	AND.w #$000C
	CMP.w #$000C
	BNE.b label_C079A9
	LDA.w #$0018
	STA.w $0F12,X
	BRA.b label_C079C1

label_C079A9:
	LDA.b $0E
	AND.w #$0008
	CMP.w #$0008
	BNE.b label_C079BB
	LDA.w #$0010
	STA.w $0F12,X
	BRA.b label_C079C1

label_C079BB:
	LDA.w #$0008
	STA.w $0F12,X
label_C079C1:
	LDX.b $04
	LDA.w $000E,X
	AND.w #$00FF
	CMP.w #$0003
	BNE.b label_C079D8
	LDA.b $02
	ASL
	TAX
	LDA.w #$0038
	STA.w $0F12,X
label_C079D8:
	TYA
	ASL
	STA.b $02
	LDA.b $10
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.l DATA_C3F2B5,X
label_C079EA:
	PLD
	RTL

;--------------------------------------------------------------------

org $C07A56
label_C07A56:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	STY.b $04
	STX.b $02
	STX.b $16
	STA.b $14
	LDA.b $04
	STA.w $9F73
	LDY.w $4DC6
	LDX.b $02
	LDA.b $14
	JSL.l label_C0780F
	STA.b $12
	CMP.w #$FFFF
	BNE.b label_C07A8B
	LDA.b $04
	ASL
	TAX
	LDA.b $12
	STA.w $10F2,X
	JMP.w label_C07B37

label_C07A8B:
	LDA.w #DATA_EF133F
	STA.b $0A
	LDA.w #DATA_EF133F>>16
	STA.b $0C
	LDA.b $12
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $04
	ASL
	TAX
	LDA.b $10
	STA.w $2A06,X
	LDA.b $0E
	CLC
	ADC.w #$0009
	STA.w $29CA,X
	LDY.w #$0008
	LDA.b [$0E],Y
	AND.w #$00FF
	STA.w $2A42,X
	LDA.b $02
	STA.w $2C22,X
	LDA.w $4DC6
	CLC
	ADC.w #$0037
	TAY
	LDA.w $0000,Y
	PHA
	LDA.b $02
	STA.w $00C0
	PLA
	STA.b $02
	LDA.w $00C0
	CMP.b $02
	BEQ.b label_C07B05
	LDA.b $16
	STA.b $02
	STA.w $0000,Y
	TXA
	CLC
	ADC.w #$1002
	TAX
	LDA.w $0000,X
	ORA.w #$8000
	STA.w $0000,X
label_C07B05:
	LDA.w $9885
	BEQ.b label_C07B26
	LDA.b $16
	STA.b $02
	CMP.w #$000C
	BEQ.b label_C07B26
	LDA.b $04
	ASL
	CLC
	ADC.w #$1002
	TAX
	LDA.w $0000,X
	AND.w #$1FFF
	STA.w $0000,X
	BRA.b label_C07B37

label_C07B26:
	LDA.b $04
	ASL
	CLC
	ADC.w #$1002
	TAX
	LDA.w $0000,X
	ORA.w #$6000
	STA.w $0000,X
label_C07B37:
	LDA.w $98A5
	CMP.w #$0002
	BNE.b label_C07B50
	LDA.b $04
	ASL
	CLC
	ADC.w #$1002
	TAX
	LDA.w $0000,X
	ORA.w #$1000
	STA.w $0000,X
label_C07B50:
	PLD
	RTL

;--------------------------------------------------------------------

label_C07B52:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDA.w $9A0B
	STA.b $14
	LDA.w #$0018
	STA.b $12
	JMP.w label_C07C4D

label_C07B67:
	LDA.b $12
	ASL
	STA.b $04
	STA.b $10
	LDX.b $04
	LDA.w $0A62,X
	CMP.w #$FFFF
	BNE.b label_C07B7B
	JMP.w label_C07C4B

label_C07B7B:
	LDA.b $04
	CLC
	ADC.w #$10B6
	TAX
	LDA.w $0000,X
	ORA.w #$C000
	STA.w $0000,X
	LDX.b $04
	LDA.w $0E9A,X
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	TAX
	STX.w $4DC6
	LDA.w $9889
	CMP.b $12
	BEQ.b label_C07BAD
	LDA.w $003D,X
	CMP.b $14
	BNE.b label_C07BE9
label_C07BAD:
	LDA.b $12
	ASL
	STA.b $02
	LDY.b $12
	LDX.w $9883
	STX.b $0E
	LDX.b $02
	LDA.w $0E5E,X
	LDX.b $0E
	JSL.l label_C07A56
	LDA.w $9877
	LDX.b $02
	STA.w $0B8E,X
	LDA.w $987B
	LDX.b $02
	STA.w $0BCA,X
	LDA.w $98A3
	AND.w #$00FF
	CMP.w #$0001
	BEQ.b label_C07C2D
	LDA.w $987F
	LDX.b $02
	STA.w $2AF6,X
	BRA.b label_C07C2D

label_C07BE9:
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	CLC
	ADC.w #$5156
	STA.b $02
	LDY.b $12
	LDX.b $02
	LDA.w $0006,X
	TAX
	STX.b $0E
	LDA.b $10
	STA.b $04
	LDX.b $04
	LDA.w $0E5E,X
	LDX.b $0E
	JSL.l label_C07A56
	LDX.b $02
	LDA.w $0000,X
	LDX.b $04
	STA.w $0B8E,X
	LDX.b $02
	LDA.w $0002,X
	LDX.b $04
	STA.w $0BCA,X
	LDX.b $02
	LDA.w $0008,X
	LDX.b $04
	STA.w $2AF6,X
label_C07C2D:
	LDA.b $12
	ASL
	TAX
	LDA.w $0B8E,X
	SEC
	SBC.w $0031
	STA.w $0B16,X
	LDA.w $0BCA,X
	SEC
	SBC.w $0033
	STA.w $0B52,X
	LDA.b $12
	JSL.l label_C0A780
label_C07C4B:
	INC.b $12
label_C07C4D:
	LDA.b $12
	CMP.w #$001E
	BCS.b label_C07C59
	BEQ.b label_C07C59
	JMP.w label_C07B67

label_C07C59:
	PLD
	RTL

;--------------------------------------------------------------------

label_C07C5B:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w $5D58
	BEQ.b label_C07C88
	LDA.w #$0018
	STA.b $0E
	BRA.b label_C07C83

label_C07C6F:
	ASL
	CLC
	ADC.w #$116A
	TAX
	LDA.w $0000,X
	AND.w #$7FFF
	STA.w $0000,X
	LDA.b $0E
	INC
	STA.b $0E
label_C07C83:
	CMP.w #$001E
	BCC.b label_C07C6F
label_C07C88:
	PLD
	RTL

;--------------------------------------------------------------------

	%FREE_BYTES(NULLROM, 740, $00)						; $C07D1C

;--------------------------------------------------------------------

org $C08000
label_C08000:
	STZ.w !REGISTER_IRQNMIAndJoypadEnableFlags
	STZ.b $00
	LDX.b #$00
	LDY.b #$01
	REP.b #$30
	LDA.w #$1FFE
	MVN $00,$00
	TXS
	LDA.w #$1F00
	TCD
	SEP.b #$20
	LDA.b #$80
	STA.w !REGISTER_ScreenDisplayRegister
	STA.w $000D
	STZ.w !REGISTER_OAMSizeAndDataAreaDesignation
	STZ.w !REGISTER_OAMAddressLo
	STZ.w !REGISTER_OAMAddressHi
	STZ.w !REGISTER_BGModeAndTileSizeSetting
	STZ.w !REGISTER_MosaicSizeAndBGEnable
	STZ.w !REGISTER_BG1AddressAndSize
	STZ.w !REGISTER_BG2AddressAndSize
	STZ.w !REGISTER_BG3AddressAndSize
	STZ.w !REGISTER_BG4AddressAndSize
	STZ.w !REGISTER_BG1And2TileDataDesignation
	STZ.w !REGISTER_BG3And4TileDataDesignation
	STZ.w !REGISTER_BG1HorizScrollOffset
	STZ.w !REGISTER_BG1HorizScrollOffset
	STZ.w !REGISTER_BG1VertScrollOffset
	STZ.w !REGISTER_BG1VertScrollOffset
	STZ.w !REGISTER_BG2HorizScrollOffset
	STZ.w !REGISTER_BG2HorizScrollOffset
	STZ.w !REGISTER_BG2VertScrollOffset
	STZ.w !REGISTER_BG2VertScrollOffset
	STZ.w !REGISTER_BG3HorizScrollOffset
	STZ.w !REGISTER_BG3HorizScrollOffset
	STZ.w !REGISTER_BG3VertScrollOffset
	STZ.w !REGISTER_BG3VertScrollOffset
	STZ.w !REGISTER_BG4HorizScrollOffset
	STZ.w !REGISTER_BG4HorizScrollOffset
	STZ.w !REGISTER_BG4VertScrollOffset
	STZ.w !REGISTER_BG4VertScrollOffset
	LDA.b #$80
	STA.w !REGISTER_VRAMAddressIncrementValue
	STZ.w !REGISTER_VRAMAddressLo
	STZ.w !REGISTER_VRAMAddressHi
	STZ.w !REGISTER_Mode7TilemapSettings
	STZ.w !REGISTER_Mode7MatrixParameterA
	LDA.b #$01
	STA.w !REGISTER_Mode7MatrixParameterA
	STZ.w !REGISTER_Mode7MatrixParameterB
	STZ.w !REGISTER_Mode7MatrixParameterB
	STZ.w !REGISTER_Mode7MatrixParameterC
	STZ.w !REGISTER_Mode7MatrixParameterC
	STZ.w !REGISTER_Mode7MatrixParameterD
	STA.w !REGISTER_Mode7MatrixParameterD
	STZ.w !REGISTER_Mode7CenterX
	STZ.w !REGISTER_Mode7CenterX
	STZ.w !REGISTER_Mode7CenterY
	STZ.w !REGISTER_Mode7CenterY
	STZ.w !REGISTER_CGRAMAddress
	STZ.w !REGISTER_BG1And2WindowMaskSettings
	STZ.w !REGISTER_BG3And4WindowMaskSettings
	STZ.w !REGISTER_ObjectAndColorWindowSettings
	STZ.w !REGISTER_Window1LeftPositionDesignation
	STZ.w !REGISTER_Window1RightPositionDesignation
	STZ.w !REGISTER_Window2LeftPositionDesignation
	STZ.w !REGISTER_Window2RightPositionDesignation
	STZ.w !REGISTER_BGWindowLogicSettings
	STZ.w !REGISTER_ColorAndObjectWindowLogicSettings
	LDA.b #$1F
	STA.w !REGISTER_MainScreenLayers
	STZ.w !REGISTER_SubScreenLayers
	STZ.w !REGISTER_MainScreenWindowMask
	STZ.w !REGISTER_SubScreenWindowMask
	STZ.w !REGISTER_ColorMathInitialSettings
	STZ.w !REGISTER_ColorMathSelectAndEnable
	LDA.b #$E0
	STA.w !REGISTER_FixedColorData
	STZ.w !REGISTER_InitialScreenSettings
	LDA.b #$FF
	STA.w !REGISTER_Multiplicand
	STZ.w !REGISTER_Multiplicand
	STZ.w !REGISTER_Multiplier
	STZ.w !REGISTER_DividendLo
	STZ.w !REGISTER_DividendHi
	STZ.w !REGISTER_Divisor
	STZ.w !REGISTER_HCountTimerLo
	STZ.w !REGISTER_HCountTimerHi
	STZ.w !REGISTER_VCountTimerLo
	STZ.w !REGISTER_VCountTimerHi
	STZ.w !REGISTER_DMAEnable
	STZ.w !REGISTER_HDMAEnable
	LDA.b #$01
	STA.w !REGISTER_EnableFastROM
	REP.b #$30
	LDA.w #$DFFF
	MVN $7E,$7E
	LDA.w #$2000
	STA.w $00A1
	STA.w $00A3
	LDA.w #$FFFF
	STA.w $2402
	LDA.w #$1234
	STA.w $0024
	LDA.w #$5678
	STA.w $0026
	LDA.w #$0001
	STA.w $002E
	LDA.w #$851B
	STA.w $0020
	JSL.l label_008B19
	JML.l label_C0B99A

EB_InitAndMainLoop_Main:
	CLC
	XCE
	JML.l label_C08000

EB_VBlankRoutine_Main:
	JML.l label_C08170

EB_IRQRoutine_Main:
	JML.l label_C0814F

label_C0814F:
	PHP
	REP.b #$30
	PHA
	PHX
	PHY
	PHD
	PEA.w $0000
	PLD
	PHB
	PEA.w $0000
	PLB
	PLB
	SEP.b #$20
	LDA.w !REGISTER_IRQEnable
	BMI.b label_C08183
	REP.b #$30
	PLB
	PLD
	PLY
	PLX
	PLA
	PLP
	RTI

label_C08170:
	PHP
	REP.b #$30
	PHA
	PHX
	PHY
	PHD
	PEA.w $0000
	PLD
	PHB
	PEA.w $0000
	PLB
	PLB
	SEP.b #$20
label_C08183:
	LDA.w !REGISTER_NMIEnable
	STZ.w !REGISTER_HDMAEnable
	LDA.b #$80
	STA.w !REGISTER_ScreenDisplayRegister
	INC.b $2B
	INC.b $02
	REP.b #$20
	SEP.b #$10
	LDX.b $2C
	BEQ.b label_C081C8
	LDY.b #$00
	STZ.w !REGISTER_OAMAddressLo
	STY.w DMA[$00].Parameters
	STY.w DMA[$00].SourceBank
	LDY.b #!REGISTER_OAMDataWritePort
	STY.w DMA[$00].Destination
	LDA.w #!RAM_EB_Global_OAMBuffer1
	LDX.b $2C
	DEX
	BEQ.b label_C081B5
	LDA.w #!RAM_EB_Global_OAMBuffer2
label_C081B5:
	STA.w DMA[$00].SourceLo
	LDA.w #$0220
	STA.w DMA[$00].SizeLo
	LDY.b #$01
	STY.w !REGISTER_DMAEnable
	CLC
	ADC.b $99
	STA.b $99
label_C081C8:
	LDX.w $0030
	BEQ.b label_C081F7
	LDA.w DATA_C08F98-$04,X
	STA.w DMA[$00].SourceLo
	LDY.w DATA_C08F98-$02,X
	STY.w !REGISTER_CGRAMAddress
	LDA.w #$2200
	STA.w DMA[$00].Parameters
	LDY.b #$00
	STY.w DMA[$00].SourceBank
	STY.w $0030
	LDA.w DATA_C08F98-$06,X
	STA.w DMA[$00].SizeLo
	LDY.b #$01
	STY.w !REGISTER_DMAEnable
	CLC
	ADC.b $99
	STA.b $99
label_C081F7:
	SEP.b #$20
	LDA.b $28
	BEQ.b label_C0821F
	DEC.b $2A
	BPL.b label_C0821F
	LDA.b $29
	STA.b $2A
	LDA.b $0D
	AND.b #$0F
	CLC
	ADC.b $28
	BPL.b label_C08215
	STZ.w $001F
	LDA.b #$80
	BRA.b label_C0821B

label_C08215:
	CMP.b #$10
	BCC.b label_C0821D
	LDA.b #$0F
label_C0821B:
	STZ.b $28
label_C0821D:
	STA.b $0D
label_C0821F:
	REP.b #$10
	LDA.b $0D
	STA.w !REGISTER_ScreenDisplayRegister
	LDA.b $10
	STA.w !REGISTER_MosaicSizeAndBGEnable
	LDY.b $15
	STY.w !REGISTER_BG1And2TileDataDesignation
	LDY.b $17
	LDY.w #$00FF
	STY.w !REGISTER_Window2LeftPositionDesignation
	REP.b #$20
	SEP.b #$10
	LDX.b $01
	BRA.b label_C08272

label_C08240:
	LDY.w EB_DMAToVRAMUpdateTable[$00].ParameterIndex,X
	LDA.w DATA_C08FB0,Y
	STA.w DMA[$00].Parameters
	LDA.w DATA_C08FB0+$02,Y
	STA.w !REGISTER_VRAMAddressIncrementValue
	LDA.w EB_DMAToVRAMUpdateTable[$00].SizeLo,X
	STA.w DMA[$00].SizeLo
	LDA.w EB_DMAToVRAMUpdateTable[$00].SourceLo,X
	STA.w DMA[$00].SourceLo
	LDY.w EB_DMAToVRAMUpdateTable[$00].SourceBank,X
	STY.w DMA[$00].SourceBank
	LDA.w EB_DMAToVRAMUpdateTable[$00].VRAMAddressLo,X
	STA.w !REGISTER_VRAMAddressLo
	TXA
	CLC
	ADC.w #$0008
	TAX
	LDY.b #$01
	STY.w !REGISTER_DMAEnable
label_C08272:
	CPX.b $00
	BNE.b label_C08240
	STX.b $01
	SEP.b #$20
	LDA.b $2C
	BNE.b label_C08281
	JMP.w label_C08334

label_C08281:
	DEC
	BNE.b label_C082D6
	LDA.b $41
	STA.w !REGISTER_BG1HorizScrollOffset
	LDA.b $42
	STA.w !REGISTER_BG1HorizScrollOffset
	LDA.b $45
	STA.w !REGISTER_BG1VertScrollOffset
	LDA.b $46
	STA.w !REGISTER_BG1VertScrollOffset
	LDA.b $49
	STA.w !REGISTER_BG2HorizScrollOffset
	LDA.b $4A
	STA.w !REGISTER_BG2HorizScrollOffset
	LDA.b $4D
	STA.w !REGISTER_BG2VertScrollOffset
	LDA.b $4E
	STA.w !REGISTER_BG2VertScrollOffset
	LDA.b $51
	STA.w !REGISTER_BG3HorizScrollOffset
	LDA.b $52
	STA.w !REGISTER_BG3HorizScrollOffset
	LDA.b $55
	STA.w !REGISTER_BG3VertScrollOffset
	LDA.b $56
	STA.w !REGISTER_BG3VertScrollOffset
	LDA.b $59
	STA.w !REGISTER_BG4HorizScrollOffset
	LDA.b $5A
	STA.w !REGISTER_BG4HorizScrollOffset
	LDA.b $5D
	STA.w !REGISTER_BG4VertScrollOffset
	LDA.b $5E
	STA.w !REGISTER_BG4VertScrollOffset
	BRA.b label_C08334

label_C082D6:
	LDA.b $43
	STA.w !REGISTER_BG1HorizScrollOffset
	LDA.b $44
	STA.w !REGISTER_BG1HorizScrollOffset
	LDA.b $47
	STA.w !REGISTER_BG1VertScrollOffset
	LDA.b $48
	STA.w !REGISTER_BG1VertScrollOffset
	LDA.b $4B
	STA.w !REGISTER_BG2HorizScrollOffset
	LDA.b $4C
	STA.w !REGISTER_BG2HorizScrollOffset
	LDA.b $4F
	STA.w !REGISTER_BG2VertScrollOffset
	LDA.b $50
	STA.w !REGISTER_BG2VertScrollOffset
	LDA.b $53
	STA.w !REGISTER_BG3HorizScrollOffset
	LDA.b $54
	STA.w !REGISTER_BG3HorizScrollOffset
	LDA.b $57
	STA.w !REGISTER_BG3VertScrollOffset
	LDA.b $58
	STA.w !REGISTER_BG3VertScrollOffset
	LDA.b $5B
	STA.w !REGISTER_BG4HorizScrollOffset
	LDA.b $5C
	STA.w !REGISTER_BG4HorizScrollOffset
	LDA.b $5F
	STA.w !REGISTER_BG4VertScrollOffset
	LDA.b $60
	STA.w !REGISTER_BG4VertScrollOffset
	REP.b #$20
	LDA.w $0031
	STA.w $0061
	LDA.w $0033
	STA.w $0063
label_C08334:
	LDY.b #$00
	STY.b $2C
	LDX.b $0D
	BMI.b label_C0834B
	LDX.b $1A
	STX.w !REGISTER_MainScreenLayers
	LDX.b $1B
	STX.w !REGISTER_SubScreenLayers
	LDX.b $1F
	STX.w !REGISTER_HDMAEnable
label_C0834B:
	JSR.w label_C08501
	REP.b #$30
	STZ.b $99
	LDA.w $0022
	BNE.b label_C0836D
	INC.w $0022
	PHB
	PEA.w $7E7E
	PLB
	PLB
	PHD
	PEA.w $0200
	PLD
	JSR.w label_C08518
	PLD
	PLB
	STZ.w $0022
label_C0836D:
	LDA.w #$2000
	CMP.b $A3
	BNE.b label_C08377
	LDA.w #$2200
label_C08377:
	STA.b $A3
	STA.b $A1
	LDA.w #$0000
	STA.l $7E9E2B
	STZ.b $AB
	INC.b $A7
	BNE.b label_C0838A
	INC.b $A9
label_C0838A:
	PLB
	PLD
	PLY
	PLX
	PLA
	PLP
EB_VBlankRoutine_EndofVBlank:
	RTI

;--------------------------------------------------------------------

label_C08391:
	SEP.b #$20
	LDA.b #$30
	STA.l $307FF0
	INC
	STA.l $317FF0
	CMP.l $307FF0
	BEQ.b label_C083B2
	INC
	STA.l $327FF0
	CMP.l $307FF0
	BEQ.b label_C083B2
	STA.w $0A36
label_C083B2:
	REP.b #$30
	LDA.w $0A36
	RTL

;--------------------------------------------------------------------

label_C083B8:
	REP.b #$30
	LDA.w #$0000
	STA.w $007B
	RTL

;--------------------------------------------------------------------

label_C083C1:
	REP.b #$30
	LDA.b $0E
	STA.w $0085
	LDA.b $10
	STA.w $0087
	LDA.w $0065
	STA.w $008B
	LDA.w #$0001
	STA.w $0089
	LDA.w #$8000
	ORA.w $007B
	STA.w $007B
	RTL

;--------------------------------------------------------------------

label_C083E3:
	REP.b #$30
	LDA.w $007B
	AND.w #$4000
	BNE.b label_C0841A
	LDA.b [$0E]
	AND.w #$00FF
	BEQ.b label_C083B8
	STA.w $0081
	LDY.w #$0001
	LDA.b [$0E],Y
	STA.w $0083
	LDA.b $0E
	STA.w $007D
	LDA.b $10
	STA.w $007F
	LDA.b [$0E],Y
	STA.w $0077
	STA.w $0079
	LDA.w #$4000
	ORA.w $007B
	STA.w $007B

label_C0841A:
	RTL

;--------------------------------------------------------------------

label_C0841B:
	REP.b #$30
	LDA.b $7B
	BEQ.b label_C0844B
	AND.w #$4000
	BEQ.b label_C0844B
	DEC.b $81
	BNE.b label_C08455
	INC.b $7D
	INC.b $7D
	INC.b $7D
	LDA.b [$7D]
	AND.w #$00FF
	BEQ.b label_C08444
	STA.b $81
	LDY.w #$0001
	LDA.b [$7D],Y
	STA.b $77
	STA.b $79
	BRA.b label_C08455

label_C08444:
	LDA.b $7B
	AND.w #$BFFF
	STA.b $7B
label_C0844B:
	LDA.w !REGISTER_Joypad2Lo
	STA.b $79
	LDA.w !REGISTER_Joypad1Lo
	STA.b $77
label_C08455:
	RTS

;--------------------------------------------------------------------

label_C08456:
	REP.b #$30
	LDA.b $7B
	AND.w #$8000
	BEQ.b label_C08495
	LDA.b $77
	ORA.b $79
	TAX
	CMP.b $8B
	BNE.b label_C08471
	INC.b $89
	LDA.b $89
	CMP.w #$00FF
	BNE.b label_C08495
label_C08471:
	LDA.b $89
	STA.b [$85]
	INC.b $85
	LDA.b $8B
	STA.b [$85]
	INC.b $85
	INC.b $85
	STX.b $8B
	STZ.b $89
	INC.b $89
	LDA.w #$0000
	STA.b [$85]
	LDA.b $85
	BPL.b label_C08495
	LDA.b $7B
	AND.w #$7FFF
	STA.b $7B
label_C08495:
	RTS

;--------------------------------------------------------------------

label_C08496:
	SEP #$20
label_C08498:
	LDA.w !REGISTER_HVBlankFlagsAndJoypadStatus
	LSR
	BCS.b label_C08498
	JSR.w label_C0841B
	JSR.w label_C08456
	REP.b #$30
	LDX.w #$0002
label_C084A9:
	LDA.b $77,X
	AND.w #$FFF0
	STA.b $75
	LDA.b $65,X
	EOR.w #$FFFF
	AND.b $75
	STA.b $6D,X
	LDA.b $75
	CMP.b $65,X
	STA.b $65,X
	BEQ.b label_C084CC
	LDA.b $6D,X
	STA.b $69,X
	LDA.w #$0014
	STA.b $71,X
	BRA.b label_C084DD

label_C084CC:
	LDY.b $71,X
	BEQ.b label_C084D6
	DEC.b $71,X
	STZ.b $69,X
	BRA.b label_C084DD

label_C084D6:
	STA.b $69,X
	LDA.w #$0003
	STA.b $71,X
label_C084DD:
	DEX
	DEX
	BPL.b label_C084A9
	LDA.l $7E436C
	BNE.b label_C084F9
	LDA.b $67
	ORA.b $65
	STA.b $65
	LDA.b $6B
	ORA.b $69
	STA.b $69
	LDA.b $6F
	ORA.b $6D
	STA.b $6D
label_C084F9:
	LDA.b $6D
	BEQ.b label_C08500
	INC.w $0A34
label_C08500:
	RTS

;--------------------------------------------------------------------

label_C08501:
	SEP.b #$30
	LDX.b $CB
	CPX.b $CA
	BEQ.b label_C08515
	LDA.w $1AC2,X
	STA.w !REGISTER_APUPort3
	TXA
	INC
	AND.b #$07
	STA.b $CB
label_C08515:
	REP.b #$30
	RTS

;--------------------------------------------------------------------

label_C08518:
	JMP.w ($0020)

label_C0851B:
	RTS

;--------------------------------------------------------------------

label_C0851C:
	REP.b #$30
	STA.w $0020
	RTL

;--------------------------------------------------------------------

label_C08522:
	LDA.w #label_C0851B
	STA.w $0020
	RTL

;--------------------------------------------------------------------

label_C08529:
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$0004
	TCD
	PLA
	LDY.w #$0002
	LDA.b [$0E],Y
	STA.b $00
	INY
	INY
	LDA.b [$0E],Y
	STA.b $02
	INY
	INY
	LDA.b [$0E],Y
	TAX
	LDA.b [$0E]
	AND.w #$01FF
	TAY
	BRA.b label_C08555

label_C0854E:
	LDA.b [$00],Y
	STA.w $0000,X
	INX
	INX
label_C08555:
	DEY
	DEY
	BPL.b label_C0854E
	SEP.b #$20
	LDY.w #$0001
	LDA.b [$0E],Y
	LSR
	ORA.w $0030
	STA.w $0030
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C0856B:
	SEP.b #$20
	STA.w $0030
	REP.b #$20
	RTL

;--------------------------------------------------------------------

label_C08573:
	PHP
	REP.b #$30
	LDA.b $0E
	STA.w $008D
	SEP.b #$10
	LDX.b $10
	STX.w $008F
	PHD
	PEA.w $0000
	PLD
	PHB
	LDY.b #$00
	PHY
	PLB
	REP.b #$10
	BRA.b label_C085A7

label_C08590:
	INY
	INY
	LDA.b [$8D],Y
	STA.b $93
	INY
	INY
	LDA.b [$8D],Y
	STA.b $95
	INY
	INY
	LDA.b [$8D],Y
	STA.b $97
	INY
	INY
	JSR.w label_C0865F
label_C085A7:
	LDA.b [$8D],Y
	STA.b $91
	AND.w #$00FF
	CMP.w #$00FF
	BNE.b label_C08590
	PLB
	PLD
	PLP
	RTL

;--------------------------------------------------------------------

label_C085B7:
	REP.b #$30
	STA.w $0091
label_C085BC:
	LDA.w $0099
	BNE.b label_C085BC
	LDA.b $0E
	STA.w $0094
	LDA.b $10
	STA.w $0096
	STY.w $0097
	CPX.w #$1201
	BCC.b label_C08604
	LDA.w #$1200
	STA.w $0092
label_C085D9:
	CPX.w #$1201
	BCC.b label_C08604
label_C085DE:
	LDA.w $0099
	BNE.b label_C085DE
	PHX
	JSL.l label_C08643
	LDA.w $0094
	CLC
	ADC.w #$1200
	STA.w $0094
	LDA.w $0097
	CLC
	ADC.w #$0900
	STA.w $0097
	PLA
	SEC
	SBC.w #$1200
	TAX
	BRA.b label_C085D9

label_C08604:
	STX.w $0092
label_C08607:
	LDA.w $0099
	BNE.b label_C08607
	JSL.l label_C08643
label_C08610:
	LDA.w $0099
	BNE.b label_C08610
	RTL

;--------------------------------------------------------------------

label_C08616:
	REP.b #$30
	STA.w $0091
	STX.w $0092
	LDA.b $0E
	STA.w $0094
	LDA.b $10
	STA.w $0096
	STY.w $0097
	JMP.w label_C08643

label_C0862E:
	REP.b #$30
	STA.w $0091
	STX.w $0092
	STY.w $0094
	LDA.b $0E
	STA.w $0096
	LDA.b $10
	STA.w $0097
label_C08643:
	PHP
	REP.b #$20
	SEP.b #$10
	PHD
	PEA.w $0000
	PLD
	PHB
	LDY.b #!REGISTER_ScreenDisplayRegister>>16
	PHY
	PLB
	REP.b #$10
	JSR.w label_C0865F
	PLB
	PLD
	PLP
	RTL

;--------------------------------------------------------------------

; Note: Something related to setting up DMA updates.

label_C0865B:
	JSR.w label_C0865F
	RTL

label_C0865F:
	PHP
	PHY
	SEP.b #$10
	LDY.b $0D
	BMI.b label_C086A5
	LDA.b $92
	CLC
	ADC.b $99
	CMP.w #$1201
	BCC.b label_C08677
label_C08671:
	LDA.b $99
	BNE.b label_C08671
	LDA.b $92
label_C08677:
	STA.b $99
	LDY.b $01
	STY.b $A5
	LDY.b $00
	LDA.b $91
	STA.w EB_DMAToVRAMUpdateTable[$00].ParameterIndex,Y
	LDA.b $93
	STA.w EB_DMAToVRAMUpdateTable[$00].SizeHi,Y
	LDA.b $95
	STA.w EB_DMAToVRAMUpdateTable[$00].SourceHi,Y
	LDA.b $97
	STA.w EB_DMAToVRAMUpdateTable[$00].VRAMAddressLo,Y
	TYA
	CLC
	ADC.w #$0008
	TAY
	CPY.b $A5
	BNE.b label_C086A1
label_C0869D:
	CPY.b $01
	BEQ.b label_C0869D
label_C086A1:
	STY.b $00
	BRA.b label_C086D9

label_C086A5:
	LDY.b $91
	LDA.w DATA_C08FB0,Y
	STA.w DMA[$01].Parameters
	LDX.w DATA_C08FB0+$02,Y
	STX.w !REGISTER_VRAMAddressIncrementValue
	LDA.b $92
	STA.w DMA[$01].SizeLo
	LDA.b $94
	STA.w DMA[$01].SourceLo
	LDX.b $96
	STX.w DMA[$01].SourceBank
	LDA.b $97
	STA.w !REGISTER_VRAMAddressLo
	LDX.b #$02
	STX.w !REGISTER_DMAEnable
	LDA.w $00A3
	STA.w $00A1
	LDA.w #$0000
	STA.l $7E9E2B
label_C086D9:
	REP.b #$10
	PLY
	PLP
	RTS

;--------------------------------------------------------------------

label_C086DE:
	REP.b #$30
	TAY

label_C086E1:
	TYA
	CLC
	ADC.w $00A1
	SEC
	SBC.w #$0200
	CMP.w $00A3
	BCS.b label_C086FA
	ADC.w #$0200
	LDY.w $00A1
	STA.w $00A1
	TYA
	RTL

label_C086FA:
	LDA.w $002B
	BEQ.b label_C086FA
	STZ.w $002B
	BRA.b label_C086E1

;--------------------------------------------------------------------

label_C08704:
	PHP
	SEP.b #$20
	LDA.w $001E
	AND.b #$7F
	STA.w $001E
	STA.l !REGISTER_IRQNMIAndJoypadEnableFlags
	PLP
	RTL

;--------------------------------------------------------------------

label_C08715:
	PHP
	SEP.b #$20
	LDA.w $001E
	ORA.b #$81
	STA.w $001E
	STA.l !REGISTER_IRQNMIAndJoypadEnableFlags
	PLP
	RTL

;--------------------------------------------------------------------

label_C08726:
	SEP.b #$20
	LDA.b #$80
	STA.w $000D
	STZ.w $001F
	STZ.w $0028
	STZ.w $002B

label_C08736:
	LDA.w $002B
	BEQ.b label_C08736
	LDA.b #$00
	STA.l !REGISTER_HDMAEnable
	REP.b #$30
	RTL

;--------------------------------------------------------------------

label_C08744:
	SEP.b #$20
	LDA.b #$80
	STA.w $000D
	STZ.w $002B

label_C0874E:
	LDA.w $002B
	BEQ.b label_C0874E
	REP.b #$30
	RTL

;--------------------------------------------------------------------

label_C08756:
	SEP.b #$20
	LDA.w $001E
	AND.b #$B0
	BEQ.b label_C08769
label_C0875F:
	LDA.w $002B
	BEQ.b label_C0875F
	STZ.w $002B
	BRA.b label_C08775

label_C08769:
	LDA.l !REGISTER_HVBlankFlagsAndJoypadStatus
	BMI.b label_C08769
label_C0876F:
	LDA.l !REGISTER_HVBlankFlagsAndJoypadStatus
	BPL.b label_C0876F
label_C08775:
	STZ.w $002B
	PHD
	PEA.w $0000
	PLD
	PHB
	PEA.w $0000
	PLB
	PLB
	JSR.w label_C08496
	PLB
	PLD
	REP.b #$20
	RTL

;--------------------------------------------------------------------

label_C0878B:
	TAX
label_C0878C:
	INC.w $002C
	PHX
	JSL.l label_C08756
	PLX
	DEX
	BNE.b label_C0878C
	RTL

label_C08799:
	JSR.w label_C0879D
	RTL

label_C0879D:
	PHP
	SEP.b #$20
	AND.b #$8F
	STA.w $000D
	PLP
	RTS

;--------------------------------------------------------------------

label_C087A7:
	JSR.w label_C087AB
	RTL

label_C087AB:
	PHP
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$0002
	TCD
	PLA
	STA.b $00
	SEP.b #$20
	LDA.w $000D
	EOR.b #$FF
	ASL
	ASL
	ASL
	ASL
	AND.b #$F0
	ORA.b $00
	STA.w $0010
	PLD
	PLP
	RTS

;--------------------------------------------------------------------

label_C087CE:
	PHP
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$0006
	TCD
	PLA
	STZ.w $0028
	STA.b $00
	STX.b $02
	STY.b $04
	SEP.b #$20
	STZ.w $000D

label_C087E8:
	SEP.b #$20
	STZ.w $0010
	LDA.w $000D
	CLC
	ADC.b $00
	CMP.b #$0F
	REP.b #$20
	BCS.b label_C0880B
	JSR.w label_C0879D
	LDA.b $04
	BEQ.b label_C08803
	JSR.w label_C087AB

label_C08803:
	LDA.b $02
	JSL.l label_C0878B
	BRA.b label_C087E8

label_C0880B:
	LDA.w #$000F
	JSR.w label_C0879D
	PLD
	PLP
	RTL

;--------------------------------------------------------------------

label_C08814:
	PHP
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$0006
	TCD
	PLA
	STZ.w $0028
	STA.b $00
	STX.b $02
	STY.b $04

label_C08829:
	SEP.b #$20
	STZ.w $0010
	LDA.w $000D
	BMI.b label_C0884C
	SEC
	SBC.b $00
	REP.b #$20
	BMI.b label_C0884C
	JSR.w label_C0879D
	LDA.b $04
	BEQ.b label_C08844
	JSR.w label_C087AB

label_C08844:
	LDA.b $02
	JSL.l label_C0878B
	BRA.b label_C08829

label_C0884C:
	REP.b #$20
	LDA.w #$0080
	JSR.w label_C0879D
	SEP.b #$20
	STZ.w $001F
	STZ.w $002B

label_C0885C:
	LDA.w $002B
	BEQ.b label_C0885C
	LDA.b #$00
	STA.l !REGISTER_HDMAEnable
	REP.b #$20
	PLD
	PLP
	RTL

;--------------------------------------------------------------------

label_C0886C:
	PHP
	SEP.b #$30
	STA.w $0028
	STX.w $0029
	STX.w $002A
	PLP
	RTL

;--------------------------------------------------------------------

label_C0887A:
	PHP
	SEP.b #$30
	EOR.b #$FF
	INC
	STA.w $0028
	STX.w $0029
	STX.w $002A
	PLP
	RTL

;--------------------------------------------------------------------

label_C0888B:
	SEP.b #$20
	LDA.w $0028
	BEQ.b label_C088A2
	REP.b #$30
	JSL.l label_C088B1
	JSL.l label_C08B26
	JSL.l label_C08756
	BRA.b label_C0888B

label_C088A2:
	REP.b #$30
	RTL

;--------------------------------------------------------------------

label_C088A5:
	SEP.b #$30
	LDX.w $000B
	STA.w $000B
	TXA
	REP.b #$30
	RTL

;--------------------------------------------------------------------

label_C088B1:
	SEP.b #$20
	REP.b #$10
	LDX.w #$0000
	STX.w $2504
	STX.w $2606
	STX.w $2708
	STX.w $280A
	LDX.w $002E
	DEX
	BEQ.b label_C088CD
	JMP.w label_C089F3

label_C088CD:				; Note: OAM initialize routine
	LDX.w #!RAM_EB_Global_OAMBuffer1
	STX.w $0003
	LDX.w #$0700
	STX.w $0005
	LDX.w #!RAM_EB_Global_UpperOAMBuffer1
	STX.w $0007
	LDA.b #$80
	STA.w $000A
	LDA.b #$E0
	PHD
	PEA.w !RAM_EB_Global_OAMBuffer1
	PLD
	STA.b EB_OAMBuffer1[$00].YDisp
	STA.b EB_OAMBuffer1[$01].YDisp
	STA.b EB_OAMBuffer1[$02].YDisp
	STA.b EB_OAMBuffer1[$03].YDisp
	STA.b EB_OAMBuffer1[$04].YDisp
	STA.b EB_OAMBuffer1[$05].YDisp
	STA.b EB_OAMBuffer1[$06].YDisp
	STA.b EB_OAMBuffer1[$07].YDisp
	STA.b EB_OAMBuffer1[$08].YDisp
	STA.b EB_OAMBuffer1[$09].YDisp
	STA.b EB_OAMBuffer1[$0A].YDisp
	STA.b EB_OAMBuffer1[$0B].YDisp
	STA.b EB_OAMBuffer1[$0C].YDisp
	STA.b EB_OAMBuffer1[$0D].YDisp
	STA.b EB_OAMBuffer1[$0E].YDisp
	STA.b EB_OAMBuffer1[$0F].YDisp
	STA.b EB_OAMBuffer1[$10].YDisp
	STA.b EB_OAMBuffer1[$11].YDisp
	STA.b EB_OAMBuffer1[$12].YDisp
	STA.b EB_OAMBuffer1[$13].YDisp
	STA.b EB_OAMBuffer1[$14].YDisp
	STA.b EB_OAMBuffer1[$15].YDisp
	STA.b EB_OAMBuffer1[$16].YDisp
	STA.b EB_OAMBuffer1[$17].YDisp
	STA.b EB_OAMBuffer1[$18].YDisp
	STA.b EB_OAMBuffer1[$19].YDisp
	STA.b EB_OAMBuffer1[$1A].YDisp
	STA.b EB_OAMBuffer1[$1B].YDisp
	STA.b EB_OAMBuffer1[$1C].YDisp
	STA.b EB_OAMBuffer1[$1D].YDisp
	STA.b EB_OAMBuffer1[$1E].YDisp
	STA.b EB_OAMBuffer1[$1F].YDisp
	STA.b EB_OAMBuffer1[$20].YDisp
	STA.b EB_OAMBuffer1[$21].YDisp
	STA.b EB_OAMBuffer1[$22].YDisp
	STA.b EB_OAMBuffer1[$23].YDisp
	STA.b EB_OAMBuffer1[$24].YDisp
	STA.b EB_OAMBuffer1[$25].YDisp
	STA.b EB_OAMBuffer1[$26].YDisp
	STA.b EB_OAMBuffer1[$27].YDisp
	STA.b EB_OAMBuffer1[$28].YDisp
	STA.b EB_OAMBuffer1[$29].YDisp
	STA.b EB_OAMBuffer1[$2A].YDisp
	STA.b EB_OAMBuffer1[$2B].YDisp
	STA.b EB_OAMBuffer1[$2C].YDisp
	STA.b EB_OAMBuffer1[$2D].YDisp
	STA.b EB_OAMBuffer1[$2E].YDisp
	STA.b EB_OAMBuffer1[$2F].YDisp
	STA.b EB_OAMBuffer1[$30].YDisp
	STA.b EB_OAMBuffer1[$31].YDisp
	STA.b EB_OAMBuffer1[$32].YDisp
	STA.b EB_OAMBuffer1[$33].YDisp
	STA.b EB_OAMBuffer1[$34].YDisp
	STA.b EB_OAMBuffer1[$35].YDisp
	STA.b EB_OAMBuffer1[$36].YDisp
	STA.b EB_OAMBuffer1[$37].YDisp
	STA.b EB_OAMBuffer1[$38].YDisp
	STA.b EB_OAMBuffer1[$39].YDisp
	STA.b EB_OAMBuffer1[$3A].YDisp
	STA.b EB_OAMBuffer1[$3B].YDisp
	STA.b EB_OAMBuffer1[$3C].YDisp
	STA.b EB_OAMBuffer1[$3D].YDisp
	STA.b EB_OAMBuffer1[$3E].YDisp
	STA.b EB_OAMBuffer1[$3F].YDisp
	PEA.w !RAM_EB_Global_OAMBuffer1+$0100
	PLD
	STA.b EB_OAMBuffer1[$40].YDisp
	STA.b EB_OAMBuffer1[$41].YDisp
	STA.b EB_OAMBuffer1[$42].YDisp
	STA.b EB_OAMBuffer1[$43].YDisp
	STA.b EB_OAMBuffer1[$44].YDisp
	STA.b EB_OAMBuffer1[$45].YDisp
	STA.b EB_OAMBuffer1[$46].YDisp
	STA.b EB_OAMBuffer1[$47].YDisp
	STA.b EB_OAMBuffer1[$48].YDisp
	STA.b EB_OAMBuffer1[$49].YDisp
	STA.b EB_OAMBuffer1[$4A].YDisp
	STA.b EB_OAMBuffer1[$4B].YDisp
	STA.b EB_OAMBuffer1[$4C].YDisp
	STA.b EB_OAMBuffer1[$4D].YDisp
	STA.b EB_OAMBuffer1[$4E].YDisp
	STA.b EB_OAMBuffer1[$4F].YDisp
	STA.b EB_OAMBuffer1[$50].YDisp
	STA.b EB_OAMBuffer1[$51].YDisp
	STA.b EB_OAMBuffer1[$52].YDisp
	STA.b EB_OAMBuffer1[$53].YDisp
	STA.b EB_OAMBuffer1[$54].YDisp
	STA.b EB_OAMBuffer1[$55].YDisp
	STA.b EB_OAMBuffer1[$56].YDisp
	STA.b EB_OAMBuffer1[$57].YDisp
	STA.b EB_OAMBuffer1[$58].YDisp
	STA.b EB_OAMBuffer1[$59].YDisp
	STA.b EB_OAMBuffer1[$5A].YDisp
	STA.b EB_OAMBuffer1[$5B].YDisp
	STA.b EB_OAMBuffer1[$5C].YDisp
	STA.b EB_OAMBuffer1[$5D].YDisp
	STA.b EB_OAMBuffer1[$5E].YDisp
	STA.b EB_OAMBuffer1[$5F].YDisp
	STA.b EB_OAMBuffer1[$60].YDisp
	STA.b EB_OAMBuffer1[$61].YDisp
	STA.b EB_OAMBuffer1[$62].YDisp
	STA.b EB_OAMBuffer1[$63].YDisp
	STA.b EB_OAMBuffer1[$64].YDisp
	STA.b EB_OAMBuffer1[$65].YDisp
	STA.b EB_OAMBuffer1[$66].YDisp
	STA.b EB_OAMBuffer1[$67].YDisp
	STA.b EB_OAMBuffer1[$68].YDisp
	STA.b EB_OAMBuffer1[$69].YDisp
	STA.b EB_OAMBuffer1[$6A].YDisp
	STA.b EB_OAMBuffer1[$6B].YDisp
	STA.b EB_OAMBuffer1[$6C].YDisp
	STA.b EB_OAMBuffer1[$6D].YDisp
	STA.b EB_OAMBuffer1[$6E].YDisp
	STA.b EB_OAMBuffer1[$6F].YDisp
	STA.b EB_OAMBuffer1[$70].YDisp
	STA.b EB_OAMBuffer1[$71].YDisp
	STA.b EB_OAMBuffer1[$72].YDisp
	STA.b EB_OAMBuffer1[$73].YDisp
	STA.b EB_OAMBuffer1[$74].YDisp
	STA.b EB_OAMBuffer1[$75].YDisp
	STA.b EB_OAMBuffer1[$76].YDisp
	STA.b EB_OAMBuffer1[$77].YDisp
	STA.b EB_OAMBuffer1[$78].YDisp
	STA.b EB_OAMBuffer1[$79].YDisp
	STA.b EB_OAMBuffer1[$7A].YDisp
	STA.b EB_OAMBuffer1[$7B].YDisp
	STA.b EB_OAMBuffer1[$7C].YDisp
	STA.b EB_OAMBuffer1[$7D].YDisp
	STA.b EB_OAMBuffer1[$7E].YDisp
	STA.b EB_OAMBuffer1[$7F].YDisp
	PLD
	REP.b #$20
	RTL

label_C089F3:				; Note: OAM initialize routine
	LDX.w #!RAM_EB_Global_OAMBuffer2
	STX.w $0003
	LDX.w #$0A00
	STX.w $0005
	LDX.w #!RAM_EB_Global_UpperOAMBuffer2
	STX.w $0007
	LDA.b #$80
	STA.w $000A
	LDA.b #$E0
	PHD
	PEA.w !RAM_EB_Global_OAMBuffer2
	PLD
	STA.b EB_OAMBuffer2[$00].YDisp
	STA.b EB_OAMBuffer2[$01].YDisp
	STA.b EB_OAMBuffer2[$02].YDisp
	STA.b EB_OAMBuffer2[$03].YDisp
	STA.b EB_OAMBuffer2[$04].YDisp
	STA.b EB_OAMBuffer2[$05].YDisp
	STA.b EB_OAMBuffer2[$06].YDisp
	STA.b EB_OAMBuffer2[$07].YDisp
	STA.b EB_OAMBuffer2[$08].YDisp
	STA.b EB_OAMBuffer2[$09].YDisp
	STA.b EB_OAMBuffer2[$0A].YDisp
	STA.b EB_OAMBuffer2[$0B].YDisp
	STA.b EB_OAMBuffer2[$0C].YDisp
	STA.b EB_OAMBuffer2[$0D].YDisp
	STA.b EB_OAMBuffer2[$0E].YDisp
	STA.b EB_OAMBuffer2[$0F].YDisp
	STA.b EB_OAMBuffer2[$10].YDisp
	STA.b EB_OAMBuffer2[$11].YDisp
	STA.b EB_OAMBuffer2[$12].YDisp
	STA.b EB_OAMBuffer2[$13].YDisp
	STA.b EB_OAMBuffer2[$14].YDisp
	STA.b EB_OAMBuffer2[$15].YDisp
	STA.b EB_OAMBuffer2[$16].YDisp
	STA.b EB_OAMBuffer2[$17].YDisp
	STA.b EB_OAMBuffer2[$18].YDisp
	STA.b EB_OAMBuffer2[$19].YDisp
	STA.b EB_OAMBuffer2[$1A].YDisp
	STA.b EB_OAMBuffer2[$1B].YDisp
	STA.b EB_OAMBuffer2[$1C].YDisp
	STA.b EB_OAMBuffer2[$1D].YDisp
	STA.b EB_OAMBuffer2[$1E].YDisp
	STA.b EB_OAMBuffer2[$1F].YDisp
	STA.b EB_OAMBuffer2[$20].YDisp
	STA.b EB_OAMBuffer2[$21].YDisp
	STA.b EB_OAMBuffer2[$22].YDisp
	STA.b EB_OAMBuffer2[$23].YDisp
	STA.b EB_OAMBuffer2[$24].YDisp
	STA.b EB_OAMBuffer2[$25].YDisp
	STA.b EB_OAMBuffer2[$26].YDisp
	STA.b EB_OAMBuffer2[$27].YDisp
	STA.b EB_OAMBuffer2[$28].YDisp
	STA.b EB_OAMBuffer2[$29].YDisp
	STA.b EB_OAMBuffer2[$2A].YDisp
	STA.b EB_OAMBuffer2[$2B].YDisp
	STA.b EB_OAMBuffer2[$2C].YDisp
	STA.b EB_OAMBuffer2[$2D].YDisp
	STA.b EB_OAMBuffer2[$2E].YDisp
	STA.b EB_OAMBuffer2[$2F].YDisp
	STA.b EB_OAMBuffer2[$30].YDisp
	STA.b EB_OAMBuffer2[$31].YDisp
	STA.b EB_OAMBuffer2[$32].YDisp
	STA.b EB_OAMBuffer2[$33].YDisp
	STA.b EB_OAMBuffer2[$34].YDisp
	STA.b EB_OAMBuffer2[$35].YDisp
	STA.b EB_OAMBuffer2[$36].YDisp
	STA.b EB_OAMBuffer2[$37].YDisp
	STA.b EB_OAMBuffer2[$38].YDisp
	STA.b EB_OAMBuffer2[$39].YDisp
	STA.b EB_OAMBuffer2[$3A].YDisp
	STA.b EB_OAMBuffer2[$3B].YDisp
	STA.b EB_OAMBuffer2[$3C].YDisp
	STA.b EB_OAMBuffer2[$3D].YDisp
	STA.b EB_OAMBuffer2[$3E].YDisp
	STA.b EB_OAMBuffer2[$3F].YDisp
	PEA.w !RAM_EB_Global_OAMBuffer2+$0100
	PLD
	STA.b EB_OAMBuffer2[$40].YDisp
	STA.b EB_OAMBuffer2[$41].YDisp
	STA.b EB_OAMBuffer2[$42].YDisp
	STA.b EB_OAMBuffer2[$43].YDisp
	STA.b EB_OAMBuffer2[$44].YDisp
	STA.b EB_OAMBuffer2[$45].YDisp
	STA.b EB_OAMBuffer2[$46].YDisp
	STA.b EB_OAMBuffer2[$47].YDisp
	STA.b EB_OAMBuffer2[$48].YDisp
	STA.b EB_OAMBuffer2[$49].YDisp
	STA.b EB_OAMBuffer2[$4A].YDisp
	STA.b EB_OAMBuffer2[$4B].YDisp
	STA.b EB_OAMBuffer2[$4C].YDisp
	STA.b EB_OAMBuffer2[$4D].YDisp
	STA.b EB_OAMBuffer2[$4E].YDisp
	STA.b EB_OAMBuffer2[$4F].YDisp
	STA.b EB_OAMBuffer2[$50].YDisp
	STA.b EB_OAMBuffer2[$51].YDisp
	STA.b EB_OAMBuffer2[$52].YDisp
	STA.b EB_OAMBuffer2[$53].YDisp
	STA.b EB_OAMBuffer2[$54].YDisp
	STA.b EB_OAMBuffer2[$55].YDisp
	STA.b EB_OAMBuffer2[$56].YDisp
	STA.b EB_OAMBuffer2[$57].YDisp
	STA.b EB_OAMBuffer2[$58].YDisp
	STA.b EB_OAMBuffer2[$59].YDisp
	STA.b EB_OAMBuffer2[$5A].YDisp
	STA.b EB_OAMBuffer2[$5B].YDisp
	STA.b EB_OAMBuffer2[$5C].YDisp
	STA.b EB_OAMBuffer2[$5D].YDisp
	STA.b EB_OAMBuffer2[$5E].YDisp
	STA.b EB_OAMBuffer2[$5F].YDisp
	STA.b EB_OAMBuffer2[$60].YDisp
	STA.b EB_OAMBuffer2[$61].YDisp
	STA.b EB_OAMBuffer2[$62].YDisp
	STA.b EB_OAMBuffer2[$63].YDisp
	STA.b EB_OAMBuffer2[$64].YDisp
	STA.b EB_OAMBuffer2[$65].YDisp
	STA.b EB_OAMBuffer2[$66].YDisp
	STA.b EB_OAMBuffer2[$67].YDisp
	STA.b EB_OAMBuffer2[$68].YDisp
	STA.b EB_OAMBuffer2[$69].YDisp
	STA.b EB_OAMBuffer2[$6A].YDisp
	STA.b EB_OAMBuffer2[$6B].YDisp
	STA.b EB_OAMBuffer2[$6C].YDisp
	STA.b EB_OAMBuffer2[$6D].YDisp
	STA.b EB_OAMBuffer2[$6E].YDisp
	STA.b EB_OAMBuffer2[$6F].YDisp
	STA.b EB_OAMBuffer2[$70].YDisp
	STA.b EB_OAMBuffer2[$71].YDisp
	STA.b EB_OAMBuffer2[$72].YDisp
	STA.b EB_OAMBuffer2[$73].YDisp
	STA.b EB_OAMBuffer2[$74].YDisp
	STA.b EB_OAMBuffer2[$75].YDisp
	STA.b EB_OAMBuffer2[$76].YDisp
	STA.b EB_OAMBuffer2[$77].YDisp
	STA.b EB_OAMBuffer2[$78].YDisp
	STA.b EB_OAMBuffer2[$79].YDisp
	STA.b EB_OAMBuffer2[$7A].YDisp
	STA.b EB_OAMBuffer2[$7B].YDisp
	STA.b EB_OAMBuffer2[$7C].YDisp
	STA.b EB_OAMBuffer2[$7D].YDisp
	STA.b EB_OAMBuffer2[$7E].YDisp
	STA.b EB_OAMBuffer2[$7F].YDisp
	PLD
	REP.b #$20
	RTL

;--------------------------------------------------------------------

label_008B19:
	SEP.b #$20
	LDA.b #$00
	STA.w $0009
	REP.b #$20
	JSL.l label_C088B1
label_C08B26:
	REP.b #$30
	JSR.w label_C08B8E
	SEP.b #$20
	PHB
	PLA
	CMP.b #$FF
	BNE.b label_C08B35
label_C08B33:
	BRA.b label_C08B33

label_C08B35:
	LDA.w $000A
	CMP.b #$80
	BEQ.b label_C08B40
label_C08B3C:
	LSR
	LSR
	BCC.b label_C08B3C
label_C08B40:
	LDX.w $0007
	STA.w $0000,X
	REP.b #$30
	LDA.w $002E
	DEC
	ASL
	TAX
	LDA.w $0031
	STA.w $0041,X
	LDA.w $0033
	STA.w $0045,X
	LDA.w $0035
	STA.w $0049,X
	LDA.w $0037
	STA.w $004D,X
	LDA.w $0039
	STA.w $0051,X
	LDA.w $003B
	STA.w $0055,X
	LDA.w $003D
	STA.w $0059,X
	LDA.w $003F
	STA.w $005D,X
	SEP.b #$20
	LDA.w $002E
	STA.w $002C
	EOR.b #$03
	STA.w $002E
	REP.b #$30
	RTL

;--------------------------------------------------------------------

label_C08B8E:
	PHP
	REP.b #$20
	LDA.w $2402
	CMP.w #$0000
	BNE.b label_C08B9C
	JSR.w label_C08C53
label_C08B9C:
	LDX.w #$0000
	BRA.b label_C08BBC

label_C08BA1:
	LDA.w $24C4,X
	STA.w $000B
	PHX
	LDA.w $2404,X
	PHA
	LDA.w $2484,X
	TAY
	LDA.w $2444,X
	TAX
	PLA
	JSL.l label_C08CD5
	PLX
	INX
	INX
label_C08BBC:
	CPX.w $2504
	BCC.b label_C08BA1
	LDA.w $2402
	CMP.w #$0001
	BNE.b label_C08BCC
	JSR.w label_C08C53
label_C08BCC:
	LDX.w #$0000
	BRA.b label_C08BEC

label_C08BD1:
	LDA.w $25C6,X
	STA.w $000B
	PHX
	LDA.w $2506,X
	PHA
	LDA.w $2586,X
	TAY
	LDA.w $2546,X
	TAX
	PLA
	JSL.l label_C08CD5
	PLX
	INX
	INX
label_C08BEC:
	CPX.w $2606
	BCC.b label_C08BD1
	LDA.w $2402
	CMP.w #$0002
	BNE.b label_C08BFC
	JSR.w label_C08C53
label_C08BFC:
	LDX.w #$0000
	BRA.b label_C08C1C

label_C08C01:
	LDA.w $26C8,X
	STA.w $000B
	PHX
	LDA.w $2608,X
	PHA
	LDA.w $2688,X
	TAY
	LDA.w $2648,X
	TAX
	PLA
	JSL.l label_C08CD5
	PLX
	INX
	INX
label_C08C1C:
	CPX.w $2708
	BCC.b label_C08C01
	LDA.w $2402
	CMP.w #$0003
	BNE.b label_C08C2C
	JSR.w label_C08C53
label_C08C2C:
	LDX.w #$0000
	BRA.b label_C08C4C

label_C08C31:
	LDA.w $27CA,X
	STA.w $000B
	PHX
	LDA.w $270A,X
	PHA
	LDA.w $278A,X
	TAY
	LDA.w $274A,X
	TAX
	PLA
	JSL.l label_C08CD5
	PLX
	INX
	INX
label_C08C4C:
	CPX.w $280A
	BCC.b label_C08C31
	PLP
	RTS

label_C08C53:
	RTS

;--------------------------------------------------------------------

label_C08C54:
	JSR.w label_C08C58
	RTL

label_C08C58:
	REP.b #$20
	PHX
	PHA
	LDA.w $2400
	ASL
	TAX
	PLA
	JMP.w (DATA_C08C65,X)

DATA_C08C65:
	dw label_C08C6D
	dw label_C08C87
	dw label_C08CA1
	dw label_C08CBB

label_C08C6D:
	LDX.w $2504
	STA.w $2404,X
	PLA
	STA.w $2444,X
	TYA
	STA.w $2484,X
	LDA.w $000B
	STA.w $24C4,X
	INX
	INX
	STX.w $2504
	RTS

label_C08C87:
	LDX.w $2606
	STA.w $2506,X
	PLA
	STA.w $2546,X
	TYA
	STA.w $2586,X
	LDA.w $000B
	STA.w $25C6,X
	INX
	INX
	STX.w $2606
	RTS

label_C08CA1:
	LDX.w $2708
	STA.w $2608,X
	PLA
	STA.w $2648,X
	TYA
	STA.w $2688,X
	LDA.w $000B
	STA.w $26C8,X
	INX
	INX
	STX.w $2708
	RTS

label_C08CBB:
	LDX.w $280A
	STA.w $270A,X
	PLA
	STA.w $274A,X
	TYA
	STA.w $278A,X
	LDA.w $000B
	STA.w $27CA,X
	INX
	INX
	STX.w $280A
	RTS

;--------------------------------------------------------------------

; Note: This routine seems responsible for drawing sprites

label_C08CD5:
;$C08CD5
	PHP
	PHD
	PEA.w $0000
	PLD
	REP.b #$30
	STX.b $9B
	STY.b $9D
	TAY
	LDX.b $03
	CPX.b $05
	BCC.b label_C08CEB
	PLD
	PLP
	RTL

label_C08CEB:
	PHB
	SEP.b #$20
	LDA.b $0B
	PHA
	PLB
	BRA.b label_C08CFF

label_C08CF4:
	LDA.w $0001,Y
	TAY
	BRA.b label_C08CFF

label_C08CFA:
	INY
	INY
	INY
	INY
	INY
label_C08CFF:
	REP.b #$20
	LDA.w $0000,Y
	AND.w #$00FF
	CMP.w #$0080
	BCC.b label_C08D12
	BEQ.b label_C08CF4
	ORA.w #$FF00
	CLC
label_C08D12:
	ADC.b $9D
	DEC
	CMP.w #$00E0
	BCC.b label_C08D28
	CMP.w #$FFE0
	BCS.b label_C08D28
	SEP.b #$20
label_C08D21:
	LDA.w $0004,Y
	BPL.b label_C08CFA
	BRA.b label_C08D73

label_C08D28:
	STA.b $9F
	LDA.w $0001,Y
	STA.b EB_OAMBuffer1[$00].Tile,X
	LDA.w $0003,Y
	AND.w #$00FF
	CMP.w #$0080
	BCC.b label_C08D3E
	ORA.w #$FF00
	CLC
label_C08D3E:
	ADC.b $9B
	SEP.b #$20
	STA.b EB_OAMBuffer1[$00].XDisp,X
	XBA
	BEQ.b label_C08D4B
	CMP.b #$FF
	BNE.b label_C08D21
label_C08D4B:
	ROL
	ROR.b $0A
	LDA.w $0004,Y
	ROR
	ROR.b $0A
	BCC.b label_C08D60
	LDA.b $0A
	STA.b [$07]
	INC.b $07
	LDA.b #$80
	STA.b $0A
label_C08D60:
	LDA.b $9F
	STA.b EB_OAMBuffer1[$00].YDisp,X
	INX
	INX
	INX
	INX
	LDA.w $0004,Y
	BMI.b label_C08D73
	REP.b #$20
	CPX.b $05
	BCC label_C08CFA
label_C08D73:
	STX.b $03
	PLB
	PLD
	PLP
	RTL

;--------------------------------------------------------------------

label_C08D79:
	PHP
	SEP.b #$20
	XBA
	LDA.w $000F
	AND.b #$F0
	STA.w $000F
	XBA
	ORA.w $000F
	STA.w $000F
	STA.l !REGISTER_BGModeAndTileSizeSetting
	PLP
	RTL

;--------------------------------------------------------------------

label_C08D92:
	PHP
	SEP.b #$20
	STA.w $000E
	STA.l !REGISTER_OAMSizeAndDataAreaDesignation
	PLP
	RTL

;--------------------------------------------------------------------

label_C08D9E:
	PHP
	SEP.b #$20
	REP.b #$10
	AND.b #$03
	STA.w $0011
	REP.b #$20
	TXA
	XBA
	SEP.b #$20
	AND.b #$FC
	ORA.w $0011
	STA.w $0011
	STA.l !REGISTER_BG1AddressAndSize
	LDA.w $0015
	AND.b #$F0
	STA.w $0015
	REP.b #$20
	STZ.w $0031
	STZ.w $0033
	TYA
	XBA
	SEP.b #$20
	LSR
	LSR
	LSR
	LSR
	ORA.w $0015
	STA.w $0015
	STA.l !REGISTER_BG1And2TileDataDesignation
	PLP
	RTL

;--------------------------------------------------------------------

label_C08DDE:
	PHP
	SEP.b #$20
	REP.b #$10
	AND.b #$03
	STA.w $0012
	REP.b #$20
	TXA
	XBA
	SEP.b #$20
	AND.b #$FC
	ORA.w $0012
	STA.w $0012
	STA.l !REGISTER_BG2AddressAndSize
	LDA.w $0015
	AND.b #$0F
	STA.w $0015
	REP.b #$20
	STZ.w $0035
	STZ.w $0037
	TYA
	XBA
	SEP.b #$20
	AND.b #$F0
	ORA.w $0015
	STA.w $0015
	STA.l !REGISTER_BG1And2TileDataDesignation
	PLP
	RTL

;--------------------------------------------------------------------

label_C08E1C:
	PHP
	SEP.b #$20
	REP.b #$10
	AND.b #$03
	STA.w $0013
	REP.b #$20
	TXA
	XBA
	SEP.b #$20
	AND.b #$FC
	ORA.w $0013
	STA.w $0013
	STA.l !REGISTER_BG3AddressAndSize
	LDA.w $0016
	AND.b #$F0
	STA.w $0016
	REP.b #$20
	STZ.w $0039
	STZ.w $003B
	TYA
	XBA
	SEP.b #$20
	LSR
	LSR
	LSR
	LSR
	ORA.w $0016
	STA.w $0016
	STA.l !REGISTER_BG3And4TileDataDesignation
	PLP
	RTL

;--------------------------------------------------------------------

label_C08E5C:
	PHP
	SEP.b #$20
	REP.b #$10
	AND.b #$03
	STA.w $0014
	REP.b #$20
	TXA
	XBA
	SEP.b #$20
	AND.b #$FC
	ORA.w $0014
	STA.w $0014
	STA.l !REGISTER_BG4AddressAndSize
	LDA.w $0016
	AND.b #$0F
	STA.w $0016
	REP.b #$20
	STZ.w $003D
	STZ.w $003F
	TYA
	XBA
	SEP.b #$20
	AND.b #$F0
	ORA.w $0016
	STA.w $0016
	STA.l !REGISTER_BG3And4TileDataDesignation
	PLP
	RTL

;--------------------------------------------------------------------

label_C08E9A:
	PHP
	REP.b #$20
	LDA.w $0024
	SEP.b #$20
	XBA
	LDA.w $0026
	REP.b #$20
	STA.l !REGISTER_Multiplicand
	CLC
	ADC.w #$006D
	STA.w $0026
	LDA.l !REGISTER_ProductOrRemainderLo
	ROR
	ROR
	PHA
	AND.w #$0003
	CLC
	ADC.w $0024
	ROR
	BCC.b label_C08EC7
	ORA.w #$8000
label_C08EC7:
	STA.w $0024
	PLA
	ROR
	ROR
	AND.w #$00FF
	PLP
	RTL

;--------------------------------------------------------------------

label_C08ED2:
	STX.w $00A5
	LSR.w $00A5
	TAX
	LDY.w #$0000
	BRA.b label_C08EE7

label_C08EDE:
	LDA.b [$0E],Y
	STA.w $0000,X
	INX
	INX
	INY
	INY
label_C08EE7:
	DEC.w $00A5
	BPL.b label_C08EDE
	RTL

;--------------------------------------------------------------------

label_C08EED:
	TAY
	SEP #$20
	BRA.b label_C08EF6

label_C08EF2:
	LDA.b [$12],Y
	STA.b [$0E],Y
label_C08EF6:
	DEY
	BPL.b label_C08EF2
	REP.b #$30
	RTL

;--------------------------------------------------------------------

; Note: Routine that generates the BG of the textbox letter tiles

label_C08EFC:
	TXY
	TAX
	TYA
	LSR
	TAY
	SEP.b #$20
	LDA.b $0E
	XBA
	LDA.b $0E
	REP.b #$20
	BRA.b label_C08F11

label_C08F0C:
	STA.w $0000,X
	INX
	INX
label_C08F11:
	DEY
	BPL.b label_C08F0C
	RTL

;--------------------------------------------------------------------

label_C08F15:
	SEP.b #$20
	TXY
label_C08F18:
	DEY
	BMI.b label_C08F1F
	STA.b [$0E],Y
	BRA.b label_C08F18

label_C08F1F:
	REP.b #$30
	RTL

;--------------------------------------------------------------------

label_C08F22:
	SEP.b #$30
	LDY.b #$FF
label_C08F26:
	INY
	LDA.b [$0E],Y
	BNE.b label_C08F26
	REP.b #$30
	TYA
	RTL

;--------------------------------------------------------------------

label_C08F2F:
	SEP.b #$20
	LDY.w #$FFFF
label_C08F34:
	INY
	LDA.b [$0E],Y
	BEQ.b label_C08F3F
	CMP.b [$12],Y
	BEQ.b label_C08F34
	LDA.b #$01
label_C08F3F:
	REP.b #$30
	RTL

;--------------------------------------------------------------------

label_C08F42:
	REP.b #$30
	TAY
	PHB
	PEA.w $0000
	PLB
	PLB
	LDA.b $01,S
	STA.w $0000,Y
	LDA.b $03,S
	STA.w $0002,Y
	PHP
	PHP
	PLA
	STA.w $0004,Y
	TDC
	STA.w $0005,Y
	TSC
	STA.w $0007,Y
	PLB
	LDA.w #$0000
	RTL

;--------------------------------------------------------------------

label_C08F68:
	REP.b #$30
	TAY
	PEA.w $0000
	PLB
	PLB
	LDA.w $0007,Y
	TCS
	LDA.w $0005,Y
	TCD
	LDA.w $0003,Y
	PHA
	PLP
	PLP
	LDA.w $0000,Y
	STA.b $01,S
	LDA.w $0002,Y
	STA.b $03,S
	PLB
	TXA
	RTL

;--------------------------------------------------------------------

label_C08F8B:
	SEP.b #$20
	LDA.w $0000
label_C08F90:
	CMP.w $0001
	BNE.b label_C08F90
	REP.b #$30
	RTL

;--------------------------------------------------------------------

DATA_C08F98:
	db $80,$FE,$00,$01,$00,$02
	db $00,$00,$00,$00,$00,$01
	db $00,$03,$80,$00,$00,$00
	db $00,$02,$00,$02,$00,$00

;--------------------------------------------------------------------

DATA_C08FB0:
	db $01,!REGISTER_WriteToVRAMPortLo,$80
	db $09,!REGISTER_WriteToVRAMPortLo,$80
	db $00,!REGISTER_WriteToVRAMPortLo,$00
	db $08,!REGISTER_WriteToVRAMPortLo,$00
	db $00,!REGISTER_WriteToVRAMPortHi,$80
	db $08,!REGISTER_WriteToVRAMPortHi,$80
	db $81,!REGISTER_ReadFromVRAMPortLo,$80
	db $80,!REGISTER_ReadFromVRAMPortLo,$00
	db $80,!REGISTER_ReadFromVRAMPortHi,$80
	db $01,!REGISTER_WriteToVRAMPortLo,$81
	db $09,!REGISTER_WriteToVRAMPortLo,$81
	db $00,!REGISTER_WriteToVRAMPortLo,$01
	db $08,!REGISTER_WriteToVRAMPortLo,$01
	db $00,!REGISTER_WriteToVRAMPortHi,$81
	db $08,!REGISTER_WriteToVRAMPortHi,$81
	db $81,!REGISTER_ReadFromVRAMPortLo,$81
	db $80,!REGISTER_ReadFromVRAMPortLo,$01
	db $80,!REGISTER_ReadFromVRAMPortHi,$81

;--------------------------------------------------------------------

label_C08FE6:
	XBA
	TYA
label_C08FE8:
	REP.b #$20
	STA.l !REGISTER_Multiplicand
	NOP #2
	LDA.l !REGISTER_ProductOrRemainderLo
	SEP.b #$20
	RTL

;--------------------------------------------------------------------

label_C08FF7:
	REP.b #$10
	XBA
	BEQ.b label_C09022
	SEP.b #$20
	XBA
	PHA
	TYA
	REP.b #$20
	STA.l !REGISTER_Multiplicand
	NOP #2
	LDA.l !REGISTER_ProductOrRemainderLo
	TAY
	SEP.b #$20
	PLA
	STA.l !REGISTER_Multiplier
	REP.b #$20
	TYA
	XBA
	AND.w #$FF00
	CLC
	ADC.l !REGISTER_ProductOrRemainderLo
	RTL

label_C09022:
	SEP.b #$20
	TYA
	REP.b #$20
	STA.l !REGISTER_Multiplicand
	NOP #2
	LDA.l !REGISTER_ProductOrRemainderLo
	RTL

;--------------------------------------------------------------------

label_C09032:
	STY.w $00B4
	STA.w $00B6
	STZ.w $00B2
	INC.w $00C4
	LDA.w $00B5
	SEP.b #$20
	TYA
	REP.b #$20
	STA.l !REGISTER_Multiplicand
	LDY.w $00B5
	REP.b #$20
	LDA.l !REGISTER_ProductOrRemainderLo
	STA.w $00B0
	TYA
	STA.l !REGISTER_Multiplicand
	LDA.w $00B6
	SEP.b #$20
	LDA.w $00B4
	REP.b #$20
	TAY
	LDA.l !REGISTER_ProductOrRemainderLo
	CLC
	ADC.w $00B1
	STA.w $00B1
	TYA
	STA.l !REGISTER_Multiplicand
	NOP
	LDA.w $00B1
	CLC
	ADC.l !REGISTER_ProductOrRemainderLo
	STA.w $00B1
	LDA.w $00B0
	RTL

;--------------------------------------------------------------------

label_C09086:
	LDA.b $08
	STA.w $00BA
	LDA.b $06
	STA.w $00B8
	LDY.b $0A
	JSL.l label_C09032
	STA.b $06
	LDA.w $00B4
	SEP.b #$20
	LDA.w $00B7
	REP.b #$20
	STA.l !REGISTER_Multiplicand
	LDA.w $00B2
	NOP
	CLC
	ADC.l !REGISTER_ProductOrRemainderLo
	STA.b $08
	LDA.w $00B8
	LDY.b $0C
	JSL.l label_C09032
	CLC
	ADC.b $08
	STA.b $08
	LDA.w $00BA
	LDY.b $0A
	JSL.l label_C09032
	CLC
	ADC.b $08
	STA.b $08
	RTL

;--------------------------------------------------------------------

label_C090CE:
	PHA
	STY.w $00B4
	EOR.w $00B4
	STA.w $00B4
	PLA
	JSL.l label_C0911E
	ROL.w $00B4
	BCC.b label_C090E5
	EOR.b #$FF
	INC
label_C090E5:
	RTL

;--------------------------------------------------------------------

label_C090E6:
	PHA
	STY.w $00B4
	EOR.w $00B4
	STA.w $00B4
	PLA
	JSL.l label_C0914B
	ROL.w $00B4
	BCC.b label_C090FE
	EOR.w #$FFFF
	INC
label_C090FE:
	RTL

;--------------------------------------------------------------------

label_C090FF:
	LDA.b $08
	EOR.b $0C
	STA.w $00B4
	JSL.l label_C0917C
	ROL.w $00B4
	BCC.b label_C0911D
	LDA.w #$0000
	SBC.b $06
	STA.b $06
	LDA.w #$0000
	SBC.b $08
	STA.b $08
label_C0911D:
	RTL

;--------------------------------------------------------------------

label_C0911E:
	PHA
	TYA
	BPL.b label_C09126
	EOR.b #$FF
	INC
	TAY

label_C09126:
	PLA
	BPL.b label_C0912C
	EOR.b #$FF
	INC

label_C0912C:
	STA.l !REGISTER_DividendLo
	LDA.b #$00
	STA.l !REGISTER_DividendHi
	TYA
	STA.l !REGISTER_Divisor
	NOP #6
	LDA.l !REGISTER_ProductOrRemainderLo
	TAY
	LDA.l !REGISTER_QuotientLo
	RTL

;--------------------------------------------------------------------

label_C0914B:
	PHA
	TYA
	BPL.b label_C09154
	EOR.w #$FFFF
	INC
	TAY

label_C09154:
	PLA
	BPL.b label_C0915B
	EOR.w #$FFFF
	INC

label_C0915B:
	STA.w $00B0
	STY.w $00B2
	LDA.w #$0000
	LDY.w #$0010

label_C09167:
	ROL.w $00B0
	ROL
	CMP.w $00B2
	BCC.b label_C09173
	SBC.w $00B2

label_C09173:
	DEY
	BNE.b label_C09167
	TAY
	LDA.w $00B0
	ROL
	RTL

;--------------------------------------------------------------------

label_C0917C:
	LDA.b $08
	BPL.b label_C09191
	EOR.w #$FFFF
	STA.b $08
	LDA.b $06
	EOR.w #$FFFF
	INC
	STA.b $06
	BNE.b label_C09191
	INC.b $08

label_C09191:
	LDA.b $0C
	BPL.b label_C091A6
	EOR.w #$FFFF
	STA.b $0C
	LDA.b $0A
	EOR.w #$FFFF
	INC
	STA.b $0A
	BNE.b label_C091A6
	INC.b $0C

label_C091A6:
	LDA.b $0A
	STA.w $00B0
	LDA.b $0C
	STA.w $00B2
	STZ.b $0A
	STZ.b $0C
	LDY.w #$0020

label_C091B7:
	ROL.b $06
	ROL.b $08
	ROL.b $0A
	ROL.b $0C
	LDA.b $0C
	CMP.w $00B2
	BNE.b label_C091CB
	LDA.b $0A
	CMP.w $00B0

label_C091CB:
	BCC.b label_C091DB
	LDA.b $0A
	SBC.w $00B0
	STA.b $0A
	LDA.b $0C
	SBC.w $00B2
	STA.b $0C

label_C091DB:
	DEY
	BNE.b label_C091B7
	ROL.b $06
	ROL.b $08
	RTL

;--------------------------------------------------------------------

label_C091E3:
	STA.w $00B4
	JSL.l label_C0911E
	TYA
	ROL.w $00B4
	BCC.b label_C091F3
	EOR.b #$FF
	INC

label_C091F3:
	RTL

;--------------------------------------------------------------------

label_C091F4:
	STA.w $00B4
	JSL.l label_C0914B
	TYA
	ROL.w $00B4
	BCC.b label_C09205
	EOR.w #$FFFF
	INC
label_C09205:
	RTL

;--------------------------------------------------------------------

label_C09206:
	LDA.b $08
	STA.w $00B4
	JSL.l label_C0917C
	ROL.w $00B4
	BCC.b label_C09222
	LDA.w #$0000
	SBC.b $0A
	STA.b $06
	LDA.w #$0000
	SBC.b $0C
	BRA.b label_C09228

label_C09222:
	LDA.b $0A
	STA.b $06
	LDA.b $0C

label_C09228:
	STA.b $08
	RTL

;--------------------------------------------------------------------

label_C0922B:
	JSL.l label_C0912C
	TYA
	RTL

;--------------------------------------------------------------------

label_C09231:
	JSL.l label_C0915B
	TYA
	RTL

;--------------------------------------------------------------------

label_C09237:
	JSL label_C091A6
	BRA label_C09222

;--------------------------------------------------------------------

label_C0923D:
	ASL
label_C0923E:
	DEY
	BPL.b label_C0923D
	RTL

;--------------------------------------------------------------------

label_C09242:
	ASL.b $06
	ROL.b $08
label_C09246:
	DEY
	BPL.b label_C09242
	RTL

;--------------------------------------------------------------------

label_C0924A:
	CMP.b #$00
	BPL.b label_C09251
	BMI.b label_C09257

label_C09250:
	LSR

label_C09251:
	DEY
	BPL.b label_C09250
	RTL

label_C09255:
	SEC
	ROR

label_C09257:
	DEY
	BPL.b label_C09255
	RTL

;--------------------------------------------------------------------

label_C0925B:
	CMP.w #$0000
	BPL.b label_C09251
	BMI.b label_C09257
	LDA.b $08
	BPL.b label_C0926C
	BMI.b label_C09275

label_C09268:
	LSR.b $08
	ROR.b $06

label_C0926C:
	DEY
	BPL.b label_C09268
	RTL

label_C09270:
	SEC
	ROR.b $08
	ROR.b $06

label_C09275:
	DEY
	BPL.b label_C09270
	RTL

;--------------------------------------------------------------------

label_C09279:
	JMP.w [$00BC]

;--------------------------------------------------------------------

label_C0927C:
	LDA.w #label_C0DB0F
	STA.w $0A5E
	LDX.w #$FFFF
	STX.w $0A50
	STX.w $0AD8
	STX.w $12E4
	INX
	STX.w $0A52
	STX.w $0A54
	CLC
	LDX.w #$0038
label_C09299:
	TXA
	ADC.w #$0002
	STA.w $0A9E,X
	DEX
	DEX
	BPL.b label_C09299
	LDX.w #$0088
label_C092A7:
	TXA
	ADC.w #$0002
	STA.w $125A,X
	DEX
	DEX
	BPL.b label_C092A7
	LDX.w #$003A
	LDA.w #$FFFF
label_C092B8:
	STA.w $0A62,X
	DEX
	DEX
	BPL.b label_C092B8
	LDX.w #$003A
label_C092C2:
	STZ.w $116A,X
	STZ.w $10B6,X
	DEX
	DEX
	BPL.b label_C092C2
	LDX.w #$0006
label_C092CF:
	STZ.w $1A12,X
	STZ.w $1A1A,X
	STZ.w $1A22,X
	STZ.w $1A32,X
	STZ.w $1A2A,X
	STZ.w $1A3A,X
	STZ.w $1A02,X
	STZ.w $1A0A,X
	STZ.w $103E,X
	DEX
	DEX
	BPL.b label_C092CF
	JSR.w label_C00000
	STZ.w $0A60
	RTL

;--------------------------------------------------------------------

; Note: Related to initializing a script

label_C092F5:
	PHA
	STZ.w $0A48
	STZ.w $0A38
	STZ.w $0A3A
	STZ.w $0A3C
	STZ.w $0A3E
	STZ.w $0A40
	STZ.w $0A42
	STZ.w $0A44
	STZ.w $0A46
	STZ.w $0A4A
	LDA.w #$0000
	STA.w $0A4C
	LDA.w #$001E
	STA.w $0A4E
	PLA
label_C09321:
	PHA
	PHY
	PHX
	LDA.w $0A4C
	ASL
	STA.w $0A4C
	LDA.w $0A4E
	ASL
	STA.w $0A4E
	JSR.w label_C09C02
	BCC.b label_C0933E
	PLA
	PLA
	PLA
	LDA.w #$0000
	RTL

label_C0933E:
	JSR.w label_C09D03
	TYA
	STA.w $0ADA,X
	LDA.w #$FFFF
	STA.w $125A,Y
	LDA.w #label_C09FC8
	STA.w $121E,X
	LDA.w #label_C0A023
	STA.w $11A6,X
	LDA.w #label_C0A3A4
	STA.w $11E2,X
	LDA.w $0A38
	STA.w $0E5E,X
	LDA.w $0A3A
	STA.w $0E9A,X
	LDA.w $0A3C
	STA.w $0ED6,X
	LDA.w $0A3E
	STA.w $0F12,X
	LDA.w $0A40
	STA.w $0F4E,X
	LDA.w $0A42
	STA.w $0F8A,X
	LDA.w $0A44
	STA.w $0FC6,X
	LDA.w $0A46
	STA.w $1002,X
	LDA.w $0A4A
	STA.w $103E,X
	LDA.w #$8000
	STA.w $0C42,X
	STA.w $0C7E,X
	STA.w $0CBA,X
	PLA
	STA.w $0B8E,X
	STA.w $0B16,X
	PLA
	STA.w $0BCA,X
	STA.w $0B52,X
	LDA.w $0A48
	STA.w $0C06,X
	JSR.w label_C09C57
	PLA
	BRA.b label_C093CB

label_C093B9:
	PHA
	JSR.w label_C09C99
	JSR.w label_C09D03
	TYA
	STA.w $0ADA,X
	LDA.w #$FFFF
	STA.w $125A,Y
	PLA
label_C093CB:
	STA.w $0A62,X
	PHX
	ASL
	ADC.w $0A62,X
	TXY
	TAX
	LDA.l ScriptPtrs+$02,X
	TAY
	LDA.l ScriptPtrs,X
	PLX
	STZ.w $10F2,X
	DEC.w $10F2,X
	STZ.w $0DAA,X
	STZ.w $0CF6,X
	STZ.w $0DE6,X
	STZ.w $0D32,X
	STZ.w $0E22,X
	STZ.w $0D6E,X
	BRA.b label_C0941E

label_C093F9:
	PHA
	TXA
	ASL
	TAX
	PLA
	JSL.l label_C09403
	RTL

label_C09403:
	PHY
	PHA
	LDA.w $0A62,X
	BPL.b label_C0940C
label_C0940A:
	BRA.b label_C0940A

label_C0940C:
	JSR.w label_C09C99
	JSR.w label_C09D03
	TYA
	STA.w $0ADA,X
	LDA.w #$FFFF
	STA.w $125A,Y
	PLA
	PLY
label_C0941E:
	PHY
	PHA
	JSR.w label_C09DA1
	TXY
	LDX.w $0ADA,Y
	PLA
	STA.w $13FE,X
	PLA
	AND.w #$00FF
	STA.w $148A,X
	STZ.w $1372,X
	STZ.w $12E6,X
	TYA
	LSR
	CLC
	RTL

;--------------------------------------------------------------------

label_C0943C:
	LDX.w $0A50
	BMI.b label_C09450

label_C09441:
	LDA.w $10B6,X
	ORA.w #$C000
	STA.w $10B6,X
	LDA.w $0A9E,X
	TAX
	BPL.b label_C09441

label_C09450:
	RTL

;--------------------------------------------------------------------

label_C09451:
	LDX.w $0A50
	BMI.b label_C09465

label_C09456:
	LDA.w $10B6,X
	AND.w #$3FFF
	STA.w $10B6,X
	LDA.w $0A9E,X
	TAX
	BPL.b label_C09456

label_C09465:
	RTL

;--------------------------------------------------------------------

label_C09466:
	LDA.w $0A60
	BEQ.b label_C0946C
	RTL

label_C0946C:
	JML.l label_C09470&$BFFFFF	; Note: This code must jump to bank $80 or it will not work.

label_C09470:
	REP.b #$30
	REP.b #$20			; Optimization: Unnecessary REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$00A0
	AND.w #$FF00
	TCD
	PLA
	INC.w $0A60
	LDX.w $0A50
	BMI.b label_C094CB
	STZ.b $80
	STZ.b $86
label_C0948C:
	STX.b $88
	STX.w $1A44
	STX.w $1A42
	LSR.w $1A42
	LDA.w $0A9E,X
	STA.w $0A56
	JSR.w label_C094D0
	LDX.w $0A56
	BPL.b label_C0948C
	LDX.w $0A50
	BMI.b label_C094CB
label_C094AA:
	STX.w $1A42
	LSR.w $1A42
	STX.b $88
	BIT.w $10B6,X
	BVS.b label_C094BA
	JSR.w ($121E,X)
label_C094BA:
	JSR.w ($11A6,X)
	LDX.b $88
	LDA.w $0A9E,X
	TAX
	BPL.b label_C094AA
	LDX.w #$0000
	JSR.w ($0A5E,X)
label_C094CB:
	PLD
	STZ.w $0A60
	RTL

;--------------------------------------------------------------------

label_C094D0:
	BIT.w $10B6,X
	BVS.b label_C094F3
	LDY.w $0ADA,X
label_C094D8:
	STY.b $8A
	STY.w $1A48
	STY.w $1A46
	LSR.w $1A46
	LDA.w $125A,Y
	STA.w $0A58
	JSR.w label_C09506
	LDY.w $0A58
	BPL.b label_C094D8
	LDX.b $88
label_C094F3:
	LDA.w $10B6,X
	BMI.b label_C09505
	STA.w $0A5C
	LDA.w $107A,X
	STA.w $0A5A
	JSL.l label_C09D9E
label_C09505:
	RTS

;--------------------------------------------------------------------

label_C09506:
	LDX.b $8A
	LDA.w $1372,X
	BNE.b label_C09554
	LDY.w $13FE,X
	LDA.w $148A,X
	STA.b $82
	TXA
	ASL
	ASL
	ASL
	ADC.w #$15A2
	STA.b $84
label_C0951E:
	LDA.b [$80],Y
	INY
	AND.w #$00FF
	CMP.w #$0070
	BCS.b label_C09530
	ASL
	TAX
	JSR.w (ScriptOpcodePtrs,X)
	BRA.b label_C09544

label_C09530:
	STA.b $90
	AND.w #$000F
	STA.w $1372,X
	LDA.b $90
	AND.w #$0070
	LSR
	LSR
	LSR
	TAX
	JSR.w (DATA_C095E2,X)
label_C09544:
	LDX.b $8A
	LDA.w $1372,X
	BEQ.b label_C0951E
	TYA
	STA.w $13FE,X
	LDA.b $82
	STA.w $148A,X
label_C09554:
	DEC.w $1372,X
	RTS

ScriptOpcodePtrs:
	dw label_C095F2
	dw label_C09603
	dw label_C09627
	dw label_C0964D
	dw label_C09685
	dw label_C096AA
	dw label_C096C3
	dw label_C099DD
	dw label_C09A1A
	dw label_C09A2E
	dw label_C0995D
	dw label_C0996B
	dw label_C099C3
	dw label_C09A9F
	dw label_C09AE2
	dw label_C09B09
	dw label_C09979
	dw label_C0999E
	dw label_C09B0F
	dw label_C09A0E
	dw label_C09A87
	dw ScriptOpcode15_Unknown
	dw label_C09B2C
	dw label_C09B44
	dw label_C09A5C
	dw label_C09649
	dw label_C09658
	dw label_C0966F
	dw label_C09B4D
	dw label_C09B61
	dw label_C09B6B
	dw label_C09B79
	dw label_C09B91
	dw label_C09BB4
	dw label_C09BE4
	dw label_C09BEE
	dw label_C09620
	dw label_C09BF8
	dw label_C09BCC
	dw label_C09A97
	dw label_C096E3
	dw label_C096F3
	dw label_C09703
	dw label_C098A0
	dw label_C098AE
	dw label_C098BC
	dw label_C0976D
	dw label_C09792
	dw label_C097B7
	dw label_C097DC
	dw label_C097EF
	dw label_C09802
	dw label_C09826
	dw label_C0984A
	dw label_C09875
	dw label_C098CA
	dw label_C098DE
	dw label_C098F2
	dw label_C0991C
	dw label_C096CF
	dw label_C09A38
	dw label_C09A3E
	dw label_C09A44
	dw label_C09713
	dw label_C09731
	dw label_C0974F
	dw ScriptOpcode42_JSLToAddress
	dw label_C09931
	dw label_C09BA9

DATA_C095E2:
	dw label_C096CF
	dw label_C09A38
	dw label_C09A3E
	dw label_C09A44
	dw label_C09713
	dw label_C09731
	dw label_C0974F
	dw label_C0993D

;--------------------------------------------------------------------

label_C095F2:
	LDX.b $88
	JSR.w label_C09C3B
	LDX.b $8A
	LDA.w #$FFFF
	STA.w $1372,X
	STA.w $0A58
	RTS

;--------------------------------------------------------------------

label_C09603:
	LDA.b [$80],Y
	LDX.b $8A
	INY
label_C09608:
	STA.b $90
	STY.b $94
	TYA
	LDY.w $12E6,X
	STA.b ($84),Y
	INY
	INY
	LDA.b $90
	STA.b ($84),Y
	INY
	TYA
	STA.w $12E6,X
	LDY.b $94
	RTS

;--------------------------------------------------------------------

label_C09620:
	LDX.b $8A
	LDA.w $1516,X
	BRA.b label_C09608

;--------------------------------------------------------------------

label_C09627:
	STY.b $94
	LDX.b $8A
	LDY.w $12E6,X
	DEY
	SEP.b #$20
	LDA.b ($84),Y
	DEC
	STA.b ($84),Y
	REP.b #$20
	BNE.b label_C09643
	DEY
	DEY
	TYA
	STA.w $12E6,X
	LDY.b $94
	RTS

label_C09643:
	DEY
	DEY
	LDA.b ($84),Y
	TAY
	RTS

;--------------------------------------------------------------------

label_C09649:
	LDA.b [$80],Y
	TAY
	RTS

;--------------------------------------------------------------------

label_C0964D:
	LDA.b [$80],Y
	TAX
	INY
	INY
	LDA.b [$80],Y
	STA.b $82
	TXY
	RTS

;--------------------------------------------------------------------

label_C09658:
	LDA.b [$80],Y
	STA.b $90
	INY
	INY
	TYA
	LDX.b $8A
	LDY.w $12E6,X
	STA.b ($84),Y
	INY
	INY
	TYA
	STA.w $12E6,X
	LDY.b $90
	RTS

;--------------------------------------------------------------------

label_C0966F:
	STY.b $94
	LDX.b $8A
	LDY.w $12E6,X
	BNE.b label_C0967B
	JMP.w label_C099C3

label_C0967B:
	DEY
	DEY
	TYA
	STA.w $12E6,X
	LDA.b ($84),Y
	TAY
	RTS

;--------------------------------------------------------------------

label_C09685:
	LDA.b [$80],Y
	STA.b $8C
	INY
	INY
	LDA.b [$80],Y
	STA.b $8E
	INY
	TYA
	LDX.b $8A
	LDY.w $12E6,X
	STA.b ($84),Y
	INY
	INY
	LDA.b $82
	STA.b ($84),Y
	INY
	TYA
	STA.w $12E6,X
	LDA.b $8E
	STA.b $82
	LDY.b $8C
	RTS

;--------------------------------------------------------------------

label_C096AA:
	LDX.b $8A
	LDY.w $12E6,X
	BNE.b label_C096B4
	JMP.w label_C099C3

label_C096B4:
	DEY
	LDA.b ($84),Y
	STA.b $82
	DEY
	DEY
	TYA
	STA.w $12E6,X
	LDA.b ($84),Y
	TAY
	RTS


;--------------------------------------------------------------------

label_C096C3:
	LDX.b $8A
	LDA.b [$80],Y
	AND.w #$00FF
	STA.w $1372,X
	INY
	RTS

;--------------------------------------------------------------------

label_C096CF:
	LDX.b $88
	LDA.b [$80],Y
	AND.w #$00FF
	CMP.w #$00FF
	BNE.b label_C096DE
	LDA.w #$FFFF

label_C096DE:
	STA.w $10F2,X
	INY
	RTS

;--------------------------------------------------------------------

label_C096E3:
	LDX.b $88
	LDA.b [$80],Y
	INY
	INY
	STA.w $0B8E,X
	LDA.w #$8000
	STA.w $0C42,X
	RTS

;--------------------------------------------------------------------

label_C096F3:
	LDX.b $88
	LDA.b [$80],Y
	INY
	INY
	STA.w $0BCA,X
	LDA.w #$8000
	STA.w $0C7E,X
	RTS

;--------------------------------------------------------------------

label_C09703:
	LDX.b $88
	LDA.b [$80],Y
	INY
	INY
	STA.w $0C06,X
	LDA.w #$8000
	STA.w $0CBA,X
	RTS

;--------------------------------------------------------------------

label_C09713:
	LDX.b $88
	LDA.b [$80],Y
	INY
	INY
	STA.b $90
	AND.w #$00FF
	XBA
	STA.w $0DAA,X
	LDA.b $90
	AND.w #$FF00
	BPL.b label_C0972C
	ORA.w #$00FF

label_C0972C:
	XBA
	STA.w $0CF6,X
	RTS

;--------------------------------------------------------------------

label_C09731:
	LDX.b $88
	LDA.b [$80],Y
	INY
	INY
	STA.b $90
	AND.w #$00FF
	XBA
	STA.w $0DE6,X
	LDA.b $90
	AND.w #$FF00
	BPL.b label_C0974A
	ORA.w #$00FF

label_C0974A:
	XBA
	STA.w $0D32,X
	RTS

;--------------------------------------------------------------------

label_C0974F:
	LDX.b $88
	LDA.b [$80],Y
	INY
	INY
	STA.b $90
	AND.w #$00FF
	XBA
	STA.w $0E22,X
	LDA.b $90
	AND.w #$FF00
	BPL.b label_C09768
	ORA.w #$00FF

label_C09768:
	XBA
	STA.w $0D6E,X
	RTS

;--------------------------------------------------------------------

label_C0976D:
	LDX.b $88
	LDA.b [$80],Y
	INY
	INY
	STA.b $90
	AND.w #$00FF
	XBA
	CLC
	ADC.w $0DAA,X
	STA.w $0DAA,X
	LDA.b $90
	AND.w #$FF00
	BPL.b label_C0978A
	ORA.w #$00FF

label_C0978A:
	XBA
	ADC.w $0CF6,X
	STA.w $0CF6,X
	RTS

;--------------------------------------------------------------------

label_C09792:
	LDX.b $88
	LDA.b [$80],Y
	INY
	INY
	STA.b $90
	AND.w #$00FF
	XBA
	CLC
	ADC.w $0DE6,X
	STA.w $0DE6,X
	LDA.b $90
	AND.w #$FF00
	BPL.b label_C097AF
	ORA.w #$00FF

label_C097AF:
	XBA
	ADC.w $0D32,X
	STA.w $0D32,X
	RTS

;--------------------------------------------------------------------

label_C097B7:
	LDX.b $88
	LDA.b [$80],Y
	INY
	INY
	STA.b $90
	AND.w #$00FF
	XBA
	CLC
	ADC.w $0E22,X
	STA.w $0E22,X
	LDA.b $90
	AND.w #$FF00
	BPL.b label_C097D4
	ORA.w #$00FF

label_C097D4:
	XBA
	ADC.w $0D6E,X
	STA.w $0D6E,X
	RTS

;--------------------------------------------------------------------

label_C097DC:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	INY
	LDA.b [$80],Y
	STA.w $1A02,X
	STZ.w $1A12,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C097EF:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	INY
	LDA.b [$80],Y
	STA.w $1A0A,X
	STZ.w $1A1A,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09802:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	INY
	LDA.b [$80],Y
	STA.b $90
	AND.w #$00FF
	XBA
	STA.w $1A32,X
	LDA.b $90
	AND.w #$FF00
	BPL.b label_C0981F
	ORA.w #$00FF

label_C0981F:
	XBA
	STA.w $1A22,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09826:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	INY
	LDA.b [$80],Y
	STA.b $90
	AND.w #$00FF
	XBA
	STA.w $1A3A,X
	LDA.b $90
	AND.w #$FF00
	BPL.b label_C09843
	ORA.w #$00FF

label_C09843:
	XBA
	STA.w $1A2A,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C0984A:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	INY
	LDA.b [$80],Y
	STA.b $90
	AND.w #$00FF
	XBA
	CLC
	ADC.w $1A32,X
	STA.w $1A32,X
	LDA.b $90
	AND.w #$FF00
	BPL.b label_C0986B
	ORA.w #$00FF

label_C0986B:
	XBA
	ADC.w $1A22,X
	STA.w $1A22,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09875:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	INY
	LDA.b [$80],Y
	STA.b $90
	AND.w #$00FF
	XBA
	CLC
	ADC.w $1A3A,X
	STA.w $1A3A,X
	LDA.b $90
	AND.w #$FF00
	BPL.b label_C09896
	ORA.w #$00FF

label_C09896:
	XBA
	ADC.w $1A2A,X
	STA.w $1A2A,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C098A0:
	LDX.b $88
	LDA.b [$80],Y
	CLC
	ADC.w $0B8E,X
	STA.w $0B8E,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C098AE:
	LDX.b $88
	LDA.b [$80],Y
	CLC
	ADC.w $0BCA,X
	STA.w $0BCA,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C098BC:
	LDX.b $88
	LDA.b [$80],Y
	CLC
	ADC.w $0C06,X
	STA.w $0C06,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C098CA:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	INY
	LDA.b [$80],Y
	CLC
	ADC.w $1A02,X
	STA.w $1A02,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C098DE:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	INY
	LDA.b [$80],Y
	CLC
	ADC.w $1A0A,X
	STA.w $1A0A,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C098F2:
	LDX.b $88
	STZ.w $0DAA,X
	STZ.w $0CF6,X
	STZ.w $0DE6,X
	STZ.w $0D32,X
	STZ.w $0E22,X
	STZ.w $0D6E,X
	RTS

;--------------------------------------------------------------------

label_C09907:
	ASL
	TAX
	STZ.w $0DAA,X
	STZ.w $0CF6,X
	STZ.w $0DE6,X
	STZ.w $0D32,X
	STZ.w $0E22,X
	STZ.w $0D6E,X
	RTL

;--------------------------------------------------------------------

label_C0991C:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	STZ.w $1A32,X
	STZ.w $1A22,X
	STZ.w $1A3A,X
	STZ.w $1A2A,X
	INY
	RTS

;--------------------------------------------------------------------

label_C09931:
	LDX.b $88
	LDA.b [$80],Y
	AND.w #$00FF
	INY
	STA.w $103E,X
	RTS

;--------------------------------------------------------------------

ScriptOpcode42_JSLToAddress:
label_C0993D:
	LDA.b [$80],Y
	STA.w $0A5A
	INY
	INY
	LDA.b [$80],Y
	INY
	STA.w $0A5C
	STY.b $94
	LDX.b $8A
	LDA.w $1516,X
	JSL.l label_C09D9E
	LDX.b $8A
	STA.w $1516,X
	LDY.b $94
	RTS

;--------------------------------------------------------------------

label_C0995D:
	LDX.b $8A
	LDA.w $1516,X
	BNE.b label_C09968
	LDA.b [$80],Y
	TAY
	RTS

label_C09968:
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C0996B:
	LDX.b $8A
	LDA.w $1516,X
	BEQ.b label_C09976
	LDA.b [$80],Y
	TAY
	RTS

label_C09976:
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09979:
	LDX.b $8A
	LDA.w $1516,X
	STA.b $90
	LDA.b [$80],Y
	AND.w #$00FF
	INY
	STY.b $94
	CMP.b $90
	BCC.b label_C0998E
	BNE.b label_C09993

label_C0998E:
	ASL
	ADC.b $94
	TAY
	RTS

label_C09993:
	LDA.b $90
	ASL
	CLC
	ADC.b $94
	TAY
	LDA.b [$80],Y
	TAY
	RTS

;--------------------------------------------------------------------

label_C0999E:
	LDX.b $8A
	LDA.w $1516,X
	STA.b $90
	LDA.b [$80],Y
	AND.w #$00FF
	INY
	STY.b $94
	CMP.b $90
	BCC.b label_C0998E
	BEQ.b label_C0998E
	LDY.w $12E6,X
	ASL
	ADC.b $94
	STA.b ($84),Y
	INY
	INY
	TYA
	STA.w $12E6,X
	BRA.b label_C09993

;--------------------------------------------------------------------

label_C099C3:
	STY.b $94
	LDY.b $8A

label_C099C7:
	LDX.b $88
	JSR.w label_C09D12
	LDA.w #$FFFF
	STA.w $1372,Y
	LDA.w $0ADA,X
	BPL.b label_C099DA
	JMP.w label_C095F2

label_C099DA:
	LDY.b $94
	RTS

;--------------------------------------------------------------------

label_C099DD:
	STY.b $94
	JSR.w label_C09D03
	BCS.b label_C09A09
	STY.w $0A58
	LDX.b $8A
	LDA.w $125A,X
	STA.w $125A,Y
	TYA
	STA.w $125A,X
	TYX
	STZ.w $12E6,X
	STZ.w $1372,X
	LDY.b $94
	LDA.b [$80],Y
	STA.w $13FE,X
	LDA.b $82
	STA.w $148A,X
	INY
	INY
	RTS

label_C09A09:
	LDY.b $94
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09A0E:
	STY.b $94
	LDX.b $8A
	LDY.w $125A,X
	BPL.b label_C099C7
	LDY.b $94
	RTS

;--------------------------------------------------------------------

label_C09A1A:
	LDX.b $88
	LDA.b [$80],Y
	STA.w $107A,X
	INY
	INY
	SEP.b #$20
	LDA.b [$80],Y
	STA.w $10B6,X
	REP.b #$20
	INY
	RTS

;--------------------------------------------------------------------

label_C09A2E:
	DEY
	LDX.b $8A
	LDA.w #$FFFF
	STA.w $1372,X
	RTS

;--------------------------------------------------------------------

label_C09A38:
	LDX.b $88
	INC.w $10F2,X
	RTS

;--------------------------------------------------------------------

label_C09A3E:
	LDX.b $88
	DEC.w $10F2,X
	RTS

;--------------------------------------------------------------------

label_C09A44:
	LDX.b $88
	LDA.b [$80],Y
	AND.w #$00FF
	CMP.w #$0080
	BCC.b label_C09A54
	ORA.w #$FF00
	CLC

label_C09A54:
	ADC.w $10F2,X
	STA.w $10F2,X
	INY
	RTS

;--------------------------------------------------------------------

label_C09A5C:
	LDA.b [$80],Y
	STA.b $8C
	INY
	INY
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	INY
	LDA.b [$80],Y
	STA.b $90
	INY
	LDA.l DATA_C09ABD,X
	STA.w $0A5A
	LDA.w #$0000
	STA.w $0A5C
	LDX.w #$0000
	SEP.b #$20
	JSR.w label_C09D9E
	REP.b #$20
	RTS

;--------------------------------------------------------------------

label_C09A87:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	LDA.l DATA_C09AF9,X
	CLC
	ADC.b $88
	BRA.b label_C09AA2

;--------------------------------------------------------------------

label_C09A97:
	LDA.w #$1516
	CLC
	ADC.b $8A
	BRA.b label_C09AA3

;--------------------------------------------------------------------

label_C09A9F:
	LDA.b [$80],Y
	INY
label_C09AA2:
	INY
label_C09AA3:
	STA.b $8C
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	INY
	LDA.b [$80],Y
	STA.b $90
label_C09AB0:
	INY
	INY
	LDA.l DATA_C09ABD,X
	STA.w $0A5A
	JMP.w ($0A5A)

DATA_C09ABD:
	dw label_C09AC5
	dw label_C09ACC
	dw label_C09AD3
	dw label_C09ADB

;--------------------------------------------------------------------

label_C09AC5:
	LDA.b ($8C)
	AND.b $90
	STA.b ($8C)
	RTS

;--------------------------------------------------------------------

label_C09ACC:
	LDA.b ($8C)
	ORA.b $90
	STA.b ($8C)
	RTS

;--------------------------------------------------------------------

label_C09AD3:
	LDA.b ($8C)
	CLC
	ADC.b $90
	STA.b ($8C)
	RTS

;--------------------------------------------------------------------

label_C09ADB:
	LDA.b ($8C)
	EOR.b $90
	STA.b ($8C)
	RTS

;--------------------------------------------------------------------

label_C09AE2:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	LDA.l DATA_C09AF9,X
	ADC.b $88
	TAX
	INY
	LDA.b [$80],Y
	STA.w $0000,X
	INY
	INY
	RTS

DATA_C09AF9:
	dw $0E5E,$0E9A,$0ED6,$0F12
	dw $0F4E,$0F8A,$0FC6,$1002

;--------------------------------------------------------------------

label_C09B09:
	LDX.b $88
	JSR.w label_C09DA1
	RTS

;--------------------------------------------------------------------

label_C09B0F:
	LDA.b [$80],Y
	TAX
	INY
	INY
	SEP.b #$20
	LDA.b [$80],Y
	STA.w $0000,X
	REP.b #$20
	INY
	RTS

;--------------------------------------------------------------------

ScriptOpcode15_Unknown:
;$C09B1F
	LDA.b [$80],Y
	TAX
	INY
	INY
	LDA.b [$80],Y
	STA.w $0000,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09B2C:
	LDX.b $8A
	LDA.w $1516,X
	BNE.b label_C09B41
label_C09B33:
	LDA.b [$80],Y
	TAY
	LDA.w $12E6,X
	SEC
	SBC.w #$0003
	STA.w $12E6,X
	RTS

label_C09B41:
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09B44:
	LDX.b $8A
	LDA.w $1516,X
	BEQ.b label_C09B41
	BRA.b label_C09B33

;--------------------------------------------------------------------

label_C09B4D:
	LDX.b $88
	LDA.b [$80],Y
	STA.w $112E,X
	INY
	INY
	SEP.b #$20
	LDA.b [$80],Y
	STA.w $116A,X
	REP.b #$20
	INY
	RTS

;--------------------------------------------------------------------

label_C09B61:
	LDA.b [$80],Y
	LDX.b $8A
	STA.w $1516,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09B6B:
	LDA.b [$80],Y
	TAX
	LDA.w $0000,X
	LDX.b $8A
	STA.w $1516,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09B79:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	LDA.l DATA_C09AF9,X
	ADC.b $88
	STA.b $8C
	LDX.b $8A
	LDA.w $1516,X
	STA.b ($8C)
	INY
	RTS

;--------------------------------------------------------------------

label_C09B91:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	LDA.l DATA_C09AF9,X
	ADC.b $88
	TAX
	LDA.w $0000,X
	LDX.b $8A
	STA.w $1516,X
	INY
	RTS

;--------------------------------------------------------------------

label_C09BA9:
	LDX.b $8A
	LDA.w $1516,X
	BEQ.b label_C09BB3
	STA.w $1372,X

label_C09BB3:
	RTS

;--------------------------------------------------------------------

label_C09BB4:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	LDA.l DATA_C09AF9,X
	ADC.b $88
	TAX
	LDA.w $0000,X
	LDX.b $8A
	STA.w $1372,X
	INY
	RTS

;--------------------------------------------------------------------

label_C09BCC:
	LDA.b [$80],Y
	AND.w #$00FF
	ASL
	TAX
	LDA.l DATA_C09AF9,X
	ADC.b $88
	TAX
	LDA.w $0000,X
	LDX.b $88
	STA.w $10F2,X
	INY
	RTS

;--------------------------------------------------------------------

label_C09BE4:
	LDA.b [$80],Y
	LDX.b $88
	STA.w $11E2,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09BEE:
	LDA.b [$80],Y
	LDX.b $88
	STA.w $11A6,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09BF8:
	LDA.b [$80],Y
	LDX.b $88
	STA.w $121E,X
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09C02:
	LDA.w $0A54
	BMI.b label_C09C20
	LDY.w #$FFFF
	LDA.w $0A52
	BMI.b label_C09C20
label_C09C0F:
	TAX
	CPX.w $0A4C
	BCC.b label_C09C1A
	CPX.w $0A4E
	BCC.b label_C09C22
label_C09C1A:
	TXY
	LDA.w $0A9E,X
	BPL.b label_C09C0F
label_C09C20:
	SEC
	RTS

label_C09C22:
	TYA
	BPL.b label_C09C2D
	LDA.w $0A9E,X
	STA.w $0A52
	CLC
	RTS

label_C09C2D:
	LDA.w $0A9E,X
	STA.w $0A9E,Y
	CLC
	RTS

;--------------------------------------------------------------------

label_C09C35:
	ASL
	TAX
	JSR.w label_C09C3B
	RTL

label_C09C3B:
	PHA
	LDA.w $0A62,X
	BMI.b label_C09C55
	PHY
	LDA.w #$FFFF
	STA.w $0A62,X
	JSR.w label_C09DA1
	JSR.w label_C09C99
	JSR.w label_C09C73
	JSR.w label_C09C8F
	PLY
label_C09C55:
	PLA
	RTS

;--------------------------------------------------------------------

label_C09C57:
	LDA.w #$FFFF
	STA.w $0A9E,X
	TXA
	LDX.w $0A50
	BPL.b label_C09C68
	STA.w $0A50
	BRA.b label_C09C71

label_C09C68:
	TXY
	LDX.w $0A9E,Y
	BPL.b label_C09C68
	STA.w $0A9E,Y
label_C09C71:
	TAX
	RTS

;--------------------------------------------------------------------

label_C09C73:
	JSR.w label_C09CB5
	LDA.w $0A9E,X
	CPY.w #$FFFF
	BEQ.b label_C09C83
	STA.w $0A9E,Y
	BRA.b label_C09C86

label_C09C83:
	STA.w $0A50
label_C09C86:
	CPX.w $0A56
	BNE.b label_C09C8E
	STA.w $0A56
label_C09C8E:
	RTS

;--------------------------------------------------------------------

label_C09C8F:
	LDA.w $0A52
	STA.w $0A9E,X
	STX.w $0A52
	RTS

;--------------------------------------------------------------------

label_C09C99:
	LDA.w $0ADA,X
	BMI.b label_C09CB4
	PHX
	LDA.w $0A54
	PHA
	LDA.w $0ADA,X
	STA.w $0A54
label_C09CA9:
	TAX
	LDA.w $125A,X
	BPL.b label_C09CA9
	PLA
	STA.w $125A,X
	PLX
label_C09CB4:
	RTS

;--------------------------------------------------------------------

label_C09CB5:
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$0002
	TCD
	PLA
	STX.b $00
	LDY.w #$FFFF
	LDX.w $0A50
label_C09CC8:
	CPX.b $00
	BEQ.b label_C09CD3
	TXY
	LDA.w $0A9E,X
	TAX
	BRA.b label_C09CC8

label_C09CD3:
	LDX.b $00
	PLD
	RTS

;--------------------------------------------------------------------

label_C09CD7:
	LDA.w #$8000
	LDX.w $0A52
	BRA.b label_C09CE6

label_C09CDF:
	LDY.w $0A9E,X
	STA.w $0A9E,X
	TYX
label_C09CE6:
	BPL.b label_C09CDF
	LDX.w #$003A
	LDY.w #$FFFF
label_C09CEE:
	LDA.w $0A9E,X
	CMP.w #$8000
	BNE.b label_C09CFB
	TYA
	STA.w $0A9E,X
	TXY
label_C09CFB:
	DEX
	DEX
	BPL.b label_C09CEE
	STY.w $0A52
	RTL

;--------------------------------------------------------------------

label_C09D03:
	LDY.w $0A54
	BPL.b label_C09D0A
	SEC
	RTS

label_C09D0A:
	LDA.w $125A,Y
	STA.w $0A54
	CLC
	RTS

;--------------------------------------------------------------------

label_C09D12:
	JSR.w label_C09D1F
	LDA.w $0A54
	STA.w $125A,Y
	STY.w $0A54
	RTS

label_C09D1F:
	PHX
	JSR.w label_C09D3E
	LDA.w $125A,Y
	CPX.w #$FFFF
	BEQ.b label_C09D31
	STA.w $125A,X
	PLX
	BRA.b label_C09D35

label_C09D31:
	PLX
	STA.w $0ADA,X
label_C09D35:
	CPY.w $0A58
	BNE.b label_C09D3D
	STA.w $0A58
label_C09D3D:
	RTS

;--------------------------------------------------------------------

label_C09D3E:
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$0002
	TCD
	PLA
	STY.b $00
	LDY.w $0ADA,X
	LDX.w #$FFFF
label_C09D51:
	CPY.b $00
	BEQ.b label_C09D5C
	TYX
	LDA.w $125A,Y
	TAY
	BRA.b label_C09D51

label_C09D5C:
	LDY.b $00
	PLD
	RTS

;--------------------------------------------------------------------

label_C09D60:
	STY.b $94
	STZ.b $00
	LDA.w $0ADA,X
	CMP.b $94
	BEQ.b label_C09D75
label_C09D6B:
	INC.b $00
	TAY
	LDA.w $125A,Y
	CMP.b $94
	BNE.b label_C09D6B
label_C09D75:
	LDA.b $00
	RTS

;--------------------------------------------------------------------

label_C09D78:
	LDY.w $0ADA,X
	DEC
	BMI.b label_C09D85
label_C09D7E:
	LDA.w $125A,Y
	TAY
	DEC
	BPL.b label_C09D7E
label_C09D85:
	RTS

;--------------------------------------------------------------------

EB_ReadScriptParameterByte:
.RTL:
;$C09D86
	LDA.b [$80],Y
	INY
	AND.w #$00FF
	RTL


.RTS:
;$C09D8D
	LDA.b [$80],Y
	INY
	AND.w #$00FF
	RTS

EB_ReadScriptParameterWord:
.RTL:
;$C09D94
	LDA [$80],Y
	INY
	INY
	RTL

.RTS:
;$C09D99
	LDA.b [$80],Y
	INY
	INY
	RTS

;--------------------------------------------------------------------

label_C09D9E:
	JMP.w [$0A5A]

;--------------------------------------------------------------------

label_C09DA1:
	LDA.w #$943B
	STA.w $107A,X
	LDA.w #$00C0
	STA.w $10B6,X
	RTS

;--------------------------------------------------------------------

org $C09E71
label_C09E71:
	JSR.w EB_ReadScriptParameterWord_RTS
	STY.b $94
	JMP.w label_C092F5

;--------------------------------------------------------------------

org $C09EFF
label_C09EFF:
	LDX.w $1A44
	BRA.b label_C09F0A

label_C09F04:
	LDX.b $88
	BRA.b label_C09F0A

label_C09F08:
	ASL
	TAX
label_C09F0A:
	LDY.w #$0000
	LDA.w $0C42,X
	CLC
	ADC.w $0DAA,X
	LDA.w $0B8E,X
	ADC.w $0CF6,X
	STA.w $2848
	CMP.w $0B8E,X
	BEQ.b label_C09F23
	INY
label_C09F23:
	LDA.w $0C7E,X
	CLC
	ADC.w $0DE6,X
	LDA.w $0BCA,X
	ADC.w $0D32,X
	STA.w $284A
	CMP.w $0BCA,X
	BEQ.b label_C09F39
	INY
label_C09F39:
	TYA
	RTL

;--------------------------------------------------------------------

org $C09FBB
label_C09FBB:
	LDA.b [$80],Y
	INY
	INY
	STY.b $94
	XBA
	TAX
	XBA
	JML.l label_C0887A

;--------------------------------------------------------------------

label_C09FC8:
	LDX.b $88
label_C09FCA:
	LDA.w $0C42,X
	CLC
	ADC.w $0DAA,X
	STA.w $0C42,X
	LDA.w $0B8E,X
	ADC.w $0CF6,X
	STA.w $0B8E,X
	LDA.w $0C7E,X
	CLC
	ADC.w $0DE6,X
	STA.w $0C7E,X
	LDA.w $0BCA,X
	ADC.w $0D32,X
	STA.w $0BCA,X
label_C09FF0:
	RTS

;--------------------------------------------------------------------

org $C0A023
label_C0A023:
	LDX.b $88
	LDA.w $0B8E,X
	SEC
	SBC.w $0031
	STA.w $0B16,X
	LDA.w $0BCA,X
	SEC
	SBC.w $0033
	STA.w $0B52,X
label_C0A039:
	RTS

;--------------------------------------------------------------------

org $C0A0BB
label_C0A0BB:
	LDX.b $88
	LDA.w $0B8E,X
	STA.w $0B16,X
	LDA.w $0BCA,X
	STA.w $0B52,X
	RTS

;--------------------------------------------------------------------

label_C0A0CA:
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$00A0
	AND.w #$FF00
	TCD
	PLA
label_C0A0D8:
	BMI.b label_C0A0D8
	ASL
	TAX
	STX.b $88
	JSR.w label_C0A0E3
	PLD
	RTS

label_C0A0E3:
	LDA.w $116A,X
	BMI.b label_C0A0F9
	BVS.b label_C0A0F9
	STA.b $8E
	LDA.w $112E,X
	STA.b $8C
	LDA.w $10F2,X
	BMI.b label_C0A0F9
	JMP.w ($11E2,X)

label_C0A0F9:
	RTS

;--------------------------------------------------------------------

label_C0A0FA:
	ASL
	TAY
	SEP.b #$20
	LDA.b $8E
	STA.w $000B
	REP.b #$20
	LDA.b [$8C],Y
	STA.b $96
	LDA.w $103E,X
	STA.w $2400
	LDY.w $0BCA,X
	LDA.w $0B8E,X
	TAX
	LDA.b $96
	JMP.w label_C08C58

;--------------------------------------------------------------------

label_C0A11B:
	RTS

;--------------------------------------------------------------------

org $C0A11C
CheckIfGameShouldRun:
.Main:
;$C0A11C
if !Define_EB_Global_DisableCopyDetection == !FALSE
	SEP.b #$20
	LDA.b #$30
	STA.l $307FF0
	INC
	STA.l $317FF0
	CMP.l $307FF0
	BEQ.b label_C0A13B
	REP.b #$20
	PLA
	TSC
	SBC.w #$0100
	TCD
	JML.l EB_DisplayCopyrightProtectionScreen_Main
endif

label_C0A13B:
	LDA.l !REGISTER_PPUStatusFlag2
	AND.b #$10
	BEQ.b label_C0A14F
	REP.b #$20
	PLA
	TSC
	SBC.w #$0100
	TCD
	JML.l DisplayIncorrectRegionScreen_Main

label_C0A14F:
	REP.b #$20
	RTL

if !Define_EB_Global_DisableCopyDetection != !FALSE
	%FREE_BYTES(NULLROM, 31, $00)
endif

;--------------------------------------------------------------------

label_C0A152:
	JSR.w label_C0A156
	RTL

label_C0A156:
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$000A
	TCD
	PLA
	STA.b $00
	STX.b $02
	ORA.b $02
	BPL.b label_C0A16E
	LDA.w #$FFFF
	PLD
	RTS

label_C0A16E:
	LDA.b $00
	CMP.w $2888
	BNE.b label_C0A17F
	CPX.w $288A
	BNE.b label_C0A17F
	LDA.w $288C
	PLD
	RTS

label_C0A17F:
	STA.w $2888
	STX.w $288A
	TXA
	LSR
	LSR
	LSR
	XBA
	ORA.b $00
	TAY
	LDA.w #DATA_D75000>>16
	STA.b $06
	LDX.w #DATA_D75000
	LDA.b $02
	AND.w #$0004
	BEQ.b label_C0A19F
	LDX.w #$8000
label_C0A19F:
	STX.b $04
	LDA.b $02
	AND.w #$0007
	ASL
	ASL
	TAX
	LDA.b [$04],Y
	JMP.w (DATA_C0A1AE,X)

DATA_C0A1AE:
	dd label_C0A1D4&$0000FFFF
	dd label_C0A1D2&$0000FFFF
	dd label_C0A1D0&$0000FFFF
	dd label_C0A1CE&$0000FFFF
	dd label_C0A1D4&$0000FFFF
	dd label_C0A1D2&$0000FFFF
	dd label_C0A1D0&$0000FFFF
	dd label_C0A1CE&$0000FFFF

label_C0A1CE:
	LSR
	LSR
label_C0A1D0:
	LSR
	LSR
label_C0A1D2:
	LSR
	LSR
label_C0A1D4:
	AND.w #$0003
	XBA
	STA.b $08
	LDA.l DATA_C42F64,X
	STA.b $04
	LDA.l DATA_C42F64+$02,X
	STA.b $06
	LDA.b [$04],Y
	AND.w #$00FF
	ORA.b $08
	STA.w $288C
	PLD
	RTS

;--------------------------------------------------------------------

org $C0A21C
label_C0A21C:
	LDY.w $0A50
	BMI.b label_C0A22C
label_C0A221:
	TYX
	CMP.w $2C9A,X
	BEQ.b label_C0A22F
	LDY.w $0A9E,X
	BPL.b label_C0A221
label_C0A22C:
	LDA.w #$0000
label_C0A22F:
	RTL

;--------------------------------------------------------------------

org $C0A254
label_C0A254:
	ASL
	TAX
	LDA.w $0B8E,X
	SEC
	SBC.w $0031
	STA.w $0B16,X
	LDA.w $0BCA,X
	SEC
	SBC.w $0033
	STA.w $0B52,X
	RTL

;--------------------------------------------------------------------

label_C0A26B:
	LDX.b $88
	CPX.w $5D78
	BEQ.b label_C0A292
	LDA.w $1002,X
	AND.w #$1800
	BNE.b label_C0A292
	LDA.w $5DB8
	BNE.b label_C0A292
	LDA.w $2AF6,X
	CMP.w $5D76
	BNE.b label_C0A292
	ASL
	TAX
	LDY.w $5D78
	JSR.w (DATA_C0A350,X)
	ASL
	BEQ.b label_C0A2A8
label_C0A292:
	LDX.b $88
	LDA.w $0B8E,X
	SEC
	SBC.w $0031
	STA.w $0B16,X
	LDA.w $0BCA,X
	SEC
	SBC.w $0033
	STA.w $0B52,X
label_C0A2A8:
	LDX.b $88
	RTS

DATA_C0A2AB:
	dw $0000,$0011,$0020,$002F,$003E,$004D

label_C0A2B7:
	LDX.b $88
	LDA.w $0B16,Y
	EOR.w $0B16,X
	BNE.b label_C0A2E0
	LDA.w $0BCA,Y
	SEC
	SBC.w $0BCA,X
	BPL.b label_C0A2CE
	EOR.w #$FFFF
	INC
label_C0A2CE:
	LDY.w $0F8A,X
	TYX
	SEC
	SBC.l DATA_C0A2AB,X
	BPL.b label_C0A2DD
	EOR.w #$FFFF
	INC
label_C0A2DD:
	BEQ.b label_C0A2E0
	DEC
label_C0A2E0:
	RTS

label_C0A2E1:
	LDX.b $88
	LDA.w $0B52,Y
	EOR.w $0B52,X
	BNE.b label_C0A30A
	LDA.w $0B8E,Y
	SEC
	SBC.w $0B8E,X
	BPL.b label_C0A2F8
	EOR.w #$FFFF
	INC
label_C0A2F8:
	LDY.w $0F8A,X
	TYX
	SEC
	SBC.l DATA_C0A2AB,X
	BPL.b label_C0A307
	EOR.w #$FFFF
	INC
label_C0A307:
	BEQ.b label_C0A30A
	DEC
label_C0A30A:
	RTS

DATA_C0A30B:
	dw $0000,$000B,$0016,$0020,$002B,$0036

label_C0A317:
	LDX.b $88
	LDA.w $0B8E,Y
	SEC
	SBC.w $0B8E,X
	BPL.b label_C0A326
	EOR.w #$FFFF
	INC
label_C0A326:
	STA.b $00
	LDA.w $0F8A,X
	TAX
	LDA.b $00
	CMP.l DATA_C0A30B,X
	BCC.b label_C0A34F
	LDX.b $88
	LDA.w $0BCA,Y
	SEC
	SBC.w $0BCA,X
	BPL.b label_C0A343
	EOR.w #$FFFF
	INC
label_C0A343:
	SEC
	SBC.b $00
	BEQ.b label_C0A34F
	BPL.b label_C0A34E
	EOR.w #$FFFF
	INC
label_C0A34E:
	DEC
label_C0A34F:
	RTS

DATA_C0A350:
	dw label_C0A2B7
	dw label_C0A317
	dw label_C0A2E1
	dw label_C0A317
	dw label_C0A2B7
	dw label_C0A317
	dw label_C0A2E1
	dw label_C0A317

;--------------------------------------------------------------------

label_C0A360:
	LDX.b $88
	LDA.w $2C5E,X
	BMI.b label_C0A37C
	LDA.w $28DA,X
	AND.w #$00D0
	BEQ.b label_C0A372
	JMP.w label_C098F2

label_C0A372:
	LDX.b $88
	LDA.w $289E,X
	BMI.b label_C0A37C
	RTS

label_C0A37A:
	LDX.b $88
label_C0A37C:
	JSR.w label_C09FCA
	JSL.l label_C0C7DB
	RTS

;--------------------------------------------------------------------

org $C0A3A4
label_C0A3A4:
	LDA.w $341A,X
	AND.w #$0001
	BEQ.b label_C0A3B4
	LDA.w $2916,X
	CLC
	ADC.b $8C
	STA.b $8C
label_C0A3B4:
	SEP.b #$30
	LDA.b #$30
	LDY.b #$20
	STA.b $00
	STA.b $02
	LDA.w $2BAA,X
	LSR
	BCC.b label_C0A3C6
	STY.b $02
label_C0A3C6:
	LSR
	BCC.b label_C0A3CB
	STY.b $00
label_C0A3CB:
	LDA.w $2BE7,X
	TAX
	LDY.b #$FD
	BRA.b label_C0A3E0

label_C0A3D3:
	INY
	INY
	INY
	INY
	INY
	LDA.b [$8C],Y
	AND.b #$CF
	ORA.b $00
	STA.b [$8C],Y
label_C0A3E0:
	DEX
	BPL.b label_C0A3D3
	LDX.b $88
	LDA.w $2BE6,X
	TAX
	BRA.b label_C0A3F8

label_C0A3EB:
	INY
	INY
	INY
	INY
	INY
	LDA.b [$8C],Y
	AND.b #$CF
	ORA.b $02
	STA.b [$8C],Y
label_C0A3F8:
	DEX
	BPL.b label_C0A3EB
	REP.b #$10
	LDX.b $88
	LDA.b $8E
	STA.w $000B
	REP.b #$20
	LDA.w $103E,X
	STA.w $2400
	TAY
	AND.w #$8000
	BEQ.b label_C0A42C
	TYA
	AND.w #$003F
	ASL
	TAX
	LDA.w $103E,X
	LDX.b $88
	STA.w $2400
	TYA
	AND.w #$4000
	BNE.b label_C0A42C
	LDA.w #$0000
	STA.w $103E,X
label_C0A42C:
	JSL.l label_C0AC43
	LDX.b $88
	LDA.b $8E
	STA.w $000B
	LDY.w $0B52,X
	LDA.w $0B16,X
	TAX
	LDA.b $8C
	JMP.w label_C08C58

;--------------------------------------------------------------------

label_C0A443:

;--------------------------------------------------------------------

org $C0A48F
label_C0A48F:
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$0006
	TCD
	PLA
	ASL
	TAY
	LDA.w $10F2,Y
	STA.w $2892
	JSL.l label_C0A4C4
	PLD
	RTL

;--------------------------------------------------------------------

label_C0A4A8:
	STZ.w $2892
	JSL.l label_C0C711
	BNE.b label_C0A4C2
	RTL

label_C0A4B2:
	LDA.w #$0001
	STA.w $2892
	JSL.l label_C0C711
	BNE.b label_C0A4C2
	RTL

label_C0A4BF:
	STZ.w $2892
label_C0A4C2:
	LDY.b $88
label_C0A4C4:
	STY.b $08
	LDA.w $2ABA,Y
	STA.b $00
	LDA.w $2A7E,Y
	STA.w $0092
	LDA.w $298E,Y
	STA.w $0097
	LDA.w $2A06,Y
	STA.b $04
	LDA.w $29CA,Y
	STA.b $02
	LDA.w $2AF6,Y
	ASL
	TAX
	LDA.l DATA_C0A60B,X
	BEQ.b label_C0A4F8
	TAX
	LDA.b $02
	CLC
label_C0A4F0:
	ADC.w #$0004
	DEX
	BNE.b label_C0A4F0
	STA.b $02
label_C0A4F8:
	LDA.w $2892
	BEQ.b label_C0A501
	INC.b $02
	INC.b $02
label_C0A501:
	LDA.b [$02]
	AND.w #$0002
	BNE.b label_C0A53D
	LDA.w $2BAA,Y
	STA.b $06
	AND.w #$0008
	BEQ.b label_C0A53D
	SEP.b #$20
	LDA.b #$03
	STA.w $0091
	LDA.b #DATA_C40BE8>>16
	STA.w $0096
	REP.b #$20
	LDA.w #DATA_C40BE8
	STA.w $0094
	JSL.l label_C0A56E
	DEC.b $00
	BEQ.b label_C0A56D
	LDA.b $06
	AND.w #$0004
	BEQ.b label_C0A53D
	JSL.l label_C0A56E
	DEC.b $00
	BEQ.b label_C0A56D
label_C0A53D:
	LDY.b $08
	LDA.b [$02]
	STA.w $341A,Y
	AND.w #$FFF0
	STA.w $0094
	SEP.b #$20
	LDA.b #$00
	STA.w $0091
	LDA.w $2A42,Y
	STA.w $0096
	REP.b #$20
label_C0A559:
	JSL.l label_C0A56E
	DEC.b $00
	BEQ.b label_C0A56D
	LDA.w $0094
	CLC
	ADC.w $0092
	STA.w $0094
	BRA.b label_C0A559

label_C0A56D:
	RTL

label_C0A56E:
	LDA.w $0092
	LSR
	CLC
	ADC.w $0097
	DEC
	EOR.w $0097
	AND.w #$0100
	BEQ.b label_C0A5CE
	LDA.w $0094
	PHA
	LDA.w $0092
	PHA
	LDA.w $0097
	PHA
	CLC
	ADC.w #$0100
	AND.w #$FF00
	PHA
	SEC
	SBC.w $0097
	ASL
	STA.w $0092
	JSL.l label_C08643
	LDA.w $0094
	CLC
	ADC.w $0092
	STA.w $0094
	PLA
	CLC
	ADC.w #$0100
	STA.w $0097
	PLX
	PLA
	PHA
	PHX
	SEC
	SBC.w $0092
	STA.w $0092
	JSL.l label_C08643
	PLA
	STA.w $0097
	PLA
	STA.w $0092
	PLA
	STA.w $0094
	BRA.b label_C0A5D2

label_C0A5CE:
	JSL.l label_C08643
label_C0A5D2:
	LDA.w $0097
	AND.w #$0100
	BNE.b label_C0A5E5
	LDA.w $0097
	CLC
	ADC.w #$0100
	STA.w $0097
	RTL

label_C0A5E5:
	LDA.w $0092
	CLC
	ADC.w #$0020
	AND.w #$FFC0
	LSR
	CLC
	ADC.w $0097
	PHA
	EOR.w $0097
	AND.w #$0100
	BEQ.b label_C0A602
	PLA
	STA.w $0097
	RTL

label_C0A602:
	PLA
	SEC
	SBC.w #$0100
	STA.w $0097
	RTL

DATA_C0A60B:						; Note: Something related to sprite drawing
	dw $0000,$0000,$0001,$0002
	dw $0002,$0002,$0003,$0000
	dw $0004,$0005,$0006,$0007

DATA_C0A623:
	dw $0000,$0004,$0001,$0005
	dw $0002,$0006,$0003,$0007

;--------------------------------------------------------------------

label_C0A633:

;--------------------------------------------------------------------

org $C0A65F
label_C0A65F:
	LDX.b $88
	TAY
	LDA.w $2C5E,X
	BMI.b label_C0A66B
	TYA
	STA.w $2AF6,X
label_C0A66B:
	TYA
	RTL

;--------------------------------------------------------------------

org $C0A679
label_C0A679:
	JSL.l EB_ReadScriptParameterByte_RTL
	STY.b $94
	LDX.b $88
	STA.w $2BAA,X
	RTL

;--------------------------------------------------------------------

org $C0A685
label_C0A685:
	JSL.l EB_ReadScriptParameterWord_RTL
	STY.b $94
	LDX.b $88
	STA.w $2B32,X
	RTL

;--------------------------------------------------------------------

org $C0A6DA
label_C0A6DA:
	LDX.b $88
	LDA.w #$FFFF
	STA.w $289E,X
	RTL

;--------------------------------------------------------------------

label_C0A6E3:
	LDX.b $88
	STX.w $2896
	LDA.w $2C22,X
	XBA
	ORA.w $2AF6,X
	CMP.w $3456,X
	BEQ.w label_C0A6FB
	STA.w $3456,X
	JSR.w label_C0A794
	RTL

label_C0A6FB:
	LDA.w $1002,X
	BPL.b label_C0A708
	AND.w #$7FFF
	STA.w $1002,X
	BRA.b label_C0A750

label_C0A708:
	AND.w #$2000
	BEQ.b label_C0A717
	LDA.w $10F2,X
	BEQ.b label_C0A753
	STZ.w $10F2,X
	BRA.b label_C0A750

label_C0A717:
	LDA.w $5D60
	BNE.b label_C0A753
	DEC.w $0ED6,X
	BMI.b label_C0A723
	BNE.b label_C0A753
label_C0A723:
	LDA.w $0F12,X
	STA.w $0ED6,X
	LDA.w $10F2,X
	EOR.w #$0002
	STA.w $10F2,X
	BNE.b label_C0A750
	CPX.w $2898
	BNE.b label_C0A750
	LDX.w $289C
	BNE.b label_C0A741
	LDX.w $289A
label_C0A741:
	LDA.l DATA_C40BD4,X
	BEQ.b label_C0A750
	LDX.w $B4B6
	BNE.b label_C0A750
	JSL.l label_C0ABE0
label_C0A750:
	JSR.w $A794
label_C0A753:
	LDX.b $88
	LDA.w $9F3F
	BNE.b label_C0A77F
	LDA.w $5D58
	BEQ.b label_C0A77F
	CMP.w #$002D
	BCS.b label_C0A769
	AND.w #$0003
	BNE.b label_C0A776
label_C0A769:
	AND.w #$0001
	BNE.b label_C0A776
	LDA.w $116A,X
	ORA.w #$8000
	BRA.b label_C0A77C

label_C0A776:
	LDA.w $116A,X
	AND.w #$7FFF
label_C0A77C:
	STA.w $116A,X
label_C0A77F:
	RTL

;--------------------------------------------------------------------

label_C0A780:
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$0008
	TCD
	PLA
	ASL
	STA.w $2896
	JSR.w label_C0A794
	PLD
	RTL

label_C0A794:
	LDY.w $2896
	LDA.w $2ABA,Y
	STA.b $00
	LDA.w $2A7E,Y
	STA.w $0092
	LDA.w $298E,Y
	STA.w $0097
	LDA.w $2A06,Y
	STA.b $04
	LDA.w $2AF6,Y
	ASL
	TAX
	LDA.l DATA_C0A623,X
	ASL
	ASL
	CLC
	ADC.w $29CA,Y
	ADC.w $10F2,Y
	STA.b $02
	LDA.b [$02]
	AND.w #$0002
	BNE.b label_C0A7FD
	LDA.w $2BAA,Y
	STA.b $06
	AND.w #$0008
	BEQ.b label_C0A7FD
	SEP.b #$20
	LDA.b #$03
	STA.w $0091
	LDA.b #DATA_C40BE8>>16
	STA.w $0096
	REP.b #$20
	LDA.w #DATA_C40BE8
	STA.w $0094
	JSL.l label_C0A56E
	DEC.b $00
	BEQ.b label_C0A82E
	LDA.b $06
	AND.w #$0004
	BEQ.b label_C0A7FD
	JSL.l label_C0A56E
	DEC.b $00
	BEQ.b label_C0A82E
label_C0A7FD:
	LDY.w $2896
	LDA.b [$02]
	STA.w $341A,Y
	AND.w #$FFFE
	STA.w $0094
	SEP.b #$20
	LDA.b #$00
	STA.w $0091
	LDA.w $2A42,Y
	STA.w $0096
	REP.b #$20
label_C0A81A:
	JSL.l label_C0A56E
	DEC.b $00
	BEQ.b label_C0A82E
	LDA.w $0094
	CLC
	ADC.w $0092
	STA.w $0094
	BRA.b label_C0A81A

label_C0A82E:
	RTS

;--------------------------------------------------------------------

org $C0A84C
label_C0A84C:
	JSL.l EB_ReadScriptParameterWord_RTL
	STY.b $94
	JSL.l label_C21628
	RTL

;--------------------------------------------------------------------

org $C0A864
label_C0A864:
	JSL.l EB_ReadScriptParameterByte_RTL
	STY.b $94
	JSL.l label_C46C9B
	RTL

;--------------------------------------------------------------------

org $C0A88D
label_C0A88D:
	JSL.l EB_ReadScriptParameterWord_RTL
	PHA
	STY.b $94
	JSL.l EB_ReadScriptParameterWord_RTL
	STY.b $94
	PLX
	JSL.l label_C46E4F
	RTL

;--------------------------------------------------------------------

org $C0A8DC
label_C0A8DC:
	LDA.w #$0000
	LDX.w #$0001
	JSL.l label_C47143
	RTL

;--------------------------------------------------------------------

org $C0AA6E
label_C0AA6E:
	LDX.b $88
	LDA.w $0E5E,X
	BNE.b label_C0AA90
	JSL.l EB_ReadScriptParameterByte_RTL
	STY.b $94
	STA.w $2AF6,X
	JSL.l EB_ReadScriptParameterByte_RTL
	STY.b $94
	STA.w $10F2,X
	STA.w $2892
	TXY
	JSL.l label_C0A4C4
	RTL

label_C0AA90:
	LDX.b $88
	JSL.l EB_ReadScriptParameterByte_RTL
	STY.b $94
	STA.w $2AF6,X
	JSL.l EB_ReadScriptParameterByte_RTL
	STY.b $94
	ASL
	STA.w $10F2,X
	STX.w $2896
	JSR.w label_C0A794
	RTL

;--------------------------------------------------------------------

org $C0AAD5
label_C0AAD5:
	JSL.l EB_ReadScriptParameterByte_RTL
	STY.b $94
	INC
	STA.b $90
	JSL.l EB_ReadScriptParameterWord_RTL
	STY.b $94
	STA.b $92
	LDY.w #$000C
	LDA.b ($84),Y
	BNE.b label_C0AAF1
	LDA.b $90
	STA.b ($84),Y
label_C0AAF1:
	LDA.b ($84),Y
	DEC
	STA.b ($84),Y
	BEQ.b label_C0AAFC
	LDA.b $92
	STA.b $94
label_C0AAFC:
	RTL

;--------------------------------------------------------------------

label_C0AAFD:
	LDA.w #$0000
	LDY.w #$000C
	STA.b ($84),Y
	RTL

;--------------------------------------------------------------------

org $C0AB06
UploadDataToSPC700:
.Main:
;$C0AB06
	REP.b #$30
	STA.w $00C6
	STX.w $00C8
	PHB
	PEA.w !REGISTER_ScreenDisplayRegister>>16
	PLB
	PLB
	PHD
	PEA.w $0000
	PLD
	LDY.w #$0000
	LDA.w !REGISTER_APUPort0
	CMP.w #$BBAA
	BEQ.b label_C0AB27
	JSR.w label_C0ABA8
label_C0AB27:
	SEP.b #$20
	LDA.w $001E
	AND.b #$7F
	STA.w $001E
	STA.l !REGISTER_IRQNMIAndJoypadEnableFlags
	LDA.b #$CC
	BRA.b label_C0AB5F

label_C0AB39:
	LDA.b [$C6],Y
	INY
	XBA
	LDA.b #$00
	BRA.b label_C0AB4C

label_C0AB41:
	XBA
	LDA.b [$C6],Y
	INY
	XBA
label_C0AB46:
	CMP.w !REGISTER_APUPort0
	BNE.b label_C0AB46
	INC
label_C0AB4C:
	REP.b #$20
	STA.w !REGISTER_APUPort0
	SEP.b #$20
	DEX
	BNE.b label_C0AB41
label_C0AB56:
	CMP.w !REGISTER_APUPort0
	BNE.b label_C0AB56
label_C0AB5B:
	ADC.b #$03
	BEQ.b label_C0AB5B
label_C0AB5F:
	PHA
	REP.b #$20
	LDA.b [$C6],Y
	BNE.b label_C0AB6C
	TAX
	LDA.w #$0500
	BRA.b label_C0AB73

label_C0AB6C:
	TAX
	INY
	INY
	LDA.b [$C6],Y
	INY
	INY
label_C0AB73:
	STA.w !REGISTER_APUPort2
	SEP.b #$20
	CPX.w #$0001
	LDA.b #$00
	ROL
	STA.w !REGISTER_APUPort1
	ADC.b #$7F
	PLA
	STA.w !REGISTER_APUPort0
label_C0AB87:
	CMP.w !REGISTER_APUPort0
	BNE.b label_C0AB87
	BVS.b label_C0AB39
	REP.b #$20
label_C0AB90:
	LDA.w !REGISTER_APUPort0
	BNE.b label_C0AB90
	SEP.b #$20
	LDA.w $001E
	ORA.b #$80
	STA.w $001E
	STA.l !REGISTER_IRQNMIAndJoypadEnableFlags
	REP.b #$20
	PLD
	PLB
	RTL

label_C0ABA8:
	STZ.w !REGISTER_APUPort2
	STZ.w !REGISTER_APUPort0
label_C0ABAE:
	LDA.w #$00FF
	STA.w !REGISTER_APUPort0
	LDA.w !REGISTER_APUPort0
	CMP.w #$BBAA
	BNE.b label_C0ABAE
	RTS

;--------------------------------------------------------------------

label_C0ABBD:
	SEP.b #$20
	STA.l !REGISTER_APUPort0
	REP.b #$30
	RTL

;--------------------------------------------------------------------

label_C0ABC6:
	SEP.b #$20
	LDA.b #$00
	STA.l !REGISTER_APUPort0
	REP.b #$30
label_C0ABD0:
	JSL.l label_C0AC20
	CMP.w #$0000
	BNE.b label_C0ABD0
	LDA.w #$FFFF
	STA.w $B53B
	RTL

;--------------------------------------------------------------------

label_C0ABE0:
	SEP.b #$30
	CMP.b #$00
	BEQ.b label_C0AC01
	LDX.w $00CA
	ORA.w $1ACA
	STA.w $1AC2,X
	TXA
	INC
	AND.b #$07
	STA.w $00CA
	LDA.b #$80
	EOR.w $1ACA
	STA.w $1ACA
	REP.b #$30
	RTL

label_C0AC01:
	SEP.b #$20
	LDA.b #$57
	STA.l !REGISTER_APUPort3
	REP.b #$30
	RTL

;--------------------------------------------------------------------

label_C0AC0C:
	SEP.b #$20
	ORA.w $1ACB
	STA.l !REGISTER_APUPort1
	LDA.b #$80
	EOR.w $1ACB
	STA.w $1ACB
	REP.b #$30
	RTL

;--------------------------------------------------------------------

label_C0AC20:
	SEP.b #$20
	LDA.l !REGISTER_APUPort0
	REP.b #$30
	AND.w #$00FF
	RTL

;--------------------------------------------------------------------

org $C0AC43
label_C0AC43:
	LDA.w #$00C4
	STA.b $04
	STA.w $000B
	LDY.w #$0000
	LDA.w $2BAA,X
	AND.w #$0001
	BEQ.b label_C0AC59
	LDY.w #$0005
label_C0AC59:
	STY.b $00
	LDA.w $2BAA,X
	AND.w #$000C
	BEQ.b label_C0ACD7
	CMP.w #$0004
	BEQ.b label_C0ACE1
	LDA.w $2A7E,X
	CMP.w #$0040
	BNE.b label_C0ACA1
	LDA.w $301E,X
	STA.b $02
	LDA.w $305A,X
	BNE.b label_C0AC89
	LDA.w #$3096
	JSR.w label_C0AD56
	LDX.b $88
	STA.w $301E,X
	TYA
	STA.w $305A,X
label_C0AC89:
	DEC.w $305A,X
	LDA.w $0B16,X
	STA.b $06
	LDY.w $0B52,X
	LDA.w $3096,X
	CLC
	ADC.b $00
	LDX.b $06
	JSR.w label_C08C58
	BRA.b label_C0ACD7

label_C0ACA1:
	LDA.w $30D2,X
	STA.b $02
	LDA.w $310E,X
	BNE.b label_C0ACBA
	LDA.w #$314A
	JSR.w label_C0AD56
	LDX.b $88
	STA.w $30D2,X
	TYA
	STA.w $310E,X
label_C0ACBA:
	DEC.w $310E,X
	LDA.w $0B16,X
	STA.b $06
	LDA.w $0B52,X
	CLC
	ADC.w #$0008
	TAY
	LDA.w $314A,X
	CLC
	ADC.b $00
	ADC.b $00
	LDX.b $06
	JSR.w label_C08C58
label_C0ACD7:
	LDX.b $88
	LDA.w $2E7A,X
	BNE.b label_C0ACDF
	RTL

label_C0ACDF:
	BPL.b label_C0AD19
label_C0ACE1:
	CPX.w #$002E
	BCC.b label_C0AD55
	LDA.w $2F6A,X
	STA.b $02
	LDA.w $2FA6,X
	BNE.b label_C0ACFF
	LDA.w #$2FE2
	JSR.w label_C0AD56
	LDX.b $88
	STA.w $2F6A,X
	TYA
	STA.w $2FA6,X
label_C0ACFF:
	DEC.w $2FA6,X
	LDA.w $0B16,X
	STA.b $06
	LDY.w $0B52,X
	LDA.w $2FE2,X
	BEQ.b label_C0AD19
	CLC
	ADC.b $00
	LDX.b $06
	JSR.w label_C08C58
	LDX.b $88
label_C0AD19:
	LDA.w $2E7A,X
	AND.w #$4000
	BEQ.b label_C0AD55
	CPX.w #$002E
	BCC.b label_C0AD55
	LDA.w $2EB6,X
	STA.b $02
	LDA.w $2EF2,X
	BNE.b label_C0AD3F
	LDA.w #$2F2E
	JSR.w label_C0AD56
	LDX.b $88
	STA.w $2EB6,X
	TYA
	STA.w $2EF2,X
label_C0AD3F:
	DEC.w $2EF2,X
	LDA.w $0B16,X
	STA.b $06
	LDY.w $0B52,X
	LDA.w $2F2E,X
	CLC
	ADC.b $00
	LDX.b $06
	JSR.w label_C08C58
label_C0AD55:
	RTL

label_C0AD56:
	CLC
	ADC.b $88
	TAX
	LDY.w #$0000
label_C0AD5D:
	LDA.b [$02],Y
	INY
	INY
	CMP.w #$0001
	BNE.b label_C0AD6F
	LDA.b [$02],Y
	INY
	INY
	STA.w $0000,X
	BRA.b label_C0AD5D

label_C0AD6F:
	CMP.w #$0003
	BNE.b label_C0AD7D
	LDA.b [$02],Y
	STA.b $02
	LDY.w #$0000
	BRA.b label_C0AD5D

label_C0AD7D:
	LDA.b [$02],Y
	INY
	INY
	STY.b $08
	TAY
	LDA.b $02
	CLC
	ADC.b $08
	RTS

;--------------------------------------------------------------------

org $C0ADB2
label_C0ADB2:
	PHY
	TAY
	LDA.l DATA_C0AE1E-$01,X
	PHA
	TYA
	ASL
	ASL
	ASL
	ASL
	TAX
	SEP.b #$20
	LDA.b #$7E
	STA.l HDMA[$00].SourceBank,X
	STA.l HDMA[$00].IndirectSourceBank,X
	PLA
	STA.l HDMA[$00].Destination,X
	PLA
	LDA.b #$42
	STA.l HDMA[$00].Parameters,X
	REP.b #$20
	PLA
	PHX
	BNE.b label_C0ADF0
	LDX.w #$0006
label_C0ADE0:
	LDA.l DATA_C0AE26,X
	STA.w $3C32,X
	DEX
	DEX
	BPL.b label_C0ADE0
	LDA.w #$3C32
	BRA.b label_C0AE01

label_C0ADF0:
	LDX #$0006
label_C0ADF3:
	LDA.l DATA_C0AE2D,X
	STA.w $3C3C,X
	DEX
	DEX
	BPL.b label_C0ADF3
	LDA.w #$3C3C
label_C0AE01:
	PLX
	STA.l HDMA[$00].SourceLo,X
	SEP.b #$20
	TYX
	LDA.w $001F
	ORA.l DATA_C0AE16,X
	STA.w $001F
	REP.b #$20
	RTL

DATA_C0AE16:
	db $01,$02,$04,$08,$10,$20,$40,$80

DATA_C0AE1E:
	db !REGISTER_BG1HorizScrollOffset,!REGISTER_BG2HorizScrollOffset
	db !REGISTER_BG3HorizScrollOffset,!REGISTER_BG4HorizScrollOffset
	db !REGISTER_BG1VertScrollOffset,!REGISTER_BG2VertScrollOffset
	db !REGISTER_BG3VertScrollOffset,!REGISTER_BG4VertScrollOffset

DATA_C0AE26:
	dw $46E4,$FC3C,$3D0E
	db $00

DATA_C0AE2D:
	dw $06E4,$FC3E,$3ECE
	db $00

;--------------------------------------------------------------------

label_C0AE34:
	TAX
	SEP.b #$20
	LDA.w $001F
	AND.l DATA_C0AE44,X
	STA.w $001F
	REP.b #$20
	RTL

DATA_C0AE44:
	db $FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F

;--------------------------------------------------------------------

label_C0AE4C:
	STA.w $1ACC
	STX.w $1ACE
	STY.w $1AD2
	RTL

;--------------------------------------------------------------------

label_C0AE56:
	STA.w $1AD4
	RTL

;--------------------------------------------------------------------

label_C0AE5A:
	PHD
	PHA
	TDC
	SEC
	SBC.w #$000B
	AND.w #$FF00
	TCD
	PLA
	STA.b $00
	TXA
	SEP.b #$20
	STA.l !REGISTER_Mode7MatrixParameterA
	XBA
	STA.l !REGISTER_Mode7MatrixParameterA
	STZ.b $02
	STY.b $03
	STZ.b $04
	REP.b #$20
	LDA.w #$0000
	LDX.w #$01C0
	LDY.w $1AD2
	BEQ.b label_C0AE8B
	TXA
	LDX.w #$0380

label_C0AE8B:
	STA.b $07
	STX.b $09
	LDA.w $1ACC
	CMP.w #$0002
	BCC.b label_C0AE9F
	BNE.b label_C0AE9C
	JMP.w label_C0AF24

label_C0AE9C:
	JMP.w label_C0AF65

label_C0AE9F:
	LDA.w $1ACE
	BEQ.b label_C0AEB6
	DEC
	ASL
	ASL
	TAX
	LDA.w $0033,X
	CLC
	ADC.b $03
	AND.w #$00FF
	STA.b $03
	LDA.w $0031,X
label_C0AEB6:
	STA.b $05
	LDA.w $1ACC
	BNE.b label_C0AEE2
	LDY.b $07
label_C0AEBF:
	LDX.b $03
	LDA.l DATA_C0B425,X
	STA.l !REGISTER_Mode7MatrixParameterB
	LDA.l !REGISTER_PPUMultiplicationProductMid
	CLC
	ADC.b $05
	STA.w $3C46,Y
	LDA.b $02
	CLC
	ADC.b $00
	STA.b $02
	INY
	INY
	CPY.b $09
	BCC.b label_C0AEBF
	PLD
	RTL

label_C0AEE2:
	LDY.b $07
label_C0AEE4:
	LDX.b $03
	LDA.l DATA_C0B425,X
	STA !REGISTER_Mode7MatrixParameterB
	LDA !REGISTER_PPUMultiplicationProductMid
	CLC
	ADC.b $05
	STA.w $3C46,Y
	LDA.b $02
	CLC
	ADC.b $00
	STA.b $02
	LDX.b $03
	LDA.l DATA_C0B425,X
	STA.l !REGISTER_Mode7MatrixParameterB
	LDA.b $05
	SEC
	SBC.l !REGISTER_PPUMultiplicationProductMid
	STA.w $3C48,Y
	LDA.b $02
	CLC
	ADC.b $00
	STA.b $02
	INY
	INY
	INY
	INY
	CPY.b $09
	BCC.b label_C0AEE4
	PLD
	RTL

label_C0AF24:
	LDA.w $1ACE
	BEQ.b label_C0AF30
	DEC
	ASL
	ASL
	TAX
	LDA.w $0033,X

label_C0AF30:
	XBA
	AND.w #$FF00
	STA.b $05
	LDY.b $07

label_C0AF38:
	LDX.b $03
	LDA.l DATA_C0B425,X
	STA.l !REGISTER_Mode7MatrixParameterB
	LDA.b $05
	CLC
	ADC.w $1AD4
	STA.b $05
	XBA
	AND.w #$00FF
	CLC
	ADC.l !REGISTER_PPUMultiplicationProductMid
	STA.w $3C46,Y
	LDA.b $02
	CLC
	ADC.b $00
	STA.b $02
	INY
	INY
	CPY.b $09
	BCC.b label_C0AF38
	PLD
	RTL

label_C0AF65:
	LDA.w $1ACE
	BEQ.b label_C0AF71
	DEC
	ASL
	ASL
	TAX
	LDA.w $0033,X

label_C0AF71:
	XBA
	AND.w #$FF00
	STA.b $05
	LDY.b $07

label_C0AF79:
	LDX.b $03
	LDA.l DATA_C0B425,X
	STA.l !REGISTER_Mode7MatrixParameterB
	LDA.b $05
	CLC
	ADC.w $1AD4
	STA.b $05
	XBA
	AND.w #$00FF
	CLC
	ADC.l !REGISTER_PPUMultiplicationProductMid
	STA.w $3C46,Y
	LDA.b $02
	CLC
	ADC.b $00
	STA.b $02
	LDX.b $03
	LDA.l DATA_C0B425,X
	STA.l !REGISTER_Mode7MatrixParameterB
	LDA.b $05
	CLC
	ADC.w $1AD4
	STA.b $05
	XBA
	AND.w #$00FF
	SEC
	SBC.l !REGISTER_PPUMultiplicationProductMid
	STA.w $3C48,Y
	LDA.b $02
	CLC
	ADC.b $00
	STA.b $02
	INY
	INY
	INY
	INY
	CPY.b $09
	BCC.b label_C0AF79
	PLD
	RTL

;--------------------------------------------------------------------

label_C0AFCD:
	TAX
	SEP.b #$20
	LDA.l DATA_C0AFF1,X
	STA.w $001A
	LDA.l DATA_C0AFFC,X
	STA.w $001B
	LDA.l DATA_C0B006,X
	STA.l !REGISTER_ColorMathInitialSettings
	LDA.l DATA_C0B010,X
	STA.l !REGISTER_ColorMathSelectAndEnable
	REP.b #$20
	RTL

DATA_C0AFF1:
	db $17,$1F,$17,$17,$17,$17,$15,$15
	db $15,$15,$15

DATA_C0AFFC:
	db $00,$00,$08,$08,$08,$08,$02,$02
	db $02,$02

DATA_C0B006:
	db $00,$00,$02,$02,$02,$02,$02,$02
	db $02,$02

DATA_C0B010:
	db $00,$00,$24,$64,$A4,$E4,$21,$61
	db $A1,$E1

;--------------------------------------------------------------------

label_C0B01A:
	SEP.b #$20
	AND.b #$1F
	ORA.b #$20
	STA.l !REGISTER_FixedColorData
	TXA
	AND.b #$1F
	ORA.b #$40
	STA.l !REGISTER_FixedColorData
	TYA
	AND.b #$1F
	ORA.b #$80
	STA.l !REGISTER_FixedColorData
	REP.b #$20
	RTL

;--------------------------------------------------------------------

label_C0B039:
	SEP.b #$20
	STA.l !REGISTER_ColorMathInitialSettings
	TXA
	STA.l !REGISTER_ColorMathSelectAndEnable
	REP.b #$20
	RTL

;--------------------------------------------------------------------

label_C0B047:
	TXY
	SEP.b #$20
	PHA
	PHA
	AND.b #$03
	TAX
	LDA.l DATA_C0B0A6,X
	CPY.w #$0000
	BEQ.b label_C0B05A
	AND.b #$AA

label_C0B05A:
	STA.l !REGISTER_BG1And2WindowMaskSettings
	PLA
	LSR
	LSR
	PHA
	AND.b #$03
	TAX
	LDA.l DATA_C0B0A6,X
	CPY.w #$0000
	BEQ.b label_C0B070
	AND.b #$AA

label_C0B070:
	STA.l !REGISTER_BG3And4WindowMaskSettings
	PLA
	LSR
	LSR
	AND.b #$03
	TAX
	LDA.l DATA_C0B0A6,X
	CPY.w #$0000
	BEQ.b label_C0B085
	AND.b #$AA

label_C0B085:
	STA.l !REGISTER_ObjectAndColorWindowSettings
	PLA
	AND.b #$1F
	STA.l !REGISTER_MainScreenWindowMask
	STA.l !REGISTER_SubScreenWindowMask
	REP.b #$20
	LDA.w #$5555
	CPY.w #$0000
	BEQ.b label_C0B0A1
	LDA.w #$0000

label_C0B0A1:
	STA.l !REGISTER_BGWindowLogicSettings
	RTL

DATA_C0B0A6:
	db $00,$0F,$F0,$FF

;--------------------------------------------------------------------

label_C0B0AA:
	REP.b #$20
	LDA.w #$00FF
	STA.l !REGISTER_Window1LeftPositionDesignation
	STA.l !REGISTER_Window2LeftPositionDesignation
	RTL

;--------------------------------------------------------------------

org $C0B400
label_C0B400:
	PHA
	TXA
	SEC
	SBC.w #$0040
	AND.w #$00FF
	TAX
	PLA
label_C0B40B:
	SEP.b #$20
	STA.l !REGISTER_Mode7MatrixParameterA
	XBA
	STA.l !REGISTER_Mode7MatrixParameterA
	LDA.l DATA_C0B425,X
	STA.l !REGISTER_Mode7MatrixParameterB
	REP.b #$20
	LDA.l !REGISTER_PPUMultiplicationProductMid
	RTL

;--------------------------------------------------------------------

org $C0B425
DATA_C0B425:
	db $00,$03,$06,$09,$0C,$0F,$12,$15,$18,$1C,$1F,$22,$25,$28,$2B,$2E
	db $30,$33,$36,$39,$3C,$3F,$41,$44,$47,$49,$4C,$4E,$51,$53,$55,$58
	db $5A,$5C,$5E,$60,$62,$64,$66,$68,$6A,$6C,$6D,$6F,$70,$72,$73,$75
	db $76,$77,$78,$79,$7A,$7B,$7C,$7C,$7D,$7E,$7E,$7F,$7F,$7F,$7F,$7F
	db $7F,$7F,$7F,$7F,$7F,$7F,$7E,$7E,$7D,$7C,$7C,$7B,$7A,$79,$78,$77
	db $76,$75,$73,$72,$70,$6F,$6D,$6C,$6A,$68,$66,$64,$62,$60,$5E,$5C
	db $5A,$58,$55,$53,$51,$4E,$4C,$49,$47,$44,$41,$3F,$3C,$39,$36,$33
	db $30,$2E,$2B,$28,$25,$22,$1F,$1C,$18,$15,$12,$0F,$0C,$09,$06,$03
	db $00,$FD,$FA,$F7,$F4,$F1,$EE,$EB,$E8,$E4,$E1,$DE,$DB,$D8,$D5,$D2
	db $D0,$CD,$CA,$C7,$C4,$C1,$BF,$BC,$B9,$B7,$B4,$B2,$AF,$AD,$AB,$A8
	db $A6,$A4,$A2,$A0,$9E,$9C,$9A,$98,$96,$94,$93,$91,$90,$8E,$8D,$8B
	db $8A,$89,$88,$87,$86,$85,$84,$84,$83,$82,$82,$81,$81,$81,$81,$81
	db $81,$81,$81,$81,$81,$81,$82,$82,$83,$84,$84,$85,$86,$87,$88,$89
	db $8A,$8B,$8D,$8E,$90,$91,$93,$94,$96,$98,$9A,$9C,$9E,$A0,$A2,$A4
	db $A6,$A8,$AB,$AD,$AF,$B2,$B4,$B7,$B9,$BC,$BF,$C1,$C4,$C7,$CA,$CD
	db $D0,$D2,$D5,$D8,$DB,$DE,$E1,$E4,$E8,$EB,$EE,$F1,$F4,$F7,$FA,$FD

;--------------------------------------------------------------------

label_C0B525:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	JSL.l label_C08726
	JSL.l label_C0927C
	JSL.l label_C088B1
	JSL.l label_C08B26
	JSL.l label_C01A86
	LDX.w #$0000
	LDA.w #$8000
	JSL.l label_C01C11
	JSL.l label_C01A69
	JSL.l label_C00013
	JSL.l label_C432B1
	JSL.l label_C005E7
	LDA.w #FileSelectScreenSpritePalettes
	STA.b $0E
	LDA.w #FileSelectScreenSpritePalettes>>16
	STA.b $10
	LDX.w #$0100
	LDA.w #$0300
	JSL.l label_C08ED2
	JSL.l label_C200D9
	LDA.w #$0000
	STA.b $06
	LDA.w #$007F
	STA.b $08
	LDA.w #$0000
	STA.b [$06]
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$7C00
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$03
	JSL.l label_C08616
	LDA.w #FileSelectAndBattlePartyWindowsGFX
	STA.b $0E
	LDA.w #FileSelectAndBattlePartyWindowsGFX>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #$7F2000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDA.w #$7F1000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	LDA.w #$2A00
	JSL.l label_C08EED
	LDA.w #$0001
	JSL.l label_C44963
	LDA.w #$E01FC8
	STA.b $0E
	LDA.w #$E01FC8>>16
	STA.b $10
	LDX.w #$0040
	LDA.w #$0200
	JSL.l label_C08ED2
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	LDX.w #$0000
	REP.b #$20
	LDA.w #$00E6
	JSL.l label_C47370
	LDA.w #$0017
	STA.w $0A4C
	LDA.w #$0018
	STA.w $0A4E
	LDY.w #$0000
	TYX
	LDA.w #$0313
	JSL.l label_C09321
	SEP.b #$20
	LDA.b #$16
	STA.w $001A
	REP.b #$20
	STZ.w $0037
	STZ.w $0033
	STZ.w $0035
	STZ.w $0031
	JSL.l label_C088B1
	JSL.l label_C08B26
	LDX.w #$0001
	TXA
	JSL.l label_C0886C
	JSL.l label_C1FF6B
	LDY.w #$0000
	LDX.w #$0001
	TXA
	JSL.l label_C08814
	LDA.w #$0017
	JSL.l label_C09C35
	SEP.b #$20
	LDA.b #$17
	STA.w $001A
	REP.b #$20
	LDA.w $98B7
	AND.w #$00FF
	DEC
	JSL.l label_C4FD18
	PLD
	RTS

;--------------------------------------------------------------------

label_C0B65F:
	REP.b #$31
	TXY
	TAX
	STX.w !RAM_EB_Player_XPosLo
	STY.w !RAM_EB_Player_YPosLo
	LDA.w #$0002
	STA.w !RAM_EB_Player_FacingDirection
	SEP.b #$20
	LDA.b #$01
	STA.w $986F
	STX.w $0B46
	STY.w $0B82
	REP.b #$20
	RTL

;--------------------------------------------------------------------

; Note: Related to the intro cutscene, where the game pans over Onett

label_C0B67F:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF1
	TCD
	JSL.l label_C0927C
	JSL.l label_C01A86
	LDX.w #$0000
	LDA.w #$8000
	JSL.l label_C01C11
	JSL.l label_C01A69
	STZ.w $4DC2
	STZ.w $5D74
	LDA.w #$0001
	STA.w $4A58
	LDA.w #$FFFF
	STA.w $4A5A
	LDA.w #$000A
	STA.w $4A5E
	STZ.w $5D60
	STZ.w $5D9A
	LDA.w #$0001
	JSL.l label_C4FD45
	LDA.w #$0697
	STA.w $9E54
	LDA.w #label_C0DC4E
	JSL.l label_C0851C
	STZ.w $9F41
	STZ.w $9F3F
	LDA.w #$FFFF
	STA.w $B4A8
	LDA.w #$0017
	STA.w $0A4C
	LDA.w #$0018
	STA.w $0A4E
	LDY.w #$0000
	TYX
	LDA.w #$0001
	JSL.l label_C09321
	JSL.l label_C02D29
	JSL.l label_C03A24
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0200
	REP.b #$20
	LDA.w #$0200
	JSL.l label_C08EFC
	JSL.l label_C47F87
	JSL.l label_C0004B
	LDX.w !RAM_EB_Player_YPosLo
	LDA.w !RAM_EB_Player_XPosLo
	JSL.l label_C013F6
	JSL.l label_C06B21
	JSL.l label_C47C3F
	LDA.w #$0001
	JSL.l label_C44963
	JSL.l label_C039E5
	PLD
	RTS

;--------------------------------------------------------------------

label_C0B731:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w $4DC2
	BNE.b label_C0B741
	JMP.w label_C0B7D6

label_C0B741:
	LDA.w $436C
	BEQ.b label_C0B74F
	JSL.l label_EFE708
	CMP.w #$FFFF
	BEQ.b label_C0B798
label_C0B74F:
	JSL.l $C26634
	CMP.w #$0000
	BEQ.b label_C0B761
	JSL.l $C261BD
	STZ.w $4DC2
	BRA.b label_C0B798

label_C0B761:
	JSL.l $C052AA
	TAX
	STX.b $10
	JSL.l label_C07B52
	STZ.w $5D98
	LDA.w $9F3F
	BNE.b label_C0B794
	LDX.b $10
	BEQ.b label_C0B786
	LDA.w $436C
	BEQ.b label_C0B7D6
	JSL.l label_EFE746
	CMP.w #$0000
	BNE.b label_C0B7D6
label_C0B786:
	JSL.l label_C018F3
	LDX.w #$0001
	TXA
	JSL.l label_C0886C
	BRA.b label_C0B798

label_C0B794:
	JSL.l $C0EA99
label_C0B798:
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C0B7BE

label_C0B79F:
	ASL
	TAX
	LDA.w #$FFFF
	STA.w $289E,X
	STZ.w $2C5E,X
	TXA
	CLC
	ADC.w #$116A
	TAX
	LDA.w $0000,X
	AND.w #$7FFF
	STA.w $0000,X
	LDA.b $0E
	INC
	STA.b $0E
label_C0B7BE:
	CMP.w #$0017
	BNE.b label_C0B79F
	STZ.w $5D98
	JSL.l label_C09451
	LDA.w #$0078
	STA.w $5D58
	LDA.w #$FFFF
	STA.w $4DB6
label_C0B7D6:
	PLD
	RTL

;--------------------------------------------------------------------

label_C0B7DB:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	JSL.l label_C43317
	LDA.w #$0A20
	JSL.l label_C08F42
	JSL.l label_C4DAD2
	JSR.w label_C0B525
	JSR.w label_C0B67F
	JSL.l label_C088B1
	JSL.l label_C09466
	LDX.w #$0001
	TXA
	JSL.l label_C0886C
	JSL.l label_C08B26
	LDA.w #$0A2A
	JSL.l label_C08F42
	JSL.l label_C43F53
label_C0B814:
	JSL.l label_C088B1
	JSL.l label_C09466
	JSL.l label_C08B26
	JSL.l label_C4A7B0
	JSL.l label_C08756
	LDA.w $5E02
	SEC
	SBC.w $5E04
	BEQ.b label_C0B84A
	LDA.w $5D60
	BNE.b label_C0B84A
	LDA.w $4DBA
	BNE.b label_C0B84A
	LDA.w $4DC2
	BNE.b label_C0B84A
	JSL.l label_C075DD
	INC.w $5D74
	JMP.w label_C0B95E

label_C0B84A:
	LDA.w $98A5
	CMP.w #$0002
	BNE.b label_C0B855
	JMP.w label_C0B95E

label_C0B855:
	LDX.w $9883
	CPX.w #$000C
	BNE.b label_C0B860
	JMP.w label_C0B95E

label_C0B860:
	LDA.w $5D60
	BEQ.b label_C0B868
	JMP.w label_C0B95E

label_C0B868:
	LDA.w $4DC2
	BEQ.b label_C0B876
	JSL.l label_C0B731
	INC.w $5D74
	BRA.b label_C0B892

label_C0B876:
	LDA.w $006D
	AND.w #$00A0
	BEQ.b label_C0B892
	CPX.w #$0003
	BNE.b label_C0B892
	JSL.l label_C0943C
	JSL.l $C1BEC6
	JSL.l label_C09451
	JMP.w label_C0B814

label_C0B892:
	LDA.w $436C
	BEQ.b label_C0B8C6
	LDA.w $0065
	AND.w #$A000
	BEQ.b label_C0B8AE
	LDA.w $006D
	AND.w #$0010
	BEQ.b label_C0B8AE
	JSL.l $C12E63
	JMP.w label_C0B814

label_C0B8AE:
	LDA.w $006F
	AND.w #$0080
	BEQ.b label_C0B8BA
	JSL.l $C490EE
label_C0B8BA:
	LDA.w $006F
	AND.w #$8000
	BEQ.b label_C0B8C6
	JSL.l $C4E366
label_C0B8C6:
	LDA.w $5D60
	BEQ.b label_C0B8CE
	JMP.w label_C0B814

label_C0B8CE:
	LDA.w $4DBA
	BEQ.b label_C0B8D6
	JMP.w label_C0B814

label_C0B8D6:
	LDA.w $5D74
	BNE.b label_C0B920
	LDA.w $5D9A
	BNE.b label_C0B923
	LDA.w $006D
	AND.w #!Joypad_A
	BEQ.b label_C0B8EE
	JSL.l $C134A7
	BRA.b label_C0B923

label_C0B8EE:
	LDA.w $006D
	AND.w #$A000
	BEQ.b label_C0B904
	LDA.w $9883
	CMP.w #$0003
	BEQ.b label_C0B904
	JSL.l $C13CA1
	BRA.b label_C0B923

label_C0B904:
	LDA.w $006D
	AND.w #!Joypad_X
	BEQ.b label_C0B912
	JSL.l $C13CE5
	BRA.b label_C0B923

label_C0B912:
	LDA.w $006D
	AND.w #!Joypad_L
	BEQ.b label_C0B923
	JSL.l EB_HandlePlayerCheckingObject_Main
	BRA.b label_C0B923

label_C0B920:
	DEC.w $5D74
label_C0B923:
	LDA.w $9F3F
	BEQ.b label_C0B92C
	JSL.l $C0EA99
label_C0B92C:
	LDA.w $436C
	BEQ.b label_C0B95E
	LDA.w $006F
	AND.w #$8000
	BEQ.b label_C0B95E
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C0B959

label_C0B940:
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99D8,X
	STA.w $9A15,X
	LDA.w $99DA,X
	STA.w $9A1B,X
	LDA.b $0E
	INC
	STA.b $0E
label_C0B959:
	CMP.w #$0006
	BCC.b label_C0B940
label_C0B95E:
	JSL.l label_C04FFE
	CMP.w #$0000
	BNE.b label_C0B97A
	JSL.l $C4C718
	CMP.w #$0000
	BEQ.b label_C0B97A
	LDX.w #$0000
	LDA.w #$0A20
	JSL.l label_C08F68
label_C0B97A:
	LDA.w $436C
	BNE.b label_C0B982
	JMP.w label_C0B814

label_C0B982:
	LDA.w $0065
	AND.w #$1000
	BNE.b label_C0B98D
	JMP.w label_C0B814

label_C0B98D:
	LDA.w $0065
	AND.w #$2000
	BNE.b label_C0B998
	JMP.w label_C0B814

label_C0B998:
	PLD
	RTL

;--------------------------------------------------------------------

label_C0B99A:
	REP.b #$31
	JSL.l label_EF0B9E
	JSL.l UploadSPCEngine_Main
	JSL.l label_C08715
	JSL.l CheckIfGameShouldRun_Main
	JSL.l label_C08756
	JSL.l label_C08756
	STZ.w $436C
	JSL.l label_C0B7DB
	RTS

;--------------------------------------------------------------------

label_C0B9BC:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	STY.b $16
	STX.b $14
	STA.b $12
	LDX.b $26
	STX.b $04
	LDA.w #$0000
	STA.b $02
	BRA.b label_C0BA2D

label_C0B9D7:
	LDA.b $02
	ASL
	TAX
	LDA.w $9897,X
	ASL
	TAY
	LDA.w $2B6E,Y
	STA.b $10
	LDA.b $02
	ASL
	ASL
	CLC
	ADC.b $12
	TAX
	STX.b $0E
	LDA.b $10
	ASL
	STA.b $10
	TAX
	LDA.w $0B8E,Y
	SEC
	SBC.l DATA_C42A1F,X
	LSR
	LSR
	LSR
	SEC
	SBC.b $16
	AND.w #$003F
	LDX.b $0E
	STA.w $007E,X
	LDA.b $10
	PHA
	TAX
	LDA.w $0BCA,Y
	SEC
	SBC.l DATA_C42A41,X
	PLX
	CLC
	ADC.l DATA_C42AEB,X
	LSR
	LSR
	LSR
	SEC
	SBC.b $04
	AND.w #$003F
	LDX.b $0E
	STA.w $007C,X
	INC.b $02
label_C0BA2D:
	LDA.b $02
	CMP.b $14
	BCC.b label_C0B9D7
	PLD
	RTS

;--------------------------------------------------------------------

label_C0BA35:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFC6
	TCD
	PLA
	STY.b $38
	STX.b $36
	STA.b $04
	STA.b $34
	LDA.b $4E
	STA.b $32
	LDA.b $4C
	STA.b $30
	LDX.b $4A
	STX.b $2E
	LDY.b $48
	STY.b $2C
	LDA.w #$7F3000
	STA.b $06
	LDA.w #$7F3000>>16
	STA.b $08
	LDA.b $36
	LDX.b $04
	STA.w $009C,X
	LDX.w #$0000
	STX.b $2A
	BRA.b label_C0BAC7

label_C0BA6F:
	LDA.w #$0000
	STA.b $28
	BRA.b label_C0BABB

label_C0BA76:
	CLC
	ADC.b $38
	AND.w #$003F
	PHA
	LDX.b $2A
	STX.b $02
	TYA
	CLC
	ADC.b $02
	AND.w #$003F
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	PLX
	STX.b $02
	CLC
	ADC.b $02
	TAX
	LDA.w $E000,X
	AND.w #$00FF
	AND.w #$00C0
	BEQ.b label_C0BAAC
	SEP.b #$20
	LDA.b #$FD
	STA.b [$06]
	REP.b #$20
	INC.b $06
	BRA.b label_C0BAB6

label_C0BAAC:
	SEP.b #$20
	LDA.b #$00
	STA.b [$06]
	REP.b #$20
	INC.b $06
label_C0BAB6:
	LDA.b $28
	INC
	STA.b $28
label_C0BABB:
	LDX.b $04
	CMP.w $0078,X
	BNE.b label_C0BA76
	LDX.b $2A
	INX
	STX.b $2A
label_C0BAC7:
	TXA
	LDX.b $04
	CMP.w $007A,X
	BNE.b label_C0BA6F
	LDA.w #$0000
	STA.b $02
	STA.b $26
	STA.b $28
	JMP.w label_C0BB88

label_C0BADB:
	ASL
	STA.b $24
	LDY.w #$0A62
	LDA.b ($24),Y
	CMP.w #$FFFF
	BNE.b label_C0BAEB
	JMP.w label_C0BB83

label_C0BAEB:
	LDY.w #$2C5E
	LDA.b ($24),Y
	CMP.w #$FFFF
	BEQ.b label_C0BAF8
	JMP.w label_C0BB83

label_C0BAF8:
	LDY.w #$2B6E
	LDA.b ($24),Y
	STA.b $22
	LDA.b $02
	STA.b $04
	ASL
	ASL
	ASL
	ADC.b $04
	ASL
	STA.b $02
	LDA.b $34
	STA.b $04
	CLC
	ADC.b $02
	TAX
	STX.b $2A
	LDA.b $28
	STA.w $00B0,X
	LDA.b $2E
	STA.w $00A0,X
	LDA.b $22
	ASL
	STA.b $22
	LDX.b $22
	LDA.l DATA_C42AA7,X
	LDX.b $2A
	STA.w $00A4,X
	LDX.b $22
	LDA.l DATA_C42AC9,X
	LDX.b $2A
	STA.w $00A2,X
	LDX.b $22
	LDY.w #$0B8E
	LDA.b ($24),Y
	SEC
	SBC.l DATA_C42A1F,X
	LSR
	LSR
	LSR
	SEC
	SBC.b $38
	AND.w #$003F
	LDX.b $2A
	STA.w $00A8,X
	LDY.b $2C
	STY.b $02
	LDX.b $22
	LDY.w #$0BCA
	LDA.b ($24),Y
	SEC
	SBC.l DATA_C42A41,X
	LDX.b $22
	CLC
	ADC.l DATA_C42AEB,X
	LSR
	LSR
	LSR
	SEC
	SBC.b $02
	AND.w #$003F
	LDX.b $2A
	STA.w $00A6,X
	LDA.b $26
	STA.b $02
	INC.b $02
	LDA.b $02
	STA.b $26
label_C0BB83:
	LDA.b $28
	INC
	STA.b $28
label_C0BB88:
	CMP.w #$001E
	BEQ.b label_C0BB90
	JMP.w label_C0BADB

label_C0BB90:
	LDA.b $02
	LDX.b $04
	STA.w $009E,X
	LDA.w #$7F3000
	STA.b $0E
	LDA.w #$7F3000>>16
	STA.b $10
	LDA.w #$0004
	STA.b $12
	LDA.b $36
	STA.b $14
	LDA.b $04
	CLC
	ADC.w #$007C
	STA.b $16
	LDA.b $02
	STA.b $18
	LDA.b $04
	CLC
	ADC.w #$00A0
	STA.b $1A
	LDA.w #$FFFF
	STA.b $1C
	LDA.b $30
	STA.b $1E
	LDA.b $32
	STA.b $20
	LDA.b $04
	CLC
	ADC.w #$0078
	TAY
	LDX.w #$F400
	LDA.w #$0C00
	JSL.l label_C4B59F
	TAX
	STX.b $28
label_C0BBDF:
	JSL.l label_C4B595
	CMP.w #$0C00
	BEQ.b label_C0BBEA
	BCS.b label_C0BBDF
label_C0BBEA:
	LDX.b $28
	BNE.b label_C0BC14
	LDA.w #$0000
	STA.b $28
	BRA.b label_C0BC0A

label_C0BBF5:
	ASL
	TAX
	LDA.w $0A62,X
	CMP.w #$FFFF
	BEQ.b label_C0BC05
	LDA.w #$0001
	STA.w $2C5E,X
label_C0BC05:
	LDA.b $28
	INC
	STA.b $28
label_C0BC0A:
	CMP.w #$001E
	BNE.b label_C0BBF5
	LDA.w #$FFFF
	BRA.b label_C0BC72

label_C0BC14:
	LDA.w #$0000
	STA.b $28
	BRA.b label_C0BC67

label_C0BC1B:
	STA.b $04
	ASL
	ASL
	ASL
	ADC.b $04
	ASL
	STA.b $02
	LDA.b $34
	STA.b $04
	CLC
	ADC.b $02
	TAX
	LDA.w $00B0,X
	STA.b $22
	TXA
	CLC
	ADC.w #$00AA
	TAY
	STY.b $30
	LDA.w $0000,Y
	BEQ.b label_C0BC58
	LDA.b $22
	ASL
	STA.b $22
	LDA.w $00AC,X
	LDY.w #$2E02
	STA.b ($22),Y
	LDY.b $30
	LDA.w $0000,Y
	LDY.w #$2E3E
	STA.b ($22),Y
	BRA.b label_C0BC62

label_C0BC58:
	LDA.b $22
	ASL
	TAX
	LDA.w #$0001
	STA.w $2C5E,X
label_C0BC62:
	LDA.b $28
	INC
	STA.b $28
label_C0BC67:
	LDX.b $26
	STX.b $02
	CMP.b $02
	BCC.b label_C0BC1B
	LDA.w #$0000
label_C0BC72:
	PLD
	RTS

;--------------------------------------------------------------------

label_C0BC74:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFD4
	TCD
	PLA
	STA.b $2A
	LDA.w $9889
	STA.b $28
	LDA.w #$F200
	STA.b $26
	STX.w $F278
	STY.w $F27A
	LDA.w $F278
	LSR
	STA.b $04
	STA.w $4A92
	LDA.w $F27A
	LSR
	STA.b $02
	STA.b $24
	LDA.b $02
	STA.w $4A94
	LDA.b $28
	ASL
	STA.b $28
	CLC
	ADC.w #$0B8E
	TAY
	STY.b $22
	LDA.w #DATA_C42A1F
	STA.b $0A
	LDA.w #DATA_C42A1F>>16
	STA.b $0C
	LDA.b $28
	CLC
	ADC.w #$2B6E
	STA.b $20
	LDA.b ($20)
	ASL
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	STA.b $02
	LDA.w $0000,Y
	SEC
	SBC.b $02
	LSR
	LSR
	LSR
	STA.w $4A8E
	LDA.b $28
	CLC
	ADC.w #$0BCA
	TAX
	LDA.w #DATA_C42A41
	STA.b $06
	LDA.w #DATA_C42A41>>16
	STA.b $08
	LDA.b $06
	STA.b $1C
	LDA.b $08
	STA.b $1E
	LDA.b ($20)
	ASL
	STA.b $1A
	LDA.w #DATA_C42AEB
	STA.b $16
	LDA.w #DATA_C42AEB>>16
	STA.b $18
	LDA.b $1A
	TAY
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	STA.b $02
	LDA.w $0000,X
	SEC
	SBC.b $02
	CLC
	ADC.b [$16],Y
	LSR
	LSR
	LSR
	STA.w $4A90
	LDA.b ($20)
	ASL
	STA.b $1A
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	STA.b $02
	LDY.b $22
	LDA.w $0000,Y
	SEC
	SBC.b $02
	LSR
	LSR
	LSR
	SEC
	SBC.b $04
	STA.b $04
	LDA.b $1A
	TAY
	PHA
	LDA.b $1C
	STA.b $06
	LDA.b $1E
	STA.b $08
	PLA
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	STA.b $02
	LDA.w $0000,X
	SEC
	SBC.b $02
	CLC
	ADC.b [$16],Y
	LSR
	LSR
	LSR
	LDX.b $24
	STX.b $02
	SEC
	SBC.b $02
	STA.b $02
	STA.b $0E
	LDY.b $04
	LDX.b $2A
	LDA.b $26
	JSR.w label_C0B9BC
	LDA.b $02
	STA.b $0E
	STZ.b $10
	LDA.w #$0040
	STA.b $12
	LDA.w #$0032
	STA.b $14
	LDY.b $04
	LDX.b $2A
	LDA.b $26
	JSR.w label_C0BA35
	PLD
	RTL

;--------------------------------------------------------------------

org $C0C6B6
label_C0C6B6:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w $9F47
	CMP.w #$0004
	BCC.b label_C0C6CB
	LDA.w #$FFFF
	BRA.b label_C0C70F

label_C0C6CB:
	LDA.w $1A42
	ASL
	TAX
	LDA.w $9877
	SEC
	SBC.w #$0080
	STA.b $02
	LDA.w $0B8E,X
	SEC
	SBC.b $02
	STA.b $0E
	LDA.w $987B
	SEC
	SBC.w #$0070
	STA.b $02
	LDA.w $0BCA,X
	SEC
	SBC.b $02
	TAX
	LDA.b $0E
	CMP.w #$FFC0
	BCS.b label_C0C6FD
	CMP.w #$0140
	BCS.b label_C0C70C
label_C0C6FD:
	CPX.w #$FFC0
	BCS.b label_C0C707
	CPX.w #$0140
	BCS.b label_C0C70C
label_C0C707:
	LDA.w #$FFFF
	BRA.b label_C0C70F

label_C0C70C:
	LDA.w #$0000
label_C0C70F:
	PLD
	RTL

;--------------------------------------------------------------------

label_C0C711:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w $1A42
	ASL
	TAX
	STX.b $0E
	LDA.w $2B6E,X
	ASL
	TAY
	LDA.w $0B16,X
	TYX
	SEC
	SBC.l DATA_C42A1F,X
	STA.b $04
	LDX.b $0E
	LDA.w $0B52,X
	STA.b $0E
	TYX
	SEC
	SBC.l DATA_C42A41,X
	STA.b $02
	LDA.b $0E
	CLC
	ADC.w #$0008
	PHA
	LDA.b $04
	ORA.b $04
	ORA.b $02
	PLY
	STY.b $02
	ORA.b $02
	AND.w #$FF00
	BEQ.b label_C0C75B
	LDA.w #$0000
	BRA.b label_C0C75E

label_C0C75B:
	LDA.w #$FFFF
label_C0C75E:
	PLD
	RTL

;--------------------------------------------------------------------

org $C0C7DB
label_C0C7DB:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w $1A42
	STA.b $10
	ASL
	STA.b $02
	LDA.b $10
	TAY
	LDX.b $02
	LDA.w $0BCA,X
	TAX
	STX.b $0E
	LDX.b $02
	LDA.w $0B8E,X
	LDX.b $0E
	JSL.l label_C05F33
	LDX.b $02
	STA.w $2BAA,X
	PLD
	RTL

;--------------------------------------------------------------------

org $C0C83B
label_C0C83B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE2
	TCD
	PLA
	STA.b $1C
	LDY.w $1A42
	STY.b $1A
	TYA
	ASL
	TAX
	LDA.b $1C
	STA.w $1A86,X
	AND.w #$0001
	BEQ.b label_C0C88A
	LDA.w #$B505
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	LDA.w $2B32,X
	STA.b $06
	STZ.b $08
	JSL.l label_C09086
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C0C87E
	DEC.b $09
label_C0C87E:
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	BRA.b label_C0C8B9

label_C0C88A:
	LDA.w #$0000
	STA.b $0A
	LDA.w #$0001
	STA.b $0C
	LDA.w $2B32,X
	STA.b $06
	STZ.b $08
	JSL.l label_C09086
	LDA.b $07
	STA.b $06
	SEP.b #$20
	LDA.b $09
	STA.b $08
	STZ.b $09
	BPL.b label_C0C8AF
	DEC.b $09
label_C0C8AF:
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
label_C0C8B9:
	LDA.b $1C
	BEQ.b label_C0C8F5
	CMP.w #$0001
	BEQ.b label_C0C921
	CMP.w #$0002
	BNE.b label_C0C8CA
	JMP.w label_C0C953

label_C0C8CA:
	CMP.w #$0003
	BNE.b label_C0C8D2
	JMP.w label_C0C970

label_C0C8D2:
	CMP.w #$0004
	BNE.b label_C0C8DA
	JMP.w label_C0C993

label_C0C8DA:
	CMP.w #$0005
	BNE.b label_C0C8E2
	JMP.w label_C0C9B0

label_C0C8E2:
	CMP.w #$0006
	BNE.b label_C0C8EA
	JMP.w label_C0C9E1

label_C0C8EA:
	CMP.w #$0007
	BNE.b label_C0C8F2
	JMP.w label_C0CA0C

label_C0C8F2:
	JMP.w label_C0CA33

label_C0C8F5:
	LDA.w #$0000
	STA.b $12
	LDA.w #$0000
	STA.b $14
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	SEC
	LDA.w #$0000
	SBC.b $06
	STA.b $06
	LDA.w #$0000
	SBC.b $08
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	JMP.w label_C0CA33

label_C0C921:
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	SEC
	LDA.w #$0000
	SBC.b $06
	STA.b $06
	LDA.w #$0000
	SBC.b $08
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	JMP.w label_C0CA33

label_C0C953:
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.w #$0000
	STA.b $16
	LDA.w #$0000
	STA.b $18
	JMP.w label_C0CA33

label_C0C970:
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	JMP.w label_C0CA33

label_C0C993:
	LDA.w #$0000
	STA.b $12
	LDA.w #$0000
	STA.b $14
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	JMP.w label_C0CA33

label_C0C9B0:
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	SEC
	LDA.w #$0000
	SBC.b $06
	STA.b $06
	LDA.w #$0000
	SBC.b $08
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	BRA.b label_C0CA33

label_C0C9E1:
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	SEC
	LDA.w #$0000
	SBC.b $06
	STA.b $06
	LDA.w #$0000
	SBC.b $08
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.w #$0000
	STA.b $16
	LDA.w #$0000
	STA.b $18
	BRA.b label_C0CA33

label_C0CA0C:
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	SEC
	LDA.w #$0000
	SBC.b $06
	STA.b $06
	LDA.w #$0000
	SBC.b $08
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
label_C0CA33:
	LDY.b $1A
	TYA
	ASL
	TAX
	LDA.b $14
	STA.w $0CF6,X
	LDA.b $12
	STA.w $0DAA,X
	LDA.b $18
	STA.w $0D32,X
	LDA.b $16
	STA.w $0DE6,X
	PLD
	RTL

;--------------------------------------------------------------------

org $C0D19B
label_C0D19B:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFDE
	TCD
	LDA.w $4DB6
	STA.b $20
	STZ.w $4DBA
	LDA.b $20
	ASL
	STA.b $1E
	CLC
	ADC.w #$1A86
	STA.b $02
	LDX.b $02
	LDA.w $0000,X
	CMP.w #$0008
	BNE.b label_C0D1C8
	LDY.w #$0000
	LDX.w #$0001
	BRA.b label_C0D233

label_C0D1C8:
	LDA.w $4DB8
	ASL
	TAX
	LDA.w $0BCA,X
	STA.b $0E
	LDY.w $0B8E,X
	LDA.b $1E
	TAX
	LDA.w $0BCA,X
	TAX
	STX.b $1C
	LDA.b $1E
	TAX
	LDA.w $0B8E,X
	LDX.b $1C
	JSL.l label_C41EFF
	LDY.w #$2000
	CLC
	ADC.w #$1000
	JSL.l label_C0915B
	STA.b $04
	LDX.b $02
	LDA.w $0000,X
	SEC
	SBC.b $04
	AND.w #$0007
	BEQ.b label_C0D20E
	CMP.w #$0001
	BEQ.b label_C0D20E
	CMP.w #$0007
	BNE.b label_C0D213
label_C0D20E:
	LDY.w #$0001
	BRA.b label_C0D216

label_C0D213:
	LDY.w #$0000
label_C0D216:
	LDA.w $987F
	SEC
	SBC.b $04
	AND.w #$0007
	BEQ.b label_C0D22B
	CMP.w #$0001
	BEQ.b label_C0D22B
	CMP.w #$0007
	BNE.b label_C0D230
label_C0D22B:
	LDX.w #$0000
	BRA.b label_C0D233

label_C0D230:
	LDX.w #$0001
label_C0D233:
	STZ.w $4DBC
	CPX.w #$0001
	BNE.b label_C0D246
	CPY.w #$0000
	BNE.b label_C0D246
	LDA.w #$0001
	STA.w $4DBC
label_C0D246:
	CPY.w #$0001
	BNE.b label_C0D256
	CPX.w #$0000
	BNE.b label_C0D256
	LDA.w #$0002
	STA.w $4DBC
label_C0D256:
	LDA.w #$0078
	STA.w $5D60
	LDA.b $20
	ASL
	TAX
	LDA.w $2C9A,X
	AND.w #$7FFF
	STA.b $1A
	STA.w $4A8C
	LDA.w #EB_EnemyBattleGroupDataPtrs
	STA.b $0A
	LDA.w #EB_EnemyBattleGroupDataPtrs>>16
	STA.b $0C
	LDA.b $1A
	ASL
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	JSL.l label_C2E8E0
	LDA.w #$0000
	STA.b $04
	JMP.w label_C0D319

label_C0D297:
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b [$0A]
	AND.w #$00FF
	STA.b $02
	CMP.w #$00FF
	BEQ.b label_C0D304
	LDY.w #$0000
	LDA.b $02
	STA.b $1A
	BEQ.b label_C0D2FA
	LDY.w #$0001
	LDA.b [$06],Y
	TAY
	LDA.b $20
	ASL
	TAX
	TYA
	CMP.w $2D12,X
	BNE.b label_C0D2CF
	LDA.w #$FFFF
	STA.w $2C5E,X
	LDA.b $1A
	DEC
	STA.b $1A
label_C0D2CF:
	LDA.b $1A
	BEQ.b label_C0D2FA
	LDA.w #$0000
	STA.b $18
	BRA.b label_C0D2F5

label_C0D2DA:
	ASL
	TAX
	LDA.w $0A62,X
	CMP.w #$FFFF
	BEQ.b label_C0D2F0
	TYA
	CMP.w $2D12,X
	BNE.b label_C0D2F0
	LDA.w #$FFFF
	STA.w $2C5E,X
label_C0D2F0:
	LDA.b $18
	INC
	STA.b $18
label_C0D2F5:
	CMP.w #$0017
	BNE.b label_C0D2DA
label_C0D2FA:
	LDA.w #$0003
	CLC
	ADC.b $06
	STA.b $06
	BRA.b label_C0D30A

label_C0D304:
	LDY.w #$0000
	TYA
	STA.b $02
label_C0D30A:
	LDA.b $04
	ASL
	TAX
	TYA
	STA.w $4A7C,X
	LDA.b $02
	STA.w $4A84,X
	INC.b $04
label_C0D319:
	LDA.b $04
	CMP.w #$0004
	BEQ.b label_C0D323
	JMP.w label_C0D297

label_C0D323:
	STZ.w $9F8A
	LDY.w #$0040
	TYX
	LDA.w $98A3
	AND.w #$00FF
	JSL.l label_C0BC74
	LDA.w #$F200
	STA.b $16
	LDA.w #EB_EnemyBattleGroupDataPtrs
	STA.b $0A
	LDA.w #EB_EnemyBattleGroupDataPtrs>>16
	STA.b $0C
	LDA.w $4A8C
	ASL
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	STZ.b $1E
	JMP.w label_C0D47D

label_C0D35F:
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b [$0A]
	AND.w #$00FF
	TAX
	STX.b $14
	CPX.w #$00FF
	BNE.b label_C0D377
	JMP.w label_C0D47B

label_C0D377:
	CPX.w #$0000
	BNE.b label_C0D37F
	JMP.w label_C0D473

label_C0D37F:
	LDY.w #$0001
	LDA.b [$06],Y
	STA.b $1A
	CPX.w #$0000
	BNE.b label_C0D38E
	JMP.w label_C0D473

label_C0D38E:
	LDA.w #$0000
	STA.b $18
	TAY
	STY.b $12
	BRA.b label_C0D3BB

label_C0D398:
	LDY.b $12
	TYA
	STA.b $04
	ASL
	ASL
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.b $16
	TAX
	LDA.w $00B0,X
	ASL
	TAX
	LDA.w $2D12,X
	CMP.b $1A
	BNE.b label_C0D3B8
	LDA.b $18
	INC
	STA.b $18
label_C0D3B8:
	INY
	STY.b $12
label_C0D3BB:
	TYA
	LDY.w #$009E
	CMP.b ($16),Y
	BCC.b label_C0D398
	LDX.b $14
	STX.b $02
	LDA.b $18
	CMP.b $02
	BEQ.b label_C0D3CF
	BCS.b label_C0D3D2
label_C0D3CF:
	JMP.w label_C0D473

label_C0D3D2:
	STX.b $02
	SEC
	SBC.b $02
	STA.b $04
	STA.b $12
	JMP.w label_C0D45E

label_C0D3DE:
	LDA.w #$FFFF
	STA.b $02
	STA.b $10
	LDY.w #$0000
	STY.b $1C
	TYA
	STA.b $18
	BRA.b label_C0D428

label_C0D3EF:
	STA.b $04
	ASL
	ASL
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.b $16
	TAX
	STX.b $14
	LDA.w $00B0,X
	ASL
	TAX
	LDA.w $2D12,X
	CMP.b $1A
	BNE.b label_C0D423
	LDX.b $14
	LDA.w $00AE,X
	TAX
	LDY.b $1C
	STY.b $02
	TXA
	CMP.b $02
	BCC.b label_C0D423
	BEQ.b label_C0D423
	LDA.b $18
	STA.b $02
	STA.b $10
	TXY
	STY.b $1C
label_C0D423:
	LDA.b $18
	INC
	STA.b $18
label_C0D428:
	LDY.w #$009E
	CMP.b ($16),Y
	BCC.b label_C0D3EF
	LDA.b $10
	STA.b $02
	STA.b $04
	ASL
	ASL
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.b $16
	STA.b $18
	CLC
	ADC.w #$00B0
	TAX
	STX.b $14
	LDA.w $0000,X
	CMP.b $20
	BEQ.b label_C0D45E
	LDA.b $18
	TAX
	STZ.w $00AE,X
	LDX.b $14
	LDA.w $0000,X
	ASL
	TAX
	STZ.w $2C5E,X
label_C0D45E:
	LDA.b $12
	STA.b $04
	LDX.b $04
	LDA.b $04
	DEC
	STA.b $04
	STA.b $12
	CPX.w #$0000
	BEQ.b label_C0D473
	JMP.w label_C0D3DE

label_C0D473:
	LDA.w #$0003
	CLC
	ADC.b $06
	STA.b $06
label_C0D47B:
	INC.b $1E
label_C0D47D:
	LDA.b $1E
	CMP.w #$0004
	BEQ.b label_C0D487
	JMP.w label_C0D35F

label_C0D487:
	LDA.w #$0000
	STA.b $18
	BRA.b label_C0D4C1

label_C0D48E:
	CMP.b $20
	BEQ.b label_C0D4BC
	ASL
	TAX
	LDA.w $2C5E,X
	CMP.w #$FFFF
	BNE.b label_C0D4AD
	TXA
	CLC
	ADC.w #$10B6
	TAX
	LDA.w $0000,X
	AND.w #$3FFF
	STA.w $0000,X
	BRA.b label_C0D4BC

label_C0D4AD:
	TXA
	CLC
	ADC.w #$116A
	TAX
	LDA.w $0000,X
	ORA.w #$8000
	STA.w $0000,X
label_C0D4BC:
	LDA.b $18
	INC
	STA.b $18
label_C0D4C1:
	CMP.w #$0017
	BNE.b label_C0D48E
	LDA.b $20
	ASL
	TAX
	STZ.w $2C5E,X
	LDA.w $9F8A
	ASL
	PHA
	LDA.w $2D12,X
	PLX
	STA.w $9F8C,X
	INC.w $9F8A
	PLD
	RTL

;--------------------------------------------------------------------

org $C0DA31
label_C0DA31:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDA.w $0A50
	INC
	BNE.b label_C0DA42
	JMP.w label_C0DB0D

label_C0DA42:
	LDA.w #$0000
	STA.b $02
	TAY
	STY.b $14
	BRA.b label_C0DA7D

label_C0DA4C:
	TYA
	ASL
	TAX
	LDA.w $0A62,X
	INC
	BEQ.b label_C0DA78
	LDA.w $103E,X
	DEC
	BNE.b label_C0DA74
	LDA.w $0B52,X
	CLC
	ADC.w #$0008
	AND.w #$FE00
	BNE.b label_C0DA74
	LDA.b $02
	ASL
	TAX
	TYA
	INC
	STA.w $280C,X
	INC.b $02
	BRA.b label_C0DA78

label_C0DA74:
	TYA
	JSR.w label_C0A0CA
label_C0DA78:
	LDY.b $14
	INY
	STY.b $14
label_C0DA7D:
	CPY.w #$001E
	BNE.b label_C0DA4C
	LDA.b $02
	ASL
	TAX
	LDA.w #$FFFF
	STA.w $280C,X
	LDA.b $02
	STA.b $04
	BRA.b label_C0DAFD

label_C0DA92:
	LDX.w #$0000
	STX.b $14
	BRA.b label_C0DA9E

label_C0DA99:
	LDX.b $14
	INX
	STX.b $14
label_C0DA9E:
	TXA
	ASL
	TAX
	LDA.w $280C,X
	BEQ.b label_C0DA99
	LDX.b $14
	STX.b $02
	STX.b $12
	DEC
	ASL
	TAX
	LDY.w $0BCA,X
	BRA.b label_C0DAD2

label_C0DAB4:
	LDA.b $10
	BEQ.b label_C0DAD2
	DEC
	ASL
	TAX
	LDA.w $0BCA,X
	STA.b $0E
	STA.b $02
	TYA
	CMP.b $02
	BCS.b label_C0DAD2
	LDA.b $0E
	TAY
	LDX.b $14
	STX.b $02
	LDA.b $02
	STA.b $12
label_C0DAD2:
	LDX.b $14
	INX
	STX.b $14
	TXA
	ASL
	TAX
	LDA.w $280C,X
	STA.b $10
	INC
	BNE.b label_C0DAB4
	LDA.b $12
	STA.b $02
	ASL
	CLC
	ADC.w #$280C
	TAX
	STX.b $10
	LDA.w $0000,X
	DEC
	JSR.w label_C0A0CA
	LDA.w #$0000
	LDX.b $10
	STA.w $0000,X
label_C0DAFD:
	LDA.b $04
	STA.b $0E
	LDA.b $04
	DEC
	STA.b $04
	LDA.b $0E
	BEQ.b label_C0DB0D
	JMP.w label_C0DA92

label_C0DB0D:
	PLD
	RTS

;--------------------------------------------------------------------

label_C0DB0F:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE8
	TCD
	LDA.w $0067
	AND.w #$2000
	BEQ.b label_C0DB25
	JSR.w label_C0DA31
	JMP.w label_C0DBE4

label_C0DB25:
	LDA.w #$FFFF
	STA.b $16
	LDY.w $0A50
	STY.b $14
	BRA.b label_C0DB7C

label_C0DB31:
	TYA
	LSR
	ASL
	TAX
	LDA.w $0B52,X
	CMP.w #$0100
	BCC.b label_C0DB42
	CMP.w #$FFC0
	BCC.b label_C0DB71
label_C0DB42:
	TYA
	LSR
	ASL
	TAX
	LDA.w $0B16,X
	CMP.w #$0140
	BCC.b label_C0DB53
	CMP.w #$FFC0
	BCC.b label_C0DB71
label_C0DB53:
	TYA
	LSR
	STA.b $12
	ASL
	TAX
	LDA.w $103E,X
	CMP.w #$0001
	BNE.b label_C0DB6C
	LDA.b $16
	STA.w $280C,X
	LDA.b $12
	STA.b $16
	BRA.b label_C0DB71

label_C0DB6C:
	LDA.b $12
	JSR.w label_C0A0CA
label_C0DB71:
	LDY.b $14
	TYA
	LSR
	ASL
	TAX
	LDY.w $0A9E,X
	STY.b $14
label_C0DB7C:
	TYA
	INC
	BNE.b label_C0DB31
	BRA.b label_C0DBDF

label_C0DB82:
	LDA.b $16
	STA.b $10
	LDA.b $16
	ASL
	TAX
	LDA.w $0BCA,X
	STA.b $0E
	LDA.w #$FFFF
	STA.b $04
	LDA.b $16
	STA.b $02
	LDY.w $280C,X
	BRA.b label_C0DBB7

label_C0DB9D:
	TYA
	ASL
	TAX
	LDA.w $0BCA,X
	CMP.b $0E
	BCC.b label_C0DBAF
	STA.b $0E
	STY.b $10
	LDA.b $02
	STA.b $04
label_C0DBAF:
	STY.b $02
	TYA
	ASL
	TAX
	LDY.w $280C,X
label_C0DBB7:
	TYA
	INC
	BNE.b label_C0DB9D
	LDA.b $10
	JSR.w label_C0A0CA
	LDA.b $04
	INC
	BEQ.b label_C0DBD6
	LDA.b $04
	ASL
	PHA
	LDA.b $10
	ASL
	TAX
	LDA.w $280C,X
	PLX
	STA.w $280C,X
	BRA.b label_C0DBDF

label_C0DBD6:
	LDA.b $10
	ASL
	TAX
	LDA.w $280C,X
	STA.b $16
label_C0DBDF:
	LDA.b $16
	INC
	BNE.b label_C0DB82
label_C0DBE4:
	PLD
	RTS

;--------------------------------------------------------------------

label_C0DBE6:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TAY
	LDA.b $20
	STA.b $06
	LDA.b $22
	STA.b $08
	LDA.w #$9E3C
	STA.b $10
	LDX.w #$0000
	STX.b $0E
	BRA.b label_C0DC18

label_C0DC05:
	TAX
	LDA.w $0000,X
	BEQ.b label_C0DC1D
	LDA.b $10
	CLC
	ADC.w #$0006
	STA.b $10
	LDX.b $0E
	INX
	STX.b $0E
label_C0DC18:
	CPX.w #$0004
	BCC.b label_C0DC05
label_C0DC1D:
	LDA.b $10
	TAX
	TYA
	STA.w $0000,X
	LDA.b $10
	TAY
	INY
	INY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDX.b $0E
	TXA
	PLD
	RTL

;--------------------------------------------------------------------

label_C0DC38:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF2
	TCD
	PLA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	TAX
	STZ.w $9E3C,X
	PLD
	RTL

;--------------------------------------------------------------------

label_C0DC4E:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w $0002
	AND.w #$00FF
	BNE.b label_C0DC66
	LDA.w $9E54
	BEQ.b label_C0DC66
	DEC.w $9E54
label_C0DC66:
	LDA.w $88E0
	CMP.w #$FFFF
	BNE.b label_C0DCC4
	LDA.w $9643
	BNE.b label_C0DCC4
	LDA.w $5D60
	BNE.b label_C0DCC4
	LDA.w $4DBA
	BNE.b label_C0DCC4
	LDY.w #$9E3C
	STY.b $0E
	LDA.w #$0000
	STA.b $02
	BRA.b label_C0DCBD

label_C0DC89:
	LDA.w $0000,Y
	BEQ.b label_C0DCB1
	TYX
	DEC
	STA.w $0000,X
	BNE.b label_C0DCB1
	INY
	INY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	PHA
	LDA.b $06
	STA.w $00BC
	LDA.b $08
	STA.w $00BE
	PLA
	JSL.l label_C09279
label_C0DCB1:
	LDY.b $0E
	TYA
	CLC
	ADC.w #$0006
	TAY
	STY.b $0E
	INC.b $02
label_C0DCBD:
	LDA.b $02
	CMP.w #$0004
	BCC.b label_C0DC89
label_C0DCC4:
	PLD
	RTS

;--------------------------------------------------------------------

label_C0DCC6:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w $88E0
	CMP.w #$FFFF
	BNE.b label_C0DD0D
	LDA.w $9643
	BNE.b label_C0DD0D
	LDA.w $5D60
	BNE.b label_C0DD0D
	LDA.w $4DBA
	BNE.b label_C0DD0D
	LDA.w $9E56
	BNE.b label_C0DD0D
	LDA.w #$0307
	JSL.l label_C21628
	CMP.w #$0000
	BNE.b label_C0DD0D
	LDA.w #DATA_C7D33E
	STA.b $0E
	LDA.w #DATA_C7D33E>>16
	STA.b $10
	LDA.w #$000A
	JSL.l label_C064E3
	LDA.w #$0001
	STA.w $9E56
label_C0DD0D:
	PLD
	RTL

;--------------------------------------------------------------------

org $C0DD2C
label_C0DD2C:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	BRA.b label_C0DD4F

label_C0DD3A:
	JSL.l label_C088B1
	JSL.l label_C09466
	JSL.l label_C08B26
	JSL.l label_C08756
	LDA.b $0E
	DEC
	STA.b $0E
label_C0DD4F:
	BNE.b label_C0DD3A
	PLD
	RTL

;--------------------------------------------------------------------

org $C0EBE0
label_C0EBE0:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDA.w #$0000
	STA.b $06
	LDA.w #$007F
	STA.b $08
	LDA.w #TitleLogoGFX1
	STA.b $0E
	LDA.w #TitleLogoGFX1>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$0000
	LDX.w #$B000
	SEP.b #$20
	TYA
	JSL.l label_C08616
	LDA.w #TitleLogoTilemap
	STA.b $0E
	LDA.w #TitleLogoTilemap>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$5800
	LDX.w #$1000
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #TitleLogoGFX2
	STA.b $0E
	LDA.w #TitleLogoGFX2>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$6000
	LDX.w #$4000
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	PLD
	RTL

;--------------------------------------------------------------------

label_C0EC77:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	BNE.b label_C0EC9D
	LDA.w #TitleScreenLetterPalettes
	STA.b $0E
	LDA.w #TitleScreenLetterPalettes>>16
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	BRA.b label_C0ECB5

label_C0EC9D:
	LDA.w #TitleScreenGlowPalettes
	STA.b $0E
	LDA.w #TitleScreenGlowPalettes>>16
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
label_C0ECB5:
	PLD
	RTL

;--------------------------------------------------------------------

label_C0ECB7:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	SEP.b #$20
	STZ.w $0030
	REP.b #$20
	LDA.w #TitleScreenBGPalettes
	STA.b $0E
	LDA.w #TitleScreenBGPalettes>>16
	STA.b $10
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	JSL.l label_C496F9
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0100
	REP.b #$20
	LDA.w #$0200
	JSL.l label_C08EFC
	LDX.w #$00FF
	LDA.w #$00A5
	JSL.l label_C496E7
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C0ED14:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF1
	TCD
	SEP.b #$20
	LDA.b #$FF
	STA.b $0E
	LDX.w #$0100
	REP.b #$20
	LDA.w #$0200
	JSL.l label_C08EFC
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C0ED39:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF1
	TCD
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0100
	REP.b #$20
	LDA.w #$0200
	JSL.l label_C08EFC
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

; Note: This routine is called when skipping the title screen animation.

label_C0ED5C:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	SEP.b #$20
	STZ.w $0030
	REP.b #$20
	LDA.w #TitleScreenBGPalettes
	STA.b $0E
	LDA.w #TitleScreenBGPalettes>>16
	STA.b $10
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #$0000
	JSL.l label_C0EC77
	LDA.w #$01A0
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDX.w #$0020
	LDA.w #$0300
	JSL.l label_C08ED2
	LDA.w #$0001
	JSL.l label_C0EC77
	LDA.w #$0260
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDX.w #$0020
	LDA.w #$02E0
	JSL.l label_C08ED2
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C0EDD1:
	REP.b #$31
	LDA.w #$0002
	STA.w $9641
	RTL

;--------------------------------------------------------------------

label_C0EDDA:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE8
	TCD
	LDA.w $1A42
	ASL
	TAX
	LDY.w $0E5E,X
	STY.b $16
	LDA.w $0E9A,X
	STA.b $14
	LDA.w $0ED6,X
	STA.b $02
	LDA.w #$0000
	STA.b $06
	LDA.w #$007F
	STA.b $08
	TYA
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDA.b $14
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$0200
	JSL.l label_C08ED2
	LDY.b $16
	TYA
	INC
	STA.b $12
	CMP.b $02
	BNE.b label_C0EE32
	LDA.w #$0000
	STA.b $12
label_C0EE32:
	LDA.w $1A42
	ASL
	TAX
	LDA.b $12
	STA.w $0E5E,X
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C0EE47:
	REP.b #$31
	SEP.b #$20
	LDA.b #$13
	STA.w $001A
	REP.b #$20
	RTL

;--------------------------------------------------------------------

label_C0EE53:
	REP.b #$31
	LDA.w $1A42
	ASL
	CLC
	ADC.w #$116A
	TAX
	LDA.w $0000,X
	AND.w #$7FFF
	STA.w $0000,X
	RTL

;--------------------------------------------------------------------

label_C0EE68:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	STA.b $02
	LDA.w #$0001
	JSL.l label_C08D79
	LDY.w #$0000
	LDX.w #$4000
	TYA
	JSL.l label_C08E1C
	SEP.b #$20
	LDA.b #$04
	STA.w $001A
	REP.b #$20
	LDA.b $02
	BEQ.b DecompressNintendoLogoData
	CMP.w #$0001
	BEQ.b DecompressApeSoftwareLogoData
	CMP.w #$0002
	BNE.b label_C0EEA0
	JMP.w DecompressHalLogoData

label_C0EEA0:
	JMP.w label_C0EFA7

DecompressNintendoLogoData:
	LDA.w #NintendoLogoGFX
	STA.b $0E
	LDA.w #NintendoLogoGFX>>16
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #NintendoLogoTilemap
	STA.b $0E
	LDA.w #NintendoLogoTilemap>>16
	STA.b $10
	LDA.w #$8000
	STA.b $12
	LDA.w #$007E
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #NintendoLogoPalette
	STA.b $0E
	LDA.w #NintendoLogoPalette>>16
	STA.b $10
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	JMP.w label_C0EFA7

DecompressApeSoftwareLogoData:
	LDA.w #ApeSoftwareLogoGFX
	STA.b $0E
	LDA.w #ApeSoftwareLogoGFX>>16
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #ApeSoftwareLogoTilemap
	STA.b $0E
	LDA.w #ApeSoftwareLogoTilemap>>16
	STA.b $10
	LDA.w #$8000
	STA.b $12
	LDA.w #$007E
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #ApeSoftwareLogoPalette
	STA.b $0E
	LDA.w #ApeSoftwareLogoPalette>>16
	STA.b $10
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	BRA.b label_C0EFA7

DecompressHalLogoData:
	LDA.w #HalLogoGFX
	STA.b $0E
	LDA.w #HalLogoGFX>>16
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #HalLogoTilemap
	STA.b $0E
	LDA.w #HalLogoTilemap>>16
	STA.b $10
	LDA.w #$8000
	STA.b $12
	LDA.w #$007E
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #HalLogoPalette
	STA.b $0E
	LDA.w #HalLogoPalette>>16
	STA.b $10
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
label_C0EFA7:
	LDA.w #$0000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$0000
	LDX.w #$8000
	SEP.b #$20
	TYA
	JSL.l label_C08616
	LDA.w #$8000
	STA.b $0E
	LDA.w #$007E
	STA.b $10
	LDY.w #$4000
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	REP.b #$20
	PLD
	RTS

;--------------------------------------------------------------------

label_C0EFE1:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	BRA.b label_C0F002

label_C0EFEF:
	LDA.w $006D
	BEQ.b label_C0EFF9
	LDA.w #$0001
	BRA.b label_C0F007

label_C0EFF9:
	JSL.l label_C08756
	LDA.b $0E
	DEC
	STA.b $0E

label_C0F002:
	BNE.b label_C0EFEF
	LDA.w #$0000

label_C0F007:
	PLD
	RTS

;--------------------------------------------------------------------

label_C0F009:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w #$0000
	JSR.w label_C0EE68
	LDY.w #$0000
	LDX.w #$0002
	LDA.w #$0001
	JSL.l label_C087CE
	LDA.w $436C
	BEQ.b label_C0F031
	LDA.w #$00B4
	JSR.w label_C0EFE1
	BRA.b label_C0F046

label_C0F031:
	LDX.w #$0000
	STX.b $0E
	BRA.b label_C0F041

label_C0F038:
	JSL.l label_C08756
	LDX.b $0E
	INX
	STX.b $0E

label_C0F041:
	CPX.w #$00B4
	BCC.b label_C0F038

label_C0F046:
	LDY.w #$0000
	LDX.w #$0002
	LDA.w #$0001
	JSL.l label_C08814
	LDA.w #$0001
	JSR.w label_C0EE68
	LDY.w #$0000
	LDX.w #$0002
	LDA.w #$0001
	JSL.l label_C087CE
	LDA.w #$0078
	JSR.w label_C0EFE1
	CMP.w #$0000
	BEQ.b label_C0F083
	LDY.w #$0000
	LDX.w #$0001
	LDA.w #$0002
	JSL.l label_C08814
	LDA.w #$0001
	BRA.b label_C0F0D0

label_C0F083:
	LDY.w #$0000
	LDX.w #$0002
	LDA.w #$0001
	JSL.l label_C08814
	LDA.w #$0002
	JSR.w label_C0EE68
	LDY.w #$0000
	LDX.w #$0002
	LDA.w #$0001
	JSL.l label_C087CE
	LDA.w #$0078
	JSR.w label_C0EFE1
	CMP.w #$0000
	BEQ.b label_C0F0C0
	LDY.w #$0000
	LDX.w #$0001
	LDA.w #$0002
	JSL.l label_C08814
	LDA.w #$0001
	BRA.b label_C0F0D0

label_C0F0C0:
	LDY.w #$0000
	LDX.w #$0002
	LDA.w #$0001
	JSL.l label_C08814

label_C0F0CB:
	LDA.w #$0000

label_C0F0D0:
	PLD
	RTL

;--------------------------------------------------------------------

label_C0F0D2:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	STZ.w $0037
	STZ.w $0035
	STZ.w $0033
	STZ.w $0031
	LDA.w #$0000
	STA.b $06
	LDA.w #$007F
	STA.b $08
	LDA.w #WarOnGiygasScreenGFX
	STA.b $0E
	LDA.w #WarOnGiygasScreenGFX>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$0000
	LDX.w #$C000
	SEP.b #$20
	TYA
	JSL.l label_C08616
	LDA.w #WarOnGiygasScreenTilemap
	STA.b $0E
	LDA.w #WarOnGiygasScreenTilemap>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$7800
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #WarOnGiygasScreenPalette
	STA.b $0E
	LDA.w #WarOnGiygasScreenPalette>>16
	STA.b $10
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	JSL.l label_C4A377
	JSL.l label_C496F9
	LDA.w #$0040
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDX.w #$0020
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08F15
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0040
	REP.b #$20
	LDA.w #$0200
	JSL.l label_C08EFC
	SEP.b #$20
	STZ.b $0E
	LDX.w #$01A0
	REP.b #$20
	LDA.w #$0260
	JSL.l label_C08EFC
	LDX #$FFFF
	LDA.w #$01E0
	JSL.l label_C496E7
	SEP.b #$20
	LDA.b #$01
	STA.w $001A
	LDA.b #$02
	STA.w $001B
	STA.l !REGISTER_ColorMathInitialSettings
	LDA.b #$03
	STA.l !REGISTER_ColorMathSelectAndEnable
	LDA.b #$18
	STA.w $0030
	REP.b #$20
	PLD
	RTS

;--------------------------------------------------------------------

label_C0F1D2:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	TAY
	STY.b $16
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.w #$007E
	STA.b $14
	LDA.b $12
	STA.b $06
	LDA.b $14
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0064
	JSL.l label_C4954C
	LDX.w #$FFFF
	LDY.b $16
	TYA
	JSL.l label_C496E7
	PLD
	RTS

;--------------------------------------------------------------------

label_C0F21E:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEC
	TCD
	LDA.w #$0000
	STA.b $04
	TAX
	STX.b $12
	BRA.b label_C0F248

label_C0F230:
	LDA.w $006D
	BEQ.b label_C0F23B
	LDA.w #$0001
	JMP.w label_C0F33A

label_C0F23B:
	JSL.l label_C2DB3F
	JSL.l label_C08756
	LDX.b $12
	INX
	STX.b $12
label_C0F248:
	CPX.w #$00EC
	BCC.b label_C0F230
	LDA.w #$0000
	STA.b $02
	BRA.b label_C0F2C2

label_C0F254:
	LDA.w $006D
	BEQ.b label_C0F25F
	LDA.w #$0001
	JMP.w label_C0F33A

label_C0F25F:
	LDY.w #$0240
	STY.b $12
	TYA
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDA.w #$4476
	JSL.l label_C08ED2
	JSL.l label_C426ED
	SEP.b #$20
	STZ.w $0030
	JSL.l label_C2DB14
	LDA.w #$4476
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDY.b $12
	TYA
	JSL.l label_C08ED2
	JSL.l label_C2DB3F
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	JSL.l label_C08756
	INC.b $02
label_C0F2C2:
	LDA.b $02
	CMP.w #$01E0
	BCS.b label_C0F2CE
	BEQ.b label_C0F2CE
	JMP.w label_C0F254

label_C0F2CE:
	JSL.l label_C49740
	SEP.b #$20
	LDA.b #$00
	STA.l !REGISTER_ColorMathSelectAndEnable
	STA.l !REGISTER_ColorMathInitialSettings
	LDA.b #$01
	STA.w $001A
	STZ.w $001B
	REP.b #$20
	LDA.w #$0078
	JSR.w label_C0EFE1
	CMP.w #$0000
	BEQ.b label_C0F2F8
	LDA.w #$0001
	BRA.b label_C0F33A

label_C0F2F8:
	LDA.w #$00AE
	JSL.l label_C4FBBD
	LDY.w #$0000
	TYX
	LDA.w #$035C
	JSL.l label_C092F5
	STA.b $12
	BRA.b label_C0F326

label_C0F30E:
	JSL.l label_C09466
	JSL.l label_C08756
	LDA.w $006D
	BEQ.b label_C0F326
	LDA.b $12
	JSL.l label_C09C35
	LDA.w #$0001
	BRA.b label_C0F33A

label_C0F326:
	LDA.b $12
	ASL
	TAX
	LDA.w $0A62,X
	CMP.w #$FFFF
	BNE.b label_C0F30E
	LDA.w #$014A
	JSR.w label_C0F1D2
	LDA.b $04
label_C0F33A:
	PLD
	RTS

;--------------------------------------------------------------------

label_C0F33C:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFED
	TCD
	JSL.l label_C0927C
	JSR.w label_C0F0D2
	LDX.w #$000B
	LDA.w #$0001
	JSL.l label_C0886C
	JSR.w label_C0F21E
	TAY
	STY.b $11
	BEQ.b label_C0F362
	LDA.w #$0001
	BRA.b label_C0F3B0

label_C0F362:
	LDX.w #$0000
	STX.b $0F
	BRA.b label_C0F380

label_C0F369:
	LDA.w $006D
	BEQ.b label_C0F373
	LDA.w #$0001
	BRA.b label_C0F3B0

label_C0F373:
	JSL.l label_C426ED
	JSL.l label_C08756
	LDX.b $0F
	INX
	STX.b $0F

label_C0F380:
	CPX.w #$014A
	BCC.b label_C0F369
	SEP.b #$20
	STZ.w $001A
	STZ.b $0E
	LDX.w #$0200
	REP.b #$20
	LDA.w #$0200
	JSL.l label_C08EFC
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	LDY.b $11
	BNE.b label_C0F3AB
	REP.b #$20
	LDA.w #$001E
	JSR.w label_C0EFE1

label_C0F3AB:
	LDY.b $11
	REP.b #$20
	TYA

label_C0F3B0:
	PLD
	RTL

;--------------------------------------------------------------------

FlashWarOnGiygasScreen:
.Main:
;$C0F3B2
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDA.w #WarOnGiygasScreenFlashPalette
	STA.b $0E
	LDA.w #WarOnGiygasScreenFlashPalette>>16
	STA.b $10
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #$0018
	JSL.l label_C0856B
	PLD
	RTL

UnflashWarOnGiygasScreen:
.Main:
;$C0F3E8
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDA.w #WarOnGiygasScreenPalette
	STA.b $0E
	LDA.w #WarOnGiygasScreenPalette>>16
	STA.b $10
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #$0018
	JSL.l label_C0856B
	PLD
	RTL

org $C0F8C2								; Note: Temp code. This is where the game will end up after a crash to help prevent emulator crashes.
	SEP.b #$FF
	LDA.b #$00
	STA.l $004200
	STA.l $00420B
	STA.l $00420C
	PHB
	PHK
	PLB
	LDA.b #$80
	STA.l $002100
	LDA.b #$00
	STA.l $002121
	STA.l $00212C
	STA.l $00212D
	STA.l $00212E
	STA.l $00212F
	LDA.b #$20
	STA.l $002132
	ASL
	STA.l $002132
	ASL
	STA.l $002132
	LDA.b #$1F
	STA.l $002122
	LDA.b #$00
	STA.l $002122
	LDA.b #$0F
	STA.l $002100
-:
	BRA.b -
	;%FREE_BYTES(NULLROM, 1774, $00)					; $C0F8C2
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankC1Macros(StartBank, EndBank)
%BANK_START(<StartBank>)
label_C10000:
	JSR.w label_C10A1D
	RTL

;--------------------------------------------------------------------

label_C10004:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.b $20
	STA.b $06
	LDA.b $22
	STA.b $08
	JSL.l label_C0943C
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C10024:
	JSL.l label_C12DD5
	LDA.w $B4A8
	CMP.w #$FFFF
	BNE.b label_C10024
	JSL.l label_C09451
	PLD
	RTL

;--------------------------------------------------------------------

label_C10036:
	REP.b #$31
	STA.w $964D
	RTS

;--------------------------------------------------------------------

label_C1003C:
	REP.b #$31
	STZ.w $964D
	RTS

;--------------------------------------------------------------------

label_C10042:
	REP.b #$31
	LDA.w $964D
	RTS

;--------------------------------------------------------------------

label_C10048:
	REP.b #$31
	STA.w $964F
	RTS

;--------------------------------------------------------------------

label_C1004E:
	REP.b #$31
	LDA.w $89C9
	AND.w #$00FF
	BEQ.b label_C1005C
	JSL.l $C3E450
label_C1005C:
	LDA.w $9643
	BEQ.b label_C10067
	JSL.l $C43568
	BRA.b label_C10077

label_C10067:
	JSL.l label_C088B1
	JSL.l label_C09466
	JSL.l label_C08B26
	JSL.l label_C08756
label_C10077:
	RTL

;--------------------------------------------------------------------

label_C10078:
	REP.b #$31
	LDA.w $8958
	RTS

;--------------------------------------------------------------------

label_C1007E:
	REP.b #$31
	STA.w $8958
	RTS

;--------------------------------------------------------------------

label_C10084:
	REP.b #$31
	LDA.w $8958
	JSL.l label_C3E521
	RTS

;--------------------------------------------------------------------

label_C1008E:
	REP.b #$31
	SEP.b #$20
	LDA.b #$01
	STA.w $5E70
	BRA.b label_C100AB

label_C10099:
	LDA.w $88E2
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $8654,X
	JSL.l label_C3E521
label_C100AB:
	REP.b #$20
	LDA.w $88E2
	CMP.w #$FFFF
	BNE.b label_C10099
	JSL.l label_C3E4CA
	JSL.l label_C12DD5
	SEP.b #$20
	STZ.w $5E70
	JSL.l $C43F53
	RTS

;--------------------------------------------------------------------

label_C100C7:
	REP.b #$31
	LDA.w #$0001
	STA.w $9645
	RTS

;--------------------------------------------------------------------

label_C100D0:
	REP.b #$31
	STZ.w $9645
	RTS

;--------------------------------------------------------------------

label_C100D6:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TAX
	STX.b $0E
	JSL.l label_C3E4CA
	JSL.l label_C12DD5
	BRA.b label_C100F1

label_C100ED:
	JSL.l label_C12E42
label_C100F1:
	LDX.b $0E
	TXA
	DEX
	STX.b $0E
	CMP.w #$0000
	BNE.b label_C100ED
	PLD
	RTS

;--------------------------------------------------------------------

label_C100FE:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TAX
	LDA.w $436C
	BEQ.b label_C10138
	LDA.w $4DC2
	BNE.b label_C10138
	BRA.b label_C10119

label_C10115:
	JSL.l label_C12E42
label_C10119:
	LDA.w $006D
	AND.w #$A0A0
	BEQ.b label_C10115
	BRA.b label_C10164

label_C10123:
	LDA.w $436C
	BEQ.b label_C10138
	LDA.w $006D
	AND.w #$8010
	CMP.w #$8010
	BNE.b label_C10138
	STZ.w $9645
	BRA.b label_C1013D

label_C10138:
	LDA.w $9645
	BNE.b label_C10123
label_C1013D:
	CPX.w #$0000
	BEQ.b label_C10145
	TXA
	BRA.b label_C10148

label_C10145:
	LDA.w $964B
label_C10148:
	TAX
	STX.b $0E
	BRA.b label_C10151

label_C1014D:
	JSL.l label_C12E42
label_C10151:
	LDX.b $0E
	TXA
	DEX
	STX.b $0E
	CMP.w #$0000
	BEQ.b label_C10164
	LDA.w $006D
	AND.w #$A0A0
	BEQ.b label_C1014D
label_C10164:
	PLD
	RTS

;--------------------------------------------------------------------

label_C10166:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	STX.b $14
	TAY
	STY.b $12
	BRA.b label_C1018C

label_C10177:
	LDA.w $436C
	BEQ.b label_C1018C
	LDA.w $006D
	AND.w #$8010
	CMP.w #$8010
	BNE.b label_C1018C
	STZ.w $9645
	BRA.b label_C10191

label_C1018C:
	LDA.w $9645
	BNE.b label_C10177
label_C10191:
	JSL.l label_C3E4CA
	JSL.l label_C12DD5
	LDX.b $14
	BNE.b label_C101B0
	LDA.w $964D
	BEQ.b label_C101B0
	LDA.w $964B
	BEQ.b label_C101B0
	LDA.w #$0000
	JSR.w label_C100FE
	JMP.w label_C102CE

label_C101B0:
	LDA.w $964D
	BEQ.b label_C101B9
	JSL.l $EF0256
label_C101B9:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	STA.b $02
	LDY.b $12
	BNE.b label_C101E3
	BRA.b label_C101D8

label_C101D4:
	JSL.l label_C12E42
label_C101D8:
	LDA.w $006D
	AND.w #$A0A0
	BEQ.b label_C101D4
	JMP.w label_C102CA

label_C101E3:
	LDA.w #AnimatedMenuCursorTiles_PointDown_Big
	STA.b $0E
	LDA.w #AnimatedMenuCursorTiles_PointDown_Big>>16
	STA.b $10
	LDX.b $02
	LDA.w $0008,X
	LDX.b $02
	CLC
	ADC.w $000C,X
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $04
	LDX.b $02
	LDA.w $0006,X
	LDX.b $02
	CLC
	ADC.w $000A,X
	CLC
	ADC.b $04
	CLC
	ADC.w #$7C20
	TAY
	LDX.w #$0002
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDX.w #$000F
	STX.b $12
	BRA.b label_C10235

label_C10224:
	LDA.w $006D
	AND.w #$A0A0
	BNE.b $62
	JSL.l label_C12E42
	LDX.b $12
	DEX
	STX.b $12
label_C10235:
	BNE.b label_C10224
	LDA.w #AnimatedMenuCursorTiles_PointDown_Small
	STA.b $0E
	LDA.w #AnimatedMenuCursorTiles_PointDown_Small>>16
	STA.b $10
	LDX.b $02
	LDA.w $0008,X
	LDX.b $02
	CLC
	ADC.w $000C,X
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $04
	LDX.b $02
	LDA.w $0006,X
	LDX.b $02
	CLC
	ADC.w $000A,X
	CLC
	ADC.b $04
	CLC
	ADC.w #$7C20
	TAY
	LDX.w #$0002
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDX.w #$000A
	STX.b $12
	BRA.b label_C10289

label_C10278:
	LDA.w $006D
	AND.w #$A0A0
	BNE.b label_C102CA
	JSL.l label_C12E42
	LDX.b $12
	DEX
	STX.b $12
label_C10289:
	BNE.b label_C10278
	JMP.w label_C101E3

label_C1028E:
	LDA.w #AnimatedMenuCursorTiles_PointDown_Wait
	STA.b $0E
	LDA.w #AnimatedMenuCursorTiles_PointDown_Wait>>16
	STA.b $10
	LDX.b $02
	LDA.w $0008,X
	LDX.b $02
	CLC
	ADC.w $000C,X
	ASL
	ASL
	ASL
	ASL
	ASL
	PHA
	LDX.b $02
	LDA.w $0006,X
	LDX.b $02
	CLC
	ADC.w $000A,X
	PLY
	STY.b $02
	CLC
	ADC.b $02
	CLC
	ADC.w #$7C20
	TAY
	LDX.w #$0002
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
label_C102CA:
	JSL.l label_EF026E
label_C102CE:
	PLD
	RTS

;--------------------------------------------------------------------

EB_TextBoxCommand1F_Arg61_MovementCodeTrigger:
.Main:
;$C102D0
	REP.b #$31
	STZ.w $9641
	JSL.l label_C3E4CA
	JSL.l label_C12DD5
	BRA.b label_C102F8

label_C102DF:
	LDA.w $436C
	BEQ.b label_C102F4
	LDA.w $0065
	AND.w #$1000
	BEQ.b label_C102F4
	LDA.w $0065
	AND.w #$2000
	BNE.b label_C10300
label_C102F4:
	JSL.l label_C1004E
label_C102F8:
	LDA.w $9641
	BEQ.b label_C102DF
	STZ.w $9641
label_C10300:
	RTS

;--------------------------------------------------------------------

org $C10301
label_C10301:
	REP.b #$31
	LDA.w $88E0
	CMP.w #$FFFF
	BNE.b label_C10310
	LDA.w #$85FE
	BRA.b label_C10323

label_C10310:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
label_C10323:
	RTS

;--------------------------------------------------------------------

org $C103DC
label_C103DC:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF2
	TCD
	JSR.w label_C10301
	CLC
	ADC.w #$001B
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $06
	STA.b $14
	LDA.b $08
	STA.b $16
	PLD
	RTS

;--------------------------------------------------------------------

org $C1045D
label_C1045D:

;--------------------------------------------------------------------

org $C10489
label_C10489:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF2
	TCD
	LDA.b $1C
	STA.b $06
	LDA.b $1E
	STA.b $08
	JSR.w $0301
	CLC
	ADC.w #$001B
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $06
	STA.b $14
	LDA.b $08
	STA.b $16
	PLD
	RTS

;--------------------------------------------------------------------

label_C104B5:
	REP.b #$31
	LDA.w $8958
	CMP.w #$FFFF
	BNE.b label_C104C4
	LDA.w #$0000
	BRA.b label_C104D7

label_C104C4:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $865E,X
label_C104D7:
	RTS

;--------------------------------------------------------------------

label_C104D8:
	REP.b #$31
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $8660,X
	RTS

;--------------------------------------------------------------------

label_C104EE:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	TAY
	STY.b $14
	TYA
	ASL
	CLC
	ADC.w #$88E4
	TAX
	STX.b $12
	LDA.w $0000,X
	CMP.w #$FFFF
	BEQ.b label_C10528
	STY.w $8958
	JSR.w label_C11383
	LDX.b $12
	LDA.w $0000,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAX
	STX.b $10
	JMP.w label_C10644

label_C10528:
	JSL.l label_C3E4EF
	STA.b $0E
	CMP.w #$FFFF
	BNE.b label_C10536
	JMP.w label_C1078B

label_C10536:
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAX
	STX.b $10
	LDY.b $14
	CPY.w #$000A
	BNE.b label_C10585
	LDA.w $88E0
	CMP.w #$FFFF
	BNE.b label_C10560
	LDA.w #$FFFF
	STA.w $0002,X
	LDA.b $0E
	STA.w $88E2
	BRA.b label_C10578

label_C10560:
	LDA.w $88E0
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.b $0E
	STA.w $8650,X
	LDA.w $88E0
	LDX.b $10
	STA.w $0002,X
label_C10578:
	LDA.w #$FFFF
	STA.w $0000,X
	LDA.b $0E
	STA.w $88E0
	BRA.b label_C105BB

label_C10585:
	LDA.w $88E0
	CMP.w #$FFFF
	BNE.b label_C1059A
	LDA.w #$FFFF
	STA.w $0000,X
	LDA.b $0E
	STA.w $88E0
	BRA.b label_C105B0

label_C1059A:
	LDA.w $88E2
	STA.w $0000,X
	LDA.w $88E2
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.b $0E
	STA.w $8652,X
label_C105B0:
	STA.w $88E2
	LDA.w #$FFFF
	LDX.b $10
	STA.w $0002,X
label_C105BB:
	LDY.b $14
	TYA
	STA.w $0004,X
	TYA
	ASL
	TAX
	LDA.b $0E
	STA.w $88E4,X
	LDA.w #DATA_C3E250
	STA.b $06
	LDA.w #DATA_C3E250>>16
	STA.b $08
	TYA
	ASL
	ASL
	ASL
	STA.b $02
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	LDX.b $10
	STA.w $0006,X
	LDA.b $02
	INC
	INC
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	STA.w $0008,X
	LDA.b $02
	INC
	INC
	INC
	INC
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	DEC
	DEC
	STA.w $000A,X
	LDA.b $02
	CLC
	ADC.w #$0006
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	DEC
	DEC
	STA.w $000C,X
	LDY.w #$03F0
	LDA.b $0E
	JSL.l label_C09032
	CLC
	ADC.w #$5E7E
	STA.w $0035,X
	LDY.b $14
	STY.w $8958
label_C10644:
	JSR.w label_C10301
	STA.b $12
	LDX.b $10
	STZ.w $0010,X
	STZ.w $000E,X
	SEP.b #$20
	LDA.b #$80
	STA.w $0012,X
	REP.b #$20
	STZ.w $0013,X
	STZ.w $0015,X
	LDA.b $12
	CLC
	ADC.w #$0017
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	TXA
	CLC
	ADC.w #$0017
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$001B
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	TXA
	CLC
	ADC.w #$001B
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$0021
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	TXA
	CLC
	ADC.w #$0021
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$0025
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	TXA
	CLC
	ADC.w #$0025
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	TAX
	LDA.w $001F,X
	LDX.b $10
	STA.w $001F,X
	LDA.b $12
	TAX
	LDA.w $0029,X
	LDX.b $10
	STA.w $0029,X
	LDA.w #$FFFF
	STA.w $002F,X
	STA.w $002D,X
	STA.w $002B,X
	LDA.w #$0001
	STA.w $0031,X
	STA.w $0033,X
	LDA.w #$0000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	TXA
	CLC
	ADC.w #$0037
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDY.w $0035,X
	STY.b $0E
	LDY.w $000C,X
	LDA.w $000A,X
	JSL.l label_C09032
	STA.b $02
	BRA.b label_C10758

label_C1073C:
	LDY.b $0E
	LDA.w $0000,Y
	BEQ.b label_C10747
	JSL.l label_C44E4D
label_C10747:
	LDA.w #$0040
	LDY.b $0E
	STA.w $0000,Y
	INY
	INY
	STY.b $0E
	LDA.b $02
	DEC
	STA.b $02
label_C10758:
	LDA.b $02
	BNE.b label_C1073C
	LDX.b $10
	LDA.w $003B,X
	AND.w #$00FF
	BEQ.b label_C10772
	AND.w #$00FF
	DEC
	ASL
	TAX
	LDA.w #$FFFF
	STA.w $894E,X
label_C10772:
	LDX.b $10
	SEP.b #$20
	STZ.w $003C,X
	STZ.w $003B,X
	JSL.l label_C45E96
	SEP.b #$20
	LDA.b #$01
	STA.w $9623
	JSL.l label_C07C5B
label_C1078B:
	PLD
	RTS

;--------------------------------------------------------------------

label_C1078D:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w #$007E
	STA.b $0E
	LDA.w #$7E40
	STA.b $10
	LDY.w #$827E
	LDX.w #$0240
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C0862E
	PLD
	RTS

;--------------------------------------------------------------------

EB_BufferTextBoxTilemap:
.Main:
;$C107AF
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFDE
	TCD
	PLA
	STA.b $20
	LDY.w #$0052
	JSL.l label_C08FF7
	TAY
	LDA.w $8685,Y
	STA.b $1E
	LDA.w $8656,Y
	ASL
	STA.b $02
	LDA.w $8658,Y
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$7DFE
	TAX
	LDA.w $865A,Y
	STA.b $04
	STA.b $1C
	LDA.w $865C,Y
	STA.b $1A
	LDA.w $0000,X
	BEQ.b label_C107F5
	CMP.w #$3C10
	BNE.b label_C10802
label_C107F5:
	LDA.w #$3C10
	STA.w $0000,X
	TXY
	INY
	INY
	STY.b $18
	BRA.b label_C1080D

label_C10802:
	LDA.w #$3C13
	STA.w $0000,X
	TXY
	INY
	INY
	STY.b $18
label_C1080D:
	LDA.b $20
	LDY.w #$0052
	JSL.l label_C08FF7
	STA.b $16
	TAX
	SEP.b #$20
	LDA.w $868B,X
	STA.b $00
	REP.b #$20
	LDA.b $00
	AND.w #$00FF
	BNE.b label_C1082C
	JMP.w label_C108B8

label_C1082C:
	LDA.b $16
	CLC
	ADC.w #$868C
	STA.b $14
	LDA.b $00
	AND.w #$00FF
	DEC
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$02E0
	STA.b $02
	LDA.w #$3C16
	LDY.b $18
	STA.w $0000,Y
	TYX
	INX
	INX
	STX.b $18
	LDA.b $04
	DEC
	STA.b $04
	STA.b $12
	LDA.b $14
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l label_C08F22
	STA.b $04
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.w #$0007
	LSR
	LSR
	LSR
	STA.b $14
	BRA.b label_C108A2

label_C10883:
	LDA.b $02
	CLC
	ADC.w #$2000
	LDX.b $18
	STA.w $0000,X
	INC.b $02
	INX
	INX
	STX.b $18
	LDA.b $12
	STA.b $04
	DEC
	STA.b $04
	STA.b $12
	LDA.b $14
	DEC
	STA.b $14
label_C108A2:
	BNE.b label_C10883
	LDA.w #$7C16
	LDX.b $18
	STA.w $0000,X
	TXY
	INY
	INY
	STY.b $18
	LDA.b $12
	STA.b $04
	DEC
	STA.b $04
label_C108B8:
	LDA.b $20
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $8654,X
	CMP.w $5E7A
	BNE.b label_C108DA
	LDA.w $5E7C
	CMP.w #$FFFF
	BEQ.b label_C108DA
	LDA.b $04
	SEC
	SBC.w #$0004
	STA.b $04
label_C108DA:
	LDX.b $04
	BRA.b label_C108EB

label_C108DE:							; Note: Something related to buffering the top border of a text box
	LDA.w #$3C11
	LDY.b $18
	STA.w $0000,Y
	INY
	INY
	STY.b $18
	DEX
label_C108EB:
	BNE.b label_C108DE
	LDA.b $20
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $8654,X
	CMP.w $5E7A
	BNE.b label_C10941
	LDA.w $5E7C
	CMP.w #$FFFF
	BEQ.b label_C10941
	LDA.w #$C3E43C
	STA.b $0A
	LDA.w #$C3E43C>>16
	STA.b $0C
	LDA.w $5E7C
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDX.w #$0000
	BRA.b label_C1093C

label_C1092C:
	LDA.b [$06]
	LDY.b $18
	STA.w $0000,Y
	INC.b $06
	INC.b $06
	INY
	INY
	STY.b $18
	INX
label_C1093C:
	CPX.w #$0004
	BCC.b label_C1092C
label_C10941:
	LDY.b $18
	LDA.w $0000,Y
	BEQ.b label_C1094D
	CMP.w #$7C10
	BNE.b label_C1095A
label_C1094D:
	LDA.w #$7C10
	STA.w $0000,Y						; Note: Something related to buffering the top right corner of a text box
	TYA
	INC
	INC
	STA.b $20
	BRA.b label_C10965

label_C1095A:
	LDA.w #$7C13
	STA.w $0000,Y
	TYA
	INC
	INC
	STA.b $20
label_C10965:
	LDA.w #$0020
	SEC
	SBC.b $1C
	DEC
	DEC
	ASL
	STA.b $02
	LDA.b $20
	CLC
	ADC.b $02
	TAX
	LDY.b $1A
	BRA.b label_C109BB

label_C1097A:
	LDA.w #$3C12
	STA.w $0000,X
	INX
	INX
	LDA.b $1C
	STA.b $18
	BRA.b label_C1099C

label_C10988:
	LDA.b ($1E)
	CLC
	ADC.w #$2000
	STA.w $0000,X
	INC.b $1E
	INC.b $1E
	INX
	INX
	LDA.b $18
	DEC
	STA.b $18
label_C1099C:
	BNE.b label_C10988
	LDA.w #$7C12
	STA.w $0000,X
	TXA
	INC
	INC
	STA.b $16
	LDA.w #$0020
	SEC
	SBC.b $1C
	DEC
	DEC
	ASL
	STA.b $02
	LDA.b $16
	CLC
	ADC.b $02
	TAX
	DEY
label_C109BB:
	BNE.b label_C1097A
	LDA.w $0000,X
	BEQ.b label_C109C7
	CMP.w #$BC10
	BNE.b label_C109D2
label_C109C7:
	LDA.w #$BC10
	STA.w $0000,X
	TXY
	INY
	INY
	BRA.b label_C109DB

label_C109D2:
	LDA.w #$BC13
	STA.w $0000,X
	TXY
	INY
	INY
label_C109DB:
	LDX.b $1C
	BRA.b label_C109E8

label_C109DF:
	LDA.w #$BC11
	STA.w $0000,Y
	INY
	INY
	DEX
label_C109E8:
	BNE.b label_C109DF
	LDA.w $0000,Y
	BEQ.b label_C109F4
	CMP.w #$FC10
	BNE.b label_C109FC
label_C109F4:
	LDA.w #$FC10
	STA.w $0000,Y
	BRA.b label_C10A02

label_C109FC:
	LDA.w #$FC13
	STA.w $0000,Y
label_C10A02:
	PLD
	RTL

;--------------------------------------------------------------------

label_C10A04:
	REP.b #$31
	JSL.l label_C3E6F8
	SEP.b #$20
	LDA.b #$01
	STA.w $89C9
	STA.w $9623
	REP.b #$20
	LDA.w #$FFFF
	STA.w $9647
	RTS

;--------------------------------------------------------------------

label_C10A1D:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	JSL.l label_C3E6F8
	SEP.b #$20
	STZ.w $89C9
	REP.b #$20
	LDA.w $9643
	BNE.b label_C10A7A
	LDY.w #$0000
	STY.b $0E
	BRA.b label_C10A6D

label_C10A3C:
	TYA
	JSL.l label_C207E1
	LDY.b $0E
	LDA.w $986F,Y
	AND.w #$00FF
	DEC
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	TAX
	LDA.w $0047,X
	STA.w $0045,X
	LDA.w $004D,X
	STA.w $004B,X
	STZ.w $0049,X
	STZ.w $0043,X
	LDY.b $0E
	INY
	STY.b $0E
label_C10A6D:
	LDA.w $98A4
	AND.w #$00FF
	STA.b $02
	TYA
	CMP.b $02
	BNE.b label_C10A3C
label_C10A7A:
	SEP.b #$20
	LDA.b #$01
	STA.w $9623
	REP.b #$20
	PLD
	RTS

;--------------------------------------------------------------------

label_C10A85:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	STY.b $18
	STX.b $02
	STX.b $16
	STA.b $14
	ASL
	TAX
	LDA.w $88E4,X
	STA.b $12
	CMP.w #$FFFF
	BNE.b label_C10AA6
	JMP.w label_C10B9F

label_C10AA6:
	LDA.b $12
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.w $865E,X
	STY.b $10
	LDA.w $8660,X
	STA.b $04
	TYA
	CMP.w $865A,X
	BNE.b label_C10ADC
	LDA.w $865C,X
	LSR
	DEC
	STA.b $02
	LDA.b $04
	CMP.b $02
	BEQ.b label_C10AD1
	INC.b $04
	BRA.b label_C10AD7

label_C10AD1:
	LDA.b $14
	JSL.l label_C437B8
label_C10AD7:
	LDY.w #$0000
	STY.b $10
label_C10ADC:
	LDA.w $964D
	BEQ.b label_C10B0D
	CPY.w #$0000
	BNE.b label_C10B0D
	LDA.b $16
	STA.b $02
	CMP.w #$0020
	BEQ.b label_C10AF6
	LDA.b $02
	CMP.w #$0040
	BNE.b label_C10B0D
label_C10AF6:
	LDA.w $964D
	CMP.w #$0001
	BNE.b label_C10B01
	JMP.w label_C10B8A

label_C10B01:
	CMP.w #$0002
	BNE.b label_C10B0D
	LDA.w #$0020
	STA.b $02
	STA.b $16
label_C10B0D:
	LDA.b $12
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.b $10
	TYA
	ASL
	STA.b $02
	LDY.w $865A,X
	LDA.b $04
	JSL.l label_C09032
	ASL
	ASL
	CLC
	ADC.w $8685,X
	CLC
	ADC.b $02
	STA.b $0E
	LDA.b $16
	STA.b $02
	CMP.w #$0022
	BNE.b label_C10B3F
	LDX.w #$0C00
	BRA.b label_C10B41

label_C10B3F:
	LDX.b $18
label_C10B41:
	LDA.b $02
	AND.w #$000F
	PHA
	LDA.b $02
	AND.w #$FFF0
	ASL
	PLY
	STY.b $02
	CLC
	ADC.b $02
	STX.b $02
	CLC
	ADC.b $02
	STA.b $02
	STA.b $18
	LDA.b $0E
	TAX
	LDA.b $02
	STA.w $0000,X
	LDA.b $12
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $865A,X
	ASL
	STA.b $02
	LDA.b $0E
	CLC
	ADC.b $02
	TAX
	LDA.b $18
	STA.b $02
	CLC
	ADC.w #$0010
	STA.w $0000,X
	LDY.b $10
	INY
	STY.b $10
label_C10B8A:
	LDA.b $12
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.b $10
	TYA
	STA.w $865E,X
	LDA.b $04
	STA.w $8660,X
label_C10B9F:
	PLD
	RTS

;--------------------------------------------------------------------

label_C10BA1:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TAX
	STX.b $0E
	LDA.w $8958
	CMP.w #$FFFF
	BEQ.b label_C10BD1
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.w $8663,X
	LDX.b $0E
	LDA.w $8958
	JSR.w label_C10A85
label_C10BD1:
	PLD
	RTS

;--------------------------------------------------------------------

label_C10BD3:
	REP.b #$31
	LDA.w $8958
	JSL.l label_C43739
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $8660,X
	TAX
	LDA.w #$0000
	JSL.l label_C438A5
	RTS

;--------------------------------------------------------------------

label_C10BF8:
	REP.b #$31
	JSR.w label_C1008E
	RTL

;--------------------------------------------------------------------

label_C10BFE:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE4
	TCD
	PLA
	STA.b $1A
	LDA.b $2E
	STA.b $06
	LDA.b $30
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.b $2A
	STA.b $0A
	LDA.b $2C
	STA.b $0C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.b $1A
	JSR.w label_C1153B
	PLD
	RTL

;--------------------------------------------------------------------

label_C10C49:
	REP.b #$31
	JSR.w label_C1138D
	RTL

;--------------------------------------------------------------------

label_C10C4F:
	REP.b #$31
	JSR.w label_C117E2
	RTL

;--------------------------------------------------------------------

label_C10C55:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.b $20
	STA.b $06
	LDA.b $22
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C10D7C
	PLD
	RTL

;--------------------------------------------------------------------

label_C10C72:
	REP.b #$31
	JSL.l label_C438A5
	RTL

;--------------------------------------------------------------------

label_C10C79:
	REP.b #$31
	JSL.l label_C438B1
	RTL

;--------------------------------------------------------------------

label_C10C80:
	REP.b #$31
	JSR.w label_C10BA1
	RTL

;--------------------------------------------------------------------

label_C10C86:
	REP.b #$31
	JSR.w label_C10CB6
	RTL

;--------------------------------------------------------------------

label_C10C8C:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STA.b $12
	LDA.b $22
	STA.b $06
	LDA.b $24
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $12
	JSR.w label_C10EFC
	PLD
	RTL

;--------------------------------------------------------------------

label_C10CAF:
	REP.b #$31
	JSL.l label_C437B8
	RTL

;--------------------------------------------------------------------

; Note: Something related to displaying text

label_C10CB6:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TAY
	STY.b $10
	LDA.w $8958
	CMP.w #$FFFF
	BNE.b label_C10CCE
	JMP.w label_C10D5E

label_C10CCE:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $8665,X
	LDY.b $10
	TYX
	JSL.l label_C44E61
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	CMP.w $88E2
	BEQ.b label_C10CFC
	SEP.b #$20
	LDA.b #$01
	STA.w $9623
label_C10CFC:
	REP.b #$20
	LDA.w $964F
	CMP.w #$0002
	BNE.b label_C10D0B
	LDX.w #$0001
	BRA.b label_C10D23

label_C10D0B:
	LDA.w $964F
	CMP.w #$0003
	BNE.b label_C10D18
	LDX.w #$0000
	BRA.b label_C10D23

label_C10D18:
	LDX.w #$0000
	LDA.w $964D
	BNE.b label_C10D23
	LDX.w #$0001
label_C10D23:
	CPX.w #$0000
	BEQ.b label_C10D43
	LDA.w $9622
	AND.w #$00FF
	BNE.b label_C10D43
	LDY.b $10
	CPY.w #$0020
	BEQ.b label_C10D43
	CPY.w #$0050
	BEQ.b label_C10D43
	LDA.w #$0007
	JSL.l label_C0ABE0
label_C10D43:
	LDA.w $9622
	AND.w #$00FF
	BNE.b label_C10D5E
	LDX.w $9625
	INX
	STX.b $0E
	BRA.b label_C10D5C

label_C10D53:
	JSL.l label_C12DD5
	LDX.b $0E
	DEX
	STX.b $0E
label_C10D5C:
	BNE.b label_C10D53
label_C10D5E:
	PLD
	RTS

;--------------------------------------------------------------------

label_C10D60:
	REP.b #$31
	JSR.w label_C10BA1
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	CMP.w $88E2
	BEQ.b label_C10D79
	SEP.b #$20
	LDA.b #$01
	STA.w $9623
label_C10D79:
	REP.b #$20
	RTS

;--------------------------------------------------------------------

label_C10D7C:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE8
	TCD
	LDA.b $26
	STA.b $06
	LDA.b $28
	STA.b $08
	LDA.b $06
	STA.b $14
	LDA.b $08
	STA.b $16
	LDX.w #$8960
	LDA.w #$0001
	STA.b $12
	BRA.b label_C10DCD

label_C10D9E:
	JSL.l label_C09237
	SEP.b #$20
	LDA.b $06
	STA.w $0000,X
	DEX
	REP.b #$20
	LDA.b $0E
	STA.b $0A
	LDA.b $10
	STA.b $0C
	LDA.b $14
	STA.b $06
	LDA.b $16
	STA.b $08
	JSL.l label_C091A6
	LDA.b $06
	STA.b $14
	LDA.b $08
	STA.b $16
	LDA.b $12
	INC
	STA.b $12
label_C10DCD:
	LDA.w #$000A
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	LDA.b $0A
	STA.b $0E
	LDA.b $0C
	STA.b $10
	LDA.b $06
	CMP.b $0A
	LDA.b $08
	SBC.b $0C
	BCS.b label_C10D9E
	SEP.b #$20
	LDA.b $06
	STA.w $0000,X
	REP.b #$20
	LDA.b $12
	PLD
	RTS

;--------------------------------------------------------------------

label_C10DF6:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE8
	TCD
	LDA.b $26
	STA.b $0A
	LDA.b $28
	STA.b $0C
	LDA.w $8958
	CMP.w #$FFFF
	BNE.b label_C10E11
	JMP.w label_C10EB2

label_C10E11:
	LDA.w #$967F
	STA.b $06
	LDA.w #$FFFF
	STA.b $08
	LDA.b $06
	CMP.b $0A
	LDA.b $08
	SBC.b $0C
	BCS.b label_C10E2D
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
label_C10E2D:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	STA.b $16
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C10D7C
	TAX
	STX.b $14
	STX.b $02
	LDA.w #$0007
	SEC
	SBC.b $02
	CLC
	ADC.w #$895A
	TAY
	STY.b $12
	LDA.b $16
	TAX
	LDA.w $0012,X
	AND.w #$00FF
	STA.b $16
	AND.w #$0080
	BNE.b label_C10EAE
	LDA.b $16
	AND.w #$000F
	INC
	LDX.b $14
	STX.b $02
	CMP.b $02
	BCS.b label_C10E86
	TXA
label_C10E86:
	STX.b $02
	SEC
	SBC.b $02
	STA.b $04
	ASL
	ADC.b $04
	ASL
	JSL.l label_C43D95
	BRA.b label_C10EAE

label_C10E97:
	LDY.b $12
	LDA.w $0000,Y
	AND.w #$00FF
	CLC
	ADC.w #$0060
	INY
	STY.b $12
	JSR.w label_C10CB6
	LDX.b $14
	DEX
	STX.b $14
label_C10EAE:
	LDX.b $14
	BNE.b label_C10E97
label_C10EB2:
	PLD
	RTS

;--------------------------------------------------------------------

label_C10EB4:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	LDA.w $8958
	CMP.w #$FFFF
	BEQ.b label_C10EDF
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.b $0E
	SEP.b #$20
	STA.w $8662,X
label_C10EDF:
	REP.b #$20
	PLD
	RTS

;--------------------------------------------------------------------

label_C10EE3:
	REP.b #$31
	CMP.w #$0001
	BEQ.b label_C10EF1
	CMP.w #$0002
	BEQ.b label_C10EF7
	BRA.b label_C10EFB

label_C10EF1:
	JSL.l $C12BF3
	BRA.b label_C10EFB

label_C10EF7:
	JSL.l $C12C36
label_C10EFB:
	RTS

;--------------------------------------------------------------------

; Note: Something textbox buffering related

label_C10EFC:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	TAX
	STX.b $12
	LDA.b $22
	STA.b $06
	LDA.b $24
	STA.b $08
	LDA.w $5E74
	AND.w #$00FF
	BEQ.b label_C10F33
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	TXA
	JSL.l label_C43EF8
	BRA.b label_C10F33

label_C10F28:
	DEX
	STX.b $12
	AND.w #$00FF
	INC.b $06
	JSR.w label_C10CB6
label_C10F33:
	LDA.b [$06]
	AND.w #$00FF
	BEQ.b label_C10F3E
	LDX.b $12
	BNE.b label_C10F28
label_C10F3E:
	PLD
	RTS

;--------------------------------------------------------------------

org $C10FAC
label_C10FAC:

;--------------------------------------------------------------------

org $C10FEA
label_C10FEA:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	LDA.w $8958
	CMP.w #$FFFF
	BEQ.b label_C1101A
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.w #$0400
	LDA.b $0E
	JSL.l label_C09032
	STA.w $8663,X
label_C1101A:
	PLD
	RTS

;--------------------------------------------------------------------

org $C11354
label_C11354:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C11379

label_C11363:
	LDY.w #$002D
	JSL.l label_C08FF7
	TAX
	LDA.w $89D4,X
	BNE.b label_C11374
	LDA.b $0E
	BRA.b label_C11381

label_C11374:
	LDA.b $0E
	INC
	STA.b $0E
label_C11379:
	CMP.w #$0046
	BNE.b label_C11363
	LDA.w #$FFFF
label_C11381:
	PLD
	RTS

;--------------------------------------------------------------------

label_C11383:
	REP.b #$31
	LDA.w $8958
	JSL.l label_C3E7E3
	RTS

;--------------------------------------------------------------------

label_C1138D:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	CMP.w #$FFFF
	BNE.b label_C113A1
	LDA.w #$0000
	BRA.b label_C113CF

label_C113A1:
	LDX.w #$0001
	STX.b $0E
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	BRA.b label_C113C3

label_C113B3:
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	LDX.b $0E
	INX
	STX.b $0E
label_C113C3:
	TAX
	LDA.w $0002,X
	CMP.w #$FFFF
	BNE.b label_C113B3
	LDX.b $0E
	TXA
label_C113CF:
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to displaying text

label_C113D1:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.b $24
	STA.b $0A
	LDA.b $26
	STA.b $0C
	LDA.b $20
	STA.b $06
	LDA.b $22
	STA.b $08
	LDA.w $8958
	CMP.w #$FFFF
	BNE.b label_C113F7
	LDA.w #$95F5
	JMP.w label_C114AF

label_C113F7:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	STA.b $02
	JSR.w label_C11354
	STA.b $10
	CMP.w #$FFFF
	BNE.b label_C1141C
	LDA.w #$95F5
	JMP.w label_C114AF

label_C1141C:
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAY
	STY.b $0E
	LDA.b $02
	CLC
	ADC.w #$002B
	TAX
	LDA.w $0000,X
	CMP.w #$FFFF
	BNE.b label_C11446
	LDA.w #$FFFF
	STA.w $0004,Y
	LDA.b $10
	STA.w $0000,X
	BRA.b label_C11463

label_C11446:
	LDA.b $02
	CLC
	ADC.w #$002D
	TAX
	LDA.w $0000,X
	STA.w $0004,Y
	LDA.w $0000,X
	LDY.w #$002D
	JSL.l label_C08FF7
	TAX
	LDA.b $10
	STA.w $89D6,X
label_C11463:
	LDX.b $02
	STA.w $002D,X
	LDA.w #$FFFF
	LDY.b $0E
	STA.w $0002,Y
	LDA.w #$0001
	STA.w $0000,Y
	TYA
	CLC
	ADC.w #$000F
	TAY
	LDA.b $0A
	STA.w $0000,Y
	LDA.b $0C
	STA.w $0002,Y
	LDA.w #$0001
	LDY.b $0E
	STA.w $0006,Y
	SEP.b #$20
	STA.w $000E,Y
	REP.b #$20
	TYA
	CLC
	ADC.w #$0013
	TAX
label_C1149B:
	SEP.b #$20
	LDA.b [$06]
	STA.w $0000,X
	INX
	LDA.b [$06]
	REP.b #$20
	INC.b $06
	AND.w #$00FF
	BNE.b label_C1149B
	TYA
label_C114AF:
	PLD
	RTS

;--------------------------------------------------------------------

label_C114B1:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE2
	TCD
	PLA
	STX.b $02
	TAY
	STY.b $1C
	LDA.b $30
	STA.b $06
	LDA.b $32
	STA.b $08
	LDA.b $06
	STA.b $18
	LDA.b $08
	STA.b $1A
	LDA.b $2C
	STA.b $0A
	LDA.b $2E
	STA.b $0C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $18
	STA.b $06
	LDA.b $1A
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSR.w label_C113D1
	STA.b $16
	CLC
	ADC.w #$002C
	TAX
	SEP.b #$20
	LDA.b #$00
	STA.w $0000,X
	REP.b #$20
	LDA.w $5E71
	AND.w #$00FF
	BEQ.b label_C11526
	LDY.b $1C
	TYA
	SEP.b #$20
	AND.b #$07
	STA.w $0000,X
	REP.b #$20
	TYA
	LSR
	LSR
	LSR
	TAY
	STY.b $1C
label_C11526:
	LDY.b $1C
	LDA.b $16
	TAX
	TYA
	STA.w $0008,X
	LDA.b $16
	TAX
	LDA.b $02
	STA.w $000A,X
	LDA.b $16
	PLD
	RTS

;--------------------------------------------------------------------

label_C1153B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	STX.b $02
	STA.b $04
	LDA.b $2C
	STA.b $06
	LDA.b $2E
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.b $28
	STA.b $0A
	LDA.b $2A
	STA.b $0C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	TYX
	LDA.b $02
	JSR.w label_C114B1
	TAX
	LDA.b $04
	STA.w $000C,X
	LDA.w #$0002
	STA.w $0000,X
	TXA
	PLD
	RTS

;--------------------------------------------------------------------

label_C11596:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE4
	TCD
	PLA
	STA.b $1A
	SEP.b #$20
	LDA.b $32
	STA.b $00
	REP.b #$20
	LDA.b $2E
	STA.b $06
	LDA.b $30
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.b $2A
	STA.b $0A
	LDA.b $2C
	STA.b $0C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.b $1A
	JSR.w label_C1153B
	TAX
	SEP.b #$20
	LDA.b $00
	STA.w $000E,X
	REP.b #$20
	TXA
	PLD
	RTS

;--------------------------------------------------------------------

label_C115F4:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	TAY
	STY.b $16
	LDA.b $2A
	STA.b $0A
	LDA.b $2C
	STA.b $0C
	LDA.b $26
	STA.b $06
	LDA.b $28
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSR.w label_C113D1
	TAX
	LDY.b $16
	TYA
	STA.w $000C,X
	LDA.w #$0002
	STA.w $0000,X
	TXA
	PLD
	RTS

;--------------------------------------------------------------------

label_C1163C:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE9
	TCD
	LDA.w $8958
	CMP.w #$FFFF
	BNE.b label_C1164F
	JMP.w label_C117DE

label_C1164F:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	STA.b $04
	LDX.b $04
	LDA.w $002B,X
	CMP.w #$FFFF
	BNE.b label_C11678
	SEP.b #$20
	LDA.b #$FF
	STA.w $968C
	JMP.w label_C117DE

label_C11678:
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	STA.b $02
	JSL.l label_C3E4D4
label_C11689:
	LDX.b $02
	LDA.w $0006,X
	LDX.b $04
	CMP.w $0033,X
	BEQ.b label_C1169D
	CMP.w #$0000
	BEQ.b label_C1169D
	JMP.w label_C117C4

label_C1169D:
	LDA.b $02
	JSL.l label_C43DDB
	LDX.b $02
	LDA.w $0006,X
	BEQ.b label_C116AD
	JMP.w label_C117A4

label_C116AD:
	LDA.w #$0000
	JSR.w label_C10FEA
	LDA.w #$014F
	JSL.l label_C43F77
	JSL.l label_C43CAA
	LDA.w #$0000
	JSR.w label_C10FEA
	LDA.b $04
	CLC
	ADC.w #$003C
	TAY
	LDA.w $0000,Y
	AND.w #$00FF
	BNE.b label_C116D6
	JMP.w label_C117A4

label_C116D6:
	LDX.w #$9C9F
	BRA.b label_C116E4

label_C116DB:
	SEP.b #$20
	LDA.b $16
	STA.w $0000,X
	INY
	INX
label_C116E4:
	SEP.b #$20
	LDA.w $0000,Y
	STA.b $16
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C116FA
	AND.w #$00FF
	CMP.w #$0058
	BNE.b label_C116DB
label_C116FA:
	SEP.b #$20
	LDA.b #$58
	STA.w $0000,X
	INX
	REP.b #$20
	LDA.b $04
	CLC
	ADC.w #$0033
	TAY
	STY.b $14
	SEP.b #$20
	LDA.w $0000,Y
	CLC
	ADC.b #$60
	STA.w $0000,X
	INX
	LDA.b #$59
	STA.w $0000,X
	INX
	LDA.b #$00
	STA.w $0000,X
	JSL.l label_C43CAA
	LDA.b #$9F
	STZ.w $0685
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$FFFF
	LDA.w $8958
	JSL.l $C2032B
	JSL.l label_C43CAA
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l label_C08F22
	STA.b $12
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $12
	DEC
	DEC
	JSR.w label_C10EFC
	LDY.b $14
	LDA.w $0000,Y
	STA.b $14
	LDX.b $04
	LDA.w $002D,X
	LDY.w #$002D
	JSL.l label_C08FF7
	TAX
	LDA.w $89D8,X
	LDY.w #$002D
	JSL.l label_C08FF7
	TAX
	LDA.b $14
	CMP.w $89DA,X
	BNE.b label_C11795
	LDA.w #$0061
	BRA.b label_C11799

label_C11795:
	CLC
	ADC.w #$0061
label_C11799:
	JSR.w label_C10CB6
	LDA.w #$0059
	JSR.w label_C10CB6
	BRA.b label_C117C4

label_C117A4:
	LDA.b $02
	CLC
	ADC.w #$0013
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$FFFF
	JSR.w label_C10EFC
label_C117C4:
	LDX.b $02
	LDA.w $0002,X
	CMP.w #$FFFF
	BEQ.b label_C117DE
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	STA.b $02
	JMP.w label_C11689

label_C117DE:
	REP.b #$20
	PLD
	RTS

;--------------------------------------------------------------------

label_C117E2:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TXY
	TAX
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C117FC

label_C117F5:
	LDA.b $0E
	INC
	STA.b $0E
	DEY
	INX
label_C117FC:
	LDA.w $0000,X
	AND.w #$00FF
	BEQ.b label_C11809
	CPY.w #$0000
	BNE.b label_C117F5
label_C11809:
	LDA.b $0E
	PLD
	RTS

;--------------------------------------------------------------------

label_C1180D:
	REP.b #$31
	TXY
	LDX.w #$0000
	JSL.l label_C451FA
	JSR.w label_C1163C
	RTS

;--------------------------------------------------------------------

label_C1181B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STY.b $02
	TXY
	LDX.w #$0000
	JSL.l label_C451FA
	LDA.b $02
	CMP.w #$FFFF
	BEQ.b label_C11882
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAY
	STY.b $0E
	LDA.b $02
	STA.w $002F,Y
	LDA.w $002B,Y
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAX
	BRA.b label_C11876

label_C11862:
	LDA.b $02
	DEC
	STA.b $02
	LDA.w $0002,X
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAX
label_C11876:
	LDA.b $02
	BNE.b label_C11862
	LDA.w $0006,X
	LDY.b $0E
	STA.w $0033,Y
label_C11882:
	JSR.w label_C1163C
	PLD
	RTS

;--------------------------------------------------------------------

label_C11887:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $10
	CMP.w #$FFFF
	BEQ.b label_C118E2
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAY
	STY.b $0E
	LDA.b $10
	STA.w $002F,Y
	LDA.w $002B,Y
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAX
	BRA.b label_C118D6

label_C118C4:
	DEC
	STA.b $10
	LDA.w $0002,X
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAX
label_C118D6:
	LDA.b $10
	BNE.b label_C118C4
	LDA.w $0006,X
	LDY.b $0E
	STA.w $0033,Y
label_C118E2:
	JSR.w label_C1163C
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to moving a text box cursor.

label_C118E7:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE2
	TCD
	PLA
	STY.b $04
	STX.b $1C
	STA.b $1A
	LDY.b $32
	STY.b $18
	LDX.b $30
	STX.b $16
	LDA.b $2E
	STA.b $14
	LDA.b $2C
	STA.b $02
	STA.b $0E
	LDA.w #$FFFF
	STA.b $10
	LDY.b $04
	LDX.b $1C
	LDA.b $1A
	JSL.l label_C20B65
	TAX
	STX.b $12
	CPX.w #$FFFF
	BNE.b label_C1195A
	LDA.b $02
	STA.b $0E
	LDA.w #$FFFF
	STA.b $10
	LDY.b $04
	LDX.b $18
	LDA.b $16
	JSL.l label_C20B65
	TAX
	STX.b $12
	LDA.b $04
	BNE.b label_C1194D
	TXA
	AND.w #$FF00
	XBA
	AND.w #$00FF
	CMP.b $1C
	BEQ.b label_C1195A
	LDX.w #$FFFF
	STX.b $12
	BRA.b label_C1195A

label_C1194D:
	TXA
	AND.w #$00FF
	CMP.b $1A
	BEQ.b label_C1195A
	LDX.w #$FFFF
	STX.b $12
label_C1195A:
	CPX.w #$FFFF
	BEQ.b label_C11965
	LDA.b $14
	JSL.l label_C0ABE0
label_C11965:
	LDX.b $12
	TXA
	PLD
	RTL

;--------------------------------------------------------------------

label_C1196A:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFD6
	TCD
	PLA
	STA.b $28
	LDA.w $8958
	STA.b $26
	CMP.w #$FFFF
	BNE.b label_C11986
	LDA.w #$0000
	JMP.w label_C11F58

label_C11986:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	STA.b $24
	LDA.w $5E79
	AND.w #$00FF
	BEQ.b label_C119B3
	LDA.w $9688
	LDY.w #$002B
	STA.b ($24),Y
	LDA.w $968A
	LDY.w #$002F
	STA.b ($24),Y
label_C119B3:
	LDY.w #$002F
	LDA.b ($24),Y
	CMP.w #$FFFF
	BEQ.b label_C11A2B
	TAX
	STX.b $22
	STA.b $20
	LDY.w #$002B
	LDA.b ($24),Y
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	STA.b $04
	BRA.b label_C119EB

label_C119D6:
	DEX
	STX.b $22
	LDX.b $04
	LDA.w $0002,X
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	STA.b $04
label_C119EB:
	LDX.b $22
	BNE.b label_C119D6
	JSL.l label_C3E4D4
	LDX.b $04
	LDY.w $000A,X
	LDX.b $04
	LDA.w $0008,X
	TAX
	INX
	LDA.b $04
	JSL.l label_C43CD2
	LDA.b $04
	CLC
	ADC.w #$0013
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0000
	LDA.w #$FFFF
	JSL.l $C43BB9
	BRA.b label_C11A3F

label_C11A2B:
	STZ.b $20
	LDY.w #$002B
	LDA.b ($24),Y
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	STA.b $04
label_C11A3F:
	STZ.b $22
	LDA.b $04
	CLC
	ADC.w #$000F
	TAY
	STY.b $1E
	LDA.w #$0000
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	CMP.b $0C
	BNE.b label_C11A66
	LDA.b $06
	CMP.b $0A
label_C11A66:
	BEQ.b label_C11A84
	JSL.l label_C3E4D4
	LDY.b $1E
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C11A84:
	LDA.w #$0000
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	LDA.b $24
	CLC
	ADC.w #$0037
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	CMP.b $0C
	BNE.b label_C11AA7
	LDA.b $06
	CMP.b $0A
label_C11AA7:
	BEQ.b label_C11AE7
	LDX.b $04
	LDA.w $0000,X
	CMP.w #$0001
	BNE.b label_C11AB8
	LDA.b $20
	INC
	BRA.b label_C11ABD

label_C11AB8:
	LDX.b $04
	LDA.w $000C,X
label_C11ABD:
	STA.b $1C
	LDA.b $24
	CLC
	ADC.w #$0037
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $1C
	PHA
	LDA.b $06
	STA.w $00BC
	LDA.b $08
	STA.w $00BE
	PLA
	JSL.l label_C09279
	LDA.b $26
	JSR.w label_C1007E
label_C11AE7:
	JSL.l label_C3E4CA
	LDA.w $5E79
	AND.w #$00FF
	BEQ.b label_C11B03
	LDA.w $9684
	LDX.b $04
	STA.w $0008,X
	LDA.w $9686
	LDX.b $04
	STA.w $000A,X
label_C11B03:
	LDX.b $04
	LDY.w $000A,X
	LDX.b $04
	LDA.w $0008,X
	TAX
	LDA.b $04
	JSL.l label_C43CD2
	LDA.w #$0001
	JSR.w label_C10FEA
	LDA.w #$0021
	JSR.w label_C10D60
	LDA.w #$0000
	JSR.w label_C10FEA
	JSL.l label_C12DD5
	LDA.w #$0001
	STA.b $02
label_C11B2F:
	LDA.b $02
	EOR.w #$0001
	STA.b $02
	STA.b $1A
	LDY.w #$0010
	LDA.b ($24),Y
	ASL
	LDY.w #$0008
	CLC
	ADC.b ($24),Y
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $02
	LDY.w #$0006
	LDA.b ($24),Y
	LDY.w #$000E
	CLC
	ADC.b ($24),Y
	CLC
	ADC.b $02
	CLC
	ADC.w #$7C20
	STA.b $1E
	LDA.b $1A
	STA.b $02
	ASL
	STA.b $18
	LDA.w #AnimatedMenuCursorTiles_PointRight_Top
	STA.b $06
	LDA.w #AnimatedMenuCursorTiles_PointRight_Top>>16
	STA.b $08
	LDA.b $18
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.b $1E
	LDX.w #$0002
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #AnimatedMenuCursorTiles_PointRight_Bottom
	STA.b $06
	LDA.w #AnimatedMenuCursorTiles_PointRight_Bottom>>16
	STA.b $08
	LDA.b $18
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $1E
	CLC
	ADC.w #$0020
	TAY
	LDX.w #$0002
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDX.w #$0000
	STX.b $1E
	JMP.w label_C11EBE

label_C11BBB:
	JSL.l label_C12E42
	LDA.w $006D
	AND.w #$0800
	BEQ.b label_C11BF5
	LDX.b $04
	LDA.w $0008,X
	STA.b $1E
	STZ.b $0E
	LDA.w #$0003
	STA.b $10
	LDA.b $1E
	STA.b $12
	LDY.w #$000C
	LDA.b ($24),Y
	LSR
	STA.b $14
	LDY.w #$FFFF
	LDX.b $04
	LDA.w $000A,X
	TAX
	LDA.b $1E
	JSL.l label_C118E7
	STA.b $1C
	JMP.w label_C11ECB

label_C11BF5:
	LDA.w $006D
	AND.w #$0200
	BEQ.b label_C11C2F
	LDX.b $04
	LDA.w $000A,X
	STA.b $22
	LDA.w #$FFFF
	STA.b $0E
	LDA.w #$0002
	STA.b $10
	LDY.w #$000A
	LDA.b ($24),Y
	STA.b $12
	LDA.b $22
	STA.b $14
	LDY.w #$0000
	TAX
	STX.b $16
	LDX.b $04
	LDA.w $0008,X
	LDX.b $16
label_C11C25:
	JSL.l label_C118E7
	STA.b $1C
	JMP.w label_C11ECB

label_C11C2F:
	LDA.w $006D
	AND.w #$0400
	BEQ.b label_C11C62
	LDX.b $04
	LDA.w $0008,X
	STA.b $1E
	STZ.b $0E
	LDA.w #$0003
	STA.b $10
	LDA.b $1E
	STA.b $12
	LDA.w #$FFFF
	STA.b $14
	LDY.w #$0001
	LDX.b $04
	LDA.w $000A,X
	TAX
	LDA.b $1E
	JSL.l label_C118E7
	STA.b $1C
	JMP.w label_C11ECB

label_C11C62:
	LDA.w $006D
	AND.w #$0100
	BEQ.b label_C11C9A
	LDX.b $04
	LDA.w $000A,X
	STA.b $22
	LDA.w #$0001
	STA.b $0E
	LDA.w #$0002
	STA.b $10
	LDA.w #$FFFF
	STA.b $12
	LDA.b $22
	STA.b $14
	LDY.w #$0000
	TAX
	STX.b $1C
	LDX.b $04
	LDA.w $0008,X
	LDX.b $1C
	JSL.l label_C118E7
	STA.b $1C
	JMP.w label_C11ECB

label_C11C9A:
	LDA.w $0069
	AND.w #$0800
	BEQ.b label_C11CC4
	STZ.b $0E
	LDA.w #$0003
	STA.b $10
	LDY.w #$FFFF
	LDX.b $04
	LDA.w $000A,X
	TAX
	STX.b $1A
	LDX.b $04
	LDA.w $0008,X
	LDX.b $1A
	JSL.l label_C20B65
	STA.b $1C
	JMP.w label_C11ECB

label_C11CC4:
	LDA.w $0069
	AND.w #$0200
	BEQ.b label_C11CF1
	LDA.w #$FFFF
	STA.b $0E
	LDA.w #$0002
	STA.b $10
	LDY.w #$0000
	LDX.b $04
	LDA.w $000A,X
	TAX
	STX.b $1A
	LDX.b $04
	LDA.w $0008,X
	LDX.b $1A
	JSL.l label_C20B65
	STA.b $1C
	JMP.w label_C11ECB

label_C11CF1:
	LDA.w $0069
	AND.w #$0400
	BEQ.b label_C11D1B
	STZ.b $0E
	LDA.w #$0003
	STA.b $10
	LDY.w #$0001
	LDX.b $04
	LDA.w $000A,X
	TAX
	STX.b $16
	LDX.b $04
	LDA.w $0008,X
	LDX.b $16
	JSL.l label_C20B65
	STA.b $1C
	JMP.w label_C11ECB

label_C11D1B:
	LDA.w $0069
	AND.w #$0100
	BEQ.b label_C11D48
	LDA.w #$0001
	STA.b $0E
	LDA.w #$0002
	STA.b $10
	LDY.w #$0000
	LDX.b $04
	LDA.w $000A,X
	TAX
	STX.b $1C
	LDX.b $04
	LDA.w $0008,X
	LDX.b $1C
	JSL.l label_C20B65
	STA.b $1C
	JMP.w label_C11ECB

label_C11D48:
	LDA.w $006D
	AND.w #!Joypad_A|!Joypad_L
	BNE.b label_C11D53
	JMP.w label_C11E76

label_C11D53:							; Note: Related to selecting a save file?
	JSL.l label_C3E4D4
	LDX.b $04
	LDA.w $0006,X
	BNE.b label_C11D61
	JMP.w label_C11E22

label_C11D61:
	LDX.b $04
	LDA.w $000E,X
	AND.w #$00FF
	JSL.l label_C0ABE0
	LDX.b $04
	LDY.w $000A,X
	LDX.b $04
	LDA.w $0008,X
	TAX
	LDA.b $04
	JSL.l label_C43CD2
	LDA.w #$002F
	JSR.w label_C10D60
	LDA.w #$0006
	JSR.w label_C10FEA
	LDA.w $5E6E
	BEQ.b label_C11DF5
	LDA.l $7EB49D
	AND.w #$00FF
	CMP.w #$0001
	BNE.b label_C11DCF
	LDA.w $8958
	CMP.w #$0013
	BNE.b label_C11DA9
	JSL.l label_C43B15
	BRA.b label_C11DF9

label_C11DA9:
	LDA.b $04
	CLC
	ADC.w #$0013
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0001
	LDA.w #$0004
	JSL.l $C43BB9
	BRA.b label_C11DF9

label_C11DCF:
	LDA.b $04
	CLC
	ADC.w #$0013
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0001
	LDA.w #$FFFF
	JSL.l $C43BB9
	BRA.b label_C11DF9

label_C11DF5:
	JSL.l label_C43B15
label_C11DF9:
	LDA.w #$0000
	JSR.w label_C10FEA
	JSL.l label_C3E4CA
	LDA.b $20
	LDY.w #$002F
	STA.b ($24),Y
	LDX.b $04
	LDA.w $0000,X
	CMP.w #$0001
	BNE.b label_C11E1A
	LDA.b $20
	INC
	JMP.w label_C11F58

label_C11E1A:
	LDX.b $04
	LDA.w $000C,X
	JMP.w label_C11F58

label_C11E22:
	LDA.w #$0002
	JSL.l label_C0ABE0
	JSR.w $C10FA3
	LDA.b $24
	CLC
	ADC.w #$0033
	TAX
	STX.b $22
	LDA.w $0000,X
	STA.b $1E
	LDX.b $04
	LDA.w $0004,X
	LDY.w #$002D
	JSL.l label_C08FF7
	TAX
	LDA.b $1E
	CMP.w $89DA,X
	BNE.b label_C11E58
	LDA.w #$0001
	LDX.b $22
	STA.w $0000,X
	BRA.b label_C11E5E

label_C11E58:
	INC
	LDX.b $22
	STA.w $0000,X
label_C11E5E:
	JSL.l label_C3E4CA
	LDA.b $26
	JSL.l $EF0115
	JSL.l label_C12DD5
	JSR.w label_C1163C
	JSL.l label_C3E4D4
	JMP.w label_C11A3F

label_C11E76:
	LDA.w $006D
	AND.w #$A000
	BEQ.b label_C11E92
	LDA.b $28
	CMP.w #$0001
	BNE.b label_C11E92
	LDA.w #$0002
	JSL.l label_C0ABE0
	LDA.w #$0000
	JMP.w label_C11F58

label_C11E92:
	INC.b $22
	LDA.w $88E4
	CMP.w $88E2
	BNE.b label_C11EB9
	LDA.b $22
	CMP.w #$003C
	BCC.b label_C11EB9
	BEQ.b label_C11EB9
	LDA.w $88F8
	CMP.w #$FFFF
	BNE.b label_C11EB0
	JSR.w $C1134B
label_C11EB0:
	LDA.w #$0000
	JSR.w label_C1007E
	JMP.w label_C11A3F

label_C11EB9:
	LDX.b $1E
	INX
	STX.b $1E
label_C11EBE:
	CPX.w #$000A
	BCS.b label_C11EC8
	BEQ.b label_C11EC8
	JMP.w label_C11BBB

label_C11EC8:
	JMP.w label_C11B2F

label_C11ECB:
	CMP.w #$FFFF
	BNE.b label_C11ED3
	JMP.w label_C11A3F

label_C11ED3:
	LDA.w #$0000
	STA.b $02
	LDY.w #$002B
	LDA.b ($24),Y
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	STA.b $22
	LDA.b $1C
	AND.w #$00FF
	TAX
	LDA.b $1C
	AND.w #$FF00
	XBA
	AND.w #$00FF
	STA.b $1C
	BRA.b label_C11F11

label_C11EFD:
	INC.b $02
	LDY.w #$0002
	LDA.b ($22),Y
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	STA.b $22
label_C11F11:
	LDY.w #$0008
	TXA
	CMP.b ($22),Y
	BNE.b label_C11EFD
	LDY.w #$000A
	LDA.b $1C
	CMP.b ($22),Y
	BNE.b label_C11EFD
	LDY.w #$0006
	LDA.b ($22),Y
	TAY
	STY.b $20
	TYA
	LDY.w #$0033
	CMP.b ($24),Y
	BEQ.b label_C11F36
	LDY.b $20
	BNE.b label_C11EFD
label_C11F36:
	LDX.b $04
	LDY.w $000A,X
	LDX.b $04
	LDA.w $0008,X
	TAX
	LDA.b $04
	JSL.l label_C43CD2
	LDA.w #$002F
	JSR.w label_C10D60
	LDA.b $02
	STA.b $20
	LDA.b $22
	STA.b $04
	JMP.w label_C11A3F

label_C11F58:
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to the file select screen.

label_C11F5A:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF2
	TCD
	LDA.b $1C
	STA.b $06
	LDA.b $1E
	STA.b $08
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8687
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to the file select screen.

label_C11F8A:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF2
	TCD
	LDA.w #$0000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8687
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	PLD
	RTS

;--------------------------------------------------------------------

org $C12DD5
label_C12DD5:
	REP.b #$31
	JSL.l label_C08E9A
	LDA.w $968C
	AND.w #$00FF
	BEQ.b label_C12DEA
	SEP.b #$20
	STZ.w $968C
	BRA.b label_C12E3F

label_C12DEA:
	LDA.w $9622
	AND.w #$00FF
	BNE.b label_C12E3F
	LDA.w $9623
	AND.w #$00FF
	BNE.b label_C12E0B
	LDA.w $88E0
	CMP.w #$FFFF
	BEQ.b label_C12E14
	LDA.w $88E2
	JSL.l EB_BufferTextBoxTilemap_Main
	BRA.b label_C12E14

label_C12E0B:
	JSL.l label_C2087C
	SEP.b #$20
	STZ.w $9623
label_C12E14:
	JSL.l label_C2109F
	SEP.b #$20
	LDA.b #$01
	STA.w $9624
	JSL.l label_C213AC
	LDA.w $B4B6
	BNE.b label_C12E34
	JSR.w label_C1FF2C
	CMP.w #$0000
	BEQ.b label_C12E34
	JSL.l label_C47F87
label_C12E34:
	STZ.w $9649
	JSL.l label_C2038B
	JSL.l label_C1004E
label_C12E3F:
	REP.b #$20
	RTL

;--------------------------------------------------------------------

label_C12E42:
	REP.b #$31
	JSL.l label_C2109F
	LDA.w $9649
	BEQ.b label_C12E5A
	JSR.w label_C1078D
	STZ.w $9649
	SEP.b #$20
	LDA.b #$01
	STA.w $9624
label_C12E5A:
	JSL.l label_C213AC
	JSL.l label_C1004E
	RTL

;--------------------------------------------------------------------

org $C13187
label_C13187:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w #$0000
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	LDA.w #$0001
	JSR.w label_C104EE
	JSL.l label_C04452
	LDA.w $5D62
	BNE.b label_C131AB
	JMP.w label_C13231

label_C131AB:
	LDA.w $5D62
	CMP.w #$FFFF
	BNE.b label_C131B6
	JMP.w label_C13231

label_C131B6:
	LDA.w $5D62
	CMP.w #$FFFE
	BNE.b label_C131CA
	LDA.w $5DDE
	STA.b $0A
	LDA.w $5DE0
	STA.b $0C
	BRA.b label_C13231

label_C131CA:
	LDA.w #$CF8985
	STA.b $06
	LDA.w #$CF8985>>16
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w $5D62
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	CMP.w #$0001
	BEQ.b label_C13202
	CMP.w #$0002
	BEQ.b label_C13231
	CMP.w #$0003
	BEQ.b label_C13231
	BRA.b label_C13231

label_C13202:
	LDA.w $5D64
	JSL.l $C042C2
	LDA.w $5D62
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	CLC
	ADC.w #$0009
	LDX.b $0E
	STX.b $06
	LDX.b $10
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $0A
	STY.b $0C
label_C13231:
	LDA.b $0A
	STA.b $18
	LDA.b $0C
	STA.b $1A
	PLD
	RTL

;--------------------------------------------------------------------

label_C1323B:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE8
	TCD
	LDA.w #$0000
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	LDA.w #$0001
	JSR.w label_C104EE
	JSL.l label_C04279
	LDA.w $5D62
	BNE.b label_C1325F
	JMP.w label_C13394

label_C1325F:
	LDA.w $5D62
	CMP.w #$FFFF
	BNE.b label_C1326A
	JMP.w label_C13394

label_C1326A:
	LDA.w $5D62
	CMP.w #$FFFE
	BNE.b label_C1327F
	LDA.w $5DDE
	STA.b $0A
	LDA.w $5DE0
	STA.b $0C
	JMP.w label_C13394

label_C1327F:
	LDA.w #$CF8985
	STA.b $06
	LDA.w #$CF8985
	STA.b $08
	LDA.b $06
	STA.b $14
	LDA.b $08
	STA.b $16
	LDA.w $5D62
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	STA.b $12
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	CMP.w #$0001
	BNE.b label_C132B0
	JMP.w label_C13394

label_C132B0:
	CMP.w #$0002
	BEQ.b label_C132C0
	CMP.w #$0003
	BNE.b label_C132BD
	JMP.w label_C13375

label_C132BD:
	JMP.w label_C13394

label_C132C0:
	LDA.b $12
	CLC
	ADC.w #$000D
	LDX.b $14
	STX.b $06
	LDX.b $16
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	CMP.w #$0100
	BCS.b label_C132EB
	STA.b $06
	STZ.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1045D
	BRA.b label_C1332F

label_C132EB:
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1045D
	LDA.w $5D62
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	CLC
	ADC.w #$000D
	LDX.b $14
	STX.b $06
	LDX.b $16
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	SEC
	SBC.w #$0100
	STA.b $06
	STZ.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C10489
label_C1332F:
	LDA.w #$CF8985
	STA.b $06
	LDA.w #$CF8985>>16
	STA.b $08
	LDA.w $5D62
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	STA.b $12
	CLC
	ADC.w #$0006
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	STA.w $9C88
	LDA.b $12
	CLC
	ADC.w #$0009
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $0A
	STY.b $0C
	BRA.b label_C13394

label_C13375:
	LDA.b $12
	CLC
	ADC.w #$0009
	LDX.b $14
	STX.b $06
	LDX.b $16
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $0A
	STY.b $0C
label_C13394:
	LDA.b $0A
	STA.b $1E
	LDA.b $0C
	STA.b $20
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Routine that runs when the player pressed L.

org $C13C32
EB_HandlePlayerCheckingObject_Main:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	JSL.l label_C0943C
	LDA.w #$0001
	JSL.l label_C0ABE0
	JSL.l label_C13187
	LDA.w #$0000
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	LDA.b $08
	CMP.b $0C
	BNE.b label_C13C5D
	LDA.b $06
	CMP.b $0A
label_C13C5D:
	BNE.b label_C13C79
	JSL.l label_C1323B
	LDA.b $08
	CMP.b $0C
	BNE.b label_C13C6D
	LDA.b $06
	CMP.b $0A
label_C13C6D:
	BNE.b label_C13C79
	LDA.w #DATA_C7C59E
	STA.b $06
	LDA.w #DATA_C7C59E>>16
	STA.b $08
label_C13C79:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
	JSL.l label_C3E4CA
	JSR.w label_C10A1D
	JSR.w label_C1008E
label_C13C8F:
	JSL.l label_C12DD5
	LDA.w $B4A8
	CMP.w #$FFFF
	BNE.b label_C13C8F
	JSL.l label_C09451
	PLD
	RTL

;--------------------------------------------------------------------

org $C14012
label_C14012:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF2
	TCD
	LDX.w $97B8
	INX
	STX.w $97B8
	STX.b $02
	LDA.w #$000A
	CLC
	SBC.b $02
	BVS.b label_C1402F
	BPL.b label_C14034
	BRA.b label_C14031

label_C1402F:
	BMI.b label_C14034
label_C14031:
	STZ.w $97B8
label_C14034:
	LDA.w $97B8
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	CLC
	ADC.w #$96AA
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to the name entry screen letter textbox

label_C14049:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF2
	TCD
	LDX.w $97B8
	DEX
	STX.w $97B8
	STX.b $02
	LDA.w #$000A
	CLC
	SBC.b $02
	BVS.b label_C14066
	BPL.b label_C1406E
	BRA.b label_C14068

label_C14066:
	BMI.b label_C1406E
label_C14068:
	LDA.w #$0009
	STA.w $97B8
label_C1406E:
	PLD
	RTS

;--------------------------------------------------------------------

org $C14103
label_C14103:

;--------------------------------------------------------------------

org $C141D0
label_C141D0:

;--------------------------------------------------------------------

org $C14265
EB_TextboxCommand04:
.Main:
;$C14265
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TXA
	STA.b $0E
	LDA.w $97CA
	BNE.b label_C1428B
	LDA.b $0E
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #EB_TextboxCommand04_Main
	BRA.b label_C142AB

label_C1428B:
	SEP.b #$10
	LDY.b #$08
	LDA.b $0E
	JSL.l label_C0923E
	STA.b $02
	LDA.w $97BA
	AND.w #$00FF
	ORA.b $02
	REP.b #$10
	LDX.w #$0001
	JSL.l label_C2165E
	LDA.w #$0000
label_C142AB:
	PLD
	RTS

;--------------------------------------------------------------------

EB_TextboxCommand05_TurnOffEventFlag:
.Main:
;$C142AD
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TXA
	STA.b $0E
	LDA.w $97CA
	BNE.b label_C142D3
	LDA.b $0E
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #EB_TextboxCommand05_TurnOffEventFlag_Main
	BRA.b label_C142F3

label_C142D3:
	SEP.b #$10
	LDY.b #$08
	LDA.b $0E
	JSL.l label_C0923E
	STA.b $02
	LDA.w $97BA
	AND.w #$00FF
	ORA.b $02
	REP.b #$10
	LDX.w #$0000
	JSL.l label_C2165E
	LDA.w #$0000
label_C142F3:
	PLD
	RTS

;--------------------------------------------------------------------

org $C142F5
EB_TextboxCommand06_BranchIfXIsTrue:
.Main:
;$C142F5
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TAY
	STY.b $0E
	LDA.w $97CA
	BNE.b label_C1431A
	TXA
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #EB_TextboxCommand06_BranchIfXIsTrue_Main
	BRA.b label_C1435D

label_C1431A:
	TXA
	SEP.b #$10
	LDY.b #$08
	JSL.l label_C0923E
	STA.b $02
	LDA.w $97BA
	AND.w #$00FF
	ORA.b $02
	JSL.l label_C21628
	CMP.w #$0000
	BEQ.b label_C1433E
	STZ.w $97CA
	LDA.w #label_C14103
	BRA.b label_C1435D

label_C1433E:
	LDY.b $0E
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.w #$0004
	CLC
	ADC.b $06
	STA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.w #$0000
label_C1435D:
	PLD
	RTS

;--------------------------------------------------------------------

org $C1435F
label_C1435F:

;--------------------------------------------------------------------

org $C143C2
label_C143C2:

;--------------------------------------------------------------------

org $C143CC
label_C143CC:

;--------------------------------------------------------------------

; Note: Something related to the intro cutscene

org $C143D6
EB_TextboxCommand08_TextPointerJSL:
.Main:
;$C143D6
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	TXA
	STA.b $12
	LDA.w #$0003
	CLC
	SBC.w $97CA
	BVC.b label_C143F0
	BPL.b label_C14407
	BRA.b label_C143F2

label_C143F0:
	BMI.b label_C14407
label_C143F2:
	LDA.b $12
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #EB_TextboxCommand08_TextPointerJSL_Main
	JMP.w label_C144A1

label_C14407:
	SEP.b #$10
	LDY.b #$18
	LDA.b $12
	STA.b $06
	STZ.b $08
	JSL.l label_C09246
	LDA.b $08
	PHA
	LDA.b $06
	PHA
	LDY.b #$10
	SEP.b #$20
	LDA.w $97BC
	STA.b $06
	STZ.b $07
	STZ.b $08
	STZ.b $09
	REP.b #$20
	JSL.l label_C09246
	LDA.b $08
	PHA
	LDA.b $06
	PHA
	LDY.b #$08
	SEP.b #$20
	LDA.w $97BB
	STA.b $06
	STZ.b $07
	STZ.b $08
	STZ.b $09
	REP.b #$20
	JSL.l label_C09246
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	SEP.b #$20
	LDA.w $97BA
	STA.b $06
	STZ.b $07
	STZ.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	ORA.b $0A
	STA.b $06
	LDA.b $08
	ORA.b $0C
	STA.b $08
	PLA
	STA.b $0A
	PLA
	STA.b $0C
	LDA.b $06
	ORA.b $0A
	STA.b $06
	LDA.b $08
	ORA.b $0C
	STA.b $08
	PLA
	STA.b $0A
	PLA
	STA.b $0C
	LDA.b $06
	ORA.b $0A
	STA.b $06
	LDA.b $08
	ORA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
	LDA.w #$0000
label_C144A1:
	PLD
	RTS

;--------------------------------------------------------------------

label_C144A3:

;--------------------------------------------------------------------

; Note: Something related to the name entry screen letter textbox.

org $C14509
label_C14509:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	LDA.w #$0001
	CLC
	SBC.w $97CA
	BVC.b label_C14520
	BPL.b label_C14535
	BRA.b label_C14522

label_C14520:
	BMI.b label_C14535
label_C14522:
	TXA
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #label_C14509
	BRA.b label_C14556

label_C14535:
	LDA.w $97BA
	AND.w #$00FF
	STA.b $0E
	LDA.w $5E71
	AND.w #$00FF
	BEQ.b label_C1454D
	LDA.b $0E
	JSL.l label_C43D75
	BRA.b label_C14553

label_C1454D:
	LDA.b $0E
	JSL.l label_C438A5
label_C14553:
	LDA.w #$0000
label_C14556:
	PLD
	RTS

;--------------------------------------------------------------------

org $C14558
label_C14558:

;--------------------------------------------------------------------

org $C14591
label_C14591:

;--------------------------------------------------------------------

org $C145EF
label_C145EF:

;--------------------------------------------------------------------

org $C1461A
label_C1461A:

;--------------------------------------------------------------------

org $C14751
label_C14751:

;--------------------------------------------------------------------

org $C147A0
label_C147A0:

;--------------------------------------------------------------------

org $C147AB
label_C147AB:

;--------------------------------------------------------------------

org $C14DFB
label_C14DFB:

;--------------------------------------------------------------------

org $C14E8C
EB_TextBoxCommand1F_Arg21_TeleportToPresetLocations:
.Main:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF2
	TCD
	PLA
	CPX.w #$0000
	BEQ.b label_C14E9E
	TXA
	BRA.b label_C14EA3

label_C14E9E:
	JSR.w label_C103DC
	LDA.b $06
label_C14EA3:
	JSR.w label_C1BCAB
	LDA.w #$0000
	PLD
	RTS

;--------------------------------------------------------------------

org $C14EAB
EB_TextboxCommand10_DelayParsing:
.Main:
;$C14EAB
	REP.b #$31
	TXA
	JSR.w label_C100D6
	LDA.w #$0000
	RTS

;--------------------------------------------------------------------

org $C14F6F
label_C14F6F:

;--------------------------------------------------------------------

org $C1528D
label_C1528D:

;--------------------------------------------------------------------

org $C15494
label_C15494:

;--------------------------------------------------------------------

org $C15529
label_C15529:

;--------------------------------------------------------------------

org $C1554E
label_C1554E:

;--------------------------------------------------------------------

org $C1583D
label_C1583D:

;--------------------------------------------------------------------

org $C15B46
label_C15B46:

;--------------------------------------------------------------------

org $C15C58
label_C15C58:

;--------------------------------------------------------------------

org $C15F71
label_C15F71:

;--------------------------------------------------------------------

org $C15F91
label_C15F91:

;--------------------------------------------------------------------

org $C16308
label_C16308:

;--------------------------------------------------------------------

org $C163A7
label_C163A7:

;--------------------------------------------------------------------

org $C163FD
label_C163FD:

;--------------------------------------------------------------------

org $C1646E
label_C1646E:

;--------------------------------------------------------------------

org $C16490
label_C16490:

;--------------------------------------------------------------------

org $C16509
label_C16509:

;--------------------------------------------------------------------

org $C16582
label_C16582:

;--------------------------------------------------------------------

org $C165AA
label_C165AA:

;--------------------------------------------------------------------

org $C165D2
label_C165D2:

;--------------------------------------------------------------------

org $C1662A
label_C1662A:

;--------------------------------------------------------------------

org $C1666D
label_C1666D:

;--------------------------------------------------------------------

org $C166DD
label_C166DD:

;--------------------------------------------------------------------

org $C166FE
label_C166FE:

;--------------------------------------------------------------------

org $C16744
EB_TextBoxCommand1F_Arg15_SpawnActiveSprite:
.Main:
;$C16744
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STX.b $02
	LDA.w #$0004
	CLC
	SBC.w $97CA
	BVC.b label_C1675D
	BPL.b label_C16773
	BRA.b label_C1675F

label_C1675D:
	BMI.b label_C16773
label_C1675F:
	LDA.b $02
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #EB_TextBoxCommand1F_Arg15_SpawnActiveSprite_Main
	BRA.b label_C167D4

label_C16773:
	SEP.b #$10
	LDY.b #$08
	LDA.w $97BB
	AND.w #$00FF
	JSL.l label_C0923E
	STA.b $04
	LDA.w $97BA
	AND.w #$00FF
	ORA.b $04
	REP.b #$10
	TAY
	STY.b $10
	SEP.b #$10
	LDY.b #$08
	LDA.w $97BD
	AND.w #$00FF
	JSL.l label_C0923E
	STA.b $04
	LDA.w $97BC
	AND.w #$00FF
	ORA.b $04
	STA.b $0E
	LDA.b $02
	CMP.w #$00FF
	BNE.b label_C167BF
	LDA.b $0E
	REP.b #$10
	TAX
	LDY.b $10
	TYA
	JSL.l label_C06578
	BRA.b label_C167D1

label_C167BF:
	LDA.b $0E
	REP.b #$10
	TAX
	LDY.b $10
	TYA
	JSL.l label_C46507
	LDX.b $02
	JSL.l label_C4C91A
label_C167D1:
	LDA.w #$0000
label_C167D4:
	PLD
	RTS

;--------------------------------------------------------------------

org $C167D6
EB_TextBoxCommand1F_Arg1E_Unknown:
.Main:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STX.b $02
	LDA.w #$0002
	CLC
	SBC.w $97CA
	BVC.b label_C167EF
	BPL.b label_C16805
	BRA.b label_C167F1

label_C167EF:
	BMI.b label_C16805
label_C167F1:
	LDA.b $02
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #EB_TextBoxCommand1F_Arg1E_Unknown_Main
	BRA.b label_C16839

label_C16805:
	SEP.b #$10
	LDY.b #$08
	LDA.w $97BB
	AND.w #$00FF
	JSL.l label_C0923E
	STA.b $04
	LDA.w $97BA
	AND.w #$00FF
	ORA.b $04
	REP.b #$10
	TAY
	STY.b $0E
	TYA
	JSL.l label_C4605A
	LDX.b $02
	JSL.l label_C4C91A
	LDX.b $02
	LDY.b $0E
	TYA
	JSL.l label_C460CE
	LDA.w #$0000
label_C16839:
	PLD
	RTS

;--------------------------------------------------------------------

org $C1683B
label_C1683B:

;--------------------------------------------------------------------

org $C169F7
label_C169F7:

;--------------------------------------------------------------------

org $C16B2B
label_C16B2B:

;--------------------------------------------------------------------

org $C16BA4
EB_TextBoxCommand1F_ArgE5_LockPlayerMovement:
.Main:
	REP.b #$31
	TXA
	JSL.l label_C46594
	LDA.w #$0000
	RTS

;--------------------------------------------------------------------

org $C16BAF
EB_TextBoxCommand1F_ArgE6_Unknown:
.Main:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TXA
	STA.b $0E
	LDA.w $97CA
	BNE.b label_C16BD5
	LDA.b $0E
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #EB_TextBoxCommand1F_ArgE6_Unknown_Main
	BRA.b label_C16BF0

label_C16BD5:
	SEP.b #$10
	LDY.b #$08
	LDA.b $0E
	JSL.l label_C0923E
	STA.b $02
	LDA.w $97BA
	AND.w #$00FF
	ORA.b $02
	JSL.l label_C4655E
	LDA.w #$0000
label_C16BF0:
	PLD
	RTS


;--------------------------------------------------------------------

org $C16BF2
label_C16BF2:

;--------------------------------------------------------------------

org $C16C35
EB_TextBoxCommand1F_ArgE8_RestrictPlayerMovement:
.Main:
;$C16C35
	REP.b #$31
	TXA
	JSL.l label_C46631
	LDA.w #$0000
	RTS

;--------------------------------------------------------------------

org $C16C40
EB_TextBoxCommand1F_ArgE9_Unknown:
.Main:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TXA
	STA.b $0E
	LDA.w $97CA
	BNE.b label_C16C66
	LDA.b $0E
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #EB_TextBoxCommand1F_ArgE9_Unknown_Main
	BRA.b label_C16C81

label_C16C66:
	SEP.b #$10
	LDY.b #$08
	LDA.b $0E
	JSL.l label_C0923E
	STA.b $02
	LDA.w $97BA
	AND.w #$00FF
	ORA.b $02
	JSL.l label_C465FB
	LDA.w #$0000
label_C16C81:
	PLD
	RTS

;--------------------------------------------------------------------

label_C16C83:

;--------------------------------------------------------------------

org $C16CC6
EB_TextBoxCommand1F_ArgEB_MakeCharacterInvisible:
.Main:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STX.b $10
	LDA.w #$0001
	CLC
	SBC.w $97CA
	BVC.b label_C16CDF
	BPL.b label_C16CF4
	BRA.b label_C16CE1

label_C16CDF:
	BMI.b label_C16CF4
label_C16CE1:
	TXA
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #EB_TextBoxCommand1F_ArgEB_MakeCharacterInvisible_Main
	BRA.b label_C16D12

label_C16CF4:
	LDA.w $97BA
	AND.w #$00FF
	TAY
	STY.b $0E
	TYA
	JSL.l label_C4608C
	LDX.b $10
	JSL.l label_C4C91A
	LDY.b $0E
	TYA
	JSL.l label_C463F4
	LDA.w #$0000
label_C16D12:
	PLD
	RTS

;--------------------------------------------------------------------

EB_TextBoxCommand1F_ArgEC_MakeCharacterVisible:
.Main:
;$C16D14
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STX.b $10
	LDA.w #$0001
	CLC
	SBC.w $97CA
	BVC.b label_C16D2D
	BPL.b label_C16D42
	BRA.b label_C16D2F

label_C16D2D:
	BMI.b label_C16D42
label_C16D2F:
	TXA
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #EB_TextBoxCommand1F_ArgEC_MakeCharacterVisible_Main
	BRA.b label_C16D60

label_C16D42:
	LDA.w $97BA
	AND.w #$00FF
	TAY
	STY.b $0E
	TYA
	JSL.l label_C4608C
	LDX.b $10
	JSL.l label_C4C91A
	LDY.b $0E
	TYA
	JSL.l label_C4645A
	LDA.w #$0000
label_C16D60:
	PLD
	RTS

;--------------------------------------------------------------------

label_C16D62:

;--------------------------------------------------------------------

org $C16DA5
EB_TextBoxCommand1F_ArgEF_UnknownArgument:
.Main:
;$C16DA5
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TXA
	STA.b $0E
	LDA.w $97CA
	BNE.b label_C16DCB
	LDA.b $0E
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #EB_TextBoxCommand1F_ArgEF_UnknownArgument_Main
	BRA.b label_C16DE6

label_C16DCB:
	SEP.b #$10
	LDY.b #$08
	LDA.b $0E
	JSL.l label_C0923E
	STA.b $02
	LDA.w $97BA
	AND.w #$00FF
	ORA.b $02
	JSL.l label_C466A8
	LDA.w #$0000
label_C16DE6:
	PLD
	RTS

;--------------------------------------------------------------------

org $C16DE8
label_C16DE8:

;--------------------------------------------------------------------

org $C16EBF
label_C16EBF:

;--------------------------------------------------------------------

org $C16F2F
EB_TextBoxCommand1F_ArgF2_ChangeMovementOfSprite:
.Main:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TXA
	STA.b $10
	LDA.w #$0003
	CLC
	SBC.w $97CA
	BVC.b label_C16F49
	BPL.b label_C16F5F
	BRA.b label_C16F4B

label_C16F49:
	BMI.b label_C16F5F
label_C16F4B:
	LDA.b $10
	SEP.b #$20
	LDX.w $97CA
	STA.w $97BA,X
	REP.b #$20
	INC.w $97CA
	LDA.w #EB_TextBoxCommand1F_ArgF2_ChangeMovementOfSprite_Main
	BRA.b label_C16F9D

label_C16F5F:
	SEP.b #$10
	LDY.b #$08
	LDA.w $97BB
	AND.w #$00FF
	JSL.l label_C0923E
	STA.b $02
	LDA.w $97BA
	AND.w #$00FF
	ORA.b $02
	REP.b #$10
	TAY
	STY.b $0E
	SEP.b #$10
	LDY.b #$08
	LDA.b $10
	JSL.l label_C0923E
	STA.b $02
	LDA.w $97BC
	AND.w #$00FF
	ORA.b $02
	REP.b #$10
	TAX
	LDY.b $0E
	TYA
	JSL.l label_C461CC
	LDA.w #$0000
label_C16F9D:
	PLD
	RTS

;--------------------------------------------------------------------

org $C16FD1
label_C16FD1:

;--------------------------------------------------------------------

org $C1711C
label_C1711C:

;--------------------------------------------------------------------

org $C17233
label_C17233:

;--------------------------------------------------------------------

org $C17254
label_C17254:

;--------------------------------------------------------------------

org $C172BC
label_C172BC:

;--------------------------------------------------------------------

org $C172DA
label_C172DA:

;--------------------------------------------------------------------

org $C17304
label_C17304:

;--------------------------------------------------------------------

org $C17325
label_C17325:

;--------------------------------------------------------------------

org $C1737D
label_C1737D:

;--------------------------------------------------------------------

org $C1741F
label_C1741F:

;--------------------------------------------------------------------

org $C17440
label_C17440:

;--------------------------------------------------------------------

org $C1790B
label_C1790B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TAY
	STY.b $0E
	TXA
	BEQ.b label_C17954
	CMP.w #$0001
	BEQ.b label_C17959
	CMP.w #$0002
	BEQ.b label_C1795E
	CMP.w #$0003
	BEQ.b label_C17971
	CMP.w #$0004
	BEQ.b label_C17976
	CMP.w #$0005
	BEQ.b label_C17982
	CMP.w #$0006
	BEQ.b label_C17987
	CMP.w #$0007
	BEQ.b label_C1798C
	CMP.w #$0008
	BEQ.b label_C17991
	CMP.w #$0009
	BEQ.b label_C17996
	CMP.w #$000A
	BEQ.b label_C1799B
	CMP.w #$000D
	BEQ.b label_C179A0
	BRA.b label_C179A5

label_C17954:
	JSR.w label_C10084
	BRA.b label_C179A5

label_C17959:
	LDA.w #label_C143C2
	BRA.b label_C179A8

label_C1795E:
	TYA
	CLC
	ADC.w #$0006
	JSL.l label_C20A20
	LDA.w #$0001
	LDY.b $0E
	STA.w $0004,Y
	BRA.b label_C179A5

label_C17971:
	LDA.w #label_C143CC
	BRA.b label_C179A8

label_C17976:
	JSR.w label_C1008E
	JSR.w label_C10A1D
	JSL.l label_C12DD5
	BRA.b label_C179A5

label_C17982:
	LDA.w #label_C14509
	BRA.b label_C179A8

label_C17987:
	JSR.w $C10FA3
	BRA.b label_C179A5

label_C1798C:
	LDA.w #label_C1528D
	BRA.b label_C179A8

label_C17991:
	LDA.w #label_C15529
	BRA.b label_C179A8

label_C17996:
	LDA.w #label_C1554E
	BRA.b label_C179A8

label_C1799B:
	JSR.w $C1AA18
	BRA.b label_C179A5

label_C179A0:
	LDA.w #label_C15B46
	BRA.b label_C179A8

label_C179A5:
	LDA.w #$0000
label_C179A8:
	PLD
	RTS

;--------------------------------------------------------------------

org $C179AA
label_C179AA:

;--------------------------------------------------------------------

org $C17B56
label_C17B56:

;--------------------------------------------------------------------

org $C17C36
label_C17C36:

;--------------------------------------------------------------------

org $C17D94
label_C17D94:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TXA
	BNE.b label_C17DA4
	JMP.w label_C17E47

label_C17DA4:
	CMP.w #$0001
	BNE.b label_C17DAC
	JMP.w label_C17E4D

label_C17DAC:
	CMP.w #$0002
	BNE.b label_C17DB4
	JMP.w label_C17E53

label_C17DB4:
	CMP.w #$0003
	BNE.b label_C17DBC
	JMP.w label_C17E59

label_C17DBC:
	CMP.w #$0004
	BNE.b label_C17DC4
	JMP.w label_C17E5F

label_C17DC4:
	CMP.w #$0005
	BNE.b label_C17DCC
	JMP.w label_C17E65

label_C17DCC:
	CMP.w #$0006
	BNE.b label_C17DD4
	JMP.w label_C17E6B

label_C17DD4:
	CMP.w #$0007
	BNE.b label_C17DDC
	JMP.w label_C17E71

label_C17DDC:
	CMP.w #$0008
	BNE.b label_C17DE4
	JMP.w label_C17E77

label_C17DE4:
	CMP.w #$0009
	BNE.b label_C17DEC
	JMP.w label_C17E7D

label_C17DEC:
	CMP.w #$000A
	BNE.b label_C17DF4
	JMP.w label_C17E83

label_C17DF4:
	CMP.w #$000B
	BNE.b label_C17DFC
	JMP.w label_C17E89

label_C17DFC:
	CMP.w #$000C
	BNE.b label_C17E04
	JMP.w label_C17E8F

label_C17E04:
	CMP.w #$0014
	BNE.b label_C17E0C
	JMP.w label_C17E95

label_C17E0C:
	CMP.w #$0015
	BNE.b label_C17E14
	JMP.w label_C17E9A

label_C17E14:
	CMP.w #$000D
	BNE.b label_C17E1C
	JMP.w label_C17E9F

label_C17E1C:
	CMP.w #$000E
	BNE.b label_C17E24
	JMP.w label_C17EC6

label_C17E24:
	CMP.w #$000F
	BNE.b label_C17E2C
	JMP.w label_C17EED

label_C17E2C:
	CMP.w #$0011
	BNE.b label_C17E34
	JMP.w label_C17EFD

label_C17E34:
	CMP.w #$0012
	BNE.b label_C17E3C
	JMP.w label_C17F02

label_C17E3C:
	CMP.w #$0013
	BNE.b label_C17E44
	JMP.w label_C17F07

label_C17E44:
	JMP.w label_C17F0C

label_C17E47:
	LDA.w #$40F9
	JMP.w label_C17F0F

label_C17E4D:
	LDA.w #$40B0
	JMP.w label_C17F0F

label_C17E53:
	LDA.w #$4FD7
	JMP.w label_C17F0F

label_C17E59:
	LDA.w #$488D
	JMP.w label_C17F0F

label_C17E5F:
	JSR.w label_C10A04
	JMP.w label_C17F0C

label_C17E65:
	LDA.w #$46BF
	JMP.w label_C17F0F

label_C17E6B:
	LDA.w #$46DE
	JMP.w label_C17F0F

label_C17E71:
	LDA.w #$45CA
	JMP.w label_C17F0F

label_C17E77:
	LDA.w #$43B8
	JMP.w label_C17F0F

label_C17E7D:
	LDA.w #$40EF
	JMP.w label_C17F0F

label_C17E83:
	LDA.w #$53AF
	JMP.w label_C17F0F

label_C17E89:
	LDA.w #$5573
	JMP.w label_C17F0F

label_C17E8F:
	LDA.w #$5BA7
	JMP.w label_C17F0F

label_C17E95:
	LDA.w #$516B
	BRA.b label_C17F0F

label_C17E9A:
	LDA.w #$51FC
	BRA.b label_C17F0F

label_C17E9F:
	LDA.w #$0000
	JSL.l $C3E75D
	JSR.w $C1AC9B
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0050
	JSL.l $C447FB
	BRA.b label_C17F0C

label_C17EC6:
	LDA.w #$0001
	JSL.l $C3E75D
	JSR.w $C1ACF2
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0050
	JSL.l $C447FB
	BRA.b label_C17F0C

label_C17EED:
	JSR.w $C1AD26
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w $C10DF6
	BRA.b label_C17F0C

label_C17EFD:
	LDA.w #$40CF
	BRA.b label_C17F0F

label_C17F02:
	LDA.w #$61D1
	BRA.b label_C17F0F

label_C17F07:
	LDA.w #$73C0
	BRA.b label_C17F0F

label_C17F0C:
	LDA.w #$0000
label_C17F0F:
	PLD
	RTS

;--------------------------------------------------------------------

org $C17F11
label_C17F11:

;--------------------------------------------------------------------

org $C1811F
label_C1811F:

;--------------------------------------------------------------------

org $C181BB
EB_TextBoxCommand1F:
.Main:
;$C181BB
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	TXA
	BNE.b label_C181CB
	JMP.w label_C18416

label_C181CB:
	CMP.w #$0001
	BNE.b label_C181D3
	JMP.w label_C1841C

label_C181D3:
	CMP.w #$0002
	BNE.b label_C181DB
	JMP.w label_C18422

label_C181DB:
	CMP.w #$0003
	BNE.b label_C181E3
	JMP.w label_C18428

label_C181E3:
	CMP.w #$0004
	BNE.b label_C181EB
	JMP.w label_C18436

label_C181EB:
	CMP.w #$0005
	BNE.b label_C181F3
	JMP.w label_C1843C

label_C181F3:
	CMP.w #$0006
	BNE.b label_C181FB
	JMP.w label_C18446

label_C181FB:
	CMP.w #$0007
	BNE.b label_C18203
	JMP.w label_C18450

label_C18203:
	CMP.w #$0011
	BNE.b label_C1820B
	JMP.w label_C18456

label_C1820B:
	CMP.w #$0012
	BNE.b label_C18213
	JMP.w label_C1845C

label_C18213:
	CMP.w #$0013
	BNE.b label_C1821B
	JMP.w label_C18462

label_C1821B:
	CMP.w #$0014
	BNE.b label_C18223
	JMP.w label_C18468

label_C18223:
	CMP.w #$0015
	BNE.b label_C1822B
	JMP.w label_C1846E

label_C1822B:
	CMP.w #$0016
	BNE.b label_C18233
	JMP.w label_C18474

label_C18233:
	CMP.w #$0017
	BNE.b label_C1823B
	JMP.w label_C1847A

label_C1823B:
	CMP.w #$0018
	BNE.b label_C18243
	JMP.w label_C18480

label_C18243:
	CMP.w #$0019
	BNE.b label_C1824B
	JMP.w label_C18486

label_C1824B:
	CMP.w #$001A
	BNE.b label_C18253
	JMP.w label_C1848C

label_C18253:
	CMP.w #$001B
	BNE.b label_C1825B
	JMP.w label_C18492

label_C1825B:
	CMP.w #$001C
	BNE.b label_C18263
	JMP.w label_C18498

label_C18263:
	CMP.w #$001D
	BNE.b label_C1826B
	JMP.w label_C1849E

label_C1826B:
	CMP.w #$001E
	BNE.b label_C18273
	JMP.w label_C184A4

label_C18273:
	CMP.w #$001F
	BNE.b label_C1827B
	JMP.w label_C184AA

label_C1827B:
	CMP.w #$0020
	BNE.b label_C18283
	JMP.w label_C184B0

label_C18283:
	CMP.w #$0021
	BNE.b label_C1828B
	JMP.w label_C184B6

label_C1828B:
	CMP.w #$0023
	BNE.b label_C18293
	JMP.w label_C184BC

label_C18293:
	CMP.w #$0030
	BNE.b label_C1829B
	JMP.w label_C184C2

label_C1829B:
	CMP.w #$0031
	BNE.b label_C182A3
	JMP.w label_C184C2

label_C182A3:
	CMP.w #$0040
	BNE.b label_C182AB
	JMP.w label_C184C8

label_C182AB:
	CMP.w #$0041
	BNE.b label_C182B3
	JMP.w label_C184CE

label_C182B3:
	CMP.w #$0050
	BNE.b label_C182BB
	JMP.w label_C184D4

label_C182BB:
	CMP.w #$0051
	BNE.b label_C182C3
	JMP.w label_C184DA

label_C182C3:
	CMP.w #$0052
	BNE.b label_C182CB
	JMP.w label_C184E0

label_C182CB:
	CMP.w #$0060
	BNE.b label_C182D3
	JMP.w label_C184E6

label_C182D3:
	CMP.w #$0061
	BNE.b label_C182DB
	JMP.w label_C184EC

label_C182DB:
	CMP.w #$0062
	BNE.b label_C182E3
	JMP.w label_C184F2

label_C182E3:
	CMP.w #$0063
	BNE.b label_C182EB
	JMP.w label_C184F8

label_C182EB:
	CMP.w #$0064
	BNE.b label_C182F3
	JMP.w label_C184FE

label_C182F3:
	CMP.w #$0065
	BNE.b label_C182FB
	JMP.w label_C18505

label_C182FB:
	CMP.w #$0066
	BNE.b label_C18303
	JMP.w label_C1850C

label_C18303:
	CMP.w #$0067
	BNE.b label_C1830B
	JMP.w label_C18512

label_C1830B:
	CMP.w #$0068
	BNE.b label_C18313
	JMP.w label_C18518

label_C18313:
	CMP.w #$0069
	BNE.b label_C1831B
	JMP.w label_C18527

label_C1831B:
	CMP.w #$0071
	BNE.b label_C18323
	JMP.w label_C18582

label_C18323:
	CMP.w #$0081
	BNE.b label_C1832B
	JMP.w label_C18588

label_C1832B:
	CMP.w #$0083
	BNE.b label_C18333
	JMP.w label_C1858E

label_C18333:
	CMP.w #$0090
	BNE.b label_C1833B
	JMP.w label_C18594

label_C1833B:
	CMP.w #$00A0
	BNE.b label_C18343
	JMP.w label_C185A9

label_C18343:
	CMP.w #$00A1
	BNE.b label_C1834B
	JMP.w label_C185B3

label_C1834B:
	CMP.w #$00A2
	BNE.b label_C18353
	JMP.w label_C185BD

label_C18353:
	CMP.w #$00B0
	BNE.b label_C1835B
	JMP.w EB_TextBoxCommand1F_ArgB0_SaveGame

label_C1835B:
	CMP.w #$00C0
	BNE.b label_C18363
	JMP.w label_C185E1

label_C18363:
	CMP.w #$00D0
	BNE.b label_C1836B
	JMP.w label_C185E7

label_C1836B:
	CMP.w #$00D1
	BNE.b label_C18373
	JMP.w label_C185ED

label_C18373:
	CMP.w #$00D2
	BNE.b label_C1837B
	JMP.w label_C18602

label_C1837B:
	CMP.w #$00D3
	BNE.b label_C18383
	JMP.w label_C18607

label_C18383:
	CMP.w #$00E1
	BNE.b label_C1838B
	JMP.w label_C1860C

label_C1838B:
	CMP.w #$00E4
	BNE.b label_C18393
	JMP.w label_C18611

label_C18393:
	CMP.w #$00E5
	BNE.b label_C1839B
	JMP.w label_C18616

label_C1839B:
	CMP.w #$00E6
	BNE.b label_C183A3
	JMP.w label_C1861B

label_C183A3:
	CMP.w #$00E7
	BNE.b label_C183AB
	JMP.w label_C18620

label_C183AB:
	CMP.w #$00E8
	BNE.b label_C183B3
	JMP.w label_C18625

label_C183B3:
	CMP.w #$00E9
	BNE.b label_C183BB
	JMP.w label_C1862A

label_C183BB:
	CMP.w #$00EA
	BNE.b label_C183C3
	JMP.w label_C1862F

label_C183C3:
	CMP.w #$00EB
	BNE.b label_C183CB
	JMP.w label_C18634

label_C183CB:
	CMP.w #$00EC
	BNE.b label_C183D3
	JMP.w label_C18639

label_C183D3:
	CMP.w #$00ED
	BNE.b label_C183DB
	JMP.w label_C1863E

label_C183DB:
	CMP.w #$00EE
	BNE.b label_C183E3
	JMP.w label_C18644

label_C183E3:
	CMP.w #$00EF
	BNE.b label_C183EB
	JMP.w label_C18649

label_C183EB:
	CMP.w #$00F0
	BNE.b label_C183F3
	JMP.w label_C1864E

label_C183F3:
	CMP.w #$00F1
	BNE.b label_C183FB
	JMP.w label_C18654

label_C183FB:
	CMP.w #$00F2
	BNE.b label_C18403
	JMP.w label_C18659

label_C18403:
	CMP.w #$00F3
	BNE.b label_C1840B
	JMP.w label_C1865E

label_C1840B:
	CMP.w #$00F4
	BNE.b label_C18413
	JMP.w label_C18663

label_C18413:
	JMP.w label_C18668

label_C18416:
	LDA.w #label_C14751
	JMP.w label_C1866B

label_C1841C:
	LDA.w #label_C147A0
	JMP.w label_C1866B

label_C18422:
	LDA.w #label_C147AB
	JMP.w label_C1866B

label_C18428:							; Note: EB_TextBoxCommand1F_Arg03_RestoreDefaultMusic_Main
	JSL.l label_C069F7
	LDX.w #$0000
	JSL.l label_C216AD
	JMP.w label_C18668

label_C18436:
	LDA.w #label_C17254
	JMP.w label_C1866B

label_C1843C:
	LDA.w #$0000
	JSL.l label_C4FD45
	JMP.w label_C18668

label_C18446:
	LDA.w #$0001
	JSL.l label_C4FD45
	JMP.w label_C18668

label_C18450:
	LDA.w #label_C1741F
	JMP.w label_C1866B

label_C18456:
	LDA.w #label_C15F71
	JMP.w label_C1866B

label_C1845C:
	LDA.w #label_C15F91
	JMP.w label_C1866B

label_C18462:
	LDA.w #label_C163FD
	JMP.w label_C1866B

label_C18468:
	LDA.w #label_C1646E
	JMP.w label_C1866B

label_C1846E:
	LDA.w #EB_TextBoxCommand1F_Arg15_SpawnActiveSprite_Main
	JMP.w label_C1866B

label_C18474:
	LDA.w #label_C16490
	JMP.w label_C1866B

label_C1847A:
	LDA.w #label_C16509
	JMP.w label_C1866B

label_C18480:
	LDA.w #label_C16582
	JMP.w label_C1866B

label_C18486:
	LDA.w #label_C165AA
	JMP.w label_C1866B

label_C1848C:
	LDA.w #label_C165D2
	JMP.w label_C1866B

label_C18492:
	LDA.w #label_C1662A
	JMP.w label_C1866B

label_C18498:
	LDA.w #label_C1666D
	JMP.w label_C1866B

label_C1849E:
	LDA.w #label_C166DD
	JMP.w label_C1866B

label_C184A4:
	LDA.w #EB_TextBoxCommand1F_Arg1E_Unknown_Main
	JMP.w label_C1866B

label_C184AA:
	LDA.w #label_C1683B
	JMP.w label_C1866B

label_C184B0:
	LDA.w #label_C14DFB
	JMP.w label_C1866B

label_C184B6:
	LDA.w #EB_TextBoxCommand1F_Arg21_TeleportToPresetLocations_Main
	JMP.w label_C1866B

label_C184BC:
	LDA.w #label_C16FD1
	JMP.w label_C1866B

label_C184C2:
	JSR.w label_C10FAC
	JMP.w label_C18668

label_C184C8:
	LDA.w #label_C172BC
	JMP.w label_C1866B

label_C184CE:
	LDA.w #label_C172DA
	JMP.w label_C1866B

label_C184D4:
	JSR.w label_C100C7
	JMP.w label_C18668

label_C184DA:
	JSR.w label_C100D0
	JMP.w label_C18668

label_C184E0:
	LDA.w #label_C144A3
	JMP.w label_C1866B

label_C184E6:
	LDA.w #label_C15494
	JMP.w label_C1866B

label_C184EC:
	JSR.w EB_TextBoxCommand1F_Arg61_MovementCodeTrigger_Main
	JMP.w label_C18668

label_C184F2:
	LDA.w #label_C169F7
	JMP.w label_C1866B

label_C184F8:
	LDA.w #label_C16DE8
	JMP.w label_C1866B

label_C184FE:
	JSL.l $C23008
	JMP.w label_C18668

label_C18505:
	JSL.l $C2307B
	JMP.w label_C18668

label_C1850C:
	LDA.w #label_C1711C
	JMP.w label_C1866B

label_C18512:
	LDA.w #label_C17233
	JMP.w label_C1866B

label_C18518:
	LDA.w $9877
	STA.w $98B2
	LDA.w $987B
	STA.w $98B4
	JMP.w label_C18668

label_C18527:
	LDY.w #$0001
	STY.b $12
	BRA.b label_C1853B

label_C1852E:
	LDX.w #$0000
	TYA
	JSL.l label_C2165E
	LDY.b $12
	INY
	STY.b $12
label_C1853B:
	CPY.w #$000A
	BCC.b label_C1852E
	BEQ.b label_C1852E
	LDX.w #$0001
	TXA
	JSL.l label_C0887A
	LDA.w #$0073
	JSL.l label_C0ABE0
	LDA.w $98B2
	STA.b $04
	LDA.w $98B4
	STA.b $02
	LDX.b $02
	LDA.b $04
	JSL.l label_C013F6
	STZ.w $2890
	LDY.w #$0004
	LDX.b $02
	LDA.b $04
	JSL.l label_C03FA9
	LDX.w #$0001
	TXA
	JSL.l label_C0886C
	LDA.w #$FFFF
	STA.w $5DC4
	JMP.w label_C18668

label_C18582:
	LDA.w #label_C15C58
	JMP.w label_C1866B

label_C18588:
	LDA.w #label_C14F6F
	JMP.w label_C1866B

label_C1858E:
	LDA.w #label_C1583D
	JMP.w label_C1866B

label_C18594:
	JSR.w label_C19441
	STA.b $06
	STZ.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1045D
	JMP.w label_C18668

label_C185A9:
	LDA.w #$0001
	JSL.l $C226C5
	JMP.w label_C18668

label_C185B3:
	LDA.w #$0000
	JSL.l $C226C5
	JMP.w label_C18668

label_C185BD:
	JSL.l $C226E6
	CMP.w #$0000
	STA.b $06
	STZ.b $08
	BPL.b label_C185CC
	DEC.b $08
label_C185CC:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1045D
	JMP.w label_C18668

EB_TextBoxCommand1F_ArgB0_SaveGame:
	JSL.l $C22A2C
	JMP.w label_C18668

label_C185E1:
	LDA.w #label_C16308
	JMP.w label_C1866B

label_C185E7:
	LDA.w #label_C163A7
	JMP.w label_C1866B

label_C185ED:
	JSL.l $C490EE
	STA.b $06
	STZ.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1045D
	BRA.b label_C18668

label_C18602:
	LDA.w #label_C17304
	BRA.b label_C1866B

label_C18607:
	LDA.w #label_C17440
	BRA.b label_C1866B

label_C1860C:
	LDA.w #label_C166FE
	BRA.b label_C1866B

label_C18611:
	LDA.w #label_C16B2B
	BRA.b label_C1866B

label_C18616:
	LDA.w #EB_TextBoxCommand1F_ArgE5_LockPlayerMovement_Main
	BRA.b label_C1866B

label_C1861B:
	LDA.w #EB_TextBoxCommand1F_ArgE6_Unknown_Main
	BRA.b label_C1866B

label_C18620:
	LDA.w #label_C16BF2
	BRA.b label_C1866B

label_C18625:
	LDA.w #EB_TextBoxCommand1F_ArgE8_RestrictPlayerMovement_Main
	BRA.b label_C1866B

label_C1862A:
	LDA.w #EB_TextBoxCommand1F_ArgE9_Unknown_Main
	BRA.b label_C1866B

label_C1862F:
	LDA.w #label_C16C83
	BRA.b label_C1866B

label_C18634:
	LDA.w #EB_TextBoxCommand1F_ArgEB_MakeCharacterInvisible_Main
	BRA.b label_C1866B

label_C18639:
	LDA.w #EB_TextBoxCommand1F_ArgEC_MakeCharacterVisible_Main
	BRA.b label_C1866B

label_C1863E:
	JSL.l EB_TextBoxCommand1F_ArgED_RestorePlayerMovement_Main
	BRA.b label_C18668

label_C18644:
	LDA.w #label_C16D62
	BRA.b label_C1866B

label_C18649:
	LDA.w #EB_TextBoxCommand1F_ArgEF_UnknownArgument_Main
	BRA.b label_C1866B

label_C1864E:
	JSL.l $C03C5E
	BRA.b label_C18668

label_C18654:
	LDA.w #label_C16EBF
	BRA.b label_C1866B

label_C18659:
	LDA.w #EB_TextBoxCommand1F_ArgF2_ChangeMovementOfSprite_Main
	BRA.b label_C1866B

label_C1865E:
	LDA.w #label_C17325
	BRA.b label_C1866B

label_C18663:
	LDA.w #label_C1737D
	BRA.b label_C1866B

label_C18668:
	LDA.w #$0000
label_C1866B:
	PLD
	RTS

;--------------------------------------------------------------------

label_C1866D:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	LDA.b $1E
	STA.b $06
	LDA.b $20
	STA.b $08
	LDA.b $0E
	BNE.b label_C1868A
	LDA.w #$0000
	BRA.b label_C1869B

label_C1868A:
	TAX
	STZ.w $0004,X
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $0E
label_C1869B:
	PLD
	RTS

;--------------------------------------------------------------------

label_C1869D:
	REP.b #$31
	TAX
	BEQ.b label_C186B0
	LDA.w $0004,X
	BEQ.b label_C186B0
	TXA
	CLC
	ADC.w #$0006
	JSL.l label_C20ABC
label_C186B0:
	RTS

;--------------------------------------------------------------------

EB_ProcessTextboxData:
.Main:
;$C186B1
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFDC
	TCD
	LDA.b $32
	STA.b $06
	LDA.b $34
	STA.b $08
	LDA.b $06
	STA.b $20
	LDA.b $08
	STA.b $22
	LDY.w #$0000
	STY.b $1E
	LDA.w #DATA_C4550E
	STA.b $0A
	LDA.w #DATA_C4550E>>16
	STA.b $0C
	LDA.b $0A
	STA.b $1A
	LDA.b $0C
	STA.b $1C
	LDA.w #$0000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.b $20
	STA.b $06
	LDA.b $22
	STA.b $08
	CMP.b $0C
	BNE.b label_C1870A
	LDA.b $06
	CMP.b $0A
label_C1870A:
	BNE.b label_C1871F
	LDA.b $20
	STA.b $06
	LDA.b $22
	STA.b $08
	LDA.b $06
	STA.b $2A
	LDA.b $08
	STA.b $2C
	JMP.w label_C18B2A

label_C1871F:
	JSR.w label_C14012
	STA.b $14
	LDA.b $20
	STA.b $06
	LDA.b $22
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $14
	JSR.w label_C1866D
	STA.b $02
	STA.b $12
	LDA.b $02
	BNE.b label_C18754
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b $06
	STA.b $2A
	LDA.b $08
	STA.b $2C
	JMP.w label_C18B2A

label_C18754:
	LDA.w $5E6E
	BEQ.b label_C18787
	LDY.b $1E
	BNE.b label_C18787
	LDA.w $9660
	BNE.b label_C18784
	LDA.b $1A
	STA.b $0A
	LDA.b $1C
	STA.b $0C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $12
	STA.b $02
	JSL.l label_C445E1
	BRA.b label_C18787

label_C18784:
	DEC.w $9660
label_C18787:
	LDA.b $1A
	STA.b $0A
	LDA.b $1C
	STA.b $0C
	LDA.b [$0A]
	AND.w #$00FF
	BEQ.b label_C187A7
	AND.w #$00FF
	STA.b $14
	INC.b $0A
	LDA.b $0A
	STA.b $1A
	LDA.b $0C
	STA.b $1C
	BRA.b label_C187CC

label_C187A7:
	LDA.b $12
	STA.b $02
	LDX.b $02
	TXY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b [$06]
	AND.w #$00FF
	STA.b $14
	INC.b $06
	TXY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
label_C187CC:
	LDY.b $1E
	BEQ.b label_C187ED
	LDA.b $14
	TAX
	LDA.b $12
	STA.b $02
	STY.b $02
	STA.w $00C0
	PEA.w label_C187E7-$01
	LDA.b $02
	DEC
	PHA
	LDA.w $00C0
	RTS						; Note: This RTS acts as a JSR, depending on what was put into Y
label_C187E7:
	TAY
	STY.b $1E
	JMP.w label_C18754

label_C187ED:
	LDA.b $14
	CMP.w #$0015
	BEQ.b label_C18804
	CMP.w #$0016
	BEQ.b label_C1885E
	CMP.w #$0017
	BNE.b label_C18801
	JMP.w label_C188B7

label_C18801:
	JMP.w label_C1890E

label_C18804:
	LDA.b $12
	STA.b $02
	LDX.b $02
	TXY
	LDA.w $0000,Y
	STA.b $0A
	LDA.w $0002,Y
	STA.b $0C
	LDA.w #EB_TextMacroBank1Ptrs
	STA.b $06
	LDA.w #EB_TextMacroBank1Ptrs>>16
	STA.b $08
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	INC.b $0A
	TXY
	LDA.b $0A
	STA.w $0000,Y
	LDA.b $0C
	STA.w $0002,Y
	LDA.b [$06]
	AND.w #$00FF
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	INC.b $0A
	LDX.b $0A
	STX.b $1A
	LDX.b $0C
	STX.b $1C
	JMP.w label_C1890E

label_C1885E:
	LDA.b $12
	STA.b $02
	LDX.b $02
	TXY
	LDA.w $0000,Y
	STA.b $0A
	LDA.w $0002,Y
	STA.b $0C
	LDA.w #EB_TextMacroBank2Ptrs
	STA.b $06
	LDA.w #EB_TextMacroBank2Ptrs>>16
	STA.b $08
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	INC.b $0A
	TXY
	LDA.b $0A
	STA.w $0000,Y
	LDA.b $0C
	STA.w $0002,Y
	LDA.b [$06]
	AND.w #$00FF
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	INC.b $0A
	LDX.b $0A
	STX.b $1A
	LDX.b $0C
	STX.b $1C
	BRA.b label_C1890E

label_C188B7:
	LDA.b $12
	STA.b $02
	LDX.b $02
	TXY
	LDA.w $0000,Y
	STA.b $0A
	LDA.w $0002,Y
	STA.b $0C
	LDA.w #EB_TextMacroBank3Ptrs
	STA.b $06
	LDA.w #EB_TextMacroBank3Ptrs>>16
	STA.b $08
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	INC.b $0A
	TXY
	LDA.b $0A
	STA.w $0000,Y
	LDA.b $0C
	STA.w $0002,Y
	LDA.b [$06]
	AND.w #$00FF
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	INC.b $0A
	LDX.b $0A
	STX.b $1A
	LDX.b $0C
	STX.b $1C
label_C1890E:
	CMP.w #$0020
	BCC.b label_C18916
	JMP.w label_C18B04

label_C18916:
	STZ.w $97CA
	CMP.w #$0000
	BNE.b label_C18921
	JMP.w label_C18A04

label_C18921:
	CMP.w #$0001
	BNE.b label_C18929
	JMP.w label_C18A0B

label_C18929:
	CMP.w #$0002
	BNE.b label_C18931
	JMP.w label_C18B0A

label_C18931:
	CMP.w #$0003
	BNE.b label_C18939
	JMP.w label_C18A1D

label_C18939:
	CMP.w #$0004
	BNE.b label_C18941
	JMP.w label_C18A29

label_C18941:
	CMP.w #$0005
	BNE.b label_C18949
	JMP.w label_C18A31

label_C18949:
	CMP.w #$0006
	BNE.b label_C18951
	JMP.w label_C18A39

label_C18951:
	CMP.w #$0007
	BNE.b label_C18959
	JMP.w label_C18A41

label_C18959:
	CMP.w #$0008
	BNE.b label_C18961
	JMP.w label_C18A49

label_C18961:
	CMP.w #$0009
	BNE.b label_C18969
	JMP.w label_C18A51

label_C18969:
	CMP.w #$000A
	BNE.b label_C18971
	JMP.w label_C18A59

label_C18971:
	CMP.w #$000B
	BNE.b label_C18979
	JMP.w label_C18A61

label_C18979:
	CMP.w #$000C
	BNE.b label_C18981
	JMP.w label_C18A69

label_C18981:
	CMP.w #$000D
	BNE.b label_C18989
	JMP.w label_C18A71

label_C18989:
	CMP.w #$000E
	BNE.b label_C18991
	JMP.w label_C18A79

label_C18991:
	CMP.w #$000F
	BNE.b label_C18999
	JMP.w label_C18A81

label_C18999:
	CMP.w #$0010
	BNE.b label_C189A1
	JMP.w label_C18A87

label_C189A1:
	CMP.w #$0011
	BNE.b label_C189A9
	JMP.w label_C18A8F

label_C189A9:
	CMP.w #$0012
	BNE.b label_C189B1
	JMP.w label_C18AAA

label_C189B1:
	CMP.w #$0013
	BNE.b label_C189B9
	JMP.w label_C18AB0

label_C189B9:
	CMP.w #$0014
	BNE.b label_C189C1
	JMP.w label_C18ABA

label_C189C1:
	CMP.w #$0018
	BNE.b label_C189C9
	JMP.w label_C18AC4

label_C189C9:
	CMP.w #$0019
	BNE.b label_C189D1
	JMP.w label_C18ACC

label_C189D1:
	CMP.w #$001A
	BNE.b label_C189D9
	JMP.w label_C18AD4

label_C189D9:
	CMP.w #$001B
	BNE.b label_C189E1
	JMP.w label_C18ADC

label_C189E1:
	CMP.w #$001C
	BNE.b label_C189E9
	JMP.w label_C18AE4

label_C189E9:
	CMP.w #$001D
	BNE.b label_C189F1
	JMP.w label_C18AEC

label_C189F1:
	CMP.w #$001E
	BNE.b label_C189F9
	JMP.w label_C18AF4

label_C189F9:
	CMP.w #$001F
	BNE.b label_C18A01
	JMP.w label_C18AFC

label_C18A01:
	JMP.w label_C18754

label_C18A04:
	JSL.l label_C438B1
	JMP.w label_C18754

label_C18A0B:
	JSR.w label_C104B5
	CMP.w #$0000
	BNE.b label_C18A16
	JMP.w label_C18754

label_C18A16:
	JSL.l label_C438B1
	JMP.w label_C18754

label_C18A1D:
	LDX.w #$0000
	LDA.w #$0001
	JSR.w label_C10166
	JMP.w label_C18754

label_C18A29:
	LDY.w #EB_TextboxCommand04_Main
	STY.b $1E
	JMP.w label_C18754

label_C18A31:
	LDY.w #EB_TextboxCommand05_TurnOffEventFlag_Main
	STY.b $1E
	JMP.w label_C18754

label_C18A39:
	LDY.w #EB_TextboxCommand06_BranchIfXIsTrue_Main
	STY.b $1E
	JMP.w label_C18754

label_C18A41:
	LDY.w #label_C1435F
	STY.b $1E
	JMP.w label_C18754

label_C18A49:
	LDY.w #EB_TextboxCommand08_TextPointerJSL_Main
	STY.b $1E
	JMP.w label_C18754

label_C18A51:
	LDY.w #label_C141D0
	STY.b $1E
	JMP.w label_C18754

label_C18A59:
	LDY.w #label_C14103
	STY.b $1E
	JMP.w label_C18754

label_C18A61:
	LDY.w #label_C14558
	STY.b $1E
	JMP.w label_C18754

label_C18A69:
	LDY.w #label_C14591
	STY.b $1E
	JMP.w label_C18754

label_C18A71:
	LDY.w #label_C145EF
	STY.b $1E
	JMP.w label_C18754

label_C18A79:
	LDY.w #label_C1461A
	STY.b $1E
	JMP.w label_C18754

label_C18A81:
	JSR.w $C1042E
	JMP.w label_C18754

label_C18A87:
	LDY.w #EB_TextboxCommand10_DelayParsing_Main
	STY.b $1E
	JMP.w label_C18754

label_C18A8F:
	LDA.w #$0001
	JSR.w label_C1196A
	STA.b $06
	STZ.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w $C1045D
	JSR.w label_C11383
	JMP.w label_C18754

label_C18AAA:
	JSR.w $C10BD3
	JMP.w label_C18754

label_C18AB0:
	LDX.w #$0000
	TXA
	JSR.w label_C10166
	JMP.w label_C18754

label_C18ABA:
	LDX.w #$0001
	TXA
	JSR.w label_C10166
	JMP.w label_C18754

label_C18AC4:
	LDY.w #label_C1790B
	STY.b $1E
	JMP.w label_C18754

label_C18ACC:
	LDY.w #label_C179AA
	STY.b $1E
	JMP.w label_C18754

label_C18AD4:
	LDY.w #label_C17B56
	STY.b $1E
	JMP.w label_C18754

label_C18ADC:
	LDY.w #label_C17C36
	STY.b $1E
	JMP.w label_C18754

label_C18AE4:
	LDY.w #label_C17D94
	STY.b $1E
	JMP.w label_C18754

label_C18AEC:
	LDY.w #label_C17F11
	STY.b $1E
	JMP.w label_C18754

label_C18AF4:
	LDY.w #label_C1811F
	STY.b $1E
	JMP.w label_C18754

label_C18AFC:
	LDY.w #EB_TextBoxCommand1F_Main
	STY.b $1E
	JMP.w label_C18754

label_C18B04:
	JSR.w label_C10CB6
	JMP.w label_C18754

label_C18B0A:
	LDA.b $12
	STA.b $02
	LDY.b $02
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $02
	JSR.w label_C1869D
	JSR.w label_C14049
	LDA.b $06
	STA.b $2A
	LDA.b $08
	STA.b $2C
label_C18B2A:
	PLD
	RTL

;--------------------------------------------------------------------

label_C18B2C:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TXY
	STY.b $0E
	TAX
	DEC
	STA.b $04
	LDA.w #$0000
	STA.b $02
	BRA.b label_C18BAF

label_C18B44:
	LDA.b $04
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99F1
	CLC
	ADC.b $02
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	BNE.b label_C18BAD
	LDY.b $0E
	TYA
	SEP.b #$20
	STA.w $0000,X
	REP.b #$20
	TYA
	LDY.w #$0027
	JSL.l label_C08FF7
	CLC
	ADC.w #$0019
	TAX
	LDA.l DATA_D55000,X
	AND.w #$00FF
	CMP.w #$0004
	BNE.b label_C18B84
	JSL.l label_C216DB
label_C18B84:
	LDY.b $0E
	TYA
	LDY.w #$0027
	JSL.l label_C08FF7
	CLC
	ADC.w #$001C
	TAX
	LDA.l DATA_D55000,X
	AND.w #$00FF					; Optimization: Unnecessary AND
	AND.w #$0010
	BEQ.b label_C18BA8
	LDY.b $0E
	TYA
	SEP.b #$20
	JSL.l label_C3EAD0
label_C18BA8:
	LDA.b $04
	INC
	BRA.b label_C18BC4

label_C18BAD:
	INC.b $02
label_C18BAF:
	LDA.w #$000E
	CLC
	SBC.b $02
	BVS.b label_C18BBC
	BMI.b label_C18BC1
	JMP.w label_C18B44

label_C18BBC:
	BPL.b label_C18BC1
	JMP.w label_C18B44

label_C18BC1:
	LDA.w #$0000
label_C18BC4:
	PLD
	RTS

label_C18BC6:						; Note: Main entry
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STX.b $04
	CMP.w #$00FF
	BNE.b label_C18C20
	LDA.w #$0000
	STA.b $02
	STA.b $10
	BRA.b label_C18C0B

label_C18BE0:
	LDA.b $10
	STA.b $02
	CLC
	ADC.w #$986F
	TAY
	STY.b $0E
	LDX.b $04
	LDA.w $0000,Y
	AND.w #$00FF
	JSR.w label_C18B2C
	CMP.w #$0000
	BEQ.b label_C18C05
	LDY.b $0E
	LDA.w $0000,Y
	AND.w #$00FF
	BRA.b label_C18C25

label_C18C05:
	INC.b $02
	LDA.b $02
	STA.b $10
label_C18C0B:
	LDA.w $98A4
	AND.w #$00FF
	PHA
	LDA.b $02
	PLY
	STY.b $02
	CMP.b $02
	BCC.b label_C18BE0
	LDA.w #$0000
	BRA.b label_C18C25

label_C18C20:
	LDX.b $04
	JSR.w label_C18B2C
label_C18C25:
	PLD
	RTL

;--------------------------------------------------------------------

org $C18EAD
label_C18EAD:

;--------------------------------------------------------------------

org $C1931B
label_C1931B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STA.b $12
	CMP.w #$0004
	BCC.b label_C193A2
	BEQ.b label_C193A2
	CMP.w #$0007
	BNE.b label_C19370
	LDA.w #$7E9819
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.w #$0006
	STA.b $12
	LDA.l $7EB49D
	AND.w #$00FF
	BEQ.b label_C19360
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $12
	JSR.w label_C10EFC
	JMP.w label_C193E5

label_C19360:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $12
	JSL.l $C447FB
	BRA.b label_C193E5

label_C19370:
	LDA.w #$9589
	STA.b $06
	LDA.w #$00D5
	STA.b $08
	LDA.b $12
	ASL
	TAX
	INX
	LDA.l DATA_D58F23,X
	AND.w #$00FF
	LDY.w #$005E
	JSL.l label_C08FF7
	INC
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0019
	JSL.l $C447FB
	BRA.b label_C193E5

label_C193A2:
	DEC
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$7E99CE
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.w #$0005
	STA.b $12
	LDA.l $7EB49D
	AND.w #$00FF
	BEQ.b label_C193D7
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $12
	JSR.w label_C10EFC
	BRA.b label_C193E5

label_C193D7:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $12
	JSL.l $C447FB
label_C193E5:
	PLD
	RTS

;--------------------------------------------------------------------

org $C19441
label_C19441:

;--------------------------------------------------------------------

org $C1ACA1
label_C1ACA1:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	STX.b $18
	STA.b $16
	LDA.w #$7E9CF5
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $16
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	TXA
	JSL.l label_C08EED
	LDX.b $18
	SEP.b #$20
	STZ.w $9CF5,X
	REP.b #$20
	LDA.w #$FFFF
	STA.w $965A
	PLD
	RTS

;--------------------------------------------------------------------

org $C1ACF8
label_C1ACF8:
	REP.b #$31
	SEP.b #$20
	STA.w $9D11
	REP.b #$20
	RTS

;--------------------------------------------------------------------

org $C1AD0A
label_C1AD0A:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF2
	TCD
	LDA.b $1C
	STA.b $06
	LDA.b $1E
	STA.b $08
	LDA.b $06
	STA.w $9D12
	LDA.b $08
	STA.w $9D14
	PLD
	RTS

;--------------------------------------------------------------------

org $C1BCAB
label_C1BCAB:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	STA.b $18
	LDA.w $5D98
	STA.b $16
	LDA.w #$0001
	STA.w $5D98
	LDA.w #EB_PresetTeleportLocations
	STA.b $0A
	LDA.w #EB_PresetTeleportLocations>>16
	STA.b $0C
	LDA.b $18
	ASL
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	STA.b $12
	LDA.b $0C
	STA.b $14
	LDY.w #$0001
	STY.b $18
	BRA.b label_C1BCF0

label_C1BCE3:
	LDX.w #$0000
	TYA
	JSL.l label_C2165E
	LDY.b $18
	INY
	STY.b $18
label_C1BCF0:
	CPY.w #$000A
	BCC.b label_C1BCE3
	BEQ.b label_C1BCE3
	JSL.l label_C06B3D
	LDA.w #$0005
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDX.w #$0001
	LDA.b [$06]
	AND.w #$00FF
	JSL.l label_C068AF
	JSL.l label_C0ABE0
	LDA.w $B4B6
	BEQ.b label_C1BD2A
	LDX.w #$0001
	TXA
	JSL.l label_C0887A
	BRA.b label_C1BD36

label_C1BD2A:
	LDX.w #$0001
	LDA.b [$06]
	AND.w #$00FF
	JSL.l label_C06662
label_C1BD36:
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b [$06]
	ASL
	ASL
	ASL
	STA.b $18
	LDY.w #$0002
	LDA.b [$0A],Y
	ASL
	ASL
	ASL
	STA.b $04
	LDA.w #$0004
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	AND.w #$007F
	DEC
	STA.b $02
	LDX.b $04
	LDA.b $18
	JSL.l label_C013F6
	STZ.w $2890
	LDY.b $02
	LDX.b $04
	LDA.b $18
	JSL.l label_C03FA9
	LDA.b [$06]
	AND.w #$00FF
	AND.w #$0080
	BEQ.b label_C1BD8F
	LDA.b $02
	JSL.l label_C052D4
label_C1BD8F:
	LDX.b $04
	LDA.b $18
	JSL.l label_C068F4
	JSL.l label_C069AF
	LDA.w #$0000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.w $9D1B
	STA.b $06
	LDA.w $9D1D
	STA.b $08
	CMP.b $0C
	BNE.b label_C1BDC7
	LDA.b $06
	CMP.b $0A
label_C1BDC7:
	BEQ.b label_C1BDF5
	LDA.w $9D1B
	STA.b $06
	LDA.w $9D1D
	STA.b $08
	PHA
	LDA.b $06
	STA.w $00BC
	LDA.b $08
	STA.w $00BE
	PLA
	JSL.l label_C09279
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	LDA.b $06
	STA.w $9D1B
	LDA.b $08
	STA.w $9D1D
label_C1BDF5:
	JSL.l label_C065A3
	LDA.w #$0005
	LDX.b $12
	STX.b $0A
	LDX.b $14
	STX.b $0C
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDX.w #$0000
	LDA.b [$06]
	AND.w #$00FF
	JSL.l label_C068AF
	JSL.l label_C0ABE0
	LDA.w $B4B6
	BEQ.b label_C1BE30
	LDX.w #$0001
	TXA
	JSL.l label_C0886C
	BRA.b label_C1BE3C

label_C1BE30:
	LDX.w #$0000
	LDA.b [$06]
	AND.w #$00FF
	JSL.l label_C06662
label_C1BE3C:
	LDA.w #$FFFF
	STA.w $5DC4
	JSL.l label_C06B21
	LDA.b $16
	STA.w $5D98
	PLD
	RTS

;--------------------------------------------------------------------

org $C1D08B
label_C1D08B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFED
	TCD
	PLA
	TAY
	STY.b $11
	SEP.b #$20
	LDA.b $22
	STA.b $10
	LDA.b $21
	STA.b $00
	REP.b #$20
	LDA.b $10
	AND.w #$00FF
	DEC
	DEC
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	STA.b $02
	PHY
	LDA.b $00
	AND.w #$00FF
	TAY
	PLA
	JSL.l label_C09032
	SEC
	SBC.b $02
	TAX
	STX.b $0E
	TXA
	CLC
	SBC.w #$0000
	BVS.b label_C1D0D1
	BPL.b label_C1D0D8
	BRA.b label_C1D0D3

label_C1D0D1:
	BMI.b label_C1D0D8
label_C1D0D3:
	LDA.w #$0000
	BRA.b label_C1D107

label_C1D0D8:
	LDA.w #$0003
	JSL.l label_C45F7B
	STA.b $02
	LDY.b $11
	TYA
	INC
	LDY.w #$0004
	JSL.l label_C091F4
	TAX
	LDA.l DATA_C3F2B1,X
	AND.w #$00FF
	CLC
	ADC.b $02
	TAY
	DEY
	LDX.b $0E
	TXA
	JSL.l label_C09032
	LDY.w #$0032
	JSL.l label_C0915B
label_C1D107:
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to selecting "Yep" on the name entry confirmation screen

label_C1D109:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE1
	TCD
	PLA
	STX.b $1D
	TAX
	TXY
	DEY
	STY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	STA.b $19
	CLC
	ADC.w #$99D3
	STA.b $02
	LDX.b $02
	SEP.b #$20
	LDA.w $0000,X
	STA.b $18
	REP.b #$20
	AND.w #$00FF
	STA.b $04
	STA.b $16
	SEP.b #$20
	LDA.b $18
	INC
	LDX.b $02
	STA.w $0000,X
	REP.b #$20
	LDA.b $1D
	BEQ.b label_C1D18E
	LDA.w #$0001
	JSR.w label_C10036
	LDX.w #$0005
	LDA.b $19
	CLC
	ADC.w #$99CE
	JSR.w label_C1ACA1
	LDX.b $02
	SEP.b #$20
	LDA.w $0000,X
	STA.b $06
	STZ.b $07
	STZ.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1AD0A
	LDA.w #DATA_EF7A66
	STA.b $0E
	LDA.w #DATA_EF7A66>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
	LDA.w #$0002
	JSR.w label_C10036
label_C1D18E:
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99EA
	TAX
	STX.b $14
	LDY.b $1B
	TYA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	TAX
	SEP.b #$20
	LDA.l EB_StatisticGrowthTable,X
	STA.b $0E
	LDX.b $14
	LDA.w $0000,X
	STA.b $0F
	REP.b #$20
	LDA.b $16
	STA.b $04
	JSR.w label_C1D08B
	STA.b $02
	CLC
	SBC.w #$0000
	BVC.b label_C1D1CF
	BPL.b label_C1D215
	BRA.b label_C1D1D1

label_C1D1CF:
	BMI.b label_C1D215
label_C1D1D1:
	LDA.b $02
	SEP.b #$20
	STA.b $00
	LDX.b $14
	LDA.w $0000,X
	CLC
	ADC.b $00
	STA.w $0000,X
	LDY.b $1B
	REP.b #$20
	TYA
	INC
	JSL.l label_C21857
	REP.b #$20
	LDA.b $1D
	BEQ.b label_C1D215
	LDA.b $02
	STA.b $06
	STZ.b $08
	BPL.b label_C1D1FC
	DEC.b $08
label_C1D1FC:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1AD0A
	LDA.w #DATA_EF7A7D
	STA.b $0E
	LDA.w #DATA_EF7A7D>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1D215:
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99EB
	TAX
	STX.b $14
	LDY.b $1B
	TYA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	TAX
	INX
	SEP.b #$20
	LDA.l EB_StatisticGrowthTable,X
	STA.b $0E
	LDX.b $14
	LDA.w $0000,X
	STA.b $0F
	REP.b #$20
	LDA.b $16
	STA.b $04
	JSR.w label_C1D08B
	STA.b $02
	CLC
	SBC.w #$0000
	BVC.b label_C1D257
	BPL.b label_C1D29D
	BRA.b label_C1D259

label_C1D257:
	BMI.b label_C1D29D
label_C1D259:
	LDA.b $02
	SEP.b #$20
	STA.b $00
	LDX.b $14
	LDA.w $0000,X
	CLC
	ADC.b $00
	STA.w $0000,X
	LDY.b $1B
	REP.b #$20
	TYA
	INC
	JSL.l label_C2192B
	REP.b #$20
	LDA.b $1D
	BEQ.b label_C1D29D
	LDA.b $02
	STA.b $06
	STZ.b $08
	BPL.b label_C1D284
	DEC.b $08
label_C1D284:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1AD0A
	LDA.w #DATA_EF7A97
	STA.b $0E
	LDA.w #DATA_EF7A97>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1D29D:
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99EC
	STA.b $02
	LDY.b $1B
	TYA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	TAX
	INX
	INX
	SEP.b #$20
	LDA.l EB_StatisticGrowthTable,X
	STA.b $0E
	LDX.b $02
	LDA.w $0000,X
	STA.b $0F
	REP.b #$20
	LDA.b $16
	STA.b $04
	JSR.w label_C1D08B
	TAX
	STX.b $14
	TXA
	CLC
	SBC.w #$0000
	BVC.b label_C1D2E1
	BPL.b label_C1D32C
	BRA.b label_C1D2E3

label_C1D2E1:
	BMI.b label_C1D32C
label_C1D2E3:
	SEP.b #$10
	STX.b $00
	REP.b #$10
	LDX.b $02
	SEP.b #$20
	LDA.w $0000,X
	CLC
	ADC.b $00
	LDX.b $02
	STA.w $0000,X
	LDY.b $1B
	REP.b #$20
	TYA
	INC
	JSL.l label_C21AEB
	REP.b #$20
	LDA.b $1D
	BEQ.b label_C1D32C
	LDX.b $14
	TXA
	STA.b $06
	STZ.b $08
	BPL.b label_C1D313
	DEC.b $08
label_C1D313:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1AD0A
	LDA.w #DATA_EF7AB1
	STA.b $0E
	LDA.w #DATA_EF7AB1>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1D32C:
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99ED
	TAX
	STX.b $14
	LDY.b $1B
	TYA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	TAX
	INX
	INX
	INX
	SEP.b #$20
	LDA.l EB_StatisticGrowthTable,X
	STA.b $0E
	LDX.b $14
	LDA.w $0000,X
	STA.b $0F
	REP.b #$20
	LDA.b $16
	STA.b $04
	JSR.w label_C1D08B
	STA.b $02
	CLC
	SBC.w #$0000
	BVC.b label_C1D370
	BPL.b label_C1D3B6
	BRA.b label_C1D372

label_C1D370:
	BMI.b label_C1D3B6
label_C1D372:
	LDA.b $02
	SEP.b #$20
	STA.b $00
	LDX.b $14
	LDA.w $0000,X
	CLC
	ADC.b $00
	STA.w $0000,X
	LDY.b $1B
	REP.b #$20
	TYA
	INC
	JSL.l label_C21BA4
	REP.b #$20
	LDA.b $1D
	BEQ.b label_C1D3B6
	LDA.b $02
	STA.b $06
	STZ.b $08
	BPL.b label_C1D39D
	DEC.b $08
label_C1D39D:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1AD0A
	LDA.w #DATA_EF7AC9
	STA.b $0E
	LDA.w #DATA_EF7AC9>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1D3B6:
	LDA.w #$000A
	CLC
	SBC.b $04
	BVC.b label_C1D3C2
	BPL.b label_C1D40C
	BRA.b label_C1D3C4

label_C1D3C2:
	BMI.b label_C1D40C
label_C1D3C4:
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99EF,X
	AND.w #$00FF
	DEC
	DEC
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	STA.b $02
	LDY.b $1B
	TYA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	TAX
	INX
	INX
	INX
	INX
	LDA.l EB_StatisticGrowthTable,X
	AND.w #$00FF
	TAY
	LDA.b $16
	STA.b $04
	JSL.l label_C09032
	SEC
	SBC.b $02
	LDY.w #$000A
	JSL.l label_C090E6
	BRA.b label_C1D43F

label_C1D40C:
	LDY.b $1B
	TYA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	TAX
	INX
	INX
	INX
	INX
	SEP.b #$20
	LDA.l EB_StatisticGrowthTable,X
	STA.b $0E
	REP.b #$20
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	SEP.b #$20
	LDA.w $99EF,X
	STA.b $0F
	REP.b #$20
	LDA.b $16
	STA.b $04
	JSR.w label_C1D08B
label_C1D43F:
	STA.b $02
	CLC
	SBC.w #$0000
	BVC.b label_C1D44B
	BPL.b label_C1D49E
	BRA.b label_C1D44D

label_C1D44B:
	BMI.b label_C1D49E
label_C1D44D:
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99EF
	TAX
	LDA.b $02
	SEP.b #$20
	STA.b $00
	LDA.w $0000,X
	CLC
	ADC.b $00
	STA.w $0000,X
	LDY.b $1B
	REP.b #$20
	TYA
	INC
	JSL.l label_C21D65
	REP.b #$20
	LDA.b $1D
	BEQ.b label_C1D49E
	LDA.b $02
	STA.b $06
	STZ.b $08
	BPL.b label_C1D485
	DEC.b $08
label_C1D485:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1AD0A
	LDA.w #DATA_EF7AE0
	STA.b $0E
	LDA.w #DATA_EF7AE0>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1D49E:
	LDA.w #$000A
	CLC
	SBC.b $04
	BVC.b label_C1D4AA
	BPL.b label_C1D4F4
	BRA.b label_C1D4AC

label_C1D4AA:
	BMI.b label_C1D4F4
label_C1D4AC:
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99F0,X
	AND.w #$00FF
	DEC
	DEC
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	STA.b $02
	LDY.b $1B
	TYA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	CLC
	ADC.w #$0005
	TAX
	LDA.l EB_StatisticGrowthTable,X
	AND.w #$00FF
	TAY
	LDA.b $16
	STA.b $04
	JSL.l label_C09032
	SEC
	SBC.b $02
	LDY.w #$000A
	JSL.l label_C090E6
	BRA.b label_C1D527

label_C1D4F4:
	LDY.b $1B
	TYA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	CLC
	ADC.w #$0005
	TAX
	SEP.b #$20
	LDA.l EB_StatisticGrowthTable,X
	STA.b $0E
	REP.b #$20
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	SEP.b #$20
	LDA.w $99F0,X
	STA.b $0F
	REP.b #$20
	LDA.b $16
	STA.b $04
	JSR.w label_C1D08B
label_C1D527:
	STA.b $02
	CLC
	SBC.w #$0000
	BVC.b label_C1D533
	BPL.b label_C1D586
	BRA.b label_C1D535

label_C1D533:
	BMI.b label_C1D586
label_C1D535:
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99F0
	TAX
	LDA.b $02
	SEP.b #$20
	STA.b $00
	LDA.w $0000,X
	CLC
	ADC.b $00
	STA.w $0000,X
	LDY.b $1B
	REP.b #$20
	TYA
	INC
	JSL.l label_C21D7D
	REP.b #$20
	LDA.b $1D
	BEQ.b label_C1D586
	LDA.b $02
	STA.b $06
	STZ.b $08
	BPL.b label_C1D56D
	DEC.b $08
label_C1D56D:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1AD0A
	LDA.w #DATA_EF7AFB
	STA.b $0E
	LDA.w #DATA_EF7AFB>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1D586:
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99EE
	STA.b $02
	LDY.b $1B
	TYA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	CLC
	ADC.w #$0006
	TAX
	SEP.b #$20
	LDA.l EB_StatisticGrowthTable,X
	STA.b $0E
	LDX.b $02
	LDA.w $0000,X
	STA.b $0F
	REP.b #$20
	LDA.b $16
	STA.b $04
	JSR.w label_C1D08B
	TAX
	STX.b $14
	TXA
	CLC
	SBC.w #$0000
	BVC.b label_C1D5CC
	BPL.b label_C1D617
	BRA.b label_C1D5CE

label_C1D5CC:
	BMI.b label_C1D617
label_C1D5CE:
	SEP.b #$10
	STX.b $00
	REP.b #$10
	LDX.b $02
	SEP.b #$20
	LDA.w $0000,X
	CLC
	ADC.b $00
	LDX.b $02
	STA.w $0000,X
	LDY.b $1B
	REP.b #$20
	TYA
	INC
	JSL.l label_C21C5D
	REP.b #$20
	LDA.b $1D
	BEQ.b label_C1D617
	LDX.b $14
	TXA
	STA.b $06
	STZ.b $08
	BPL.b label_C1D5FE
	DEC.b $08
label_C1D5FE:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1AD0A
	LDA.w #DATA_EF7B11
	STA.b $0E
	LDA.w #DATA_EF7B11>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1D617:
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99E8,X
	AND.w #$00FF
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	SEC
	SBC.w $99D8,X
	STA.b $14
	CLC
	SBC.w #$0001
	BVC.b label_C1D643
	BPL.b label_C1D64A
	BRA.b label_C1D645

label_C1D643:
	BMI.b label_C1D64A
label_C1D645:
	LDA.b $14
	TAX
	BRA.b label_C1D653

label_C1D64A:
	LDA.w #$0002
	JSL.l label_C45F7B
	TAX
	INX
label_C1D653:
	STX.b $02
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	STA.b $19
	CLC
	ADC.w #$99D8
	TAX
	LDA.w $0000,X
	CLC
	ADC.b $02
	STA.w $0000,X
	LDA.b $19
	CLC
	ADC.w #$9A15
	TAX
	LDA.w $0000,X
	CLC
	ADC.b $02
	STA.w $0000,X
	LDA.b $1D
	BEQ.b label_C1D6A6
	LDA.b $02
	STA.b $06
	STZ.b $08
	BPL.b label_C1D68D
	DEC.b $08
label_C1D68D:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1AD0A
	LDA.w #DATA_EF7B28
	STA.b $0E
	LDA.w #DATA_EF7B28>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1D6A6:
	LDY.b $1B
	CPY.w #$0002
	BNE.b label_C1D6B0
	JMP.w label_C1D8C7

label_C1D6B0:
	CPY.w #$0000
	BNE.b label_C1D6D5
	LDA.w #$004A
	JSL.l label_C21628
	CMP.w #$0000
	BEQ.b label_C1D6D5
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99E9,X
	AND.w #$00FF
	ASL
	BRA.b label_C1D6E6

label_C1D6D5:
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99E9,X
	AND.w #$00FF
label_C1D6E6:
	STA.b $12
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.b $12
	STA.b $04
	ASL
	ASL
	ADC.b $04
	SEC
	SBC.w $99DA,X
	STA.b $14
	CLC
	SBC.w #$0001
	BVC.b label_C1D70B
	BPL.b label_C1D712
	BRA.b label_C1D70D

label_C1D70B:
	BMI.b label_C1D712
label_C1D70D:
	LDA.b $14
	TAX
	BRA.b label_C1D71A

label_C1D712:
	LDA.w #$0002
	JSL.l label_C45F7B
	TAX
label_C1D71A:
	TXA
	STA.b $14
	BEQ.b label_C1D77E
	LDY.b $1B
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	STA.b $02
	STA.b $19
	LDA.b $02
	CLC
	ADC.w #$99DA
	TAX
	LDA.b $14
	STA.b $02
	LDA.w $0000,X
	CLC
	ADC.b $02
	STA.w $0000,X
	LDA.b $19
	STA.b $02
	CLC
	ADC.w #$9A1B
	TAX
	LDA.b $14
	STA.b $02
	LDA.w $0000,X
	CLC
	ADC.b $02
	STA.w $0000,X
	LDA.b $1D
	BEQ.b label_C1D77E
	LDA.b $14
	STA.b $06
	STZ.b $08
	BPL.b label_C1D765
	DEC.b $08
label_C1D765:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1AD0A
	LDA.w #DATA_EF7B46
	STA.b $0E
	LDA.w #DATA_EF7B46>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1D77E:
	LDA.b $1D
	BNE.b label_C1D785
	JMP.w label_C1D8C7

label_C1D785:
	LDA.b $16
	STA.b $04
	STA.b $02
	INC.b $02
	LDY.b $1B
	TYA
	BEQ.b label_C1D7A2
	CMP.w #$0001
	BEQ.b $6E
	CMP.w #$0003
	BNE.b label_C1D79F
	JMP.w label_C1D867

label_C1D79F:
	JMP.w label_C1D8C7

label_C1D7A2:
	LDX.w #$0001
	STX.b $1B
	BRA.b label_C1D7D6

label_C1D7A9:
	LDA.b $16
	CLC
	ADC.w #$0006
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	CMP.b $02
	BNE.b label_C1D7D1
	TXA
	SEP.b #$20
	JSR.w label_C1ACF8
	LDA.w #DATA_EF7B64
	STA.b $0E
	LDA.w #DATA_EF7B64>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1D7D1:
	LDX.b $1B
	INX
	STX.b $1B
label_C1D7D6:
	LDA.w #DATA_D58A50
	STA.b $06
	LDA.w #DATA_D58A50>>16
	STA.b $08
	TXA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	STA.b $16
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	BNE.b label_C1D7A9
	JMP.w label_C1D8C7

label_C1D805:
	LDX.w #$0001
	STX.b $1B
	BRA.b label_C1D839

label_C1D80C:
	LDA.b $16
	CLC
	ADC.w #$0007
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	CMP.b $02
	BNE.b $14
	TXA
	SEP.b #$20
	JSR.w label_C1ACF8
	LDA.w #DATA_EF7B64
	STA.b $0E
	LDA.w #DATA_EF7B64>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1D834:
	LDX.b $1B
	INX
	STX.b $1B
label_C1D839:
	LDA.w #DATA_D58A50
	STA.b $06
	LDA.w #DATA_D58A50>>16
	STA.b $08
	TXA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	STA.b $16
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	BNE.b label_C1D80C
	BRA.b label_C1D8C7

label_C1D867:
	LDX.w #$0001
	STX.b $1B
	BRA.b label_C1D89B

label_C1D86E:
	LDA.b $16
	CLC
	ADC.w #$0008
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	CMP.b $02
	BNE.b label_C1D896
	TXA
	SEP.b #$20
	JSR.w label_C1ACF8
	LDA.w #DATA_EF7B64
	STA.b $0E
	LDA.w #DATA_EF7B64>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1D896:
	LDX.b $1B
	INX
	STX.b $1B
label_C1D89B:
	LDA.w #DATA_D58A50
	STA.b $06
	LDA.w #DATA_D58A50>>16
	STA.b $08
	TXA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	STA.b $16
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	BNE.b label_C1D86E
label_C1D8C7:
	LDA.b $1D
	BEQ.b label_C1D8CE
	JSR.w label_C1003C
label_C1D8CE:
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to selecting "Yep" on the name entry confirmation screen

label_C1D8D0:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STY.b $04
	STX.b $02
	TAX
	DEX
	TXA
	LDY.w #$005F
	JSL.l label_C08FF7
	TAY
	SEP.b #$20
	LDA.b #$01
	STA.w $99D3,Y
	LDA.b #$02
	STA.w $99EA,Y
	STA.w $99EB,Y
	STA.w $99EC,Y
	STA.w $99ED,Y
	STA.w $99EE,Y
	STA.w $99EF,Y
	STA.w $99F0,Y
	REP.b #$20
	LDA.w #$001E
	STA.w $99D8,Y
	STA.w $9A15,Y
	STA.w $9A13,Y
	CPX.w #$0002
	BEQ.b label_C1D921
	LDA.w #$000A
	STA.b $10
	BRA.b label_C1D926

label_C1D921:
	LDA.w #$0000
	STA.b $10
label_C1D926:
	TXA
	LDY.w #$005F
	JSL.l label_C08FF7
	TAY
	LDA.b $10
	STA.w $99DA,Y
	STA.w $9A1B,Y
	STA.w $9A19,Y
	TXY
	INY
	STY.b $0E
	TYA
	JSL.l label_C21857
	LDY.b $0E
	REP.b #$20
	TYA
	JSL.l label_C2192B
	LDY.b $0E
	REP.b #$20
	TYA
	JSL.l label_C21AEB
	LDY.b $0E
	REP.b #$20
	TYA
	JSL.l label_C21BA4
	LDY.b $0E
	REP.b #$20
	TYA
	JSL.l label_C21C5D
	LDY.b $0E
	REP.b #$20
	TYA
	JSL.l label_C21D65
	LDY.b $0E
	REP.b #$20
	TYA
	JSL.l label_C21D7D
	BRA.b label_C1D984

label_C1D97B:
	LDX.w #$0000
	LDY.b $0E
	TYA
	JSR.w label_C1D109
label_C1D984:
	REP.b #$20
	LDA.b $02
	DEC
	STA.b $02
	BNE.b label_C1D97B
	LDA.b $04
	BEQ.b label_C1D9E7
	LDY.b $0E
	TYX
	DEX
	STX.b $10
	TXA
	LDY.w #$005F
	JSL.l label_C08FF7
	STA.b $0E
	LDA.w #EB_LevelUpRequirementTable
	STA.b $0A
	LDA.w #EB_LevelUpRequirementTable>>16
	STA.b $0C
	LDA.b $0E
	TAX
	LDA.w $99D3,X
	AND.w #$00FF
	ASL
	ASL
	STA.b $02
	LDY.w #$0190
	LDX.b $10
	TXA
	JSL.l label_C09032
	CLC
	ADC.b $02
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $0E
	CLC
	ADC.w #$99D4
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
label_C1D9E7:
	PLD
	RTS

;--------------------------------------------------------------------

label_C1D9E9:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STX.b $02
	TAX
	LDA.b $20
	STA.b $06
	LDA.b $22
	STA.b $08
	TXY
	DEY
	STY.b $10
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	STA.b $0E
	CLC
	ADC.w #$99D4
	TAX
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	TXY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	TXY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $0E
	TAX
	LDA.w $99D3,X
	AND.w #$00FF
	STA.b $0E
	STA.b $04
	LDA.w #$0063
	CLC
	SBC.b $04
	BVC.b label_C1DA56
	BMI.b label_C1DA5B
	JMP.w label_C1DB31

label_C1DA56:
	BPL.b label_C1DA5B
	JMP.w label_C1DB31

label_C1DA5B:
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.w #EB_LevelUpRequirementTable
	STA.b $06
	LDA.w #EB_LevelUpRequirementTable>>16
	STA.b $08
	LDA.b $0E
	ASL
	ASL
	STA.b $04
	INC.b $04
	INC.b $04
	INC.b $04
	INC.b $04
	LDY.b $10
	TYA
	LDY.w #$0190
	JSL.l label_C09032
	CLC
	ADC.b $04
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	CLC
	LDA.b $06
	SBC.b $0A
	LDA.b $08
	SBC.b $0C
	BCC.b label_C1DAA7
	JMP.w label_C1DB31

label_C1DAA7:
	LDA.b $02
	BEQ.b label_C1DAB2
	LDA.w #$0006
	JSL.l label_C4FBBD
label_C1DAB2:
	LDX.b $02
	LDY.b $10
	TYA
	INC
	JSR.w label_C1D109
	LDY.b $10
	TYA
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99D3,X
	AND.w #$00FF
	STA.b $0E
	STA.b $04
	LDA.w #$0063
	CLC
	SBC.b $04
	BVC.b label_C1DADC
	BPL.b label_C1DB31
	BRA.b label_C1DADE

label_C1DADC:
	BMI.b label_C1DB31
label_C1DADE:
	LDA.w #EB_LevelUpRequirementTable
	STA.b $06
	LDA.w #EB_LevelUpRequirementTable>>16
	STA.b $08
	LDA.b $0E
	ASL
	ASL
	STA.b $04
	INC.b $04
	INC.b $04
	INC.b $04
	INC.b $04
	LDY.b $10
	TYA
	LDY.w #$0190
	JSL.l label_C09032
	CLC
	ADC.b $04
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $0A
	STY.b $0C
	TXA
	CLC
	ADC.w #$99D4
	TAY
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $06
	CMP.b $0A
	LDA.b $08
	SBC.b $0C
	BCC.b label_C1DB31
	JMP.w label_C1DAB2

label_C1DB31:
	PLD
	RTL

;--------------------------------------------------------------------

org $C1DBBB
label_C1DBBB:

;--------------------------------------------------------------------

; Note: Something related to backing out of the name entry screen

org $C1E48D
label_C1E48D:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STY.b $10
	STX.b $0E
	STA.b $02
	JSL.l label_C3E4D4
	LDA.b $02
	JSR.w label_C1007E
	LDY.b $10
	LDX.b $0E
	LDA.b $02
	JSL.l label_C442AC
	TAX
	STX.b $0E
	LDA.w #$001C
	JSR.w label_C1007E
	LDX.b $0E
	TXA
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to selecting "Don't Care".

label_C1E4BE:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	STY.b $02
	STX.b $16
	STA.b $14
	JSL.l label_C3E4D4
	LDA.b $14
	JSR.w label_C104EE
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAY
	STY.b $12
	LDA.w #$0004
	CLC
	SBC.b $16
	BVC.b label_C1E4F9
	BPL.b label_C1E500
	BRA.b label_C1E4FB

label_C1E4F9:
	BMI.b label_C1E500
label_C1E4FB:
	LDX.w #$0005
	BRA.b label_C1E503

label_C1E500:
	LDX.w #$0006
label_C1E503:
	STX.b $10
	LDA.b $10
	JSL.l label_C441B7
	LDY.b $12
	LDA.w $0010,Y
	TAX
	LDA.w #$0000
	JSL.l label_C438A5
	LDA.b $02
	CMP.w #$0006
	BNE.b label_C1E524
	LDX.w #$0000
	BRA.b label_C1E527

label_C1E524:
	LDX.b $02
	INX
label_C1E527:
	STX.b $04
	LDA.b $04
	STA.b $12
	LDA.w #$0000
	STA.b $02
	STA.b $0E
	BRA.b label_C1E545

label_C1E536:
	TXY
	LDX.b $10
	LDA.b $14
	JSL.l label_C442AC
	INC.b $02
	LDA.b $02
	STA.b $0E
label_C1E545:
	LDA.b $12
	STA.b $04
	STA.b $04
	ASL
	ADC.b $04
	ASL
	STA.b $02
	LDA.b $16
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.b $02
	LDX.b $0E
	STX.b $02
	CLC
	ADC.b $02
	TAX
	LDA.l EB_DontCareNamePresets,X
	AND.w #$00FF
	TAX
	BNE.b label_C1E536
	LDA.w #$001C
	JSR.w label_C1007E
	LDA.b $12
	STA.b $04
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to the name entry screen letter textbox.

org $C1E57F
label_C1E57F:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFD0
	TCD
	PLA
	STY.b $2E
	STX.b $2C
	STA.b $2A
	LDY.b $40
	STY.b $28
	LDX.b $3E
	STX.b $26
	LDA.w #$FFFF
	STA.b $24
	STZ.b $22
	LDA.b $22
	STA.b $20
	LDA.b $26
	STA.b $1E
	JSL.l label_C3E4D4
	LDA.w #$001C
	JSR.w label_C104EE
	LDA.b $28
	CMP.w #$FFFF
	BNE.b label_C1E5D1
	LDA.l DATA_EFA6E7
	STA.b $06
	LDA.l DATA_EFA6E7+$02
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
	BRA.b label_C1E5E9

label_C1E5D1:
	LDA.l DATA_EFA6E3
	STA.b $06
	LDA.l DATA_EFA6E3+$02
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1E5E9:
	SEP.b #$20
	STZ.w $5E6D
	REP.b #$20
	LDA.b $28
	CMP.w #$FFFF
	BNE.b label_C1E628
	LDA.w #DATA_EFA6D3
	STA.b $0A
	LDA.w #DATA_EFA6D3>>16
	STA.b $0C
	LDA.b $26
	ASL
	ASL
	CLC
	ADC.w #$0008
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
	BRA.b label_C1E653

label_C1E628:
	LDA.w #DATA_EFA6D3
	STA.b $0A
	LDA.w #DATA_EFA6D3>>16
	STA.b $0C
	LDA.b $26
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1E653:
	SEP.b #$20
	LDA.b #$01
	STA.w $5E6D
label_C1E65A:
	JSL.l label_C3E4D4
	LDA.b $1E
	CMP.b $26
	BNE.b label_C1E667
	JMP.w label_C1E71F

label_C1E667:
	LDA.w #$001C
	JSR.w label_C104EE
	JSL.l label_C3E4E0
	LDA.b $28
	CMP.w #$FFFF
	BNE.b label_C1E692
	LDA.l DATA_EFA6E7
	STA.b $06
	LDA.l DATA_EFA6E7+$02
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
	BRA.b label_C1E6AA

label_C1E692:
	LDA.l DATA_EFA6E3
	STA.b $06
	LDA.l DATA_EFA6E3+$02
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1E6AA:
	LDA.b $26
	STA.b $1E
	SEP.b #$20
	STZ.w $5E6D
	REP.b #$20
	LDA.b $28
	CMP.w #$FFFF
	BNE.b label_C1E6ED
	LDA.w #DATA_EFA6D3
	STA.b $0A
	LDA.w #DATA_EFA6D3>>16
	STA.b $0C
	LDA.b $26
	ASL
	ASL
	CLC
	ADC.w #$0008
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
	BRA.b label_C1E718

label_C1E6ED:
	LDA.w #DATA_EFA6D3
	STA.b $0A
	LDA.w #DATA_EFA6D3>>16
	STA.b $0C
	LDA.b $26
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1E718:
	SEP.b #$20
	LDA.b #$01
	STA.w $5E6D
label_C1E71F:
	REP.b #$20
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	STA.b $1C
label_C1E736:
	JSL.l label_C3E4CA
	LDX.b $22
	LDA.b $20
	JSL.l label_C438A5
	LDA.w #$0001
	JSR.w label_C10FEA
	LDA.w #$0021
	JSR.w label_C10D60
	LDA.w #$0000
	JSR.w label_C10FEA
	JSL.l label_C12DD5
	LDA.w #$0001
	STA.b $04
label_C1E75D:
	LDA.b $04
	EOR.w #$0001
	STA.b $04
	LDY.w #$0010
	LDA.b ($1C),Y
	ASL
	LDY.w #$0008
	CLC
	ADC.b ($1C),Y
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $02
	LDY.w #$0006
	LDA.b ($1C),Y
	LDY.w #$000E
	CLC
	ADC.b ($1C),Y
	CLC
	ADC.b $02
	CLC
	ADC.w #$7C20
	STA.b $1A
	LDA.b $04
	ASL
	STA.b $02
	LDA.w #AnimatedMenuCursorTiles_PointRight_Top
	STA.b $06
	LDA.w #AnimatedMenuCursorTiles_PointRight_Top>>16
	STA.b $08
	LDA.b $02
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.b $1A
	LDX.w #$0002
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #AnimatedMenuCursorTiles_PointRight_Bottom
	STA.b $06
	LDA.w #AnimatedMenuCursorTiles_PointRight_Bottom>>16
	STA.b $08
	LDA.b $02
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $1A
	CLC
	ADC.w #$0020
	TAY
	LDX.w #$0002
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDX.w #$0000
	STX.b $18
	JMP.w label_C1EA0C

label_C1E7E5:
	JSL.l label_C1004E
	LDA.w $006D
	AND.w #!Joypad_DPadU<<8
	BEQ.b label_C1E815
	STZ.b $0E
	LDA.w #$007C
	STA.b $10
	LDA.b $20
	STA.b $12
	LDY.w #$000C
	LDA.b ($1C),Y
	LSR
	STA.b $14
	LDY.w #$FFFF
	LDX.b $22
	LDA.b $20
	JSL.l label_C118E7
	TAY
	STY.b $16
	JMP.w label_C1EA23

label_C1E815:
	LDA.w $006D
	AND.w #!Joypad_DPadL<<8
	BEQ.b label_C1E843
	LDA.w #$FFFF
	STA.b $0E
	LDA.w #$007B
	STA.b $10
	LDY.w #$000A
	LDA.b ($1C),Y
	STA.b $12
	LDA.b $22
	STA.b $14
	LDY.w #$0000
	LDX.b $22
	LDA.b $20
	JSL.l label_C118E7
	TAY
	STY.b $16
	JMP.w label_C1EA23

label_C1E843:
	LDA.w $006D
	AND.w #!Joypad_DPadD<<8
	BEQ.b label_C1E86C
	STZ.b $0E
	LDA.w #$007C
	STA.b $10
	LDA.b $20
	STA.b $12
	LDA.w #$FFFF
	STA.b $14
	LDY.w #$0001
	LDX.b $22
	LDA.b $20
	JSL.l label_C118E7
	TAY
	STY.b $16
	JMP.w label_C1EA23

label_C1E86C:
	LDA.w $006D
	AND.w #!Joypad_DPadR<<8
	BEQ.b label_C1E898
	LDA.w #$0001
	STA.b $0E
	LDA.w #$007B
	STA.b $10
	LDA.w #$FFFF
	STA.b $12
	LDA.b $22
	STA.b $14
	LDY.w #$0000
	LDX.b $22
	LDA.b $20
	JSL.l label_C118E7
	TAY
	STY.b $16
	JMP.w label_C1EA23

label_C1E898:
	LDA.w $0069
	AND.w #$0800
	BEQ.b label_C1E8B8
	STZ.b $0E
	LDA.w #$007C
	STA.b $10
	LDY.w #$FFFF
	LDX.b $22
	LDA.b $20
	JSL.l $C20B65
	TAY
	STY.b $16
	JMP.w label_C1EA23

label_C1E8B8:
	LDA.w $0069
	AND.w #$0400
	BEQ.b label_C1E8D8
	STZ.b $0E
	LDA.w #$007C
	STA.b $10
	LDY.w #$0001
	LDX.b $22
	LDA.b $20
	JSL.l label_C20B65
	TAY
	STY.b $16
	JMP.w label_C1EA23

label_C1E8D8:
	LDA.w $0069
	AND.w #$0200
	BEQ.b label_C1E8FB
	LDA.w #$FFFF
	STA.b $0E
	LDA.w #$007B
	STA.b $10
	LDY.w #$0000
	LDX.b $22
	LDA.b $20
	JSL.l label_C20B65
	TAY
	STY.b $16
	JMP.w label_C1EA23

label_C1E8FB:
	LDA.w $0069
	AND.w #$0100
	BEQ.b label_C1E91E
	LDA.w #$0001
	STA.b $0E
	LDA.w #$007B
	STA.b $10
	LDY.w #$0000
	LDX.b $22
	LDA.b $20
	JSL.l label_C20B65
	TAY
	STY.b $16
	JMP.w label_C1EA23

label_C1E91E:
	LDA.w $006D
	AND.w #!Joypad_A|!Joypad_L
	BNE.b label_C1E929
	JMP.w label_C1E9C5

label_C1E929:
	LDA.b $22
	CMP.w #$0006
	BNE.b label_C1E989
	LDA.b $20
	BEQ.b label_C1E941
	CMP.w #$0011
	BEQ.b label_C1E956
	CMP.w #$0019
	BEQ.b label_C1E97F
	JMP.w label_C1EA07

label_C1E941:
	LDA.w #$007A
	JSL.l label_C0ABE0
	LDY.b $24
	LDX.b $28
	LDA.b $2A
	JSR.w label_C1E4BE
	STA.b $24
	JMP.w label_C1E736

label_C1E956:
	LDA.w #$007A
	JSL.l label_C0ABE0
	LDY.w #$FFFF
	LDX.b $2C
	LDA.b $2A
	JSR.w label_C1E48D
	CMP.w #$0000
	BNE.b label_C1E96F
	JMP.w label_C1E736

label_C1E96F:
	LDA.b $28
	CMP.w #$FFFF
	BNE.b label_C1E979
	JMP.w label_C1E736

label_C1E979:
	LDA.w #$0001
	JMP.w label_C1EAA4

label_C1E97F:
	LDA.w #$005E
	JSL.l label_C0ABE0
	JMP.w label_C1EA4E

label_C1E989:
	LDA.w #$007A
	JSL.l label_C0ABE0
	LDA.b $22
	CMP.w #$0004
	BNE.b label_C1E9AF
	LDA.b $20
	BEQ.b label_C1E9A2
	CMP.w #$0007
	BEQ.b label_C1E9A7
	BRA.b label_C1E9AF

label_C1E9A2:
	STZ.b $26
	JMP.w label_C1E65A

label_C1E9A7:
	LDA.w #$0001
	STA.b $26
	JMP.w label_C1E65A

label_C1E9AF:
	LDY.b $26
	LDX.b $22
	LDA.b $20
	LSR
	JSL.l label_C4406A
	TAY
	LDX.b $2C
	LDA.b $2A
	JSR.w label_C1E48D
	JMP.w label_C1E736

label_C1E9C5:
	LDA.w $006D
	AND.w #$A000
	BEQ.b label_C1E9F6
	LDA.w #$007D
	JSL.l label_C0ABE0
	LDY.w #$FFFF
	LDX.b $2C
	LDA.b $2A
	JSR.w label_C1E48D
	CMP.w #$0000
	BNE.b label_C1E9E6
	JMP.w label_C1E736

label_C1E9E6:
	LDA.b $28
	CMP.w #$FFFF
	BNE.b label_C1E9F0
	JMP.w label_C1E736

label_C1E9F0:
	LDA.w #$0001
	JMP.w label_C1EAA4

label_C1E9F6:
	LDA.w $006D
	AND.w #!Joypad_Start<<8
	BEQ.b label_C1EA07
	LDA.w #$007E
	JSL.l label_C0ABE0
	BRA.b label_C1EA4E

label_C1EA07:
	LDX.b $18
	INX
	STX.b $18
label_C1EA0C:
	STX.b $02
	LDA.w #$000A
	CLC
	SBC.b $02
	BVS.b label_C1EA1B
	BMI.b label_C1EA20
	JMP.w label_C1E7E5

label_C1EA1B:
	BPL.b label_C1EA20
	JMP.w label_C1E7E5

label_C1EA20:
	JMP.w label_C1E75D

label_C1EA23:
	LDX.b $22
	LDA.b $20
	JSL.l label_C438A5
	LDA.w #$002F
	JSR.w label_C10D60
	LDY.b $16
	CPY.w #$FFFF
	BNE.b label_C1EA3B
	JMP.w label_C1E736

label_C1EA3B:
	TYA
	AND.w #$00FF
	STA.b $20
	TYA
	AND.w #$FF00
	XBA
	AND.w #$00FF
	STA.b $22
	JMP.w label_C1E736

label_C1EA4E:
	LDA.w #$7E1B86
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l label_C08F22
	CMP.w #$0000
	BNE.b label_C1EA71
	JMP.w label_C1E736

label_C1EA71:						; Note: Called when advancing the name entry screen to the next one
	LDA.b $2A
	JSR.w label_C1007E
	LDX.w #$0000
	BRA.b label_C1EA84

label_C1EA7B:
	SEP.b #$20
	STA.b ($2E)
	REP.b #$20
	INC.b $2E
	INX
label_C1EA84:
	LDA.w $1B86,X
	AND.w #$00FF
	BEQ.b label_C1EA9D
	CPX.b $2C
	BCC.b label_C1EA7B
	BRA.b label_C1EA9D

label_C1EA92:
	SEP.b #$20
	LDA.b #$00
	STA.b ($2E)
	REP.b #$20
	INC.b $2E
	INX
label_C1EA9D:
	CPX.b $2C
	BCC.b label_C1EA92
	LDA.w #$0000
label_C1EAA4:
	PLD
	RTS

;--------------------------------------------------------------------

org $C1EAA6
label_C1EAA6:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	TAX
	STX.b $14
	STZ.w $5E6E
	SEP.b #$20
	LDA.b #$01
	STA.w $B49D
	JSL.l label_C3E4D4
	LDA.w #$0027
	JSR.w label_C104EE
	LDX.b $14
	BNE.b label_C1EACE
	JMP.w label_C1EB4C

label_C1EACE:
	LDX.w #$0000
	TXA
	JSL.l label_C438A5
	LDA.w #$7E9801
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0018
	JSR.w label_C10EFC
	LDX.w #$0001
	LDA.w #$0000
	JSL.l label_C438A5
	LDA.w #$000C
	JSL.l label_C441B7
	LDA.w $97F5
	AND.w #$00FF
	BEQ.b label_C1EB29
	LDA.w #$7E97F5
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$000C
	JSR.w label_C10EFC
label_C1EB29:
	LDX.w #$0001
	LDA.w #$0000
	JSL.l label_C438A5
	STZ.b $0E
	LDA.w #$FFFF
	STA.b $10
	LDY.w #$97F5
	LDX.w #$000C
	LDA.w #$0027
	JSR.w label_C1E57F
	TAY
	STY.b $12
	JMP.w label_C1EBE4

label_C1EB4C:
	LDX.w #$0000
	TXA
	JSL.l label_C438A5
	LDA.w #$C3FB2B
	STA.b $0E
	LDA.w #$00C3
	STA.b $10
	LDA.w #$001A
	JSR.w label_C10EFC
	JSL.l label_C08F8B
	LDX.w #$0001
	LDA.w #$0000
	JSL.l label_C438A5
	LDA.w #$0018
	JSL.l label_C441B7
	LDX.w #$0001
	LDA.w #$0000
	JSL.l label_C438A5
	LDY.w #$9801
	LDA.w $0000,Y
	AND.w #$00FF
	BEQ.b label_C1EB96
	LDX.w #$0018
	TYA
	JSL.l label_C440B5
label_C1EB96:
	LDX.w #$0001
	LDA.w #$0000
	JSL.l label_C438A5
	LDA.w #$9801
	STA.b $02
	STZ.b $0E
	LDA.w #$FFFF
	STA.b $10
	LDY.b $02
	LDX.w #$0018
	LDA.w #$0027
	JSR.w label_C1E57F
	TAY
	STY.b $12
	LDX.b $02
	LDA.w #$9C9F
	JSL.l $C4D065
	LDA.w #$7E9C9F
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$000C
	LDA.w #$97F5
	JSL.l label_C08ED2
label_C1EBE4:
	LDA.w #$001C
	JSL.l label_C3E521
	LDA.w #$0027
	JSL.l label_C3E521
	LDA.w #$00FF
	STA.w $5E6E
	SEP.b #$20
	STZ.w $B49D
	LDY.b $12
	REP.b #$20
	TYA
	PLD
	RTL

;--------------------------------------------------------------------

label_C1EC04:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	STY.b $14
	TXY
	STY.b $12
	STA.b $02
	LDX.b $28
	STX.b $04
	LDA.b $24
	STA.b $06
	LDA.b $26
	STA.b $08
	JSL.l label_C3E4D4
	LDA.w #$001A
	JSR.w label_C104EE
	JSL.l label_C3E4E0
	LDY.b $12
	LDA.w $0000,Y
	AND.w #$00FF
	BEQ.b label_C1EC42
	LDX.b $02
	TYA
	JSL.l label_C440B5
	BRA.b label_C1EC48

label_C1EC42:
	LDA.b $02
	JSL.l label_C441B7
label_C1EC48:
	LDX.w #$0000
	TXA
	JSL.l label_C438A5
	LDA.w #$001B
	JSR.w label_C104EE
	JSL.l label_C3E4E0
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $04
	JSR.w label_C10EFC
	LDX.w #$0000
	LDA.w #$0001
	JSR.w label_C10166
	STZ.b $0E
	LDA.b $14
	STA.b $10
	LDY.b $12
	LDX.b $02
	LDA.w #$001A
	JSR.w label_C1E57F
label_C1EC80:
	TAX
	STX.b $14
	LDA.w #$001C
	JSL.l label_C3E521
	LDX.b $14
	TXA
	PLD
	RTS

;--------------------------------------------------------------------

label_C1EC8F:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $10
	LDX.w #$99CD
	STX.b $0E
	SEP.b #$20
	LDA.w $0000,X
	STA.b $00
	REP.b #$20
	LDA.b $10
	SEP.b #$20
	STA.w $0000,X
	JSL.l label_C47C3F
	LDA.w #$0002
	JSL.l label_C44963
	JSL.l label_C47F87
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	LDA.b $00
	LDX.b $0E
	STA.w $0000,X
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to the file select screen.

label_C1ECD1:
	REP.b #$31
	XBA
	AND.w #$00FF
	JSL.l label_C1EC8F
	RTL

;--------------------------------------------------------------------

label_C1ECDC:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEC
	TCD
	LDA.w $9F79
	AND.w #$00FF
	BEQ.b label_C1ED59
	LDA.w #$9C8A
	JSL.l label_C20A20
	LDA.w #$002F
	JSR.w label_C104EE
	LDX.w #$0000
	STX.b $12
	BRA.b label_C1ED38

label_C1ED00:
	SEP.b #$20
	LDA.l DATA_EF05A6,X
	AND.w $9F79
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C1ED33
	TXA
	INC
	STA.b $06
	STZ.b $08
	BPL.b label_C1ED1A
	DEC.b $08
label_C1ED1A:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C1AD0A
	LDA.w #$C7C973
	STA.b $0E
	LDA.w #$C7C973>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
label_C1ED33:
	LDX.b $12
	INX
	STX.b $12
label_C1ED38:
	STX.b $02
	LDA.w #$0003
	CLC
	SBC.b $02
	BVS.b label_C1ED46
	BPL.b label_C1ED00
	BRA.b label_C1ED48

label_C1ED46:
	BMI.b label_C1ED00
label_C1ED48:
	JSR.w label_C10084
	SEP.b #$20
	STZ.w $9F79
	REP.b #$20
	LDA.w #$9C8A
	JSL.l label_C20ABC
label_C1ED59:
	PLD
	RTS

;--------------------------------------------------------------------

label_C1ED5B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE0
	TCD
	PLA
	STA.b $02
	LDA.w #$0013
	JSR.w label_C104EE
	LDY.w #$0000
	STY.b $1E
	JMP.w label_C1EE58

;--------------------------------------------------------------------

org $C1ED75
label_C1ED75:
	TYA
	JSL.l label_EF0A68
	LDA.w $9826
	AND.w #$00FF
	BEQ.b label_C1EDE1
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0020
	REP.b #$20
	LDA.w #$9C9F
	JSL.l label_C08EFC
	LDY.b $1E
	TYA
	SEP.b #$20
	CLC
	ADC.b #$61
	STA.w $9C9F
	LDA.b #$6A
	STA.w $9CA0
	LDA.b #$50
	STA.w $9CA1
	LDX.w #$0000
	BRA.b label_C1EDC7

label_C1EDAC:
	SEP.b #$20
	STA.w $9CA2,X
	INX
label_C1EDB2:
	REP.b #$20
	LDA.w $99CE,X
	AND.w #$00FF
	BEQ.b label_C1EDC1
	CPX.w #$0005
	BCC.b label_C1EDAC
label_C1EDC1:
	SEP.b #$20
	STZ.w $9CA2,X
	INX
label_C1EDC7:
	CPX.w #$0005
	BCC.b label_C1EDB2
	LDA.b #$01
	STA.w $B49E,Y
	REP.b #$20
	LDA.w $99CD
	AND.w #$00FF
	XBA
	AND.w #$FF00
	STA.b $1C
	BRA.b label_C1EE28

label_C1EDE1:
	LDY.b $1E
	TYA
	SEP.b #$20
	CLC
	ADC.b #$61
	STA.w $9C9F
	REP.b #$20
	LDA.w #$7E9CA0
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #NameEntryScreenStrings
	STA.b $12
	LDA.w #NameEntryScreenStrings>>16
	STA.b $14
	LDA.w #$0010
	JSL.l label_C08EED
	SEP.b #$20
	STZ.w $9CB0
	LDY.b $1E
	TYX
	STZ.w $B49E,X
	REP.b #$20
	LDA.w #$0100
	STA.b $1C
label_C1EE28:
	STY.b $04
	INC.b $04
	LDA.w #$9C9F
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$0000
	STA.b $14
	LDA.b $1C
	ORA.b $04
	JSR.w label_C115F4
	LDY.b $04
	STY.b $1E
label_C1EE58:
	CPY.w #$0003
	BCS.b label_C1EE62
	BEQ.b label_C1EE62
	JMP.w label_C1ED75

label_C1EE62:
	LDY.w #$0000
	TYX
	LDA.w #$0001
	JSR.w label_C1180D
	LDY.w #$0000
	STY.b $1A
	JMP.w label_C1EFCE

label_C1EE74:
	TYA
	JSL.l label_EF0A68
	LDA.w $9826
	AND.w #$00FF
	BNE.b label_C1EE84
	JMP.w label_C1EFC9

label_C1EE84:
	LDA.w #$9C9F
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #NameEntryScreenStrings_Level
	STA.b $12
	LDA.w #NameEntryScreenStrings_Level>>16
	STA.b $14
	LDA.w #$0006
	JSL.l label_C08EED
	SEP.b #$20
	STZ.w $9CA5
	LDY.b $1A
	TYX
	REP.b #$20
	LDA.w #$0009
	JSL.l label_C438A5
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0020
	JSR.w label_C10EFC
	SEP.b #$20
	LDA.w $99D3
	STA.b $06
	STZ.b $07
	STZ.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C10D7C
	TAX
	CPX.w #$0001
	BNE.b label_C1EEF0
	LDA.w #$0050
	BRA.b label_C1EF03

label_C1EEF0:
	STX.b $04
	LDA.w #$0007
	SEC
	SBC.b $04
	TAX
	LDA.w $895A,X
	AND.w #$00FF
	CLC
	ADC.w #$0060
label_C1EF03:
	SEP.b #$20
	STA.w $9C9F
	LDA.w $8960
	CLC
	ADC.b #$60
	STA.w $9CA0
	STZ.w $9CA1
	LDY.b $1A
	TYX
	REP.b #$20
	LDA.w #$000D
	JSL.l label_C438A5
	LDA.w #$7E9C9F
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0020
	JSR.w label_C10EFC
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #NameEntryScreenStrings_TextSpeed
	STA.b $12
	LDA.w #NameEntryScreenStrings_TextSpeed>>16
	STA.b $14
	LDA.w #$000B
	JSL.l label_C08EED
	SEP.b #$20
	LDA.b #$50
	STA.w $9CAA
	REP.b #$20
	LDA.w #$7E9CAB
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #NameEntryScreenStrings_Fast
	STA.b $06
	LDA.w #NameEntryScreenStrings_Fast>>16
	STA.b $08
	LDA.w $98B6
	AND.w #$00FF
	DEC
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	CLC
	ADC.b $06
	STA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.w #$0007
	JSL.l label_C08EED
	LDY.b $1A
	TYX
	LDA.w #$0010
	JSL.l label_C438A5
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0020
	JSR.w label_C10EFC
label_C1EFC9:
	LDY.b $1A
	INY
	STY.b $1A
label_C1EFCE:
	CPY.w #$0003
	BCS.b label_C1EFD8
	BEQ.b label_C1EFD8
	JMP.w label_C1EE74

label_C1EFD8:
	LDA.b $02
	BEQ.b label_C1F03E
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $867B,X
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAY
	STY.b $1C
	LDA.w $B4A1
	AND.w #$00FF
	TAX
	DEX
	BRA.b label_C1F019

label_C1F007:
	LDA.w $0002,Y
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAY
	STY.b $1C
	DEX
label_C1F019:
	BNE.b label_C1F007
	LDA.w #$0006
	JSR.w label_C10FEA
	LDY.b $1C
	LDA.w $000A,Y
	TAX
	LDA.w $0008,Y
	INC
	JSL.l label_C438A5
	STZ.w $5E6E
	JSL.l label_C43B15
	LDA.w #$0000
	JSR.w label_C10FEA
	BRA.b label_C1F06B

label_C1F03E:
	JSR.w label_C1ECDC
label_C1F041:
	LDA.w $0028
	AND.w #$00FF
	BNE.b label_C1F041
	LDA.w #$0003
	JSL.l label_C4FBBD
	LDA.w #label_C1ECD1
	STA.b $0E
	LDA.w #label_C1ECD1>>16
	STA.b $10
	JSR.w label_C11F5A
	LDA.w #$0000
	JSR.w label_C1196A
	SEP.b #$20
	STA.w $B4A1
	JSR.w label_C11F8A
label_C1F06B:
	LDA.w $B4A1
	AND.w #$00FF
	DEC
	JSL.l label_EF0A68
	LDA.w $B4A1
	AND.w #$00FF
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Related to the "Continue/Copy/Delete/Set Up" menu. It's the first routine called that's specific to this menu.

label_C1F07E:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDA.w #$0014
	JSR.w label_C104EE
	LDA.w #NameEntryScreenStrings_Continue
	STA.b $0E
	LDA.w #NameEntryScreenStrings_Continue>>16
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$0000
	STA.b $14
	LDY.w #$0000
	TYX
	LDA.w #$0001
	JSR.w label_C1153B
	LDX.w #$0000
	BRA.b label_C1F0E8

label_C1F0AF:
	LDA.w $B4A1
	AND.w #$00FF
	DEC
	STA.b $02
	TXA
	CMP.b $02
	BEQ.b label_C1F0E7
	LDA.w $B49E,X
	AND.w #$00FF
	BNE.b label_C1F0E7
	LDA.w #NameEntryScreenStrings_CopyFile
	STA.b $0E
	LDA.w #NameEntryScreenStrings_CopyFile>>16
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$0000
	STA.b $14
	LDY.w #$0000
	LDX.w #$0006
	LDA.w #$0002
	JSR.w label_C1153B
	BRA.b label_C1F0F8

label_C1F0E7:
	INX
label_C1F0E8:
	STX.b $02
	LDA.w #$0003
	CLC
	SBC.b $02
	BVS.b label_C1F0F6
	BPL.b label_C1F0AF
	BRA.b label_C1F0F8

label_C1F0F6:
	BMI.b label_C1F0AF
label_C1F0F8:
	LDA.w #$0000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	LDA.w #NameEntryScreenStrings_DeleteFile
	STA.b $0E
	LDA.w #NameEntryScreenStrings_DeleteFile>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDY.w #$0000
	LDX.w #$000A
	LDA.w #$0003
	JSR.w label_C1153B
	LDA.w #NameEntryScreenStrings_SetUp
	STA.b $0E
	LDA.w #NameEntryScreenStrings_SetUp>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDY.w #$0000
	LDX.w #$000F
	LDA.w #$0004
	JSR.w label_C1153B
	JSR.w label_C1163C
	LDA.w #$00FF
	STA.w $5E6E
	LDA.w #$0001
	JSR.w label_C1196A
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Related to selecting Copy

org $C1F14F
label_C1F14F:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE8
	TCD
	LDX.w #$0000
	TXY
	BRA.b label_C1F167

label_C1F15D:
	LDA.w $B49E,X
	AND.w #$00FF
	BNE.b label_C1F166
	INY
label_C1F166:
	INX
label_C1F167:
	STX.b $02
	LDA.w #$0003
	CLC
	SBC.b $02
	BVS.b label_C1F175
	BPL.b label_C1F15D
	BRA.b label_C1F177

label_C1F175:
	BMI.b label_C1F15D
label_C1F177:
	CPY.w #$0001
	BEQ.b label_C1F17F
	JMP.w label_C1F1FE

label_C1F17F:
	LDA.w #$0016
	JSR.w label_C104EE
	JSL.l label_C3E4D4
	LDA.w #NameEntryScreenStrings_CopyToWhere
	STA.b $0E
	LDA.w #NameEntryScreenStrings_CopyToWhere>>16
	STA.b $10
	LDA.w #$000E
	JSR.w label_C10EFC
	LDA.w #$0000
	STA.b $02
	BRA.b label_C1F1ED

label_C1F1A0:
	LDX.b $02
	LDA.w $B49E,X
	AND.w #$00FF
	BNE.b label_C1F1EB
	LDA.b $02
	SEP.b #$20
	CLC
	ADC.b #$61
	STA.w $9C9F
	LDA.b #$6A
	STA.w $9CA0
	STZ.w $9CA1
	REP.b #$20
	LDA.w #$7E9C9F
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$0000
	STA.b $14
	LDY.w #$0001
	LDX.w #$0000
	LDA.b $02
	INC
	JSR.w label_C1153B
label_C1F1EB:
	INC.b $02
label_C1F1ED:
	LDA.w #$0003
	CLC
	SBC.b $02
	BVS.b label_C1F1F9
	BPL.b label_C1F1A0
	BRA.b label_C1F1FB

label_C1F1F9:
	BMI.b label_C1F1A0
label_C1F1FB:
	JMP.w label_C1F281

label_C1F1FE:
	LDA.w #$0015
	JSR.w label_C104EE
	JSL.l label_C3E4D4
	LDA.w #NameEntryScreenStrings_CopyToWhere
	STA.b $0E
	LDA.w #NameEntryScreenStrings_CopyToWhere>>16
	STA.b $10
	LDA.w #$000E
	JSR.w label_C10EFC
	LDA.w #$0000
	STA.b $02
	LDA.w #$0001
	STA.b $04
	BRA.b label_C1F273

label_C1F224:
	LDX.b $02
	LDA.w $B49E,X
	AND.w #$00FF
	BNE.b label_C1F271
	LDA.b $02
	SEP.b #$20
	CLC
	ADC.b #$61
	STA.w $9C9F
	LDA.b #$6A
	STA.w $9CA0
	STZ.w $9CA1
	LDX.b $04
	REP.b #$20
	INC.b $04
	LDA.w #$7E9C9F
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$0000
	STA.b $14
	TXY
	LDX.w #$0000
	LDA.b $02
	INC
	JSR.w label_C1153B
label_C1F271:
	INC.b $02
label_C1F273:
	LDA.w #$0003
	CLC
	SBC.b $02
	BVS.b label_C1F27F
	BPL.b label_C1F224
	BRA.b label_C1F281

label_C1F27F:
	BMI.b label_C1F224
label_C1F281:
	JSR.w label_C1163C
	LDA.w #$0001
	JSR.w label_C1196A
	TAY
	STY.b $16
	BEQ.b label_C1F29D
	LDA.w $B4A1
	AND.w #$00FF
	TAX
	DEX
	TYA
	DEC
	JSL.l label_EF0C15
label_C1F29D:
	STZ.w $5E6E
	JSR.w label_C10084
	LDY.b $16
	TYA
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Related to selecting Delete

label_C1F2A8:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE8
	TCD
	LDA.w #$0017
	JSR.w label_C104EE
	JSL.l label_C3E4D4
	LDA.w #$0000
	JSR.w label_C10EB4
	LDX.w #$0000
	TXA
	JSL.l label_C438A5
	LDA.w #NameEntryScreenStrings_WantToDelete
	STA.b $0E
	LDA.w #NameEntryScreenStrings_WantToDelete>>16
	STA.b $10
	LDA.w #$0020
	JSR.w label_C10EFC
	LDX.w #$0001
	LDA.w #$0000
	JSL.l label_C43D75
	LDX.w #$0001
	LDA.w #$0000
	JSL.l label_C438A5
	SEP.b #$20
	LDA.w $B4A1
	STA.b $06
	STZ.b $07
	STZ.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C10DF6
	LDA.w #$006A
	JSR.w label_C10CB6
	LDX.w #$0001
	LDA.w #$0002
	JSL.l label_C438A5
	LDA.w #$0001
	JSR.w label_C1931B
	LDX.w #$0001
	LDA.w #$0008
	JSL.l label_C438A5
	LDA.w #NameEntryScreenStrings_Level
	STA.b $0E
	LDA.w #NameEntryScreenStrings_Level>>16
	STA.b $10
	LDA.w #$0006
	JSR.w label_C10EFC
	LDX.w #$0001
	LDA.w #$000C
	JSL.l label_C438A5
	SEP.b #$20
	LDA.w $99D3
	STA.b $06
	STZ.b $07
	STZ.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSR.w label_C10DF6
	LDA.w #$0000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	LDA.w #NameEntryScreenStrings_DeleteNo
	STA.b $0E
	LDA.w #NameEntryScreenStrings_DeleteNo>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDY.w #$0002
	LDX.w #$0000
	TXA
	JSR.w label_C1153B
	LDA.w #NameEntryScreenStrings_DeleteYes
	STA.b $0E
	LDA.w #NameEntryScreenStrings_DeleteYes>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDY.w #$0003
	LDX.w #$0000
	LDA.w #$0001
	JSR.w label_C1153B
	JSR.w label_C1163C
	LDA.w #$0001
	JSR.w label_C1196A
	TAX
	STX.b $16
	BEQ.b label_C1F3B7
	LDA.w $B4A1
	AND.w #$00FF
	DEC
	JSL.l label_EF0BFA
label_C1F3B7:
	STZ.w $5E6E
	JSR.w label_C10084
	LDX.b $16
	TXA
	PLD
	RTS

;--------------------------------------------------------------------

label_C1F3C2:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE6
	TCD
	LDA.w #$0018
	JSR.w label_C104EE
	JSL.l label_C3E4D4
	LDA.w #$C0E5
	STA.b $0E
	LDA.w #$00C4
	STA.b $10
	LDA.w #$0019
	JSR.w label_C10EFC
	LDA.w #$C07F
	STA.b $06
	LDA.w #$00C4
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.w #$0000
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDX.w #$0001
	LDA.w #$0000
	JSR.w label_C114B1
	LDA.w #$0007
	LDX.b $16
	STX.b $06
	LDX.b $18
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDX.w #$0002
	LDA.w #$0000
	JSR.w label_C114B1
	LDA.w #$000E
	LDX.b $16
	STX.b $06
	LDX.b $18
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDX.w #$0003
	LDA.w #$0000
	JSR.w label_C114B1
	LDA.w $98B6
	AND.w #$00FF
	BEQ.b label_C1F48E
	AND.w #$00FF
	TAX
	DEX
	BRA.b label_C1F491

label_C1F48E:
	LDX.w #$0001
label_C1F491:
	TXA
	JSR.w label_C11887
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to selecting something in a text box.

label_C1F497:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	TAX
	STX.b $16
	LDA.w #$0018
	STA.w $8958
	JSL.l label_C3E4D4
	LDX.b $16
	BNE.b label_C1F4B5
	JMP.w label_C1F542

label_C1F4B5:
	JSL.l label_C1F3C2
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $867B,X
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAY
	STY.b $14
	LDA.w $98B6
	AND.w #$00FF
	TAX
	DEX
	BRA.b label_C1F4F6

label_C1F4E4:
	LDA.w $0002,Y
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAY
	STY.b $14
	DEX
label_C1F4F6:
	BNE.b label_C1F4E4
	LDA.w #$0006
	JSR.w label_C10FEA
	LDY.b $14
	LDA.w $000A,Y
	TAX
	LDA.w $0008,Y
	INC
	JSL.l label_C438A5
	LDY.b $14
	TYA
	CLC
	ADC.w #$0013
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0001
	LDA.w #$FFFF
	JSL.l label_C43BB9
	LDA.w #$0000
	JSR.w label_C10FEA
	LDA.w $98B6
	AND.w #$00FF
	TAX
	STX.b $12
	BRA.b label_C1F563

label_C1F542:
	STZ.w $5E6E
	LDA.w #$0001
	JSR.w label_C1196A
	TAX
	STX.b $12
	BEQ.b label_C1F563
	TXA
	SEP.b #$20
	STA.w $98B6
	REP.b #$20
	LDA.w $B4A1
	AND.w #$00FF
	DEC
	JSL.l label_EF0A4D
label_C1F563:
	LDX.b $12
	TXA
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to the sound options text box

label_C1F568:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE6
	TCD
	LDA.w #$0019
	JSR.w label_C104EE
	JSL.l label_C3E4D4
	LDA.w #NameEntryScreenStrings_SoundSettings
	STA.b $0E
	LDA.w #NameEntryScreenStrings_SoundSettings>>16
	STA.b $10
	LDA.w #$001C
	JSR.w label_C10EFC
	LDA.w #NameEntryScreenStrings_Stereo
	STA.b $0A
	LDA.w #NameEntryScreenStrings_Stereo>>16
	STA.b $0C
	LDA.w #$0000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDX.w #$0001
	LDA.w #$0000
	JSR.w label_C114B1
	LDA.w #$0007
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDX.w #$0002
	LDA.w #$0000
	JSR.w label_C114B1
	LDA.w $98B7
	AND.w #$00FF
	BEQ.b label_C1F60D
	AND.w #$00FF
	TAX
	DEX
	BRA.b label_C1F610

label_C1F60D:
	LDX.w #$0000
label_C1F610:
	TXA
	JSR.w label_C11887
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to the sound options text box

label_C1F616:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	TAX
	STX.b $16
	LDA.w #$0019
	STA.w $8958
	JSL.l label_C3E4D4
	LDX.b $16
	BNE.b label_C1F634
	JMP.w label_C1F6C0

label_C1F634:
	JSR.w label_C1F568
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $867B,X
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAY
	STY.b $14
	LDA.w $98B7
	AND.w #$00FF
	TAX
	DEX
	BRA.b label_C1F674

label_C1F662:
	LDA.w $0002,Y
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAY
	STY.b $14
	DEX
label_C1F674:
	BNE.b label_C1F662
	LDA.w #$0006
	JSR.w label_C10FEA
	LDY.b $14
	LDA.w $000A,Y
	TAX
	LDA.w $0008,Y
	INC
	JSL.l label_C438A5
	LDY.b $14
	TYA
	CLC
	ADC.w #$0013
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0001
	LDA.w #$FFFF
	JSL.l label_C43BB9
	LDA.w #$0000
	JSR.w label_C10FEA
	LDA.w $98B7
	AND.w #$00FF
	TAX
	STX.b $12
	BRA.b label_C1F6DE

label_C1F6C0:
	LDA.w #$0001
	JSR.w label_C1196A
	TAX
	STX.b $12
	BEQ.b label_C1F6D1
	TXA
	SEP.b #$20
	STA.w $98B7
label_C1F6D1:
	REP.b #$20
	LDA.w $B4A1
	AND.w #$00FF
	DEC
	JSL.l label_EF0A4D
label_C1F6DE:
	LDX.b $12
	TXA
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to the text border options

label_C1F6E3:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE6
	TCD
	LDA.w #$0032
	JSR.w label_C104EE
	JSL.l label_C3E4D4
	LDA.w #NameEntryScreenStrings_WindowStyle
	STA.b $0E
	LDA.w #NameEntryScreenStrings_WindowStyle>>16
	STA.b $10
	LDA.w #$0025
	JSR.w label_C10EFC
	LDA.w #$0000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	LDA.w #NameEntryScreenStrings_PlainFlavor
	STA.b $0E
	LDA.w #NameEntryScreenStrings_PlainFlavor>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDX.w #$0002
	LDA.w #$0000
	JSR.w label_C114B1
	LDA.w #NameEntryScreenStrings_MintFlavor
	STA.b $0E
	LDA.w #NameEntryScreenStrings_MintFlavor>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDX.w #$0003
	LDA.w #$0000
	JSR.w label_C114B1
	LDA.w #NameEntryScreenStrings_StrawberryFlavor
	STA.b $0E
	LDA.w #NameEntryScreenStrings_StrawberryFlavor>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDX.w #$0004
	LDA.w #$0000
	JSR.w label_C114B1
	LDA.w #NameEntryScreenStrings_BananaFlavor
	STA.b $0E
	LDA.w #NameEntryScreenStrings_BananaFlavor>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDX.w #$0005
	LDA.w #$0000
	JSR.w label_C114B1
	LDA.w #NameEntryScreenStrings_PeanutFlavor
	STA.b $0E
	LDA.w #NameEntryScreenStrings_PeanutFlavor>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDX.w #$0006
	LDA.w #$0000
	JSR.w label_C114B1
	LDX.w #$99CD
	LDA.w $0000,X
	AND.w #$00FF
	BNE.b label_C1F7A8
	SEP.b #$20
	LDA.b #$01
	STA.w $0000,X
label_C1F7A8:
	LDX.w #$99CD
	STX.b $18
	REP.b #$20
	LDA.w $0000,X
	AND.w #$00FF
	DEC
	JSR.w label_C11887
	LDA.w #label_C1EC8F
	STA.b $0E
	LDA.w #label_C1EC8F>>16
	STA.b $10
	JSR.w label_C11F5A
	LDA.w #$0001
	JSR.w label_C1196A
	TAY
	STY.b $16
	BEQ.b label_C1F7DB
	TYA
	SEP.b #$20
	LDX.b $18
	STA.w $0000,X
	BRA.b label_C1F7F3

label_C1F7DB:
	LDX.b $18
	LDA.w $0000,X
	AND.w #$00FF
	BEQ.b label_C1F7EB
	AND.w #$00FF
	TAX
	BRA.b label_C1F7EE

label_C1F7EB:
	LDX.w #$0001
label_C1F7EE:
	TXA
	JSL.l label_C1EC8F
label_C1F7F3:
	REP.b #$20
	LDA.w $B4A1
	AND.w #$00FF
	DEC
	JSL.l label_EF0A4D
	LDY.b $16
	TYA
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to the file select/option text boxes.

label_C1F805:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFDA
	TCD
label_C1F80D:
	JSL.l label_C3E4D4
	LDA.w #$0000
	JSR.w label_C1ED5B
	TAX
	DEX
	LDA.w $B49E,X
	AND.w #$00FF
	BNE.b label_C1F824
	JMP.w label_C1F8B9

label_C1F824:								; Note: Handles which option has been selected in the Continue/Copy/Delete/Set Up menu in order. #$0000 corresponds to closing the menu.
	JSR.w label_C1F07E
	CMP.w #$0000
	BEQ.b label_C1F842
	CMP.w #$0001
	BEQ.b label_C1F847
	CMP.w #$0002
	BEQ.b label_C1F85E
	CMP.w #$0003
	BEQ.b label_C1F868
	CMP.w #$0004
	BEQ.b label_C1F872
	BRA.b label_C1F8B3

label_C1F842:
	JSR.w label_C10084
	BRA.b label_C1F80D

label_C1F847:
	JSL.l label_C064D4
	JSL.l label_C07213
	LDA.w !RAM_EB_Player_XPosLo
	STA.w $9D1F
	LDA.w !RAM_EB_Player_YPosLo
	STA.w $9D21
	JMP.w label_C1FEC2

label_C1F85E:
	JSR.w label_C1F14F
	CMP.w #$0000
	BEQ.b label_C1F824
	BRA.b label_C1F8B3

label_C1F868:
	JSR.w label_C1F2A8
	CMP.w #$0000
	BEQ.b label_C1F824
	BRA.b label_C1F8B3

label_C1F872:
	JSL.l label_C1F3C2
label_C1F876:
	LDA.w #$0000
	JSL.l label_C1F497
	CMP.w #$0000
	BNE.b label_C1F88B
	LDA.w #$0018
	JSL.l label_C3E521
	BRA.b label_C1F824

label_C1F88B:
	JSR.w label_C1F568
label_C1F88E:
	LDA.w #$0000
	JSR.w label_C1F616
	CMP.w #$0000
	BNE.b label_C1F8A2
	LDA.w #$0019
	JSL.l label_C3E521
	BRA.b label_C1F876

label_C1F8A2:
	JSR.w label_C1F6E3
	CMP.w #$0000
	BNE.b label_C1F8B3
	LDA.w #$0032
	JSL.l label_C3E521
	BRA.b label_C1F88E

label_C1F8B3:
	JSR.w label_C1008E
	JMP.w label_C1F80D

label_C1F8B9:
	JSL.l label_C1F3C2
label_C1F8BD:
	LDA.w #$0000
	JSL.l label_C1F497
	CMP.w #$0000
	BNE.b label_C1F8D3
	LDA.w #$0018
	JSL.l label_C3E521
	JMP.w label_C1F80D

label_C1F8D3:
	JSR.w label_C1F568
label_C1F8D6:
	LDA.w #$0000
	JSR.w label_C1F616
	CMP.w #$0000
	BNE.b label_C1F8EA
	LDA.w #$0019
	JSL.l label_C3E521
	BRA.b label_C1F8BD

label_C1F8EA:
	JSR.w label_C1F6E3
	CMP.w #$0000
	BNE.b label_C1F8FB
	LDA.w #$0032
	JSL.l label_C3E521
	BRA.b label_C1F8D6

label_C1F8FB:
	LDA.w #$0002
	JSL.l label_C4FBBD
label_C1F902:
	JSR.w label_C1008E
	LDA.w #$0000
	STA.b $04
	STA.b $24
	JMP.w label_C1FAAE

;--------------------------------------------------------------------

; Note: Something related to the name entry screen?

label_C1F90F:
	LDA.b $04
	CMP.w #$FFFF
	BNE.b label_C1F935
	JSR.w label_C1008E
	LDA.w #$0001
	JSR.w label_C1ED5B
	LDA.w #$0001
	JSL.l label_C1F497
	LDA.w #$0001
	JSR.w label_C1F616
	LDA.w #$0003
	JSL.l label_C4FBBD
	BRA.b label_C1F8EA

label_C1F935:
	LDA.b $04
	JSL.l label_C4D7D9
	LDA.w #$0004
	CLC
	SBC.b $04
	BVC.b label_C1F947
	BPL.b label_C1F9A5
	BRA.b label_C1F949

label_C1F947:
	BMI.b label_C1F9A5
label_C1F949:
	LDA.w #NameEntryScreenStrings_NameNess
	STA.b $06
	LDA.w #NameEntryScreenStrings_NameNess>>16
	STA.b $08
	LDA.b $04
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0028
	STA.b $12
	LDA.b $24
	STA.b $04
	LDY.b $04
	STY.b $22
	LDA.b $04
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	TAX
	LDA.w #$0005
	LDY.b $22
	JSR.w label_C1EC04
	CMP.w #$0000
	BEQ.b label_C1F99B
	LDA.w #$FFFF
	STA.b $02
	STA.b $20
	JMP.w label_C1FA9B

label_C1F99B:
	LDA.w #$0001
	STA.b $02
	STA.b $20
	JMP.w label_C1FA9B

label_C1F9A5:
	LDA.b $04
	CMP.w #$0004
	BNE.b label_C1F9F9
	LDA.w #NameEntryScreenStrings_NameNess
	STA.b $06
	LDA.w #NameEntryScreenStrings_NameNess>>16
	STA.b $08
	LDA.b $04
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0028
	STA.b $12
	LDA.b $24
	STA.b $04
	LDY.b $04
	LDX.w #$9819
	LDA.w #$0006
	JSR.w label_C1EC04
	CMP.w #$0000
	BEQ.b label_C1F9EF
	LDA.w #$FFFF
	STA.b $02
	STA.b $20
	JMP.w label_C1FA9B

label_C1F9EF:
	LDA.w #$0001
	STA.b $02
	STA.b $20
	JMP.w label_C1FA9B

label_C1F9F9:
	LDA.b $04
	CMP.w #$0005
	BNE.b label_C1FA4B
	LDA.w #NameEntryScreenStrings_NameNess
	STA.b $06
	LDA.w #NameEntryScreenStrings_NameNess>>16
	STA.b $08
	LDA.b $04
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0028
	STA.b $12
	LDA.b $24
	STA.b $04
	LDY.b $04
	LDX.w #$981F
	LDA.w #$0006
	JSR.w label_C1EC04
	CMP.w #$0000
	BEQ.b label_C1FA42
	LDA.w #$FFFF
	STA.b $02
	STA.b $20
	BRA.b label_C1FA9B

label_C1FA42:
	LDA.w #$0001
	STA.b $02
	STA.b $20
	BRA.b label_C1FA9B

label_C1FA4B:
	LDA.b $04
	CMP.w #$0006
	BNE.b label_C1FA9B
	LDA.w #NameEntryScreenStrings_NameNess
	STA.b $06
	LDA.w #NameEntryScreenStrings_NameNess>>16
	STA.b $08
	LDA.b $04
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0028
	STA.b $12
	LDA.b $24
	STA.b $04
	LDY.b $04
	LDX.w #$9829
	LDA.w #$0006
	JSR.w label_C1EC04
	CMP.w #$0000
	BEQ.b label_C1FA94
	LDA.w #$FFFF
	STA.b $02
	STA.b $20
	BRA.b label_C1FA9B

label_C1FA94:
	LDA.w #$0001
	STA.b $02
	STA.b $20
label_C1FA9B:
	LDA.b $04
	JSL.l label_C4D830
	LDA.b $20
	STA.b $02
	LDA.b $04
	CLC
	ADC.b $02
	STA.b $04
	STA.b $24
label_C1FAAE:						; Note: Main entry
	LDA.w #$0007
	CLC
	SBC.b $04
	BVS.b label_C1FABB
	BMI.b label_C1FAC0
	JMP.w label_C1F90F

label_C1FABB:
	BPL.b label_C1FAC0
	JMP.w label_C1F90F

label_C1FAC0:
	JSR.w label_C1008E
	JSL.l label_C3E4D4
	LDX.w #$0000
	STX.b $24
	BRA.b label_C1FAE3

label_C1FACE:
	TXA
	CLC
	ADC.w #$001D
	JSR.w label_C104EE
	LDX.b $24
	INX
	STX.b $24
	TXA
	JSR.w label_C1931B
	LDX.b $24
	STX.b $24
label_C1FAE3:
	STX.b $04
	LDA.w #$0004
	CLC
	SBC.b $04
	BVS.b label_C1FAF1
	BPL.b label_C1FACE
	BRA.b label_C1FAF3

label_C1FAF1:
	BMI.b label_C1FACE
label_C1FAF3:
	LDA.w #$0021
	JSR.w label_C104EE
	LDA.w #$0007
	JSR.w label_C1931B
	LDA.w #$0022
	JSR.w label_C104EE
	LDA.w #$C2AC
	STA.b $0E
	LDA.w #$00C4
	STA.b $10
	LDA.w #$000E
	JSR.w label_C10EFC
	LDA.w #$7E981F
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l label_C08F22
	STA.b $1E
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0000
	LDA.b $1E
	JSL.l label_C44FF3
	TAX
	ASL
	PHP
	LSR
	LSR
	LSR
	LSR
	PLP
	BCC.b label_C1FB50
	ORA.w #$F000
label_C1FB50:
	STA.b $24
	LDY.w #$0008
	TXA
	JSL.l label_C091F4
	CMP.w #$0000
	BNE.b label_C1FB66
	LDA.b $24
	CMP.w #$0006
	BNE.b label_C1FB69
label_C1FB66:
	LDA.b $24
	INC
label_C1FB69:
	LDX.w #$0001
	STX.b $1C
	STA.b $04
	LDA.w $8928
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $865A,X
	SEC
	SBC.b $04
	LDX.b $1C
	JSL.l label_C438A5
	LDA.w #$7E981F
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l label_C08F22
	STA.b $24
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $24
	JSR.w label_C10EFC
	LDA.w #$0023
	JSR.w label_C104EE
	LDA.w #NameEntryScreenStrings_Coolest
	STA.b $0E
	LDA.w #NameEntryScreenStrings_Coolest>>16
	STA.b $10
	LDA.w #$000E
	JSR.w label_C10EFC
	LDA.w #$7E9829
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l label_C08F22
	STA.b $1E
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0000
	LDA.b $1E
	JSL.l label_C44FF3
	TAX
	ASL
	PHP
	LSR
	LSR
	LSR
	LSR
	PLP
	BCC.b label_C1FC02
	ORA.w #$F000
label_C1FC02:
	STA.b $24
	LDY.w #$0008
	TXA
	JSL.l label_C091F4
	CMP.w #$0000
	BNE.b label_C1FC18
	LDA.b $24
	CMP.w #$0006
	BNE.b label_C1FC1B
label_C1FC18:
	LDA.b $24
	INC
label_C1FC1B:
	LDX.w #$0001
	STX.b $22
	STA.b $04
	LDA.w $892A
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $865A,X
	SEC
	SBC.b $04
	LDX.b $22
	JSL.l label_C438A5
	LDA.w #$7E9829
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l label_C08F22
	STA.b $24
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $24
	JSR.w label_C10EFC
	LDA.w #$0024
	JSR.w label_C104EE
	LDA.w #NameEntryScreenStrings_AreYouSure
	STA.b $0E
	LDA.w #NameEntryScreenStrings_AreYouSure>>16
	STA.b $10
	LDA.w #$000D
	JSR.w label_C10EFC
	LDA.w #$0000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	LDA.w #NameEntryScreenStrings_ConfirmYes
	STA.b $0E
	LDA.w #NameEntryScreenStrings_ConfirmYes>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDY.w #$0000
	LDX.w #$000E
	LDA.w #$0001
	JSR.w label_C1153B
	LDA.w #NameEntryScreenStrings_ConfirmNo
	STA.b $0E
	LDA.w #NameEntryScreenStrings_ConfirmNo>>16
	STA.b $10
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDY.w #$0000
	LDX.w #$0012
	TYA
	JSR.w label_C1153B
	JSR.w label_C1163C
	JSL.l label_C4D8FA
	LDA.w #$00FF
	STA.w $5E6E
	LDA.w #$0001
	JSR.w label_C1196A
	TAX
	BNE.b label_C1FCDA
	JSL.l label_C021E6
	JMP.w label_C1F902

label_C1FCDA:
	LDA.w #$009E
	JSL.l label_C4FBBD
	JSL.l label_C12DD5
	LDX.w #$0000
	STX.b $24
	BRA.b label_C1FCF5

label_C1FCEC:
	JSL.l label_C1004E
	LDX.b $24
	INX
	STX.b $24
label_C1FCF5:
	STX.b $02
	LDA.w #$00B4
	CLC
	SBC.b $02
	BVS.b label_C1FD03
	BPL.b label_C1FCEC
	BRA.b label_C1FD05

label_C1FD03:
	BMI.b label_C1FCEC
label_C1FD05:
	JSL.l label_C021E6
	STZ.b $1E
	JMP.w label_C1FDE4

label_C1FD0E:
	LDA.b $1E
	STA.b $04
	INC.b $04
	LDA.b $04
	STA.b $24
	LDA.w #EB_InitialCharacterStats
	STA.b $06
	LDA.w #EB_InitialCharacterStats>>16
	STA.b $08
	LDA.b $1E
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	ASL
	STA.b $02
	LDY.w #$0000
	LDA.b $02
	CLC
	ADC.w #$0006
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	TAX
	LDA.b $24
	STA.b $04
	JSR.w label_C1D8D0
	LDA.b $02
	CLC
	ADC.w #$0008
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	BEQ.b label_C1FD72
	STA.b $06
	STZ.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0000
	LDA.b $04
	JSL.l label_C1D9E9
label_C1FD72:
	LDA.b $1E
	LDY.w #$005F
	JSL.l label_C08FF7
	TAY
	STY.b $1A
	LDA.w $99D8,Y
	STA.w $9A13,Y
	STA.w $9A15,Y
	LDA.w $99DA,Y
	STA.w $9A19,Y
	STA.w $9A1B,Y
	TYX
	STZ.w $9A17,X
	TYX
	STZ.w $9A11,X
	TYA
	CLC
	ADC.w #$99F1
	STA.b $02
	SEP.b #$20
	STZ.b $0E
	LDX.w #$000E
	REP.b #$20
	LDA.b $02
	JSL.l label_C08EFC
	LDA.w #EB_InitialCharacterStats
	STA.b $06
	LDA.w #EB_InitialCharacterStats>>16
	STA.b $08
	LDA.b $1E
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	ASL
	CLC
	ADC.w #$000A
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$000A
	LDA.b $02
	JSL.l label_C08ED2
	LDA.w #$0400
	LDY.b $1A
	STA.w $9A1D,Y
	INC.b $1E
label_C1FDE4:
	LDA.w #$0004
	CLC
	SBC.b $1E
	BVS.b label_C1FDF1
	BMI.b label_C1FDF6
	JMP.w label_C1FD0E

label_C1FDF1:
	BPL.b label_C1FDF6
	JMP.w label_C1FD0E

label_C1FDF6:
	LDA.w #EB_InitialCharacterStats
	STA.b $06
	LDA.w #EB_InitialCharacterStats>>16
	STA.b $08
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDY.w #$0004
	LDA.b [$06],Y
	STA.b $06
	STZ.b $08
	LDA.b $06
	STA.w $9831
	LDA.b $08
	STA.w $9833
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDY.w #$0002
	LDA.b [$06],Y
	ASL
	ASL
	ASL
	TAX
	LDA.b [$06]
	ASL
	ASL
	ASL
	JSL.l label_C0B65F
	SEP.b #$20
	LDA.b #$80
	STA.w $9825
	LDA.b #$83
	STA.w $9826
	LDA.b #$79
	STA.w $9827
	LDA.b #$50
	STA.w $9828
	REP.b #$20
	LDA.w #$0004
	STA.b $1E
	BRA.b label_C1FE71

label_C1FE54:
	LDA.b $1E
	CLC
	ADC.w #$9825
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	BNE.b label_C1FE6C
	SEP.b #$20
	LDA.b #$50
	STA.w $0000,X
	BRA.b label_C1FE81

label_C1FE6C:
	LDA.b $1E
	INC
	STA.b $1E
label_C1FE71:
	STA.b $02
	LDA.w #$000B
	CLC
	SBC.b $02
	BVS.b label_C1FE7F
	BPL.b label_C1FE54
	BRA.b label_C1FE81

label_C1FE7F:
	BMI.b label_C1FE54
label_C1FE81:							; Note: Executes a couple seconds after selecting "Yep" on the name entry confirmation screen
	SEP.b #$20
	LDA.b #$01
	STA.w $98B8
	REP.b #$20
	LDA.w !RAM_EB_Player_XPosLo
	STA.w $9D1F
	LDA.w !RAM_EB_Player_YPosLo
	STA.w $9D21
	JSL.l label_C064D4
	LDX.w #$06E8
	LDA.w #$0840
	JSL.l label_C0B65F
	LDA.w #DATA_C5E70B
	STA.b $0E
	LDA.w #DATA_C5E70B>>16
	STA.b $10
	JSL.l label_C46881
	LDX.w #$0001
	LDA.w #$000B
	JSL.l label_C2165E
	LDA.w #$0001
	STA.w $4A66
label_C1FEC2:
	JSR.w label_C1008E
	JSL.l label_C3EBCA
	LDA.w $98B6
	AND.w #$00FF
	STA.b $20
	TAX
	DEX
	LDA.w #DATA_C3FB1F
	STA.b $0A
	LDA.w #DATA_C3FB1F>>16
	STA.b $0C
	TXA
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.w $9627
	LDA.b $08
	STA.w $9629
	STX.w $9625
	LDA.b $20
	CMP.w #$0003
	BNE.b label_C1FF0A
	LDA.w #$0000
	BRA.b label_C1FF16

label_C1FF0A:
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	ASL
label_C1FF16:
	STA.w $964B
	STZ.w $5DBA
	LDA.w #DATA_C7DE2B
	STA.b $0E
	LDA.w #DATA_C7DE2B>>16
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
	PLD
	RTS

;--------------------------------------------------------------------

label_C1FF2C:
	REP.b #$31
	LDA.w $98A4
	AND.w #$00FF
	TAX
	DEX
	LDA.w $9891,X
	AND.w #$00FF
	ASL
	TAX
	LDA.w $4DC8,X
	TAX
	SEP.b #$20
	LDA.w $000E,X
	LDX.w #$0000
	REP.b #$20
	AND.w #$00FF
	CMP.w #$0001
	BEQ.b label_C1FF59
	CMP.w #$0002
	BNE.b label_C1FF5C
label_C1FF59:
	LDX.w #$0001
label_C1FF5C:
	LDA.w #$0000
	CPX.w $B4A2
	BEQ.b label_C1FF67
	LDA.w #$0001
label_C1FF67:
	STX.w $B4A2
	RTS

;--------------------------------------------------------------------

label_C1FF6B:
	REP.b #$31
	STZ.w $5E6E
	SEP.b #$20
	LDA.b #$01
	STA.w $B49D
	JSR.w label_C1F805
	JSL.l label_C3E4CA
	JSL.l label_C12DD5
	STZ.w $B4B6
	STZ.w $B4A2
	LDA.w #$00FF
	STA.w $5E6E
	SEP.b #$20
	STZ.w $B49D
	REP.b #$20
	LDA.w #$0000
	RTL

;--------------------------------------------------------------------

label_C1FF99:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	TXY
	STY.b $12
	TAX
	LDA.b $22
	STA.b $06
	LDA.b $24
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	TXA
	JSL.l label_C43E31
	STA.b $02
	LDY.b $12
	TYA
	ASL
	ASL
	ASL
	SEC
	SBC.b $02
	LSR
	STA.w $9E23
	LSR
	LSR
	LSR
	STA.w $9E25
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Copy protection related routine.

label_C1FFD3:
if !Define_EB_Global_DisableCopyDetection == !FALSE
	LDX.w #$0033
	REP.b #$20
	LDA.w #$0000
	STA.w !RAM_EB_Global_CopyDetectionDefeatedFlagLo
label_C1FFDE:
	CLC
	ADC.l CheckIfGameShouldRun_Main,X
	DEX
	BPL.b label_C1FFDE
	SEC
	SBC.l DATA_C1FFEF
	STA.w !RAM_EB_Global_CopyDetectionDefeatedFlagLo
	RTL

DATA_C1FFEF:
	dw $2AD8
else
	REP.b #$20
	LDA.w #$0000
	STA.w !RAM_EB_Global_CopyDetectionDefeatedFlagLo
	RTL
	%FREE_BYTES(NULLROM, 21, $00)
endif

;--------------------------------------------------------------------

	%FREE_BYTES(NULLROM, 15, $00)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankC2Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

label_C20000:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w $5D98
	BEQ.b label_C20010
	JMP.w label_C200B5

label_C20010:
	LDA.w $9881
	AND.w #$000C
	CMP.w #$0004
	BEQ.b label_C2001E
	JMP.w label_C200B5

label_C2001E:
	LDX.w #$0000
	STX.b $10
	JMP.w label_C200AB

label_C20026:
	REP.b #$20
	TXA
	CLC
	ADC.w #$97F5
	TAY
	LDA.w $0096,Y
	AND.w #$00FF
	BNE.b label_C20039
	JMP.w label_C200B5

label_C20039:
	AND.w #$00FF
	CLC
	SBC.w #$0004
	BVS.b label_C20046
	BPL.b label_C200B5
	BRA.b label_C20048

label_C20046:
	BMI.b label_C200B5
label_C20048:
	LDA.w $009C,Y
	AND.w #$00FF
	ASL
	TAX
	LDY.w $4DC8,X
	STY.w $4DC6
	LDA.w $000E,Y
	AND.w #$00FF
	TAY
	BEQ.b label_C20064
	CPY.w #$0007
	BNE.b label_C200A6
label_C20064:
	LDX.w $4DC6
	LDA.w $0018,X
	AND.w #$00FF
	STA.b $02
	LDA.w #$001E
	SEC
	SBC.b $02
	CMP.w #$8000
	BCC.b label_C2007F
	BEQ.b label_C2007F
	LDA.w #$0001
label_C2007F:
	LDY.w #$0064
	XBA
	AND.w #$FF00
	JSL.l label_C0915B
	STA.b $0E
	JSL.l label_C08E9A
	TAY
	LDA.b $0E
	STA.b $02
	TYA
	CMP.b $02
	BEQ.b label_C2009C
	BCS.b label_C200A6
label_C2009C:
	SEP.b #$20
	LDA.b #$06
	LDX.w $4DC6
	STA.w $000E,X
label_C200A6:
	LDX.b $10
	INX
	STX.b $10
label_C200AB:
	CPX.w #$0006
	BCS.b label_C200B5
	BEQ.b label_C200B5
	JMP.w label_C20026

label_C200B5:
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

DATA_C200B9:
	dw $FFF8,$0000,$0007,$FFF8,$0000,$0007

DATA_C200C5:
	dw $0000,$0000,$0000,$0007,$0007,$0007,$001E,$0033
	dw $001E,$0033

;--------------------------------------------------------------------

label_C200D9:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	SEP.b #$20
	STZ.w $89C9
	REP.b #$20
	LDA.w #$FFFF
	STA.w $89D2
	STA.w $89D0
	STA.w $89CE
	STA.w $89CC
	STA.w $89CA
	SEP.b #$20
	STZ.w $9622
	STZ.w $9623
	REP.b #$20
	STZ.w $9641
	SEP.b #$20
	STZ.w $9624
	REP.b #$20
	LDA.w #$FFFF
	STA.w $88E0
	STA.w $88E2
	LDA.w #$0000
	STA.b $10
	BRA.b label_C20131

label_C2011E:
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w #$FFFF
	STA.w $8654,X
	LDA.b $10
	INC
	STA.b $10
label_C20131:
	CMP.w #$0008
	BNE.b label_C2011E
	LDA.w #$0000
	STA.b $10
	BRA.b label_C2014A

label_C2013D:
	ASL
	TAX
	LDA.w #$FFFF
	STA.w $88E4,X
	LDA.b $10
	INC
	STA.b $10
label_C2014A:
	CMP.w #$0035
	BNE.b label_C2013D
	LDA.w #$0000
	STA.b $10
	BRA.b label_C20163

label_C20156:
	ASL
	TAX
	LDA.w #$FFFF
	STA.w $894E,X
	LDA.b $10
	INC
	STA.b $10
label_C20163:
	CMP.w #$0005
	BNE.b label_C20156
	LDA.w #$FFFF
	STA.w $5E7A
	STA.w $5E7C
	LDY.w #$7DFE
	LDX.w #$0380
	BRA.b label_C20182

label_C20179:
	LDA.w #$0000
	STA.w $0000,Y
	INY
	INY
	DEX
label_C20182:
	BNE.b label_C20179
	LDA.w #$0000
	STA.b $10
	BRA.b label_C2019B

label_C2018B:
	LDY.w #$002D
	JSL.l label_C08FF7
	TAX
	STZ.w $89D4,X
	LDA.b $10
	INC
	STA.b $10
label_C2019B:
	CMP.w #$0046
	BNE.b label_C2018B
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C201D5

label_C201A7:
	LDX.w #$0000
	STX.b $10
	BRA.b label_C201C9

label_C201AE:
	STX.b $02
	REP.b #$20
	LDA.b $0E
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	SEP.b #$20
	LDA.b #$FF
	STA.w $9D23,X
	LDX.b $10
	INX
	STX.b $10
label_C201C9:
	CPX.w #$0020
	BCC.b label_C201AE
	REP.b #$20
	LDA.b $0E
	INC
	STA.b $0E
label_C201D5:
	CMP.w #$0008
	BCC.b label_C201A7
	STZ.w $9E29
	STZ.w $9E27
	STZ.w $9E25
	STZ.w $9E23
	STZ.w $964D
	LDA.w #$0001
	STA.w $964F
	STZ.w $9643
	STZ.w $9645
	LDA.w #$FFFF
	STA.w $8958
	SEP.b #$20
	LDA.b #$01
	STA.w $5E6D
	JSL.l label_C43F53
	SEP.b #$20
	LDA.b #$FF
	STA.w $9651
	REP.b #$20
	LDA.w #$00FF
	STA.w $5E6E
	SEP.b #$20
	STZ.w $5E70
	STZ.w $5E75
	REP.b #$20
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAX
	LDA.w $002B,X
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAX
	SEP.b #$20
	STZ.w $5E71
	STZ.w $002C,X
	STZ.w $5E72
	STZ.w $5E73
	STZ.w $5E74
	STZ.w $5E76
	STZ.w $5E78
	STZ.w $5E77
	STZ.w $B4CE
	STZ.w $5E6C
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

org $C2038B
label_C2038B:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w #$007E
	STA.b $0E
	LDA.w #$7C00
	STA.b $10
	LDY.w #$7DFE
	LDX.w #$0700
	SEP.b #$20
	JSL.l label_C0862E
	LDA.w #DATA_C40BE8
	STA.b $0E
	LDA.w #DATA_C40BE8>>16
	STA.b $10
	LDY.w #$7F80
	LDX.w #$0040
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	PLD
	RTL

;--------------------------------------------------------------------

label_C203C3:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFD8
	TCD
	PLA
	STA.b $26
	LDY.w #$986F
	LDA.b ($26),Y
	AND.w #$00FF
	DEC
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	STA.b $24
	CLC
	ADC.w #$000E
	STA.b $02
	LDX.w #$0001
	LDA.b $02
	JSL.l label_C223D9
	TAY
	STY.b $22
	LDX.w #$0001
	LDA.b $02
	JSL.l label_C223D9
	STA.b $04
	LDY.b $22
	TYA
	AND.w #$FFF0
	CLC
	ADC.b $04
	STA.b $20
	LDY.w #$004F
	LDA.b ($24),Y
	STA.b $04
	STA.b $1E
	LDA.b $04
	CMP.w #$0C00
	BNE.b label_C2042D
	LDA.w #$0C00
	STA.b $02
	STA.b $1C
	STA.b $22
	LDA.w #$0800
	STA.b $1A
	BRA.b label_C20445

label_C2042D:
	LDA.b $02
	JSL.l label_C22474
	LDY.w #$0400
	JSL.l label_C09032
	STA.b $02
	STA.b $1C
	LDA.w #$1000
	STA.b $22
	STZ.b $1A
label_C20445:
	LDA.w $89CA
	CMP.b $26
	BNE.b label_C20453
	LDA.w #$0012
	STA.b $18
	BRA.b label_C20458

label_C20453:
	LDA.w #$0013
	STA.b $18
label_C20458:
	LDA.b $26
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	PHA
	LDA.w $98A4
	AND.w #$00FF
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	PHA
	ASL
	PLA
	ROR
	STA.b $02
	LDA.w #$0010
	SEC
	SBC.b $02
	PLY
	STY.b $02
	CLC
	ADC.b $02
	ASL
	STA.b $02
	LDA.b $18
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$7DFE
	TAX
	LDA.b $1E
	STA.b $04
	CLC
	ADC.w #$2004
	STA.w $0000,X
	INX
	INX
	LDY.w #$0005
	BRA.b label_C204B4

label_C204A8:
	LDA.b $04
	CLC
	ADC.w #$2005
	STA.w $0000,X
	INX
	INX
	DEY
label_C204B4:
	BNE.b label_C204A8
	LDA.b $04
	CLC
	ADC.w #$6004
	STA.w $0000,X
	TXA
	INC
	INC
	CLC
	ADC.w #$0032
	TAX
	LDA.b $04
	CLC
	ADC.w #$2006
	STA.w $0000,X
	TXA
	INC
	INC
	STA.b $16
	LDY.w #$986F
	LDA.b ($26),Y
	AND.w #$00FF
	DEC
	ASL
	ASL
	CLC
	ADC.w #$22A0
	TAY
	STY.b $14
	LDA.b $24
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l label_C08F22
	STA.b $04
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.w #$0009
	LSR
	LSR
	LSR
	STA.b $12
	LDX.w #$0000
	BRA.b label_C20542

label_C20515:
	LDA.b $12
	BEQ.b label_C20533
	LDA.b $1C
	STA.b $02
	LDY.b $14
	TYA
	CLC
	ADC.b $02
	STA.b ($16)
	INC.b $16
	INC.b $16
	INY
	STY.b $14
	LDA.b $12
	DEC
	STA.b $12
	BRA.b label_C20541

label_C20533:
	LDA.b $1C
	STA.b $02
	CLC
	ADC.w #$2007
	STA.b ($16)
	INC.b $16
	INC.b $16
label_C20541:
	INX
label_C20542:
	CPX.w #$0004
	BNE.b label_C20515
	LDA.b $1C
	STA.b $02
	CLC
	ADC.b $20
	CLC
	ADC.w #$2000
	STA.b ($16)
	LDX.b $16
	INX
	INX
	LDA.b $1E
	STA.b $04
	CLC
	ADC.w #$6006
	STA.w $0000,X
	TXA
	INC
	INC
	CLC
	ADC.w #$0032
	TAX
	LDA.b $04
	CLC
	ADC.w #$2006
	STA.w $0000,X
	TXA
	INC
	INC
	STA.b $16
	LDY.w #$986F
	LDA.b ($26),Y
	AND.w #$00FF
	DEC
	ASL
	ASL
	CLC
	ADC.w #$22B0
	TAY
	STY.b $14
	LDA.b $24
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l label_C08F22
	STA.b $04
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.w #$0009
	LSR
	LSR
	LSR
	STA.b $12
	LDX.w #$0000
	BRA.b label_C205E0

label_C205B9:
	LDA.b $12
	BEQ.b label_C205D3
	LDY.b $14
	TYA
	CLC
	ADC.b $02
	STA.b ($16)
	INC.b $16
	INC.b $16
	INY
	STY.b $14
	LDA.b $12
	DEC
	STA.b $12
	BRA.b label_C205DF

label_C205D3:
	LDA.b $02
	CLC
	ADC.w #$2017
	STA.b ($16)
	INC.b $16
	INC.b $16
label_C205DF:
	INX
label_C205E0:
	CPX.w #$0004
	BNE.b label_C205B9
	LDA.b $02
	CLC
	ADC.b $20
	CLC
	ADC.w #$2010
	STA.b ($16)
	LDX.b $16
	INX
	INX
	LDA.b $1E
	STA.b $04
	CLC
	ADC.w #$6006
	STA.w $0000,X
	TXA
	INC
	INC
	CLC
	ADC.w #$0032
	STA.b $02
	LDY.w #$0043
	LDA.b ($24),Y
	TAY
	STY.b $14
	LDY.w #$0045
	LDA.b ($24),Y
	TAX
	LDA.b $26
	LDY.b $14
	JSR.w label_C20F08
	LDA.w #$E3F8
	STA.b $06
	LDA.w #$00C3
	STA.b $08
	LDA.b $26
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	ASL
	CLC
	ADC.w #$8969
	TAY
	LDX.w #$0002
	STX.b $12
	BRA.b label_C206AC

label_C2063D:
	LDA.b $1E
	STA.b $04
	CLC
	ADC.w #$2006
	LDX.b $02
	STA.w $0000,X
	INC.b $02
	INC.b $02
	LDA.w #$0002
	STA.b $20
	BRA.b label_C20671

label_C20655:
	LDA.b [$06]
	AND.w #$00FF
	CLC
	ADC.b $22
	CLC
	ADC.w #$2000
	LDX.b $02
	STA.w $0000,X
	INC.b $06
	INC.b $02
	INC.b $02
	LDA.b $20
	DEC
	STA.b $20
label_C20671:
	BNE.b label_C20655
	LDA.w #$0003
	STA.b $20
	BRA.b label_C20690

label_C2067A:
	LDA.w $0000,Y
	CLC
	ADC.b $1A
	LDX.b $02
	STA.w $0000,X
	INY
	INY
	INC.b $02
	INC.b $02
	LDA.b $20
	DEC
	STA.b $20
label_C20690:
	BNE.b label_C2067A
	LDA.b $04
	CLC
	ADC.w #$6006
	LDX.b $02
	STA.w $0000,X
	LDA.b $02
	INC
	INC
	CLC
	ADC.w #$0032
	STA.b $02
	LDX.b $12
	DEX
	STX.b $12
label_C206AC:
	BNE.b label_C2063D
	LDY.w #$0049
	LDA.b ($24),Y
	STA.b $0E
	LDY.w #$004B
	LDA.b ($24),Y
	TAY
	LDA.b $24
	CLC
	ADC.w #$000E
	TAX
	LDA.b $26
	JSR.w label_C20F26
	LDA.b $26
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	ASL
	CLC
	ADC.w #$8975
	TAY
	LDX.w #$0002
	STX.b $12
	BRA.b label_C2074C

label_C206DD:
	LDA.b $1E
	STA.b $04
	CLC
	ADC.w #$2006
	LDX.b $02
	STA.w $0000,X
	INC.b $02
	INC.b $02
	LDA.w #$0002
	STA.b $20
	BRA.b label_C20711

label_C206F5:
	LDA.b [$06]
	AND.w #$00FF
	CLC
	ADC.b $22
	CLC
	ADC.w #$2000
	LDX.b $02
	STA.w $0000,X
	INC.b $06
	INC.b $02
	INC.b $02
	LDA.b $20
	DEC
	STA.b $20
label_C20711:
	BNE.b label_C206F5
	LDA.w #$0003
	STA.b $20
	BRA.b label_C20730

label_C2071A:
	LDA.w $0000,Y
	CLC
	ADC.b $1A
	LDX.b $02
	STA.w $0000,X
	INY
	INY
	INC.b $02
	INC.b $02
	LDA.b $20
	DEC
	STA.b $20
label_C20730:
	BNE.b label_C2071A
	LDA.b $04
	CLC
	ADC.w #$6006
	LDX.b $02
	STA.w $0000,X
	LDA.b $02
	INC
	INC
	CLC
	ADC.w #$0032
	STA.b $02
	LDX.b $12
	DEX
	STX.b $12
label_C2074C:
	BNE.b label_C206DD
	LDA.b $1E
	STA.b $04
	CLC
	ADC.w #$A004
	LDX.b $02
	STA.w $0000,X
	LDX.b $02
	INX
	INX
	LDY.w #$0005
	BRA.b label_C20770

label_C20764:
	LDA.b $04
	CLC
	ADC.w #$A005
	STA.w $0000,X
	INX
	INX
	DEY
label_C20770:
	BNE.b label_C20764
	LDA.b $04
	CLC
	ADC.w #$E004
	STA.w $0000,X
	PLD
	RTS

;--------------------------------------------------------------------

label_C2077D:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDY.w $9647
	STY.b $10
	LDX.w #$0000
	STX.b $0E
	BRA.b label_C207A7

label_C20791:
	TYA
	AND.w #$0001
	BEQ.b label_C2079B
	TXA
	JSR.w label_C203C3
label_C2079B:
	LDY.b $10
	TYA
	LSR
	TAY
	STY.b $10
	LDX.b $0E
	INX
	STX.b $0E
label_C207A7:
	LDA.w $98A4
	AND.w #$00FF
	STA.b $02
	TXA
	CMP.b $02
	BNE.b label_C20791
	PLD
	RTS

;--------------------------------------------------------------------

label_C207B6:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	SEP.b #$30
	TAY
	REP.b #$20
	LDA.w #$0001
	JSL.l label_C0923E
	ORA.w $9647
	STA.w $9647
	LDA.b $0E
	JSR.w label_C203C3
	LDA.w #$0001
	STA.w $9649
	PLD
	RTL

;--------------------------------------------------------------------

org $C207E1
label_C207E1:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TAX
	STX.b $10
	LDA.w #$0001
	STA.w $9649
	SEP.b #$10
	TXY
	JSL.l label_C0923E
	EOR.w #$FFFF
	AND.w $9647
	STA.w $9647
	REP.b #$10
	LDX.b $10
	CPX.w $89CA
	BNE.b label_C20814
	LDA.w #$0012
	STA.b $0E
	BRA.b label_C20819

label_C20814:
	LDA.w #$0013
	STA.b $0E
label_C20819:
	TXA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	PHA
	LDA.w $98A4
	AND.w #$00FF
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	PHA
	ASL
	PLA
	ROR
	STA.b $02
	LDA.w #$0010
	SEC
	SBC.b $02
	PLY
	STY.b $04
	CLC
	ADC.b $04
	ASL
	STA.b $02
	LDA.b $0E
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$7DFE
	TAX
	LDY.w #$0008
	BRA.b label_C20878

label_C2085B:
	LDA.w #$0007
	STA.b $0E
	BRA.b label_C2086F

label_C20862:
	LDA.w #$0000
	STA.w $0000,X
	INX
	INX
	LDA.b $0E
	DEC
	STA.b $0E
label_C2086F:
	BNE.b label_C20862
	TXA
	CLC
	ADC.w #$0032
	TAX
	DEY
label_C20878:
	BNE.b label_C2085B
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to opening/closing text boxes.

label_C2087C:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w $89C9
	AND.w #$00FF
	BEQ.b label_C2088F
	JSR.w label_C2077D
label_C2088F:
	LDA.w $88E0
	CMP.w #$FFFF
	BEQ.b label_C208B6
	LDY.w $88E0
	STY.b $0E
label_C2089C:
	TYA
	JSL.l EB_BufferTextBoxTilemap_Main
	LDY.b $0E
	TYA
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.w $8652,X
	STY.b $0E
	CPY.w #$FFFF
	BNE.b label_C2089C
label_C208B6:
	PLD
	RTL

;--------------------------------------------------------------------

label_C208B8:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STX.b $12
	STA.b $10
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAY
	STY.b $0E
	LDA.b $10
	ASL
	STA.b $02
	LDA.w $000A,Y
	TAY
	LDX.b $12
	TXA
	JSL.l label_C09032
	ASL
	ASL
	LDY.b $0E
	CLC
	ADC.w $0035,Y
	CLC
	ADC.b $02
	TAX
	LDA.w $0000,X
	AND.w #$03FF
	CMP.w #$004F
	BEQ.b label_C20908
	CMP.w #$0041
	BNE.b label_C2090D
label_C20908:
	LDA.w #$002F
	BRA.b label_C20910

label_C2090D:
	LDA.w #$0040
label_C20910:
	PLD
	RTL

;--------------------------------------------------------------------

EB_NameEntryLetterCharacterTable:
;$C20912
	db $05,$07,$09,$0B,$0D,$0F,$11,$13,$15,$FF,$FF,$1B,$1D,$FF
	db $23,$25,$27,$29,$2B,$2D,$2F,$31,$33,$FF,$FF,$39,$3B,$FF
	db $41,$43,$45,$47,$49,$4B,$4D,$4F,$51,$FF,$FF,$57,$59,$FF
	db $5F,$61,$63,$65,$67,$69,$6B,$6D,$6F,$71,$FF,$77,$79,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$81,$FF

;--------------------------------------------------------------------

DATA_C20958:
	dw $FFFF,$FFFF,$FFFF,$FFFF
	dw $8FFF,$801F,$03FF,$03FF
	dw $0001,$0001,$0000,$0000
	dw $0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000

;--------------------------------------------------------------------

org $C20A20
label_C20A20:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TAX
	STX.b $0E
	LDA.w $8958
	STA.w $0000,X
	LDA.w $8958
	CMP.w #$FFFF
	BNE.b label_C20A3E
	JMP.w label_C20ABA

label_C20A3E:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $865E,X
	LDX.b $0E
	STA.w $0002,X
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $8660,X
	LDX.b $0E
	STA.w $0004,X
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	SEP.b #$20
	LDA.w $8662,X
	LDX.b $0E
	STA.w $0006,X
	REP.b #$20
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $8663,X
	LDX.b $0E
	STA.w $0007,X
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $8665,X
	LDX.b $0E
	STA.w $0009,X
label_C20ABA:
	PLD
	RTL

;--------------------------------------------------------------------

label_C20ABC:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TAY
	STY.b $10
	LDA.w $0000,Y
	STA.b $0E
	CMP.w #$FFFF
	BNE.b label_C20AD6
	JMP.w label_C20B63

label_C20AD6:
	ASL
	CLC
	ADC.w #$88E4
	TAX
	LDA.w $0000,X
	CMP.w #$FFFF
	BNE.b label_C20AE7
	JMP.w label_C20B63

label_C20AE7:
	LDA.b $0E
	STA.w $8958
	LDA.w $0000,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.b $10
	LDA.w $0002,Y
	STA.w $865E,X
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.b $10
	LDA.w $0004,Y
	STA.w $8660,X
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.b $10
	SEP.b #$20
	LDA.w $0006,Y
	STA.w $8662,X
	REP.b #$20
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.b $10
	LDA.w $0007,Y
	STA.w $8663,X
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.b $10
	LDA.w $0009,Y
	STA.w $8665,X
label_C20B63:
	PLD
	RTL

;--------------------------------------------------------------------

label_C20B65:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE4
	TCD
	PLA
	STY.b $04
	STX.b $1A
	STA.b $18
	LDX.b $2C
	STX.b $16
	LDY.b $2A
	STY.b $14
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	STA.b $12
	LDA.b $18
	STA.b $02
	STA.b $10
	LDY.b $1A
	STY.b $0E
	LDA.b $04
	BNE.b label_C20BA3
	JMP.w label_C20C70

label_C20BA3:
	TYA
	CLC
	ADC.b $04
	TAY
	STY.b $0E
	BRA.b label_C20BC6

label_C20BAC:
	TYX
	LDA.b $10
	STA.b $02
	JSL.l label_C208B8
	CMP.w #$002F
	BNE.b label_C20BBD
	JMP.w label_C20D26

label_C20BBD:
	LDY.b $0E
	TYA
	CLC
	ADC.b $04
	TAY
	STY.b $0E
label_C20BC6:
	LDY.w #$000C
	LDA.b ($12),Y
	LSR
	STA.b $02
	LDY.b $0E
	TYA
	CMP.b $02
	BCC.b label_C20BAC
	LDA.b $04
	CLC
	ADC.b $1A
	TAY
	STY.b $0E
	BRA.b label_C20C16

label_C20BDF:
	LDA.b $10
	STA.b $02
	DEC
	STA.b $02
	BRA.b label_C20BFE

label_C20BE8:
	LDY.b $0E
	TYX
	LDA.b $02
	JSL.l label_C208B8
	CMP.w #$002F
	BNE.b label_C20BF9
	JMP.w label_C20D26

label_C20BF9:
	LDA.b $02
	DEC
	STA.b $02
label_C20BFE:
	LDY.w #$000A
	LDA.b $02
	CMP.b ($12),Y
	BCC.b label_C20BE8
	LDA.b $18
	STA.b $02
	STA.b $10
	LDY.b $0E
	TYA
	CLC
	ADC.b $04
	TAY
	STY.b $0E
label_C20C16:
	LDY.w #$000C
	LDA.b ($12),Y
	LSR
	STA.b $02
	LDY.b $0E
	TYA
	CMP.b $02
	BCC.b label_C20BDF
	LDX.b $18
	LDA.b $04
	CLC
	ADC.b $1A
	TAY
	STY.b $0E
	BRA.b label_C20C5E

label_C20C31:
	STX.b $02
	INC.b $02
	BRA.b label_C20C4A

label_C20C37:
	LDY.b $0E
	TYX
	LDA.b $02
	JSL.l label_C208B8
	CMP.w #$002F
	BNE.b label_C20C48
	JMP.w label_C20D26

label_C20C48:
	INC.b $02
label_C20C4A:
	LDY.w #$000A
	LDA.b $02
	CMP.b ($12),Y
	BCC.b label_C20C37
	LDX.b $18
	LDY.b $0E
	TYA
	CLC
	ADC.b $04
	TAY
	STY.b $0E
label_C20C5E:
	LDY.w #$000C
	LDA.b ($12),Y
	LSR
	STA.b $02
	LDY.b $0E
	TYA
	CMP.b $02
	BCC.b label_C20C31
	JMP.w label_C20D21

label_C20C70:
	LDA.b $02
	CLC
	ADC.b $14
	STA.b $02
	BRA.b label_C20C91

label_C20C79:
	LDY.b $0E
	TYX
	LDA.b $02
	JSL.l label_C208B8
	CMP.w #$002F
	BNE.b label_C20C8A
	JMP.w label_C20D26

label_C20C8A:
	LDA.b $02
	CLC
	ADC.b $14
	STA.b $02
label_C20C91:
	LDY.w #$000A
	LDA.b $02
	CMP.b ($12),Y
	BCC.b label_C20C79
	LDA.b $18
	CLC
	ADC.b $14
	STA.b $02
	BRA.b label_C20CD5

label_C20CA3:
	LDY.b $0E
	DEY
	STY.b $0E
	BRA.b label_C20CBB

label_C20CAA:
	TYX
	LDA.b $02
	JSL.l label_C208B8
	CMP.w #$002F
	BEQ.b label_C20D26
	LDY.b $0E
	DEY
	STY.b $0E
label_C20CBB:
	LDY.w #$000C
	LDA.b ($12),Y
	LSR
	STA.b $04
	LDY.b $0E
	TYA
	CMP.b $04
	BCC.b label_C20CAA
	LDY.b $1A
	STY.b $0E
	LDA.b $02
	CLC
	ADC.b $14
	STA.b $02
label_C20CD5:
	LDY.w #$000A
	LDA.b $02
	CMP.b ($12),Y
	BCC.b label_C20CA3
	LDX.b $1A
	LDA.b $18
	CLC
	ADC.b $14
	STA.b $02
	BRA.b label_C20D18

label_C20CE9:
	TXY
	INY
	STY.b $0E
	BRA.b label_C20D00

label_C20CEF:
	TYX
	LDA.b $02
	JSL.l label_C208B8
	CMP.w #$002F
	BEQ.b label_C20D26
	LDY.b $0E
	INY
	STY.b $0E
label_C20D00:
	LDY.w #$000C
	LDA.b ($12),Y
	LSR
	STA.b $04
	LDY.b $0E
	TYA
	CMP.b $04
	BCC.b label_C20CEF
	LDX.b $1A
	LDA.b $02
	CLC
	ADC.b $14
	STA.b $02
label_C20D18:
	LDY.w #$000A
	LDA.b $02
	CMP.b ($12),Y
	BCC.b label_C20CE9
label_C20D21:
	LDA.w #$FFFF
	BRA.b label_C20D3D

label_C20D26:
	LDA.b $16
	CMP.w #$FFFF
	BEQ.b label_C20D33
	LDA.b $16
	JSL.l label_C0ABE0
label_C20D33:
	LDY.b $0E
	TYA
	XBA
	AND.w #$FF00
	CLC
	ADC.b $02
label_C20D3D:
	PLD
	RTL

;--------------------------------------------------------------------

label_C20D3F:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	LDX.w #$8968
	LDY.w #$000A
	JSL.l label_C09231
	SEP.b #$20
	STA.w $0000,X
	DEX
	LDY.w #$000A
	REP.b #$20
	LDA.b $0E
	JSL.l label_C0915B
	STA.b $0E
	LDY.w #$000A
	JSL.l label_C09231
	SEP.b #$20
	STA.w $0000,X
	DEX
	LDY.w #$000A
	REP.b #$20
	LDA.b $0E
	JSL.l label_C0915B
	SEP.b #$20
	STA.w $0000,X
	REP.b #$20
	PLD
	RTS

;--------------------------------------------------------------------

label_C20D89:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	ASL
	CLC
	ADC.w #$8975
	TAX
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C20DBE

label_C20DA7:
	CLC
	ADC.w #$264C
	STA.w $0000,X
	LDA.b $0E
	CLC
	ADC.w #$265C
	STA.w $0006,X
	LDA.b $0E
	INC
	STA.b $0E
	INX
	INX
label_C20DBE:
	CMP.w #$0003
	BCC.b label_C20DA7
	PLD
	RTS

;--------------------------------------------------------------------

label_C20DC5:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	STX.b $02
	TAX
	CPY.w #$3000
	BCS.b label_C20DDE
	LDA.w #$0000
	STA.b $16
	BRA.b label_C20DE5

label_C20DDE:
	TYA
	SEC
	SBC.w #$3000
	STA.b $16
label_C20DE5:
	LDA.w #$3400
	STA.b $0A
	LDA.w #$0000
	STA.b $0C
	LDA.b $16
	STA.b $06
	STZ.b $08
	JSL.l label_C090FF
	LDA.b $06
	TAY
	LDA.b $02
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	STA.b $02
	TXA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$896D
	TAX
	LDA.w $8968
	AND.w #$00FF
	STA.b $14
	LDA.w $8967
	AND.w #$00FF
	STA.b $04
	LDA.w $8966
	AND.w #$00FF
	STA.b $12
	LDA.b $14
	LSR
	LSR
	ASL
	ASL
	ASL
	ASL
	STA.b $02
	LDA.b $14
	ASL
	ASL
	CLC
	ADC.b $02
	STY.b $02
	CLC
	ADC.b $02
	CLC
	ADC.w #$2600
	STA.b $02
	STA.w $0000,X
	LDA.b $02
	CLC
	ADC.w #$0010
	STA.w $0006,X
	TXA
	DEC
	DEC
	STA.b $02
	STA.b $10
	LDA.b $04
	BNE.b label_C20E6C
	LDA.b $12
	BNE.b label_C20E6C
	LDX.w #$0248
	BRA.b label_C20E6F

label_C20E6C:
	LDX.w #$0200
label_C20E6F:
	LDA.b $14
	CMP.w #$0009
	BNE.b label_C20E7B
	CPY.w #$0000
	BNE.b label_C20E7E
label_C20E7B:
	LDY.w #$0000
label_C20E7E:
	LDA.b $04
	LSR
	LSR
	ASL
	ASL
	ASL
	ASL
	STA.b $02
	LDA.b $04
	ASL
	ASL
	CLC
	ADC.b $02
	STY.b $02
	CLC
	ADC.b $02
	STX.b $02
	CLC
	ADC.b $02
	CLC
	ADC.w #$2400
	LDX.b $10
	STX.b $02
	STA.w $0000,X
	CLC
	ADC.w #$0010
	LDX.b $02
	STA.w $0006,X
	LDA.b $02
	DEC
	DEC
	STA.b $0E
	LDA.b $12
	BNE.b label_C20EBC
	LDX.w #$0248
	BRA.b label_C20EBF

label_C20EBC:
	LDX.w #$0200
label_C20EBF:
	LDA.b $04
	CMP.w #$0009
	BNE.b label_C20ECB
	CPY.w #$0000
	BNE.b label_C20ECE
label_C20ECB:
	LDY.w #$0000
label_C20ECE:
	STY.b $04
	LDA.b $12
	LSR
	LSR
	ASL
	ASL
	ASL
	ASL
	STA.b $02
	LDA.b $12
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.b $04
	STX.b $02
	CLC
	ADC.b $02
	CLC
	ADC.w #$2400
	TAX
	STX.b $12
	PHX
	LDA.b $0E
	TAX
	PLA
	STA.w $0000,X
	LDA.b $0E
	PHA
	LDX.b $12
	TXA
	CLC
	ADC.w #$0010
	PLX
	STA.w $0006,X
	PLD
	RTS

;--------------------------------------------------------------------

org $C20F08
label_C20F08:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STY.b $0E
	STA.b $02
	TXA
	JSR.w label_C20D3F
	LDY.b $0E
	LDX.w #$0000
	LDA.b $02
	JSR.w label_C20DC5
	PLD
	RTS

;--------------------------------------------------------------------

label_C20F26:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STY.b $04
	STA.b $02
	LDY.b $1E
	STY.b $0E
	LDA.w $0004,X
	AND.w #$00FF
	BEQ.b label_C20F47
	LDA.b $02
	JSR.w label_C20D89
	BRA.b label_C20F56

label_C20F47:
	LDA.b $04
	JSR.w label_C20D3F
	LDY.b $0E
	LDX.w #$0001
	LDA.b $02
	JSR.w label_C20DC5
label_C20F56:
	PLD
	RTS

;--------------------------------------------------------------------

; Note: Something related to a text box being open.

org $C2109F
label_C2109F:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEC
	TCD
	LDA.w $9697
	AND.w #$00FF
	BEQ.b label_C210B2
	JMP.w label_C213AA

label_C210B2:
	LDA.w $0002
	AND.w #$00FF
	AND.w #$0003
	TAX
	LDA.w $986F,X
	AND.w #$00FF
	BNE.b label_C210C7
	JMP.w label_C213AA

label_C210C7:
	AND.w #$00FF
	STA.b $12
	CLC
	SBC.w #$0004
	BVS.b label_C210D7
	BMI.b label_C210DC
	JMP.w label_C213AA

label_C210D7:
	BPL.b label_C210DC
	JMP.w label_C213AA

label_C210DC:
	LDA.b $12
	DEC
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	STA.b $10
	LDA.w $9698
	BNE.b label_C21105
	LDA.b $10
	CLC
	ADC.w #$0043
	TAX
	STX.b $0E
	LDA.w $0000,X
	AND.w #$0001
	BNE.b label_C21105
	JMP.w label_C21216

label_C21105:
	LDA.b $10
	TAX
	LDY.w $0045,X
	TAX
	LDA.w $0047,X
	STA.b $02
	TYA
	CMP.b $02
	BCS.b label_C2118B
	LDA.b $10
	CLC
	ADC.w #$0043
	TAX
	TXY
	STY.b $0E
	LDA.w $9696
	AND.w #$00FF
	BNE.b label_C2112D
	LDA.w $9698
	BEQ.b label_C21139
label_C2112D:
	LDA.w #$4000
	STA.b $06
	LDA.w #$0006
	STA.b $08
	BRA.b label_C2113C

label_C21139:
	JSR.w $C20F58
label_C2113C:
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDY.b $0E
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $10
	CLC
	ADC.w #$0045
	TAX
	LDA.w $0000,X
	CMP.b $02
	BCS.b label_C2117A
	BEQ.b label_C2117A
	JMP.w label_C2122B

label_C2117A:
	LDA.b $02
	STA.w $0000,X
	LDA.b $10
	TAX
	LDA.w #$0001
	STA.w $0043,X
	JMP.w label_C2122B

label_C2118B:
	TYA
	CMP.b $02
	BNE.b label_C211A8
	LDA.b $10
	CLC
	ADC.w #$0043
	TAX
	LDA.w $0000,X
	CMP.w #$0001
	BNE.b label_C211A8
	LDA.w #$0000
	STA.w $0000,X
	JMP.w label_C2122B

label_C211A8:
	LDA.b $10
	CLC
	ADC.w #$0043
	TAX
	TXY
	STY.b $0E
	LDA.w $9698
	BEQ.b label_C211C3
	LDA.w #$4000
	STA.b $06
	LDA.w #$0006
	STA.b $08
	BRA.b label_C211C6

label_C211C3:
	JSR.w $C20F58
label_C211C6:
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDY.b $0E
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	SEC
	LDA.b $06
	SBC.b $0A
	STA.b $06
	LDA.b $08
	SBC.b $0C
	STA.b $08
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $10
	TAX
	LDY.w $0045,X
	TYA
	CMP.b $02
	BCC.b label_C21203
	CPY.w #$03E8
	BCC.b label_C2122B
	BEQ.b label_C2122B
label_C21203:
	LDA.b $10
	TAX
	LDA.b $02
	STA.w $0045,X
	LDA.b $10
	TAX
	LDA.w #$0001
	STA.w $0043,X
	BRA.b label_C2122B

label_C21216:
	LDA.b $10
	PHA
	TAX
	LDA.w $0045,X
	PLX
	CMP.w $0047,X
	BEQ.b label_C2122B
	LDA.w #$0001
	LDX.b $0E
	STA.w $0000,X
label_C2122B:
	LDA.w $9698
	BNE.b label_C21244
	LDA.b $10
	CLC
	ADC.w #$0049
	TAX
	STX.b $0E
	LDA.w $0000,X
	AND.w #$0001
	BNE.b label_C21244
	JMP.w label_C21353

label_C21244:
	LDA.b $10
	TAX
	LDY.w $004B,X
	TAX
	LDA.w $004D,X
	STA.b $02
	TYA
	CMP.b $02
	BCS.b label_C212C5
	LDA.b $10
	CLC
	ADC.w #$0049
	TAX
	TXY
	LDA.w $9698
	BEQ.b label_C2126E
	LDA.w #$4000
	STA.b $06
	LDA.w #$0006
	STA.b $08
	BRA.b label_C21278

label_C2126E:
	LDA.w #$9000
	STA.b $06
	LDA.w #$0001
	STA.b $08
label_C21278:
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	CLC
	LDA.b $06
	ADC.b $0A
	STA.b $06
	LDA.b $08
	ADC.b $0C
	STA.b $08
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $10
	CLC
	ADC.w #$004B
	TAX
	LDA.w $0000,X
	CMP.b $02
	BCS.b label_C212B4
	BEQ.b label_C212B4
	JMP.w label_C21368

label_C212B4:
	LDA.b $02
	STA.w $0000,X
	LDA.b $10
	TAX
	LDA.w #$0001
	STA.w $0049,X
	JMP.w label_C21368

label_C212C5:
	TYA
	CMP.b $02
	BNE.b label_C212E2
	LDA.b $10
	CLC
	ADC.w #$0049
	TAX
	LDA.w $0000,X
	CMP.w #$0001
	BNE.b label_C212E2
	LDA.w #$0000
	STA.w $0000,X
	JMP.w label_C21368

label_C212E2:
	LDA.b $10
	CLC
	ADC.w #$0049
	TAX
	TXY
	LDA.w $9698
	BEQ.b label_C212FB
	LDA.w #$4000
	STA.b $06
	LDA.w #$0006
	STA.b $08
	BRA.b label_C21305

label_C212FB:
	LDA.w #$9000
	STA.b $06
	LDA.w #$0001
	STA.b $08
label_C21305:
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	SEC
	LDA.b $06
	SBC.b $0A
	STA.b $06
	LDA.b $08
	SBC.b $0C
	STA.b $08
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $10
	TAX
	LDY.w $004B,X
	TYA
	CMP.b $02
	BCC.b label_C21340
	CPY.w #$03E8
	BCC.b label_C21368
	BEQ.b label_C21368
label_C21340:
	LDA.b $10
	TAX
	LDA.b $02
	STA.w $004B,X
	LDA.b $10
	TAX
	LDA.w #$0001
	STA.w $0049,X
	BRA.b label_C21368

label_C21353:
	LDA.b $10
	PHA
	TAX
	LDA.w $004B,X
	PLX
	CMP.w $004D,X
	BEQ.b label_C21368
	LDA.w #$0001
	LDX.b $0E
	STA.w $0000,X
label_C21368:
	LDA.w $9698
	BEQ.b label_C213AA
	LDA.b $10
	TAX
	LDY.w $0045,X
	CPY.w #$03E7
	BNE.b label_C21381
	TAX
	LDA.w #$0001
	STA.w $0047,X
	BRA.b label_C2138D

label_C21381:
	CPY.w #$0001
	BNE.b label_C2138D
	TAX
	LDA.w #$03E7
	STA.w $0047,X
label_C2138D:
	LDA.b $10
	TAX
	LDY.w $004B,X
	CPY.w #$03E7
	BNE.b label_C2139E
	TAX
	STZ.w $004D,X
	BRA.b label_C213AA

label_C2139E:
	CPY.w #$0000
	BNE.b label_C213AA
	TAX
	LDA.w #$03E7
	STA.w $004D,X
label_C213AA:
	PLD
	RTL

;--------------------------------------------------------------------

label_C213AC:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFDE
	TCD
	LDA.w $89C9
	AND.w #$00FF
	BNE.b label_C213BF
	JMP.w label_C21624

label_C213BF:
	LDA.w $0002
	AND.w #$00FF
	AND.w #$0003
	STA.b $20
	LDY.w #$986F
	LDA.b ($20),Y
	AND.w #$00FF
	BNE.b label_C213D7
	JMP.w label_C21624

label_C213D7:
	AND.w #$00FF
	CLC
	SBC.w #$0004
	BVS.b label_C213E5
	BMI.b label_C213EA
	JMP.w label_C21624

label_C213E5:
	BPL.b label_C213EA
	JMP.w label_C21624

label_C213EA:
	LDY.b $20
	SEP.b #$10
	LDA.w $9647
	JSL.l label_C09251
	AND.w #$0001
	BNE.b label_C213FD
	JMP.w label_C21624

label_C213FD:
	LDA.w $89CA
	CMP.b $20
	BNE.b label_C21409
	LDA.w #$0012
	BRA.b label_C2140C

label_C21409:
	LDA.w #$0013
label_C2140C:
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$0060
	STA.b $02
	LDA.w $98A4
	AND.w #$00FF
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	PHA
	ASL
	PLA
	ROR
	STA.b $04
	LDA.w #$0010
	SEC
	SBC.b $04
	CLC
	ADC.b $02
	INC
	INC
	INC
	STA.b $1E
	LDA.b $20
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	STA.b $02
	LDA.b $1E
	CLC
	ADC.b $02
	STA.b $1C
	ASL
	CLC
	ADC.w #$7DFE
	STA.b $04
	STA.b $1A
	LDA.b $1C
	CLC
	ADC.w #$7C00
	STA.b $1C
	REP.b #$10
	LDY.w #$986F
	LDA.b ($20),Y
	AND.w #$00FF
	DEC
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	STA.b $18
	LDY.w #$0043
	LDA.b ($18),Y
	STA.b $16
	AND.w #$0001
	BNE.b label_C21484
	JMP.w label_C2153E

label_C21484:
	LDA.b $16
	TAY
	STY.b $14
	LDY.w #$0045
	LDA.b ($18),Y
	TAX
	LDA.b $20
	LDY.b $14
	JSR.w $C20F08
	LDA.b $20
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	ASL
	CLC
	ADC.w #$8969
	STA.b $02
	LDA.w $9624
	AND.w #$00FF
	BNE.b label_C214E3
	LDA.w #$007E
	STA.b $0E
	LDA.b $1C
	STA.b $10
	LDY.b $02
	LDX.w #$0006
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C0862E
	LDA.w #$007E
	STA.b $0E
	LDA.b $1C
	CLC
	ADC.w #$0020
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$0006
	TAY
	LDX.w #$0006
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C0862E
label_C214E3:
	LDY.b $02
	LDX.w #$0000
	STX.b $1E
	BRA.b label_C21505

label_C214EC:
	LDA.w $0000,Y
	LDX.b $1A
	STX.b $04
	STA.w $0000,X
	INY
	INY
	INC.b $04
	INC.b $04
	LDA.b $04
	STA.b $1A
	LDX.b $1E
	INX
	STX.b $1E
label_C21505:
	CPX.w #$0003
	BNE.b label_C214EC
	LDA.b $1A
	STA.b $04
	CLC
	ADC.w #$003A
	STA.b $1E
	LDX.w #$0000
	STX.b $14
	BRA.b label_C2152F

label_C2151B:
	TAX
	LDA.w $0000,Y
	STA.w $0000,X
	INY
	INY
	LDA.b $1E
	INC
	INC
	STA.b $1E
	LDX.b $14
	INX
	STX.b $14
label_C2152F:
	CPX.w #$0003
	BNE.b label_C2151B
	CLC
	ADC.w #$003A
	STA.b $04
	STA.b $1A
	BRA label_C21548

label_C2153E:
	LDA.b $04
	CLC
	ADC.w #$0080
	STA.b $04
	STA.b $1A
label_C21548:
	LDY.w #$0049
	LDA.b ($18),Y
	STA.b $16
	AND.w #$0001
	BNE.b label_C21557
	JMP.w label_C21617

label_C21557:
	LDA.b $16
	STA.b $0E
	LDY.w #$004B
	LDA.b ($18),Y
	TAY
	LDA.b $18
	CLC
	ADC.w #$000E
	TAX
	LDA.b $20
	JSR.w $C20F26
	LDA.b $20
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	ASL
	CLC
	ADC.w #$8975
	STA.b $02
	LDA.w $9624
	AND.w #$00FF
	BNE.b label_C215BE
	LDA.w #$007E
	STA.b $0E
	LDA.b $1C
	CLC
	ADC.w #$0040
	STA.b $10
	LDY.b $02
	LDX.w #$0006
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C0862E
	LDA.w #$007E
	STA.b $0E
	LDA.b $1C
	CLC
	ADC.w #$0060
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$0006
	TAY
	LDX.w #$0006
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C0862E
label_C215BE:
	LDA.b $02
	STA.b $12
	LDX.w #$0000
	STX.b $1E
	BRA.b label_C215E7

label_C215C9:
	TAX
	LDA.w $0000,X
	LDX.b $1A
	STX.b $04
	STA.w $0000,X
	LDA.b $12
	INC
	INC
	STA.b $12
	INC.b $04
	INC.b $04
	LDX.b $04
	STX.b $1A
	LDX.b $1E
	INX
	STX.b $1E
label_C215E7:
	CPX.w #$0003
	BNE.b label_C215C9
	LDA.b $1A
	STA.b $04
	CLC
	ADC.w #$003A
	TAY
	LDX.w #$0000
	STX.b $1E
	BRA.b label_C21612

label_C215FC:
	LDA.b $12
	TAX
	LDA.w $0000,X
	STA.w $0000,Y
	LDA.b $12
	INC
	INC
	STA.b $12
	INY
	INY
	LDX.b $1E
	INX
	STX.b $1E
label_C21612:
	CPX.w #$0003
	BNE.b label_C215FC
label_C21617:
	LDA.w $9624
	AND.w #$00FF
	BEQ.b label_C21624
	SEP.b #$20
	STZ.w $9624
label_C21624:
	REP.b #$30
	PLD
	RTL

;--------------------------------------------------------------------

label_C21628:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	DEC
	STA.b $0E
	LSR
	LSR
	LSR
	PHA
	LDY.w #$0008
	LDA.b $0E
	JSL.l label_C09231
	TAX
	SEP.b #$20
	LDA.l DATA_C4562F,X
	PLX
	AND.w $9C08,X
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C21659
	LDA.w #$0001
	BRA.b label_C2165C

label_C21659:
	LDA.w #$0000
label_C2165C:
	PLD
	RTL

;--------------------------------------------------------------------

label_C2165E:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	TXY
	STY.b $12
	TAX
	DEC
	STA.b $10
	LSR
	LSR
	LSR
	CLC
	ADC.w #$9C08
	TAX
	STX.b $0E
	LDY.w #$0008
	LDA.b $10
	JSL.l label_C09231
	TAX
	SEP.b #$20
	LDA.l DATA_C4562F,X
	LDY.b $12
	BEQ.b label_C21698
	STA.b $00
	LDX.b $0E
	LDA.w $0000,X
	ORA.b $00
	BRA.b label_C216A3

label_C21698:
	EOR.b #$FF
	STA.b $00
	LDX.b $0E
	LDA.w $0000,X
	AND.b $00
label_C216A3:
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	PLD
	RTL

;--------------------------------------------------------------------

label_C216AD:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TAX
	STX.b $0E
	TXA
	JSL.l label_C4FBBD
	LDX.b $0E
	STX.w $5DD4
	STX.w $5DD6
	PLD
	RTL

;--------------------------------------------------------------------

org $C216DB
label_C216DB:

;--------------------------------------------------------------------

org $C21857
label_C21857:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE9
	TCD
	PLA
	TAX
	DEC
	STA.b $02
	STA.b $15
	LDA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99EA,X
	AND.w #$00FF
	TAY
	STY.b $13
	LDA.w $99FF,X
	AND.w #$00FF
	STA.b $11
	BEQ.b label_C218E1
	LDX.w #$0000
	STX.b $0F
	LDA.b $02
	CMP.w #$0003
	BNE.b label_C21895
	LDX.w #$0001
	STX.b $0F
label_C21895:
	LDA.b $11
	DEC
	PHA
	LDA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99F1
	PLY
	STY.b $02
	CLC
	ADC.b $02
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	LDY.w #$0027
	JSL.l label_C08FF7
	LDX.b $0F
	STX.b $02
	CLC
	ADC.b $02
	CLC
	ADC.w #$001F
	TAX
	SEP.b #$20
	LDA.l DATA_D55000,X
	REP.b #$20
	SEC
	AND.w #$00FF
	SBC.w #$0080
	EOR.w #$FF80
	STA.b $04
	LDY.b $13
	TYA
	CLC
	ADC.b $04
	TAY
label_C218E1:
	STY.b $04
	LDA.w #$0000
	CLC
	SBC.b $04
	BVC.b label_C218EF
	BPL.b label_C218F6
	BRA.b label_C218F1

label_C218EF:
	BMI.b label_C218F6
label_C218F1:
	LDX.w #$0000
	BRA.b label_C2190F

label_C218F6:
	TYA
	CLC
	SBC.w #$00FF
	BVC.b label_C21901
	BPL.b label_C21908
	BRA.b label_C21903

label_C21901:
	BMI.b label_C21908
label_C21903:
	LDX.w #$00FF
	BRA.b label_C2190F

label_C21908:
	TYA
	REP.b #$20
	AND.w #$00FF
	TAX
label_C2190F:
	TXA
	SEP.b #$20
	STA.b $0E
	REP.b #$20
	LDA.b $15
	STA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	SEP.b #$20
	LDA.b $0E
	STA.w $99E3,X
	PLD
	RTL

;--------------------------------------------------------------------

label_C2192B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEB
	TCD
	PLA
	TAX
	DEC
	STA.b $02
	STA.b $13
	LDA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99EB,X
	AND.w #$00FF
	TAY
	STY.b $11
	LDA.w $9A00,X
	AND.w #$00FF
	TAX
	BEQ.b label_C219B7
	LDA.w #$0000
	STA.b $0F
	LDA.b $02
	CMP.w #$0003
	BNE.b label_C21968
	LDA.w #$0001
	STA.b $0F
label_C21968:
	LDA.b $0F
	PHA
	TXA
	DEC
	PHA
	LDA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99F1
	PLY
	STY.b $02
	CLC
	ADC.b $02
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	LDY.w #$0027
	JSL.l label_C08FF7
	PLY
	STY.b $02
	CLC
	ADC.b $02
	CLC
	ADC.w #$001F
	TAX
	SEP.b #$20
	LDA.l DATA_D55000,X
	REP.b #$20
	SEC
	AND.w #$00FF
	SBC.w #$0080
	EOR.w #$FF80
	STA.b $04
	LDY.b $11
	TYA
	CLC
	ADC.b $04
	TAY
	STY.b $11
label_C219B7:
	LDA.b $13
	STA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $9A01,X
	AND.w #$00FF
	TAX
	BEQ.b label_C21A2C
	LDA.w #$0000
	STA.b $0F
	LDA.b $02
	CMP.w #$0003
	BNE.b label_C219DD
	LDA.w #$0001
	STA.b $0F
label_C219DD:
	LDA.b $0F
	PHA
	TXA
	DEC
	PHA
	LDA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99F1
	PLY
	STY.b $02
	CLC
	ADC.b $02
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	LDY.w #$0027
	JSL.l label_C08FF7
	PLY
	STY.b $02
	CLC
	ADC.b $02
	CLC
	ADC.w #$001F
	TAX
	SEP.b #$20
	LDA.l DATA_D55000,X
	REP.b #$20
	SEC
	AND.w #$00FF
	SBC.w #$0080
	EOR.w #$FF80
	STA.b $04
	LDY.b $11
	TYA
	CLC
	ADC.b $04
	TAY
	STY.b $11
label_C21A2C:
	LDA.b $13
	STA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $9A02,X
	AND.w #$00FF
	TAX
	BEQ.b label_C21AA1
	LDA.w #$0000
	STA.b $0F
	LDA.b $02
	CMP.w #$0003
	BNE.b label_C21A52
	LDA.w #$0001
	STA.b $0F
label_C21A52:
	LDA.b $0F
	PHA
	TXA
	DEC
	PHA
	LDA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99F1
	PLY
	STY.b $02
	CLC
	ADC.b $02
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	LDY.w #$0027
	JSL.l label_C08FF7
	PLY
	STY.b $02
	CLC
	ADC.b $02
	CLC
	ADC.w #$001F
	TAX
	SEP.b #$20
	LDA.l DATA_D55000,X
	REP.b #$20
	SEC
	AND.w #$00FF
	SBC.w #$0080
	EOR.w #$FF80
	STA.b $04
	LDY.b $11
	TYA
	CLC
	ADC.b $04
	TAY
	STY.b $11
label_C21AA1:
	LDY.b $11
	STY.b $04
	LDA.w #$0000
	CLC
	SBC.b $04
	BVC.b label_C21AB1
	BPL.b label_C21AB8
	BRA.b label_C21AB3

label_C21AB1:
	BMI.b label_C21AB8
label_C21AB3:
	LDA.w #$0000
	BRA.b label_C21AD0

label_C21AB8:
	TYA
	CLC
	SBC.w #$00FF
	BVC.b label_C21AC3
	BPL.b label_C21ACA
	BRA.b label_C21AC5

label_C21AC3:
	BMI.b label_C21ACA
label_C21AC5:
	LDA.w #$00FF
	BRA.b label_C21AD0

label_C21ACA:
	TYA
	REP.b #$20
	AND.w #$00FF
label_C21AD0:
	SEP.b #$20
	STA.b $0E
	REP.b #$20
	LDA.b $13
	STA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	SEP.b #$20
	LDA.b $0E
	STA.w $99E4,X
	PLD
	RTL

;--------------------------------------------------------------------

label_C21AEB:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEB
	TCD
	PLA
	TAX
	DEC
	STA.b $02
	STA.b $13
	LDA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99EC,X
	AND.w #$00FF
	TAY
	STY.b $11
	LDA.w $9A00,X
	AND.w #$00FF
	BEQ.b label_C21B51
	DEC
	STA.b $02
	TXA
	CLC
	ADC.w #$99F1
	CLC
	ADC.b $02
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	LDY.w #$0027
	JSL.l label_C08FF7
	CLC
	ADC.w #$0021
	TAX
	SEP.b #$20
	LDA.l DATA_D55000,X
	REP.b #$20
	SEC
	AND.w #$00FF
	SBC.w #$0080
	EOR.w #$FF80
	STA.b $04
	LDY.b $11
	TYA
	CLC
	ADC.b $04
	TAY
	STY.b $11
label_C21B51:
	LDA.b $13
	STA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $9A25,X
	AND.w #$00FF
	STA.b $04
	LDY.b $11
	TYA
	CLC
	ADC.b $04
	STA.b $0F
	STA.b $04
	LDA.w #$0000
	CLC
	SBC.b $04
	BVC.b label_C21B7B
	BPL.b label_C21B82
	BRA.b label_C21B7D

label_C21B7B:
	BMI.b label_C21B82
label_C21B7D:
	LDX.w #$0000
	BRA.b label_C21B8A

label_C21B82:
	LDA.b $0F
	REP.b #$20
	AND.w #$00FF
	TAX
label_C21B8A:
	TXA
	SEP.b #$20
	STA.b $0E
	REP.b #$20
	LDA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	SEP.b #$20
	LDA.b $0E
	STA.w $99E5,X
	PLD
	RTL

;--------------------------------------------------------------------

label_C21BA4:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEB
	TCD
	PLA
	TAX
	DEC
	STA.b $02
	STA.b $13
	LDA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99ED,X
	AND.w #$00FF
	TAY
	STY.b $11
	LDA.w $99FF,X
	AND.w #$00FF
	BEQ.b label_C21C0A
	DEC
	STA.b $02
	TXA
	CLC
	ADC.w #$99F1
	CLC
	ADC.b $02
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	LDY.w #$0027
	JSL.l label_C08FF7
	CLC
	ADC.w #$0021
	TAX
	SEP.b #$20
	LDA.l DATA_D55000,X
	REP.b #$20
	SEC
	AND.w #$00FF
	SBC.w #$0080
	EOR.w #$FF80
	STA.b $04
	LDY.b $11
	TYA
	CLC
	ADC.b $04
	TAY
	STY.b $11
label_C21C0A:
	LDA.b $13
	STA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $9A26,X
	AND.w #$00FF
	STA.b $04
	LDY.b $11
	TYA
	CLC
	ADC.b $04
	STA.b $0F
	STA.b $04
	LDA.w #$0000
	CLC
	SBC.b $04
	BVC.b label_C21C34
	BPL.b label_C21C3B
	BRA.b label_C21C36

label_C21C34:
	BMI.b label_C21C3B
label_C21C36:
	LDX.w #$0000
	BRA.b label_C21C43

label_C21C3B:
	LDA.b $0F
	REP.b #$20
	AND.w #$00FF
	TAX
label_C21C43:
	TXA
	SEP.b #$20
	STA.b $0E
	REP.b #$20
	LDA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	SEP.b #$20
	LDA.b $0E
	STA.w $99E6,X
	PLD
	RTL

;--------------------------------------------------------------------

label_C21C5D:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEB
	TCD
	PLA
	TAX
	DEC
	STA.b $02
	STA.b $13
	LDA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $99EE,X
	AND.w #$00FF
	TAY
	STY.b $11
	LDA.w $9A01,X
	AND.w #$00FF
	BEQ.b label_C21CC3
	DEC
	STA.b $02
	TXA
	CLC
	ADC.w #$99F1
	CLC
	ADC.b $02
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	LDY.w #$0027
	JSL.l label_C08FF7
	CLC
	ADC.w #$0021
	TAX
	SEP.b #$20
	LDA.l DATA_D55000,X
	REP.b #$20
	SEC
	AND.w #$00FF
	SBC.w #$0080
	EOR.w #$FF80
	STA.b $04
	LDY.b $11
	TYA
	CLC
	ADC.b $04
	TAY
	STY.b $11
label_C21CC3:
	LDA.b $13
	STA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $9A02,X
	AND.w #$00FF
	BEQ.b label_C21D12
	DEC
	STA.b $02
	TXA
	CLC
	ADC.w #$99F1
	CLC
	ADC.b $02
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	LDY.w #$0027
	JSL.l label_C08FF7
	CLC
	ADC.w #$0021
	TAX
	SEP.b #$20
	LDA.l DATA_D55000,X
	REP.b #$20
	SEC
	AND.w #$00FF
	SBC.w #$0080
	EOR.w #$FF80
	STA.b $04
	LDY.b $11
	TYA
	CLC
	ADC.b $04
	TAY
	STY.b $11
label_C21D12:
	LDA.b $13
	STA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	LDA.w $9A29,X
	AND.w #$00FF
	STA.b $04
	LDY.b $11
	TYA
	CLC
	ADC.b $04
	STA.b $0F
	STA.b $04
	LDA.w #$0000
	CLC
	SBC.b $04
	BVC.b label_C21D3C
	BPL.b label_C21D43
	BRA.b label_C21D3E

label_C21D3C:
	BMI.b label_C21D43
label_C21D3E:
	LDX.w #$0000
	BRA.b label_C21D4B

label_C21D43:
	LDA.b $0F
	REP.b #$20
	AND.w #$00FF
	TAX
label_C21D4B:
	TXA
	SEP.b #$20
	STA.b $0E
	REP.b #$20
	LDA.b $02
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	SEP.b #$20
	LDA.b $0E
	STA.w $99E7,X
	PLD
	RTL

;--------------------------------------------------------------------

label_C21D65:
	REP.b #$31
	DEC
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	SEP.b #$20
	LDA.w $99EF,X
	CLC
	ADC.w $9A27,X
	STA.w $99E8,X
	RTL

;--------------------------------------------------------------------

label_C21D7D:
	REP.b #$31
	DEC
	LDY.w #$005F
	JSL.l label_C08FF7
	TAX
	SEP.b #$20
	LDA.w $99F0,X
	CLC
	ADC.w $9A28,X
	STA.w $99E9,X
	RTL

;--------------------------------------------------------------------

org $C223D9
label_C223D9:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STX.b $02
	TAY
	LDA.w $0000,Y
	AND.w #$00FF
	BEQ.b label_C223F5
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C22432

label_C223F5:
	TYX
	INX
	INX
	INX
	LDA.w $0000,X
	AND.w #$00FF
	BEQ.b label_C22409
	TXY
	LDA.w #$0003
	STA.b $0E
	BRA.b label_C22432

label_C22409:
	INY
	LDA.w #$0001
	STA.b $0E
	BRA.b label_C2241F

label_C22411:
	LDA.w $0000,Y
	AND.w #$00FF
	BNE.b label_C22432
	LDA.b $0E
	INC
	STA.b $0E
	INY
label_C2241F:
	CMP.w #$0007
	BCC.b label_C22411
	LDA.b $02
	BEQ.b label_C2242D
	LDA.w #$0007
	BRA.b label_C22472

label_C2242D:
	LDA.w #$0020
	BRA.b label_C22472

label_C22432:
	LDA.b $02
	BEQ.b label_C22455
	LDA.w $0000,Y
	AND.w #$00FF
	DEC
	ASL
	STA.b $02
	LDA.b $0E
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.l DATA_C45A27,X
	BRA.b label_C22472

label_C22455:
	LDA.w $0000,Y
	AND.w #$00FF
	DEC
	ASL
	STA.b $02
	LDA.b $0E
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.l DATA_C45A89,X
label_C22472:
	PLD
	RTL

;--------------------------------------------------------------------

label_C22474:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TAY
	LDA.w $0000,Y
	AND.w #$00FF
	BEQ.b label_C2248E
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C224C2

label_C2248E:
	TYX
	INX
	INX
	INX
	LDA.w $0000,X
	AND.w #$00FF
	BEQ.b label_C224A2
	TXY
	LDA.w #$0003
	STA.b $0E
	BRA.b label_C224C2

label_C224A2:
	INY
	LDA.w #$0001
	STA.b $0E
	BRA.b label_C224B8

label_C224AA:
	LDA.w $0000,Y
	AND.w #$00FF
	BNE.b label_C224C2
	LDA.b $0E
	INC
	STA.b $0E
	INY
label_C224B8:
	CMP.w #$0007
	BCC.b label_C224AA
	LDA.w #$0004
	BRA.b label_C224DF

label_C224C2:
	LDA.w $0000,Y
	AND.w #$00FF
	DEC
	ASL
	STA.b $02
	LDA.b $0E
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.l DATA_C45AEB,X
label_C224DF:
	PLD
	RTL

;--------------------------------------------------------------------

org $C22A2C
label_C22A2C:
	REP.b #$31
	LDA.w $B4A1
	AND.w #$00FF
	DEC
	JSL.l $EF0A4D
	RTL

;--------------------------------------------------------------------

org $C2C92D
label_C2C92D:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE1
	TCD
	PLA
	STX.b $1D
	STA.b $1B
	LDA.b ($1B)
	AND.w #$00FF
	STA.b $19
	LDY.w #$0002
	LDA.b ($1B),Y
	AND.w #$00FF
	BEQ.b label_C2C94F
	JMP.w label_C2CD86

label_C2C94F:
	LDA.b $1B
	CLC
	ADC.w #$000B
	TAX
	SEP.b #$20
	LDA.w $0000,X
	STA.b $18
	REP.b #$20
	AND.w #$00FF
	BNE.b label_C2C967
	JMP.w label_C2CBAE

label_C2C967:
	SEP.b #$20
	LDA.b $18
	DEC
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C2C979
	JMP.w label_C2CBAE

label_C2C979:
	LDY.w #$000A
	SEP.b #$20
	LDA.b ($1B),Y
	STA.w $0000,X
	LDY.w #$0003
	REP.b #$20
	LDA.b ($1B),Y
	AND.w #$00FF
	CMP.w #$0002
	BEQ.b label_C2C9A5
	CMP.w #$0001
	BNE.b label_C2C99A
	JMP.w label_C2CA3B

label_C2C99A:
	CMP.w #$0003
	BNE.b label_C2C9A2
	JMP.w label_C2CAD9

label_C2C9A2:
	JMP.w label_C2CBA5

label_C2C9A5:
	LDY.w #$0007
	SEP.b #$20
	LDA.b ($1B),Y
	LDY.w #$0006
	SEC
	SBC.b ($1B),Y
	REP.b #$20
	AND.w #$00FF
	STA.b $02
	INC.b $02
	LDX.w #$0000
	STX.b $16
	BRA.b label_C2CA16

label_C2C9C2:
	LDY.w #$0009
	LDA.b ($1B),Y
	AND.w #$00FF
	STA.b $04
	TXA
	CMP.b $04
	BCS.b label_C2C9DC
	TXA
	CLC
	ADC.b $02
	SEC
	SBC.b $04
	STA.b $14
	BRA.b label_C2C9E2

label_C2C9DC:
	TXA
	SEC
	SBC.b $04
	STA.b $14
label_C2C9E2:
	LDY.w #$0006
	LDA.b ($1B),Y
	AND.w #$00FF
	TAY
	STY.b $12
	STX.b $04
	TYA
	CLC
	ADC.b $04
	ASL
	LDY.w #$004C
	CLC
	ADC.b ($1B),Y
	PHA
	LDA.b $14
	STA.b $04
	LDY.b $12
	TYA
	CLC
	ADC.b $04
	ASL
	CLC
	ADC.b $1B
	TAX
	LDA.w $000C,X
	PLX
	STA.w $0000,X
	LDX.b $16
	INX
	STX.b $16
label_C2CA16:
	TXA
	CMP.b $02
	BCC.b label_C2C9C2
	LDA.b $1B
	CLC
	ADC.w #$0009
	TAX
	SEP.b #$20
	LDA.w $0000,X
	INC
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	CMP.b $02
	BCC.b label_C2CA3B
	SEP.b #$20
	LDA.b #$00
	STA.w $0000,X
label_C2CA3B:
	LDY.w #$0005
	SEP.b #$20
	LDA.b ($1B),Y
	LDY.w #$0004
	SEC
	SBC.b ($1B),Y
	REP.b #$20
	AND.w #$00FF
	STA.b $02
	INC.b $02
	LDX.w #$0000
	STX.b $16
	BRA.b label_C2CAAC

label_C2CA58:
	LDY.w #$0008
	LDA.b ($1B),Y
	AND.w #$00FF
	STA.b $04
	TXA
	CMP.b $04
	BCS.b label_C2CA72
	TXA
	CLC
	ADC.b $02
	SEC
	SBC.b $04
	STA.b $14
	BRA.b label_C2CA78

label_C2CA72:
	TXA
	SEC
	SBC.b $04
	STA.b $14
label_C2CA78:
	LDY.w #$0004
	LDA.b ($1B),Y
	AND.w #$00FF
	TAY
	STY.b $12
	STX.b $04
	TYA
	CLC
	ADC.b $04
	ASL
	LDY.w #$004C
	CLC
	ADC.b ($1B),Y
	PHA
	LDA.b $14
	STA.b $04
	LDY.b $12
	TYA
	CLC
	ADC.b $04
	ASL
	CLC
	ADC.b $1B
	TAX
	LDA.w $000C,X
	PLX
	STA.w $0000,X
	LDX.b $16
	INX
	STX.b $16
label_C2CAAC:
	TXA
	CMP.b $02
	BCC.b label_C2CA58
	LDA.b $1B
	CLC
	ADC.w #$0008
	TAX
	SEP.b #$20
	LDA.w $0000,X
	INC
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	CMP.b $02
	BCS.b label_C2CACF
	BEQ.b label_C2CACF
	JMP.w label_C2CBA5

label_C2CACF:
	SEP.b #$20
	LDA.b #$00
	STA.w $0000,X
	JMP.w label_C2CBA5

label_C2CAD9:
	LDY.w #$0005
	SEP.b #$20
	LDA.b ($1B),Y
	LDY.w #$0004
	SEC
	SBC.b ($1B),Y
	REP.b #$20
	AND.w #$00FF
	INC
	STA.b $10
	LDY.w #$0000
	STY.b $0E
	BRA.b label_C2CB6B

label_C2CAF5:
	LDY.w #$0008
	LDA.b ($1B),Y
	AND.w #$00FF
	STA.b $04
	LDY.b $0E
	TYA
	CLC
	ADC.b $04
	STA.b $02
	STA.b $14
	LDA.b $10
	ASL
	STA.b $04
	LDA.b $02
	CMP.b $04
	BCC.b label_C2CB1F
	LDA.b $02
	SEC
	SBC.b $04
	STA.b $02
	STA.b $14
	BRA.b label_C2CB39

label_C2CB1F:
	LDA.b $10
	PHA
	LDA.b $02
	PLY
	STY.b $02
	CMP.b $02
	BCC.b label_C2CB39
	LDA.b $14
	STA.b $02
	LDA.b $04
	DEC
	SEC
	SBC.b $02
	STA.b $02
	STA.b $14
label_C2CB39:
	LDY.w #$0004
	LDA.b ($1B),Y
	AND.w #$00FF
	TAX
	LDY.b $0E
	STY.b $02
	TXA
	CLC
	ADC.b $02
	ASL
	LDY.w #$004C
	CLC
	ADC.b ($1B),Y
	PHA
	LDA.b $14
	STA.b $02
	TXA
	CLC
	ADC.b $02
	ASL
	CLC
	ADC.b $1B
	TAX
	LDA.w $000C,X
	PLX
	STA.w $0000,X
	LDY.b $0E
	INY
	STY.b $0E
label_C2CB6B:
	LDA.b $10
	STA.b $02
	TYA
	CMP.b $02
	BCS.b label_C2CB79
	BEQ.b label_C2CB79
	JMP.w label_C2CAF5

label_C2CB79:
	LDA.b $1B
	CLC
	ADC.w #$0008
	TAX
	SEP.b #$20
	LDA.w $0000,X
	STA.b $00
	INC.b $00
	LDA.b $00
	STA.w $0000,X
	REP.b #$20
	LDA.b $10
	ASL
	STA.b $02
	LDA.b $00
	AND.w #$00FF
	CMP.b $02
	BCC.b label_C2CBA5
	SEP.b #$20
	LDA.b #$00
	STA.w $0000,X
label_C2CBA5:
	REP.b #$20
	LDA.w #$0018
	JSL.l label_C0856B
label_C2CBAE:
	LDA.w $A97A
	CMP.w #$FFFF
	BNE.b label_C2CBB9
	JMP.w label_C2CFE3

label_C2CBB9:
	LDA.b $1B
	CLC
	ADC.w #$0053
	TAX
	LDA.w $0000,X
	BNE.b label_C2CBC8
	JMP.w label_C2CC9C

label_C2CBC8:
	DEC
	STA.w $0000,X
	BEQ.b label_C2CBD1
	JMP.w label_C2CC9C

label_C2CBD1:
	LDA.b $1B
	CLC
	ADC.w #$0052
	TAX
	STX.b $0E
	SEP.b #$20
	LDA.w $0000,X
	INC
	AND.b #$03
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	CLC
	ADC.b $1B
	TAX
	LDA.w $004E,X
	AND.w #$00FF
	STA.b $10
	BNE.b label_C2CC0D
	SEP.b #$20
	LDA.b #$00
	LDX.b $0E
	STA.w $0000,X
	LDY.w #$004E
	REP.b #$20
	LDA.b ($1B),Y
	AND.w #$00FF
	STA.b $10
label_C2CC0D:
	CMP.w #$0000
	BNE.b label_C2CC15
	JMP.w label_C2CC9C

label_C2CC15:
	LDA.w #$F258
	STA.b $06
	LDA.w #$00CA
	STA.b $08
	LDA.b $10
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	STA.b $12
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	LDY.w #$0053
	STA.b ($1B),Y
	LDA.b $12
	INC
	INC
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	LDY.w #$0059
	STA.b ($1B),Y
	LDA.b $12
	INC
	INC
	INC
	INC
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	LDY.w #$005B
	STA.b ($1B),Y
	LDA.b $12
	CLC
	ADC.w #$0006
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	LDY.w #$005D
	STA.b ($1B),Y
	LDA.b $12
	CLC
	ADC.w #$0008
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	LDY.w #$005F
	STA.b ($1B),Y
label_C2CC9C:
	LDA.b $1B
	CLC
	ADC.w #$0055
	STA.b $02
	LDA.b $1B
	CLC
	ADC.w #$0059
	TAX
	LDY.w #$005D
	LDA.w $0000,X
	CLC
	ADC.b ($1B),Y
	STA.w $0000,X
	STA.b $04
	LDX.b $02
	LDA.w $0000,X
	CLC
	ADC.b $04
	LDX.b $02
	STA.w $0000,X
	LDA.b $1B
	CLC
	ADC.w #$0057
	TAY
	STY.b $16
	LDA.b $1B
	CLC
	ADC.w #$005B
	TAX
	LDY.w #$005F
	LDA.w $0000,X
	CLC
	ADC.b ($1B),Y
	STA.w $0000,X
	STA.b $04
	LDY.b $16
	LDA.w $0000,Y
	CLC
	ADC.b $04
	STA.w $0000,Y
	LDA.b $19
	CMP.w #$0001
	BEQ.b label_C2CD08
	CMP.w #$0002
	BEQ.b label_C2CD28
	CMP.w #$0003
	BEQ.b label_C2CD48
	CMP.w #$0004
	BEQ.b label_C2CD68
	JMP.w label_C2CD86

label_C2CD08:
	LDX.b $02
	LDA.w $0000,X
	XBA
	AND.w #$00FF
	CLC
	ADC.w $AD96
	STA.w $0031
	LDA.w $0000,Y
	XBA
	AND.w #$00FF
	CLC
	ADC.w $AD98
	STA.w $0033
	BRA.b label_C2CD86

label_C2CD28:
	LDX.b $02
	LDA.w $0000,X
	XBA
	AND.w #$00FF
	CLC
	ADC.w $AD96
	STA.w $0035
	LDA.w $0000,Y
	XBA
	AND.w #$00FF
	CLC
	ADC.w $AD98
	STA.w $0037
	BRA.b label_C2CD86

label_C2CD48:
	LDX.b $02
	LDA.w $0000,X
	XBA
	AND.w #$00FF
	CLC
	ADC.w $AD96
	STA.w $0039
	LDA.w $0000,Y
	XBA
	AND.w #$00FF
	CLC
	ADC.w $AD98
	STA.w $003B
	BRA.b label_C2CD86

label_C2CD68:
	LDX.b $02
	LDA.w $0000,X
	XBA
	AND.w #$00FF
	CLC
	ADC.w $AD96
	STA.w $003D
	LDA.w $0000,Y
	XBA
	AND.w #$00FF
	CLC
	ADC.w $AD98
	STA.w $003F
label_C2CD86:
	LDA.b $1B
	CLC
	ADC.w #$0066
	TAX
	LDA.w $0000,X
	BNE.b label_C2CD95
	JMP.w label_C2CF29

label_C2CD95:
	DEC
	STA.w $0000,X
	BEQ.b label_C2CD9E
	JMP.w label_C2CF29

label_C2CD9E:
	LDA.b $1B
	CLC
	ADC.w #$0065
	TAX
	STX.b $0E
	SEP.b #$20
	LDA.w $0000,X
	INC
	AND.b #$03
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	CLC
	ADC.b $1B
	TAX
	LDA.w $0061,X
	AND.w #$00FF
	STA.b $10
	BNE.b label_C2CDDA
	SEP.b #$20
	LDA.b #$00
	LDX.b $0E
	STA.w $0000,X
	LDY.w #$0061
	REP.b #$20
	LDA.b ($1B),Y
	AND.w #$00FF
	STA.b $10
label_C2CDDA:
	CMP.w #$0000
	BNE.b label_C2CDE2
	JMP.w label_C2CF29

label_C2CDE2:
	LDA.w #DATA_CAF708
	STA.b $06
	LDA.w #DATA_CAF708>>16
	STA.b $08
	LDA.b $10
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	STA.b $10
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	LDY.w #$0066
	STA.b ($1B),Y
	LDA.b $1B
	CLC
	ADC.w #$0068
	TAX
	LDA.b $10
	INC
	INC
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	SEP.b #$20
	LDA.b [$0A]
	STA.w $0000,X
	REP.b #$20
	LDA.b $10
	INC
	INC
	INC
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	LDY.w #$0069
	STA.b ($1B),Y
	LDA.b $10
	CLC
	ADC.w #$0005
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	LDY.w #$006B
	STA.b ($1B),Y
	LDA.b $10
	CLC
	ADC.w #$0007
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	SEP.b #$20
	LDA.b [$0A]
	LDY.w #$006D
	STA.b ($1B),Y
	REP.b #$20
	LDA.b $10
	CLC
	ADC.w #$0008
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	LDY.w #$006E
	STA.b ($1B),Y
	LDA.b $10
	CLC
	ADC.w #$000A
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	LDY.w #$0070
	STA.b ($1B),Y
	LDA.b $10
	CLC
	ADC.w #$000C
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	LDY.w #$0072
	STA.b ($1B),Y
	LDA.b $10
	CLC
	ADC.w #$000E
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	SEP.b #$20
	LDA.b [$0A]
	LDY.w #$0074
	STA.b ($1B),Y
	REP.b #$20
	LDA.b $10
	CLC
	ADC.w #$000F
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	LDY.w #$0075
	STA.b ($1B),Y
	LDA.w $0000,X
	AND.w #$00FF
	CMP.w #$0003
	BNE.b label_C2CF1B
	LDY.b $1D
	LDX.b $19
	INX
	INX
	INX
	INX
	LDA.b $1D
	CLC
	ADC.w #$0005
	JSL.l label_C0ADB2
	BRA.b label_C2CF29

label_C2CF1B:
	LDY.b $1D
	LDX.b $19
	LDA.b $1D
	CLC
	ADC.w #$0005
	JSL.l label_C0ADB2
label_C2CF29:
	LDA.b $1B
	CLC
	ADC.w #$0068
	STA.b $0E
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	BNE.b label_C2CF3D
	JMP.w label_C2CFE3

label_C2CF3D:
	LDA.b $1B
	CLC
	ADC.w #$0069
	TAX
	LDY.w #$0070
	LDA.w $0000,X
	CLC
	ADC.b ($1B),Y
	STA.w $0000,X
	LDA.b $1B
	CLC
	ADC.w #$006B
	TAX
	LDY.w #$0072
	LDA.w $0000,X
	CLC
	ADC.b ($1B),Y
	STA.w $0000,X
	LDA.b $1B
	CLC
	ADC.w #$006D
	TAX
	LDY.w #$0074
	SEP.b #$20
	LDA.w $0000,X
	CLC
	ADC.b ($1B),Y
	STA.w $0000,X
	REP.b #$20
	LDA.b $1B
	CLC
	ADC.w #$006E
	STA.b $02
	LDY.w #$0075
	LDX.b $02
	LDA.w $0000,X
	CLC
	ADC.b ($1B),Y
	LDX.b $02
	STA.w $0000,X
	LDY.b $1D
	LDX.b $19
	STX.b $14
	LDA.b $0E
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	DEC
	LDX.b $14
	JSL.l label_C0AE4C
	LDX.b $02
	LDA.w $0000,X
	JSL.l label_C0AE56
	LDA.w $0002
	AND.w #$00FF
	AND.w #$0001
	CMP.b $1D
	BEQ.b label_C2CFC3
	LDA.w $ADAC
	BNE.b label_C2CFE3
label_C2CFC3:
	LDY.w #$006D
	LDA.b ($1B),Y
	AND.w #$00FF
	TAY
	STY.b $10
	LDY.w #$006B
	LDA.b ($1B),Y
	XBA
	AND.w #$00FF
	TAX
	LDY.w #$0069
	LDA.b ($1B),Y
	LDY.b $10
	JSL.l label_C0AE5A
label_C2CFE3:
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to the static on the "War on Giygas" screen.

label_C2CFE5:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	TAY
	STY.b $16
	LDA.b $26
	STA.b $06
	LDA.b $28
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0077
	REP.b #$20
	TYA
	JSL.l label_C08EFC
	SEP.b #$20
	LDY.w #$0002
	LDA.b [$06],Y
	LDY.b $16
	STA.w $0001,Y
	LDY.w #$0003
	LDA.b [$06],Y
	LDY.b $16
	STA.w $0003,Y
	LDY.w #$0004
	LDA.b [$06],Y
	LDY.b $16
	STA.w $0004,Y
	LDY.w #$0005
	LDA.b [$06],Y
	LDY.b $16
	STA.w $0005,Y
	LDY.w #$0006
	LDA.b [$06],Y
	LDY.b $16
	STA.w $0006,Y
	LDY.w #$0007
	LDA.b [$06],Y
	LDY.b $16
	STA.w $0007,Y
	LDY.w #$0008
	LDA.b [$06],Y
	LDY.b $16
	STA.w $000A,Y
	REP.b #$20
	LDA.w #$0009
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0004
	TYA
	CLC
	ADC.w #$004E
	JSL.l label_C08ED2
	LDA.w #$000D
	LDX.b $12
	STX.b $06
	LDX.b $14
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0004
	LDY.b $16
	TYA
	CLC
	ADC.w #$0061
	JSL.l label_C08ED2
	LDA.w #$0001
	LDY.b $16
	STA.w $0053,Y
	STA.w $0066,Y
	SEP.b #$20
	STA.w $000B,Y
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C2D0AC:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDX.w #$ADB8
	SEP.b #$20
	LDA.w $ADB2
	STA.w $0000,X
	INX
	REP.b #$20
	LDA.w $ADB0
	STA.w $0000,X
	INX
	INX
	LDA.w $ADB4
	SEC
	SBC.w $ADB2
	STA.b $0E
	BRA.b label_C2D0EF

label_C2D0D5:
	SEP.b #$20
	LDA.b #$7F
	STA.w $0000,X
	INX
	REP.b #$20
	LDA.w $ADAE
	STA.w $0000,X
	INX
	INX
	LDA.b $0E
	SEC
	SBC.w #$007F
	STA.b $0E
label_C2D0EF:
	CMP.w #$0080
	BCS.b label_C2D0D5
	SEP.b #$20
	STA.w $0000,X
	INX
	REP.b #$20
	LDA.w $ADAE
	STA.w $0000,X
	INX
	INX
	SEP.b #$20
	LDA.b #$01
	STA.w $0000,X
	INX
	REP.b #$20
	LDA.w $ADB0
	STA.w $0000,X
	INX
	INX
	SEP.b #$20
	LDA.b #$00
	STA.w $0000,X
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C2D121:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFD0
	TCD
	PLA
	STY.b $2E
	STX.b $04
	STX.b $2C
	STA.b $02
	STZ.w $ADA0
	STZ.w $AD9E
	STZ.w $AD94
	STZ.w $AD92
	STZ.w $AD90
	STZ.w $AD8E
	STZ.w $AD8C
	LDA.b $2E
	AND.w #$0003
	BEQ.b label_C2D160
	CMP.w #$0001
	BEQ.b label_C2D16B
	CMP.w #$0002
	BEQ.b label_C2D179
	CMP.w #$0003
	BEQ.b label_C2D187
	BRA.b label_C2D193

label_C2D160:
	STZ.w $ADB2
	LDA.w #$00E0
	STA.w $ADB4
	BRA.b label_C2D193

label_C2D16B:
	LDA.w #$002F
	STA.w $ADB2
	LDA.w #$00B0
	STA.w $ADB4
	BRA.b label_C2D193

label_C2D179:
	LDA.w #$0039
	STA.w $ADB2
	LDA.w #$00A6
	STA.w $ADB4
	BRA.b label_C2D193

label_C2D187:
	LDA.w #$0043
	STA.w $ADB2
	LDA.w #$009C
	STA.w $ADB4
label_C2D193:
	STZ.w $ADB6
	LDX.w #$7000
	STX.w $ADCE
	STX.w $ADCC
	STZ.w $ADD0
	LDA.w #$FFFF
	STA.w $ADD2
	LDA.w #$0000
	STA.b $06
	LDA.w #$007F
	STA.b $08
	LDA.b $06
	STA.b $28
	LDA.b $08
	STA.b $2A
	LDA.w #DATA_CAD7A1
	STA.b $0A
	LDA.w #DATA_CAD7A1>>16
	STA.b $0C
	LDA.b $02
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	TAX
	LDA.l DATA_CADCA1,X
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $28
	STA.b $06
	LDA.b $2A
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w $4A8C
	CMP.w #$01DE
	BNE.b label_C2D232
	LDY.w #$3000
	LDX.w #$5C00
	LDA.w #$0000
	JSL.l label_C08DDE
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$3000
	LDX.w #$5000
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	BRA.b label_C2D248

label_C2D232:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$1000
	LDX.w #$2000
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
label_C2D248:
	LDA.w #$0000
	STA.b $0A
	LDA.w #$007F
	STA.b $0C
	SEP.b #$20
	LDA.b #$00
	STA.b [$0A]
	REP.b #$20
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$5800
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$03
	JSL.l label_C08616
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$0000
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$03
	JSL.l label_C08616
	LDA.w #DATA_CADCA1
	STA.b $06
	LDA.w #DATA_CADCA1>>16
	STA.b $08
	LDA.b $06
	STA.b $24
	LDA.b $08
	STA.b $26
	LDA.b $02
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	STA.b $22
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	ASL
	ASL
	PHA
	LDA.w #$D93D
	STA.b $06
	LDA.w #$00CA
	STA.b $08
	PLA
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.b $22
	INC
	INC
	LDX.b $24
	STX.b $06
	LDX.b $26
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	CMP.w #$0004
	BEQ.b label_C2D317
	JMP.w label_C2D714

label_C2D317:
	LDA.w #$0009
	JSL.l label_C08D79
	LDA.w #$0000
	STA.b $22
	BRA.b label_C2D34A

label_C2D325:
	STA.b $06
	STZ.b $08
	CLC
	LDA.b $06
	ADC.w #$0001
	STA.b $06
	LDA.b $08
	ADC.w #$007F
	STA.b $08
	SEP.b #$20
	LDA.b [$06]
	AND.b #$DF
	ORA.b #$08
	STA.b [$06]
	REP.b #$20
	LDA.b $22
	INC
	INC
	STA.b $22
label_C2D34A:
	CMP.w #$0800
	BCC.b label_C2D325
	LDA.w #$0000
	STA.b $28
	LDA.w #$007F
	STA.b $2A
	LDA.b $28
	STA.b $06
	LDA.b $2A
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$5C00
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #DATA_CADCA1
	STA.b $06
	LDA.w #DATA_CADCA1>>16
	STA.b $08
	LDA.b $06
	STA.b $24
	LDA.b $08
	STA.b $26
	LDA.b $02
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	TAX
	STX.b $20
	TXA
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$ADD4
	JSL.l label_C2CFE5
	LDA.w #$AE20
	STA.b $02
	LDA.w #$0240
	LDX.b $02
	STA.w $0000,X
	LDY.w #$ADE0
	STY.b $1E
	LDA.w #$DAD9
	STA.b $1A
	LDA.w #$00CA
	STA.b $1C
	LDX.b $20
	TXA
	INC
	LDX.b $24
	STX.b $06
	LDX.b $26
	STX.b $08
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b $1A
	STA.b $06
	LDA.b $1C
	STA.b $08
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDY.b $1E
	TYA
	JSL.l label_C08ED2
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	PHA
	LDA.b $1A
	STA.b $0A
	LDA.b $1C
	STA.b $0C
	PLA
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDA.w #$AE00
	JSL.l label_C08ED2
	LDY.b $1E
	TYA
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	STX.b $20
	LDX.b $02
	LDA.w $0000,X
	LDX.b $20
	JSL.l label_C08ED2
	SEP.b #$20
	LDA.b #$02
	STA.w $ADD4
	LDX.w #$0000
	REP.b #$20
	LDA.w #$ADD4
	JSL.l label_C2C92D
	LDX.w #$AE4B
	STX.b $1E
	SEP.b #$20
	LDA.b #$00
	STA.w $0000,X
	REP.b #$20
	LDA.w #$0001
	STA.w $AD8A
	JSL.l label_C0AFCD
	LDA.w #$0017
	STA.w $ADAE
	LDA.w #$0015
	STA.w $ADB0
	LDA.b $2C
	STA.b $04
	BNE.b label_C2D4AB
	JMP.w label_C2DAB2

label_C2D4AB:
	LDA.b $2E
	AND.w #$0004
	BNE.b label_C2D4B5
	JMP.w label_C2D6DF

label_C2D4B5:
	LDA.w #$0007
	STA.w $AD8A
	JSL.l label_C0AFCD
	LDA.b $04
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	LDX.b $24
	STX.b $06
	LDX.b $26
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.w #DATA_CAD7A1
	STA.b $0A
	LDA.w #DATA_CAD7A1>>16
	STA.b $0C
	LDA.b [$06]
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $28
	STA.b $06
	LDA.b $2A
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.b $28
	STA.b $06
	LDA.b $2A
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$0000
	LDX.w #$2000
	SEP.b #$20
	TYA
	JSL.l label_C08616
	LDA.w #$D93D
	STA.b $0A
	LDA.w #$00CA
	STA.b $0C
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b [$06]
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $28
	STA.b $06
	LDA.b $2A
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #$0000
	STA.b $2E
	BRA.b label_C2D5A9

label_C2D584:
	STA.b $06
	STZ.b $08
	CLC
	LDA.b $06
	ADC.w #$0001
	STA.b $06
	LDA.b $08
	ADC.w #$007F
	STA.b $08
	SEP.b #$20
	LDA.b [$06]
	AND.b #$DF
	ORA.b #$10
	STA.b [$06]
	REP.b #$20
	LDA.b $2E
	INC
	INC
	STA.b $2E
label_C2D5A9:
	CMP.w #$0800
	BCC.b label_C2D584
	LDA.w #$0000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$5800
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #DATA_CADCA1
	STA.b $06
	LDA.w #DATA_CADCA1>>16
	STA.b $08
	LDA.b $06
	STA.b $28
	LDA.b $08
	STA.b $2A
	LDA.b $2C
	STA.b $04
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	TAX
	STX.b $20
	LDA.w #$AE4B
	STA.b $04
	TXA
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $04
	JSL.l label_C2CFE5
	LDA.w #$AE97
	STA.b $02
	LDA.w #$0280
	LDX.b $02
	STA.w $0000,X
	SEP.b #$20
	LDA.b #$01
	LDX.b $04
	STA.w $0000,X
	LDY.w #$AE57
	STY.b $2C
	REP.b #$20
	LDA.w #$DAD9
	STA.b $0A
	LDA.w #$00CA
	STA.b $0C
	LDX.b $20
	TXA
	INC
	LDX.b $28
	STX.b $06
	LDX.b $2A
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.b [$06]
	AND.w #$00FF
	ASL
	ASL
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDY.b $2C
	TYA
	JSL.l label_C08ED2
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b [$06]
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDA.w #$AE77
	JSL.l label_C08ED2
	LDY.b $2C
	TYA
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	STX.b $22
	LDX.b $02
	LDA.w $0000,X
	LDX.b $22
	JSL.l label_C08ED2
	LDX.w #$0001
	LDA.b $04
	JSL.l label_C2C92D
	LDA.w #$0215
	STA.w $ADAE
	LDA.w #$0014
	STA.w $ADB0
	JMP.w label_C2DAB2

label_C2D6DF:
	LDA.b $04
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	LDX.b $24
	STX.b $06
	LDX.b $26
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.b $1E
	TXA
	JSL.l label_C2CFE5
	SEP.b #$20
	LDA.b #$01
	STA.w $AE4D
	LDA.b #$02
	LDX.b $1E
	STA.w $0000,X
	JMP.w label_C2DAB2

label_C2D714:
	LDA.w #$0008
	JSL.l label_C08D79
	LDY.w #$6000
	LDX.w #$7C00
	LDA.w #$0000
	JSL.l label_C08D9E
	LDY.w #$0000
	LDX.w #$5800
	TYA
	JSL.l label_C08DDE
	LDY.w #$1000
	LDX.w #$5C00
	LDA.w #$0000
	JSL.l label_C08E1C
	LDY.w #$3000
	LDX.w #$0C00
	LDA.w #$0000
	JSL.l label_C08E5C
	LDA.w #$0000
	STA.b $2E
	BRA.b label_C2D777

label_C2D754:
	STA.b $06
	STZ.b $08
	CLC
	LDA.b $06
	ADC.w #$0001
	STA.b $06
	LDA.b $08
	ADC.w #$007F
	STA.b $08
	SEP.b #$20
	LDA.b [$06]
	AND.b #$DF
	STA.b [$06]
	REP.b #$20
	LDA.b $2E
	INC
	INC
	STA.b $2E
label_C2D777:
	CMP.w #$0800
	BCC.b label_C2D754
	LDA.w #$0000
	STA.b $06
	LDA.w #$007F
	STA.b $08
	LDA.b $06
	STA.b $24
	LDA.b $08
	STA.b $26
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$5C00
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #DATA_CADCA1
	STA.b $28
	LDA.w #DATA_CADCA1>>16
	STA.b $2A
	LDA.b $02
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	TAX
	STX.b $20
	LDA.b $28
	STA.b $06
	LDA.b $2A
	STA.b $08
	TXA
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$ADD4
	JSL.l label_C2CFE5
	LDA.w #$AE20
	STA.b $02
	LDA.w #$0280
	LDX.b $02
	STA.w $0000,X
	LDY.w #$ADE0
	STY.b $1E
	LDA.w #$DAD9
	STA.b $1A
	LDA.w #$00CA
	STA.b $1C
	LDA.b $28
	STA.b $0A
	LDA.b $2A
	STA.b $0C
	LDX.b $20
	TXA
	INC
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b $1A
	STA.b $06
	LDA.b $1C
	STA.b $08
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDY.b $1E
	TYA
	JSL.l label_C08ED2
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	PHA
	LDA.b $1A
	STA.b $0A
	LDA.b $1C
	STA.b $0C
	PLA
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDA.w #$AE00
	JSL.l label_C08ED2
	LDY.b $1E
	TYA
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	STX.b $20
	LDX.b $02
	LDA.w $0000,X
	LDX.b $20
	JSL.l label_C08ED2
	SEP.b #$20
	LDA.b #$03
	STA.w $ADD4
	REP.b #$20
	LDA.b $2C
	STA.b $04
	BNE.b label_C2D8A2
	JMP.w label_C2DA9F

label_C2D8A2:
	LDA.w #$0003
	STA.w $AD8A
	JSL.l label_C0AFCD
	LDA.b $28
	STA.b $0A
	LDA.b $2A
	STA.b $0C
	LDA.b $04
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.w #DATA_CAD7A1
	STA.b $06
	LDA.w #DATA_CAD7A1>>16
	STA.b $08
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $24
	STA.b $06
	LDA.b $26
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$3000
	LDX.w #$1800
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	PHA
	LDA.w #$D93D
	STA.b $0A
	LDA.w #$00CA
	STA.b $0C
	PLA
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $24
	STA.b $06
	LDA.b $26
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #$0000
	STA.b $2E
	BRA.b label_C2D981

label_C2D95E:
	STA.b $06
	STZ.b $08
	CLC
	LDA.b $06
	ADC.w #$0001
	STA.b $06
	LDA.b $08
	ADC.w #$007F
	STA.b $08
	SEP.b #$20
	LDA.b [$06]
	AND.b #$DF
	STA.b [$06]
	REP.b #$20
	LDA.b $2E
	INC
	INC
	STA.b $2E
label_C2D981:
	CMP.w #$0800
	BCC.b label_C2D95E
	LDA.w #$0000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$0C00
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #DATA_CADCA1
	STA.b $06
	LDA.w #DATA_CADCA1>>16
	STA.b $08
	LDA.b $06
	STA.b $28
	LDA.b $08
	STA.b $2A
	LDA.b $2C
	STA.b $04
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ADC.b $04
	TAX
	STX.b $20
	LDA.w #$AE4B
	STA.b $04
	TXA
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $04
	JSL.l label_C2CFE5
	LDA.w #$AE97
	STA.b $02
	LDA.w #$02C0
	LDX.b $02
	STA.w $0000,X
	LDY.w #$AE57
	STY.b $2C
	LDA.w #$DAD9
	STA.b $0A
	LDA.w #$00CA
	STA.b $0C
	LDX.b $20
	TXA
	INC
	LDX.b $28
	STX.b $06
	LDX.b $2A
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.b [$06]
	AND.w #$00FF
	ASL
	ASL
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDY.b $2C
	TYA
	JSL.l label_C08ED2
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b [$06]
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDA.w #$AE77
	JSL.l label_C08ED2
	LDY.b $2C
	TYA
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	STX.b $20
	LDX.b $02
	LDA.w $0000,X
	LDX.b $20
	JSL.l label_C08ED2
	SEP.b #$20
	LDA.b #$04
	LDX.b $04
	STA.w $0000,X
	BRA.b label_C2DAA4

label_C2DA9F:
	SEP.b #$20
	STZ.w $AE4B
label_C2DAA4:
	REP.b #$20
	LDA.w #$0817
	STA.w $ADAE
	LDA.w #$0013
	STA.w $ADB0
label_C2DAB2:
	REP.b #$20
	STZ.w $ADAC
	LDA.w $AE4B
	AND.w #$00FF
	BEQ.b label_C2DACD
	LDA.w $AEAC
	AND.w #$00FF
	BEQ.b label_C2DACD
	LDA.w #$0001
	STA.w $ADAC
label_C2DACD:
	JSL.l label_C2D0AC
	LDA.w $ADB2
	BEQ.b label_C2DADD
	LDA.w #$0002
	JSL.l label_C429E8
label_C2DADD:
	JSL.l label_C2E9ED
	PLD
	RTL

;--------------------------------------------------------------------

label_C2DAE3:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF1
	TCD
	LDX.w #$AE35
	SEP.b #$20
	LDA.w $0000,X
	STA.b $0E
	LDY.w #$AE38
	LDA.w $0000,Y
	STA.w $0000,X
	STZ.w $AE36
	REP.b #$20
	LDA.w #$0001
	STA.w $AE3A
	SEP.b #$20
	LDA.b $0E
	STA.w $0000,Y
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C2DB14:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w $AE20
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDA.w #$ADE0
	JSL.l label_C08ED2
	PLD
	RTL

;--------------------------------------------------------------------

label_C2DB3F:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF2
	TCD
	LDA.w $ADD0
	BEQ.b label_C2DB8C
	LDA.w $ADD2
	SEC
	SBC.w #$0555
	STA.w $ADD2
	STA.b $0A
	STZ.b $0C
	LDA.w #$6000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	CLC
	LDA.b $06
	SBC.b $0A
	LDA.b $08
	SBC.b $0C
	BVC.b label_C2DB73
	BPL.b label_C2DB7E
	BRA.b label_C2DB75

label_C2DB73:
	BMI.b label_C2DB7E
label_C2DB75:
	LDA.w #$6000
	STA.w $ADD2
	STZ.w $ADD0
label_C2DB7E:
	SEP.b #$10
	LDY.b #$08
	LDA.w $ADD2
	JSL.l label_C09251
	JSR.w label_C2E08E
label_C2DB8C:
	LDA.w $ADA8
	BEQ.b label_C2DBAB
	LDA.w $ADA8
	DEC
	STA.w $ADA8
	AND.w #$0002
	BEQ.b label_C2DBA5
	LDA.w #$FFFF
	JSR.w label_C2E08E
	BRA.b label_C2DBAB

label_C2DBA5:
	LDA.w #$0100
	JSR.w label_C2E08E
label_C2DBAB:
	LDA.w $ADAA
	BEQ.b label_C2DBE9
	STZ.w $0200
	LDA.w $ADAA
	CMP.w #$0003
	BEQ.b label_C2DBC2
	CMP.w #$0002
	BEQ.b label_C2DBC8
	BRA.b label_C2DBCF

label_C2DBC2:
	LDA.w #$03E0
	STA.w $0200
label_C2DBC8:
	LDA.w #$0018
	JSL.l label_C0856B
label_C2DBCF:
	LDA.w $ADAA
	DEC
	STA.w $ADAA
	AND.w #$0002
	BEQ.b label_C2DBE3
	LDA.w #$0000
	JSR.w label_C2E08E
	BRA.b label_C2DBE9

label_C2DBE3:
	LDA.w #$0100
	JSR.w label_C2E08E
label_C2DBE9:
	LDA.w $AD8C
	BNE.b label_C2DBF3
	STZ.w $AD98
	BRA.b label_C2DC27

label_C2DBF3:
	LDA.w #$003C
	SEC
	SBC.w $AD8C
	TAX
	SEP.b #$20
	LDA.l DATA_C4A591,X
	REP.b #$20
	SEC
	AND.w #$00FF
	SBC.w #$0080
	EOR.w #$FF80
	STA.w $AD98
	LDX.w $AD8C
	DEX
	STX.w $AD8C
	BNE.b label_C2DC27
	LDA.w $AD8E
	BEQ.b label_C2DC27
	DEC.w $AD8E
	LDA.w #$000A
	STA.w $AD8C
label_C2DC27:
	STZ.w $AD96
	LDA.w $AD92
	BEQ.b label_C2DC6A
	LDY.w #$0048
	LDA.w $AD92
	JSL.l label_C09231
	DEC.w $AD92
	LDY.w #$0048
	XBA
	AND.w #$FF00
	JSL.l label_C0915B
	TAX
	LDY.w #$0100
	SEP.b #$20
	LDA.l DATA_C0B425,X
	REP.b #$20
	SEC
	AND.w #$00FF
	SBC.w #$0080
	EOR.w #$FF80
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	JSL.l label_C090E6
	STA.w $AD96
label_C2DC6A:
	LDA.w $AD94
	BEQ.b label_C2DCA1
	LDA.w $AD94
	AND.w #$0003
	DEC.w $AD94
	CMP.w #$0000
	BEQ.b label_C2DC8E
	CMP.w #$0002
	BEQ.b label_C2DC8E
	CMP.w #$0001
	BEQ.b label_C2DC93
	CMP.w #$0003
	BEQ.b label_C2DC9B
	BRA.b label_C2DCA1

label_C2DC8E:
	STZ.w $AD96
	BRA.b label_C2DCA1

label_C2DC93:
	LDA.w #$0002
	STA.w $AD96
	BRA.b label_C2DCA1

label_C2DC9B:
	LDA.w #$FFFE
	STA.w $AD96
label_C2DCA1:
	LDA.w $ADD5
	AND.w #$00FF
	CMP.w #$0002
	BNE.b label_C2DCBA
	LDA.w $AD96
	STA.w $0031
	LDA.w $AD98
	STA.w $0033
	BRA.b label_C2DCCB

label_C2DCBA:
	LDA.w $9643
	BEQ.b label_C2DCCB
	LDA.w $AD96
	STA.w $0039
	LDA.w $AD98
	STA.w $003B
label_C2DCCB:
	LDA.w $AD90
	BEQ.b label_C2DCD3
	DEC.w $AD90
label_C2DCD3:
	LDA.w $9643
	BEQ.b label_C2DCDC
	JSL.l $C2F8F9
label_C2DCDC:
	LDX.w #$0000
	LDA.w #$ADD4
	JSL.l label_C2C92D
	LDY.w #$AE4B
	LDA.w $0000,Y
	AND.w #$00FF
	BEQ.b label_C2DCF9
	LDX.w #$0001
	TYA
	JSL.l label_C2C92D
label_C2DCF9:
	JSL.l label_C2E6B6
	LDA.w $ADA0
	BEQ.b label_C2DD3E
	LDA.w $ADA0
	DEC
	STA.w $ADA0
	LDY.w #$000C
	JSL.l label_C0915B
	AND.w #$0001
	BEQ.b label_C2DD2E
	LDY.w #$0004
	LDX.w #$0000
	LDA.w #$001F
	JSL.l label_C0B01A
	LDX.w #$003F
	LDA.w #$0000
	JSL.l label_C0B039
	BRA.b label_C2DD3E

label_C2DD2E:
	LDY.w #$0000
	TYX
	TYA
	JSL.l label_C0B01A
	LDA.w $AD8A
	JSL.l label_C0AFCD
label_C2DD3E:
	LDA.w $AD9E
	BEQ.b label_C2DD7F
	LDA.w $AD9E
	DEC
	STA.w $AD9E
	LDY.w #$000C
	JSL.l label_C0915B
	AND.w #$0001
	BEQ.b label_C2DD6F
	LDY.w #$0004
	LDX.w #$001F
	LDA.w #$0000
	JSL.l label_C0B01A
	LDX.w #$003F
	LDA.w #$0000
	JSL.l label_C0B039
	BRA.b label_C2DD7F

label_C2DD6F:
	LDY.w #$0000
	TYX
	TYA
	JSL.l label_C0B01A
	LDA.w $AD8A
	JSL.l label_C0AFCD
label_C2DD7F:
	LDA.w $ADA4
	BEQ.b label_C2DDA7
	LDA.w $ADA4
	DEC
	STA.w $ADA4
	LDY.w #$0003
	JSL.l label_C0915B
	AND.w #$0001
	BEQ.b label_C2DDA0
	LDA.w $ADA6
	JSL.l label_C207E1
	BRA.b label_C2DDA7

label_C2DDA0:
	LDA.w $ADA6
	JSL.l label_C207B6
label_C2DDA7:
	JSL.l label_C4A7B0
	JSL.l label_C2FD99
	LDA.w $ADB6
	BEQ.b label_C2DE0D
	LDA.w $ADB2
	BEQ.b label_C2DE0D
	LDA.w $ADCC
	CMP.w #$03BB
	BCS.b label_C2DDCF
	STZ.w $ADCC
	LDA.w #$00E0
	STA.w $ADCE
	STZ.w $ADB6
	BRA.b label_C2DDE3

label_C2DDCF:
	LDA.w $ADCC
	SEC
	SBC.w #$03BB
	STA.w $ADCC
	LDA.w $ADCE
	CLC
	ADC.w #$03BB
	STA.w $ADCE
label_C2DDE3:
	SEP.b #$10
	LDY.b #$08
	LDA.w $ADCC
	JSL.l label_C09251
	CMP.w $ADB2
	BCS.b label_C2DDF6
	STA.w $ADB2
label_C2DDF6:
	LDY.b #$08
	LDA.w $ADCE
	JSL.l label_C09251
	CMP.w $ADB4
	BCC.b label_C2DE09
	BEQ.b label_C2DE09
	STA.w $ADB4
label_C2DE09:
	JSL.l label_C2D0AC
label_C2DE0D:
	PLD
	RTL

;--------------------------------------------------------------------

org $C2DE96
label_C2DE96:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDA.w #$AE00
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDA.w #$ADE0
	JSL.l label_C08ED2
	LDA.w #$AE77
	STA.b $0A
	PHB
	SEP.b #$20
	PLA
	STA.b $0C
	STZ.b $0D
	REP.b #$20
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDA.w #$AE57
	JSL.l label_C08ED2
	LDA.b $12
	STA.b $06
	LDA.b $14
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDA.w $AE20
	JSL.l label_C08ED2
	LDA.w $AE4B
	AND.w #$00FF
	BEQ.b label_C2DF2C
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDA.w $AE97
	JSL.l label_C08ED2
label_C2DF2C:
	PLD
	RTL

;--------------------------------------------------------------------

label_C2DF2E:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE4
	TCD
	PLA
	STY.b $1A
	STX.b $02
	STA.b $18
	LDA.b $02
	CMP.w #$FFFF
	BEQ.b label_C2DF49
	LDA.b $02
	BNE.b label_C2DF68
label_C2DF49:
	LDA.b $1A
	ASL
	STA.b $1A
	CLC
	ADC.b $18
	TAX
	LDA.b $02
	STA.w $000C,X
	LDY.w #$004C
	LDA.b $1A
	CLC
	ADC.b ($18),Y
	TAX
	LDA.b $02
	STA.w $0000,X
	JMP.w label_C2E08C

label_C2DF68:
	LDA.b $02
	CMP.w #$0100
	BNE.b label_C2DF93
	LDA.b $1A
	ASL
	STA.b $16
	CLC
	ADC.b $18
	TAX
	LDY.w $002C,X
	STY.b $14
	TYA
	STA.w $000C,X
	LDY.w #$004C
	LDA.b $16
	CLC
	ADC.b ($18),Y
	TAX
	LDY.b $14
	TYA
	STA.w $0000,X
	JMP.w label_C2E08C

label_C2DF93:
	LDA.b $1A
	ASL
	CLC
	ADC.b $18
	STA.b $04
	STA.b $14
	LDX.b $04
	LDA.w $002C,X
	STA.b $16
	AND.w #$001F
	TAX
	STX.b $12
	LDA.b $16
	LSR
	LSR
	LSR
	LSR
	LSR
	AND.w #$001F
	TAY
	STY.b $10
	SEP.b #$20
	LDA.b #$0A
	SEP.b #$10
	TAY
	REP.b #$20
	LDA.b $16
	JSL.l label_C09251
	AND.w #$001F
	STA.b $16
	REP.b #$10
	LDY.b $02
	LDX.b $12
	TXA
	JSL.l label_C09032
	XBA
	AND.w #$00FF
	TAX
	STX.b $12
	LDY.b $10
	TYA
	LDY.b $02
	JSL.l label_C09032
	XBA
	AND.w #$00FF
	TAY
	STY.b $10
	LDY.b $02
	LDA.b $16
	JSL.l label_C09032
	XBA
	AND.w #$00FF
	STA.b $0E
	SEP.b #$20
	LDA.b #$0A
	SEP.b #$10
	TAY
	REP.b #$20
	LDA.b $0E
	JSL.l label_C0923E
	STA.b $02
	REP.b #$10
	LDY.b $10
	TYA
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $04
	LDX.b $12
	TXA
	CLC
	ADC.b $04
	CLC
	ADC.b $02
	LDX.b $14
	STX.b $04
	STA.w $000C,X
	LDY.w #$0003
	LDA.b ($18),Y
	AND.w #$00FF
	CMP.w #$0002
	BNE.b label_C2E04F
	LDY.w #$0006
	LDA.b ($18),Y
	AND.w #$00FF
	CMP.b $1A
	BEQ.b label_C2E043
	BCS.b label_C2E04F
label_C2E043:
	LDY.w #$0007
	LDA.b ($18),Y
	AND.w #$00FF
	CMP.b $1A
	BCS.b label_C2E08C
label_C2E04F:
	LDY.w #$0003
	LDA.b ($18),Y
	AND.w #$00FF
	BEQ.b label_C2E073
	LDY.w #$0004
	LDA.b ($18),Y
	AND.w #$00FF
	CMP.b $1A
	BEQ.b label_C2E067
	BCS.b label_C2E073
label_C2E067:
	LDY.w #$0005
	LDA.b ($18),Y
	AND.w #$00FF
	CMP.b $1A
	BCS.b label_C2E08C
label_C2E073:
	LDA.b $1A
	ASL
	STA.b $1A
	LDY.w #$004C
	CLC
	ADC.b ($18),Y
	PHA
	LDA.b $1A
	CLC
	ADC.b $18
	TAX
	LDA.w $000C,X
	PLX
	STA.w $0000,X
label_C2E08C:
	PLD
	RTS

;--------------------------------------------------------------------

label_C2E08E:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF2
	TCD
	PLA
	STA.b $04
	LDA.w $ADD5
	AND.w #$00FF
	CMP.w #$0004
	BNE.b label_C2E0C1
	LDA.w #$0001
	STA.b $02
	BRA.b label_C2E0B8

label_C2E0AC:
	LDY.b $02
	LDX.b $04
	LDA.w #$ADD4
	JSR.w label_C2DF2E
	INC.b $02
label_C2E0B8:
	LDA.b $02
	CMP.w #$0010
	BCC.b label_C2E0AC
	BRA.b label_C2E0E5

label_C2E0C1:
	LDA.w #$0001
	STA.b $02
	BRA.b label_C2E0DE

label_C2E0C8:
	LDY.b $02
	LDX.b $04
	LDA.w #$ADD4
	JSR.w label_C2DF2E
	LDY.b $02
	LDX.b $04
	LDA.w #$AE4B
	JSR.w label_C2DF2E
	INC.b $02
label_C2E0DE:
	LDA.b $02
	CMP.w #$0004
	BCC.b label_C2E0C8
label_C2E0E5:
	PLD
	RTS

;--------------------------------------------------------------------

org $C2E6B6
label_C2E6B6:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE5
	TCD
	LDA.w $1B9E
	AND.w #$00FF
	BNE.b label_C2E6C9
	JMP.w $C2E83D

label_C2E6C9:
	LDX.w #$1B9E
	SEP.b #$20
	LDA.w $0000,X
	DEC
	STA.w $1B9E
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C2E6DF
	JMP.w label_C2E782

label_C2E6DF:
	LDA.w #$1BA0
	STA.b $04
	LDX.b $04
	LDA.w $0000,X
	AND.w #$00FF
	BEQ.b label_C2E766
	SEP.b #$20
	LDA.w $1B9F
	STA.w $1B9E
	REP.b #$20
	LDA.w #$1BA1
	STA.b $02
	LDY.b $02
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$5800
	LDX.w #$0400
	SEP.b #$20
	LDA.b #$06
	JSL.l label_C08616
	LDA.w #$E6B3
	STA.b $0E
	LDA.w #$00C2
	STA.b $10
	LDY.w #$5800
	LDX.w #$0400
	SEP.b #$20
	LDA.b #$0F
	JSL.l label_C08616
	LDY.b $02
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.w #$0400
	CLC
	ADC.b $06
	STA.b $06
	LDY.b $02
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDX.b $04
	SEP.b #$20
	LDA.w $0000,X
	DEC
	LDX.b $04
	STA.w $0000,X
	BRA.b label_C2E782

label_C2E766:
	LDA.w #$E6B4
	STA.b $0E
	LDA.w #$00C2
	STA.b $10
	LDY.w #$5800
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$03
	JSL.l label_C08616
	JSL.l label_C2DE96
label_C2E782:
	LDX.w #$1BA9
	SEP.b #$20
	LDA.w $0000,X
	STA.b $1A
	REP.b #$20
	AND.w #$00FF
	BNE.b label_C2E796
	JMP.w label_C2E83D

label_C2E796:
	SEP.b #$20
	LDA.b $1A
	DEC
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C2E7A8
	JMP.w label_C2E83D

label_C2E7A8:
	SEP.b #$20
	LDA.w $1BA8
	STA.w $0000,X
	LDA.w $1BA6
	SEC
	SBC.w $1BA5
	REP.b #$20
	AND.w #$00FF
	STA.b $02
	INC.b $02
	LDX.w #$0000
	STX.b $18
	BRA.b label_C2E813

label_C2E7C7:
	LDA.w $1BA7
	AND.w #$00FF
	STA.b $04
	TXA
	CMP.b $04
	BCS.b label_C2E7E1
	TXA
	CLC
	ADC.b $02
	SEC
	SBC.b $04
	STA.b $04
	STA.b $16
	BRA.b label_C2E7E9

label_C2E7E1:
	TXA
	SEC
	SBC.b $04
	STA.b $04
	STA.b $16
label_C2E7E9:
	LDA.w $1BA5
	AND.w #$00FF
	STA.b $14
	STX.b $04
	CLC
	ADC.b $04
	ASL
	CLC
	ADC.w $1BCA
	PHA
	LDA.b $16
	STA.b $04
	LDA.b $14
	CLC
	ADC.b $04
	ASL
	TAX
	LDA.w $1BAA,X
	PLX
	STA.w $0000,X
	LDX.b $18
	INX
	STX.b $18
label_C2E813:
	TXA
	CMP.b $02
	BCC.b label_C2E7C7
	LDX.w #$1BA7
	SEP.b #$20
	LDA.w $0000,X
	INC
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	CMP.b $02
	BCC.b label_C2E834
	SEP.b #$20
	LDA.b #$00
	STA.w $0000,X
label_C2E834:
	REP.b #$20
	LDA.w #$0018
	JSL.l label_C0856B
label_C2E83D:
	LDX.w #$1BCC
	LDA.w $0000,X
	BEQ.b label_C2E893
	DEC
	STA.w $0000,X
	BNE.b label_C2E893
	LDA.w #$0014
	JSL.l $C2FAD8
	LDA.w #$0000
	STA.b $02
	BRA.b label_C2E88C

label_C2E859:
	LDA.b $02
	ASL
	TAX
	LDA.w $AEE7,X
	BEQ.b label_C2E88A
	LDA.w #$0001
	STA.b $04
	BRA.b label_C2E883

label_C2E869:
	LDA.w $1BD4
	STA.b $0E
	LDY.w $1BD2
	LDX.w $1BD0
	LDA.b $02
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $04
	JSL.l $C2FB35
	INC.b $04
label_C2E883:
	LDA.b $04
	CMP.w #$0010
	BCC.b label_C2E869
label_C2E88A:
	INC.b $02
label_C2E88C:
	LDA.b $02
	CMP.w #$0004
	BCC.b label_C2E859
label_C2E893:
	LDX.w #$1BCE
	LDA.w $0000,X
	BEQ.b label_C2E8C2
	DEC
	STA.w $0000,X
	BNE.b label_C2E8C2
	LDY.w #$0000
	STY.b $12
	BRA.b label_C2E8BD

label_C2E8A8:
	TYA
	ASL
	TAX
	LDA.w $AEE7,X
	BEQ.b label_C2E8B8
	TYX
	LDA.w #$0014
	JSL.l $C2FADE
label_C2E8B8:
	LDY.b $12
	INY
	STY.b $12
label_C2E8BD:
	CPY.w #$0004
	BCC.b label_C2E8A8
label_C2E8C2:
	PLD
	RTL

;--------------------------------------------------------------------

label_C2E8C4:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF2
	TCD
	PLA
	STY.b $02
	TAY
	JSL.l label_C4A67E
	LDA.b $02
	SEP.b #$20
	STA.w $AECA
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

org $C2E8E0
label_C2E8E0:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE8
	TCD
	LDA.w #$0001
	STA.b $16
	LDA.w #$0004
	STA.b $14
	STA.b $04
	LDY.w #$0000
	STY.b $12
	LDA.w $4DBC
	BEQ.b label_C2E90A
	CMP.w #$0001
	BEQ.b label_C2E918
	CMP.w #$0002
	BEQ.b label_C2E935
	BRA.b label_C2E94B

label_C2E90A:
	LDX.w #$00B0
	STX.b $10
	LDA.w #$000E
	STA.b $02
	STA.b $0E
	BRA.b label_C2E94B

label_C2E918:
	LDX.w #$00B0
	STX.b $10
	LDA.w #$001C
	STA.b $14
	LDA.w #$0005
	STA.b $04
	LDY.w #$000C
	STY.b $12
	LDA.w #$0006
	STA.b $02
	STA.b $0E
	BRA.b label_C2E94B

label_C2E935:
	LDX.w #$0009
	STX.b $10
	STZ.b $14
	LDA.w #$001F
	STA.b $04
	TAY
	STY.b $12
	LDA.w #$0006
	STA.b $02
	STA.b $0E
label_C2E94B:
	LDA.w $4A8C
	CMP.w #$01C0
	BCC.b label_C2E964
	LDA.w #$0003
	STA.b $16
	LDA.w #$000E
	STA.b $02
	STA.b $0E
	LDX.w #$0008
	STX.b $10
label_C2E964:
	LDX.b $10
	TXA
	JSL.l label_C4FBBD
	JSL.l label_C04F47
	LDA.b $0E
	STA.b $02
	AND.w #$0004
	BEQ.b label_C2E99F
	LDY.b $12
	LDX.b $04
	LDA.b $14
	JSL.l label_C0B01A
	LDA.b $02
	AND.w #$0008
	BEQ.b label_C2E995
	LDX.w #$00FF
	LDA.w #$0010
	JSL.l label_C0B039
	BRA.b label_C2E99F

label_C2E995:
	LDX.w #$00BF
	LDA.w #$0010
	JSL.l label_C0B039
label_C2E99F:
	LDY.w #$001E
	LDX.b $02
	LDA.b $16
	JSL.l label_C2E8C4
	LDA.b $02
	AND.w #$0004
	BEQ.b label_C2E9BA
	SEP.b #$20
	LDA.b #$20
	STA.w $AEC8
	BRA.b label_C2E9C1

label_C2E9BA:
	SEP.b #$20
	LDA.b #$0F
	STA.w $AEC8
label_C2E9C1:
	STZ.w $AECB
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

org $C2E9ED
label_C2E9ED:
	REP.b #$31
	SEP.b #$20
	STZ.w $AEC2
	REP.b #$20
	LDA.w $AEC9
	AND.w #$00FF
	INC
	INC
	INC
	JSL.l label_C0AE34
	LDY.w #$0000
	TYX
	TYA
	JSL.l label_C0B01A
	LDX.w #$0000
	TXA
	JSL.l label_C0B047
	RTL

;--------------------------------------------------------------------

org $C2EAAA
label_C2EAAA:
	REP.b #$31
	SEP.b #$20
	STZ.w $AEC2
	REP.b #$20
	LDA.w #$0000
	STA.w $AECC
	LDA.w #$0000
	STA.w $AECE
	LDA.w #$0003
	JSL.l label_C0AE34
	LDX.w #$0000
	TXA
	JSL.l label_C0B047
	RTL

;--------------------------------------------------------------------

org $C2FD99
label_C2FD99:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE6
	TCD
	LDA.w #$0000
	STA.b $04
	STA.b $18
	JMP.w label_C2FEEB

label_C2FDAB:
	LDA.b $04
	ASL
	CLC
	ADC.w #$AEF4
	TAX
	LDA.w $0000,X
	BNE.b label_C2FDBB
	JMP.w label_C2FEE5

label_C2FDBB:
	DEC
	STA.w $0000,X
	LDA.b $04
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $16
	CLC
	ADC.w #$AF02
	TAY
	LDA.b $16
	CLC
	ADC.w #$B082
	TAX
	STX.b $14
	LDA.b $16
	CLC
	ADC.w #$B202
	STA.b $12
	LDA.b $18
	STA.b $04
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$0382
	STA.b $02
	LDA.w #$0001
	STA.b $10
	JMP.w label_C2FED2

label_C2FDFA:
	LDA.w $0000,Y
	BEQ.b label_C2FE34
	STX.b $16
	LDA.b $12
	TAX
	LDA.w $0000,X
	CLC
	ADC.b ($16)
	STA.b ($16)
	BRA.b label_C2FE24

label_C2FE0E:
	STX.b $16
	LDA.b $0E
	SEC
	SBC.w $B37C
	STA.b ($16)
	LDA.b $02
	STA.b $16
	LDA.w $0000,Y
	CLC
	ADC.b ($16)
	STA.b ($16)
label_C2FE24:
	LDX.b $14
	LDA.w $0000,X
	STA.b $0E
	LDA.w $B37C
	CMP.b $0E
	BCC.b label_C2FE0E
	BEQ.b label_C2FE0E
label_C2FE34:
	INY
	INY
	INX
	INX
	STX.b $16
	LDA.b $12
	INC
	INC
	STA.b $14
	LDA.w $0000,Y
	BEQ.b label_C2FE7A
	STX.b $12
	LDA.b $14
	TAX
	LDA.w $0000,X
	CLC
	ADC.b ($12)
	STA.b ($12)
	BRA.b label_C2FE6A

label_C2FE54:
	STX.b $12
	LDA.b $0E
	SEC
	SBC.w $B37C
	STA.b ($12)
	LDA.b $02
	STA.b $12
	LDA.w $0000,Y
	CLC
	ADC.b ($12)
	STA.b ($12)
label_C2FE6A:
	LDX.b $16
	LDA.w $0000,X
	STA.b $0E
	LDA.w $B37C
	CMP.b $0E
	BCC.b label_C2FE54
	BEQ.b label_C2FE54
label_C2FE7A:
	INY
	INY
	INX
	INX
	STX.b $16
	LDA.b $14
	INC
	INC
	STA.b $12
	LDA.w $0000,Y
	BEQ.b label_C2FEC0
	STX.b $14
	LDA.b $12
	TAX
	LDA.w $0000,X
	CLC
	ADC.b ($14)
	STA.b ($14)
	BRA.b label_C2FEB0

label_C2FE9A:
	STX.b $14
	LDA.b $0E
	SEC
	SBC.w $B37C
	STA.b ($14)
	LDA.b $02
	STA.b $14
	LDA.w $0000,Y
	CLC
	ADC.b ($14)
	STA.b ($14)
label_C2FEB0:
	LDX.b $16
	LDA.w $0000,X
	STA.b $0E
	LDA.w $B37C
	CMP.b $0E
	BCC.b label_C2FE9A
	BEQ.b label_C2FE9A
label_C2FEC0:
	INY
	INY
	INX
	INX
	STX.b $14
	LDA.b $12
	INC
	INC
	STA.b $12
	INC.b $02
	INC.b $02
	INC.b $10
label_C2FED2:
	LDA.b $10
	CMP.w #$0010
	BCS.b label_C2FEDE
	BEQ.b label_C2FEDE
	JMP.w label_C2FDFA

label_C2FEDE:
	LDA.w #$0010
	JSL.l label_C0856B
label_C2FEE5:
	INC.b $04
	LDA.b $04
	STA.b $18
label_C2FEEB:
	LDA.b $04
	CMP.w #$0004
	BCS.b label_C2FEF7
	BEQ.b label_C2FEF7
	JMP.w label_C2FDAB

label_C2FEF7:
	PLD
	RTL

;--------------------------------------------------------------------

	%FREE_BYTES(NULLROM, 52, $00)					; $C2FFCC

%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankC3Macros(StartBank, EndBank)
%BANK_START(<StartBank>)
FileSelectScreenSpritePalettes:
;$C30000
	incbin "Palettes/FileSelectScreenSpritePalettes.bin"

;--------------------------------------------------------------------

EB_DisplayCopyrightProtectionScreen:
.Main:
;$C30100
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	JSL.l label_C40B51
	LDA.w #CopyrightProtectionScreenGFX
	STA.b $0E
	LDA.w #CopyrightProtectionScreenGFX>>16
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #CopyrightProtectionScreenTilemap
	STA.b $0E
	LDA.w #CopyrightProtectionScreenTilemap>>16
	STA.b $10
	LDA.w #$4000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	JSL.l label_C40B75
	PLD
	RTL

;--------------------------------------------------------------------

DisplayIncorrectRegionScreen:
.Main:
;$C30142
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	JSL.l label_C40B51
	LDA.w #IncorrectRegionScreenGFX
	STA.b $0E
	LDA.w #IncorrectRegionScreenGFX>>16
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #IncorrectRegionScreenTilemap-$04			; Todo: This "-$04" might be incorrect.
	STA.b $0E
	LDA.w #IncorrectRegionScreenTilemap>>16
	STA.b $10
	LDA.w #$4000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	JSL.l label_C40B75
	PLD
	RTL

;--------------------------------------------------------------------

org $C30184
DATA_C30184:
	dw $01DB

DATA_C30186:
	dw $02ED

;--------------------------------------------------------------------

org $C34378
Script0214_UnknownNameEntryScreenScript:
;$C34378
	db $25 : dw label_C09FC8
	db $23 : dw label_C0A0BB
	db $0E,$00 : dw $0001
	db $19 : dw DATA_C34392

Script0215_UnknownNameEntryScreenScript:
;$C34385
	db $25 : dw label_C09FC8
	db $23 : dw label_C0A0BB
	db $0E,$00 : dw $0000
	db $19 : dw DATA_C34392

DATA_C34392:
	db $07 : dw DATA_C343AE
	db $3F : dw $FF00
	db $01,$05
	db $42 : dl label_C0AA6E : db $06,$00
	db $06,$08
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$08
	db $02
	db $19 : dw Script0023_UnknownNameEntryScreenScript

DATA_C343AE:
	db $06,$01
	db $1D : dw $0100
	db $42 : dl label_C468B5
	db $0A : dw DATA_C343C4

DATA_C343BA:
	db $1D : dw $FFF4
	db $42 : dl label_C468B5
	db $0A : dw DATA_C343D8

DATA_C343C4:
	db $1D : dw $00E0
	db $42 : dl label_C468DC
	db $0A : dw DATA_C343AE

DATA_C343CE:
	db $1D : dw $FFF4
	db $42 : dl label_C468DC
	db $0B : dw DATA_C343AE
DATA_C343D8:
	db $19 : dw Script0023_UnknownNameEntryScreenScript

;$C343DB

;--------------------------------------------------------------------

org $C371F4
Script0270_SleepingNessHead:
;$C371F4
	db $2C : dw $0001
	db $19 : dw DATA_C37276

;--------------------------------------------------------------------

org $C37245
Script0272_NessGettingOutOfBed:
;$C37245
	db $23 : dw label_C0A37A
	db $25 : dw label_C09FC8
	db $28 : dw $1FC8
	db $29 : dw $0448
	db $3B,$FF
	db $42 : dl label_C0A685 : dw $0080
	db $0E,$05 : dw $0001
	db $0E,$06 : dw $1FB8
	db $0E,$07 : dw $0448
	db $1A : dw DATA_C3AB59
	db $06,$04
	db $2C : dw $000A
	db $06,$02
	db $42 : dl label_C46E46
	db $19 : dw DATA_C3A204

DATA_C37276:
	db $25 : dw label_C09FF0
	db $3B,$00
	db $39
	db $42 : dl label_C0C7DB
	db $42 : dl label_C0A4BF
	db $19 : dw DATA_C3A17B

Script0274_SleepingNessZzz:
;$C37287
	db $25 : dw label_C09FF0
	db $3B,$00
	db $39
	db $42 : dl label_C0A679 : db $00
	db $42 : dl label_C0A4BF
DATA_C37296:
	db $06,$18
	db $3B,$00
	db $42 : dl label_C0A4B2
	db $06,$30
	db $3B,$FF
	db $42 : dl label_C0A4A8
	db $42 : dl label_C0C6B6
	db $0B : dw DATA_C37296
	db $19 : dw DATA_C3A204

;--------------------------------------------------------------------

Script035E_Mailbox:
;$C3949B
	db $1A : dw DATA_C39AC7
DATA_C3949E:
	db $06,$01
	db $42 : dl label_C0A84C : dw $01DF
	db $0A : dw DATA_C3949E
	db $0E,$00 : dw $0A50
	db $0E,$01 : dw $0188
	db $0E,$02 : dw $0010
	db $0E,$03 : dw $0008
	db $42 : dl label_C46E74
	db $0A : dw DATA_C3949E
	db $1A : dw DATA_C39E01
	db $42 : dl label_C0A88D : dw $00C6
	db $0B : dw $0000
	db $1A : dw DATA_C39AC7
DATA_C394CF:
	db $06,$01
	db $42 : dl label_C0A84C : dw $01E0
	db $0A : dw DATA_C394CF
	db $0E,$00 : dw $1D78
	db $0E,$01 : dw $05DC
	db $0E,$02 : dw $0010
	db $0E,$03 : dw $0004
	db $42 : dl label_C46E74
	db $0A : dw DATA_C394CF
	db $1A : dw DATA_C39E01
	db $42 : dl label_C0A88D : dw $00C6
	db $15 : dw $7E0988 : db $1A,$C7
	db $9A,$06,$01,$42,$4C,$A8,$C0,$E1
	db $01,$0A,$00,$95,$0E,$00,$E0,$05
	db $0E,$01,$98,$19,$0E,$02

;--------------------------------------------------------------------

org $C39AC7
DATA_C39AC7:

;--------------------------------------------------------------------

org $C39E01
DATA_C39E01:

;--------------------------------------------------------------------

org $C3A043
Script0001_IntroCutsceneCameraPan:
;$C3A043
if !Define_EB_Global_DisableCopyDetection == !FALSE
	db $42 : dl label_C1FFD3
endif
	db $0A : dw DATA_C3A04E

org $C3A04E
DATA_C3A04E:
	db $08 : dl label_C05200
DATA_C3A052:
	db $01,$06
	db $06,$C8
	db $02
	db $42 : dl label_C20000
	db $19 : dw DATA_C3A052

;--------------------------------------------------------------------

Script0002_UnknownScript:			; Note: This runs in the intro cutscene. Possible sprite script?
;$C3A05E
	db $23 : dw label_C0A039
	db $25 : dw label_C0A26B
	db $3B,$00
	db $42 : dl label_C03DAA
	db $42 : dl label_C04EF0
	db $42 : dl label_C0A6DA
	db $08 : dl label_C04D78
DATA_C3A076:
	db $42 : dl label_C0A6E3
	db $06,$01
	db $19 : dw DATA_C3A076

;--------------------------------------------------------------------

org $C3A111
DATA_C3A111:
	db $06,$08
	db $20,$04
	db $0B : dw DATA_C3A11E
	db $3B,$01
	db $42 : dl label_C0A4B2
DATA_C3A11E:
	db $06,$08
	db $20,$04
	db $0B : dw DATA_C3A111
	db $3B,$00
	db $42 : dl label_C0A4A8
	db $19 : dw DATA_C3A111

;--------------------------------------------------------------------

org $C3A17B
DATA_C3A17B:
	db $06,$18
	db $3B,$01
	db $42 : dl label_C0A4B2
	db $06,$30
	db $42 : dl label_C40015
	db $0B : dw DATA_C3A17B
	db $19 : dw DATA_C3A204

;--------------------------------------------------------------------

org $C3A1F3
DATA_C3A1F3:
	db $06,$10
	db $3B,$01
	db $42 : dl label_C0A4B2
	db $06,$10
	db $42 : dl label_C40015
	db $0B : dw DATA_C3A1F3
Script0023_UnknownNameEntryScreenScript:
	db $42 : dl label_C020F1
	db $00

;--------------------------------------------------------------------

org $C3A204
DATA_C3A204:
	db $42 : dl label_C020F1
	db $00

;--------------------------------------------------------------------

DATA_C3A209:
	db $06,$04
	db $19 : dw DATA_C3A204

;--------------------------------------------------------------------

org $C3A262
DATA_C3A262:
	db $42 : dl label_C0A6DA
DATA_C3A266:
	db $42 : dl label_C05E76
	db $F1, $A6, $64, $C0
	db $19 : dw DATA_C3A266

;--------------------------------------------------------------------

org $C3A2AA
Script0008_TrafficLight:
	db $25 : dw $9FF0
	db $3B,$00
	db $39
	db $42 : dl label_C0C7DB
	db $42 : dl label_C0A4BF
DATA_C3A2B8:
	db $06,$08
	db $42 : dl label_C0C6B6
	db $0B : dw DATA_C3A2B8
	db $42 : dl label_C020F1
	db $00

;--------------------------------------------------------------------

org $C3A2C6
Script035D_HandleConfirmationScreenWalkingCharacters:
;$C3A2C6
	db $25 : dw label_C09FF0
	db $3B,$00
	db $39
	db $42 : dl label_C0A4BF
	db $19 : dw DATA_C3A1F3

	;db $25 : dw label_C09FF0
	;db $3B,$00
	;db $39
	;db $42 : dl $C0C7DB
	;db $42 : dl $C0A4BF
	;db $19 : dw DATA_C3A1F3

;--------------------------------------------------------------------

org $C3A381
DATA_C3A381:
	db $25 : dw label_C0A360
	db $3B,$00
	db $07 : dw DATA_C3A111
	db $07 : dw DATA_C3A262

;--------------------------------------------------------------------

org $C3AA1E
DATA_C3AA1E:
	db $42 : dl label_C0A65F
	db $42 : dl label_C0C83B
	db $42 : dl label_C0A4BF
	db $1B

;--------------------------------------------------------------------

org $C3AB44
DATA_C3AB44:
	db $42 : dl label_C46ADB
	db $42 : dl label_C47044
	db $42 : dl label_C46B0A
	db $42 : dl label_C0A65F
	db $42 : dl label_C0A4BF
	db $1B

DATA_C3AB59:
	db $1A : dw DATA_C3AB44
DATA_C3AB5C:
	db $06,$01
	db $42 : dl label_C0A8DC
	db $0A : dw DATA_C3AB5C
	db $39
	db $1B

org $C3ABE0
DATA_C3ABE0:						; Note: Fade out related
	db $06,$01
	db $1E : dw $0028
	db $27 : dl $00FF00
	db $0B : dw DATA_C3ABE0
	db $1B

Script01DC_IntroCutsceneController1:
;$C3ABED
	db $28 : dw $0824
	db $29 : dw $06E8
	db $23 : dw label_C0A039
	db $25 : dw label_C09FC8
	db $3B,$FF
	db $08 : dl label_C48BE1
	db $42 : dl label_C0A685 : dw $0100
	db $1D : dw $0007
	db $1A : dw DATA_C3AA1E
	db $01,$05
	db $06,$3C
	db $02
	db $42 : dl label_C09FBB : dw $0701
	db $1A : dw  DATA_C3ABE0
	db $1D : dw $0000
	db $42 : dl label_C49EC4
	db $42 : dl label_C46E46
	db $19 : dw DATA_C3A204

Script01DD_IntroCutsceneController2:
;$C3AC27
	db $28 : dw $07D0
	db $29 : dw $0590
	db $23 : dw label_C0A039
	db $25 : dw label_C09FC8
	db $3B,$FF
	db $08 : dl label_C48BE1
	db $42 : dl label_C0A685 : dw $0100
	db $1D : dw $0001
	db $1A : dw DATA_C3AA1E
	db $01,$05
	db $06,$3C
	db $02
	db $42 : dl label_C09FBB : dw $0701
	db $1A : dw DATA_C3ABE0
	db $1D : dw $0001
	db $42 : dl label_C49EC4
	db $42 : dl label_C46E46
	db $19 : dw DATA_C3A204

Script01DD_IntroCutsceneController3:
;$C3AC61
	db $28 : dw $0A68
	db $29 : dw $0378
	db $23 : dw label_C0A039
	db $25 : dw label_C09FC8
	db $3B,$FF
	db $08 : dl label_C48BE1
	db $42 : dl label_C0A685 : dw $0100
	db $1D : dw $0000
	db $1A : dw DATA_C3AA1E
	db $0E,$05 : dw $0001
	db $0E,$06 : dw $0A68
	db $0E,$07 : dw $0150
	db $1A : dw DATA_C3AB59
	db $39
	db $06,$78
	db $42 : dl label_C09FBB
	db $01,$07
	db $1A : dw DATA_C3ABE0
	db $1D : dw $0002
	db $42 : dl label_C49EC4
	db $42 : dl label_C46E46
	db $15 : dw $7E4A66,$0000
	db $19 : dw DATA_C3A204

;--------------------------------------------------------------------

Script0024_MeteorImpactEffect:
.Main:
;$C3ACAD
	db $42 : dl label_C0A864 : db $FF
	db $25 : dw label_C09FC8
	db $3B,$FF
	db $08 : dl label_C48C2B
	db $2C : dw $0010
	db $06,$02
	db $2C : dw $FFE1
	db $06,$02
	db $2C : dw $001A
	db $06,$02
	db $2C : dw $FFE9
	db $06,$02
	db $2C : dw $0015
	db $06,$02
	db $2C : dw $FFED
	db $06,$02
	db $2C : dw $0012
	db $06,$02
	db $2C : dw $FFF0
	db $06,$02
	db $2C : dw $000F
	db $06,$02
	db $2C : dw $FFF2
	db $06,$02
	db $2C : dw $000D
	db $06,$02
	db $2C : dw $FFF4
	db $06,$02
	db $2C : dw $000B
	db $06,$02
	db $2C : dw $FFF5
	db $06,$02
	db $2C : dw $000A
	db $06,$02
	db $2C : dw $FFF7
	db $06,$02
	db $2C : dw $0009
	db $06,$02
	db $2C : dw $FFF8
	db $06,$02
	db $2C : dw $0008
	db $06,$02
	db $2C : dw $FFF9
	db $06,$02
	db $2C : dw $0007
	db $06,$02
	db $2C : dw $FFFA
	db $06,$02
	db $2C : dw $0006
	db $06,$02
	db $2C : dw $FFFB
	db $06,$02
	db $2C : dw $0005
	db $06,$02
	db $2C : dw $FFFB
	db $06,$02
	db $2C : dw $0004
	db $06,$02
	db $2C : dw $FFFC
	db $06,$02
	db $2C : dw $0004
	db $06,$02
	db $2C : dw $FFFD
	db $06,$02
	db $2C : dw $0003
	db $06,$02
	db $2C : dw $FFFD
	db $06,$02
	db $01,$0A
	db $2C : dw $0002
	db $06,$02
	db $2C : dw $FFFE
	db $06,$02
	db $02
	db $01,$14
	db $2C : dw $0001
	db $06,$02
	db $2C : dw $FFFF
	db $06,$02
	db $02
	db $42 : dl label_C46E46
	db $09

;$C3AD7A
	db $00,$00,$00,$00,$00,$00
	;db $42 : dl label_C0A84C : dw $0127
	db $0A : dw DATA_C3A381
	db $25,$60,$A3
	db $07,$9F,$A0
	db $07,$62,$A2
	db $3B,$00
	db $39
	db $42,$BF,$A4,$C0
	db $42,$8D,$A8,$C0 : db $C5,$00,$9F,$E7
	db $42,$85,$A6,$C0 : db $00,$01
	db $0E,$05 : dw $002A
	db $42,$43,$A9,$C0 : db $01
	db $1A : dw $C3AB44
DATA_C3ADAD:
	db $06,$01
	db $39
	db $1D,$30,$1E
	db $42,$B5,$68,$C4
	db $0B,$C6,$AD
	db $42,$43,$A9,$C0,$01
	db $42,$C6,$A8,$C0
	db $19 : dw DATA_C3ADAD

;--------------------------------------------------------------------

Script00C9_UnknownScript:
;$C3D5D8

;--------------------------------------------------------------------

org $C3E012
DATA_C3E012:
	db $01,$00,$1B,$00,$02,$00,$18,$00
	db $02,$00,$1C,$00,$02,$00,$19,$00
	db $03,$00,$1D,$00,$02,$00,$1A,$00
	db $04,$00,$1E,$00,$02,$00,$1B,$00
	db $2C,$00,$FF,$FF,$02,$00,$1C,$00
	db $2D,$00,$FF,$FF,$02,$00,$1C,$00
	db $28,$00,$FF,$FF,$02,$00,$1C,$00
	db $B6,$00,$FF,$FF,$02,$00,$1C,$00
	db $2E,$00,$FF,$FF,$03,$00,$1C,$00
	db $29,$00,$FF,$FF,$02,$00,$1C,$00
	db $27,$00,$FF,$FF,$02,$00,$1C,$00
	db $27,$00,$FF,$FF,$02,$00,$1C,$00
	db $27,$00,$FF,$FF,$02,$00,$1C,$00
	db $27,$00,$FF,$FF,$02,$00,$1C,$00
	db $27,$00,$FF,$FF,$02,$00,$1C,$00
	db $33,$00,$23,$00,$02,$00,$1C,$00
	db $33,$00,$23,$00,$02,$00,$1C,$00

;--------------------------------------------------------------------

DATA_C3E09A:
;$C3E09A

;--------------------------------------------------------------------

org $C3E0BC
DATA_C3E0BC:
	db $00,$60,$01,$00,$00,$60,$01,$00
	db $00,$60,$01,$00,$CC,$CC,$01,$00
	db $00,$00,$01,$00,$00,$00,$00,$00
	db $00,$00,$01,$00,$CC,$CC,$00,$00
	db $CC,$CC,$00,$00,$00,$00,$00,$00
	db $00,$80,$00,$00,$00,$00,$00,$00
	db $CC,$CC,$00,$00,$CC,$CC,$00,$00

DATA_C3E0F4:
	db $E6,$F8,$00,$00,$E6,$F8,$00,$00
	db $E6,$F8,$00,$00,$D5,$45,$01,$00
	db $05,$B5,$00,$00,$00,$00,$00,$00
	db $05,$B5,$00,$00,$D0,$90,$00,$00
	db $D0,$90,$00,$00,$00,$00,$00,$00
	db $82,$5A,$00,$00,$00,$00,$00,$00
	db $D0,$90,$00,$00,$D0,$90,$00,$00

;--------------------------------------------------------------------

DATA_C3E12C:
	dw $00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$0011
	dw $0011,$00FF,$00FF,$00FF,$0000,$00FF

DATA_C3E148:
	dw $0000,$0000,$000A,$0000,$0000,$0000,$FFF6,$0000

DATA_C3E158:
	dw $FFFB,$FFFB,$0000,$0005,$0005,$0005,$0000,$FFFB
	dw $0004,$0004,$0006,$0000,$0000,$0000,$0002,$0004

DATA_C3E178:
	dw $0000,$0400,$0800,$0C00,$0200,$0600,$0A00,$0E00
	dw $0100,$0500,$0900,$0D00,$0300,$0700,$0B00,$0F00
	dw $0000,$0200,$0100,$0300,$0800,$0A00,$0900,$0B00
	dw $0400,$0600,$0500,$0700,$0C00,$0E00,$0D00,$0F00
	dw $0000,$0800,$0400,$0C00,$0100,$0900,$0500,$0D00
	dw $0200,$0A00,$0600,$0E00,$0300,$0B00,$0700,$0F00

DATA_C3E1D8:
	dw $0004,$0000,$0002,$0006,$0000,$0000,$0004,$0000
	dw $0000,$0000,$FFFC,$0000,$FFFC,$0000,$0000,$0000
	dw $0004,$0000,$0000,$0000,$0007,$0001,$0005,$0003
	dw $0002,$0006,$0002,$0006,$0000,$0008,$0000,$0008
	dw $0000,$0000,$0008,$0008,$0008,$0000,$0008,$0000
	dw $0008,$0008,$0000,$0000

DATA_C3E230:
	dw $0000,$0001,$0001,$0001,$0000,$FFFF,$FFFF,$FFFF

DATA_C3E240:
	dw $FFFF,$FFFF,$0000,$0001,$0001,$0001,$0000,$FFFF

;--------------------------------------------------------------------

; Note: Something related to the file select?

DATA_C3E250:
	db $01,$00,$01,$00,$0D,$00,$08,$00,$0C,$00,$01,$00,$13,$00,$08,$00
	db $07,$00,$01,$00,$18,$00,$10,$00,$01,$00,$01,$00,$06,$00,$0A,$00
	db $01,$00,$03,$00,$0B,$00,$06,$00,$14,$00,$01,$00,$0B,$00,$10,$00
	db $08,$00,$01,$00,$14,$00,$0A,$00,$12,$00,$01,$00,$0D,$00,$10,$00
	db $01,$00,$01,$00,$1E,$00,$12,$00,$0C,$00,$01,$00,$13,$00,$12,$00
	db $01,$00,$0A,$00,$08,$00,$04,$00,$01,$00,$0F,$00,$0B,$00,$04,$00
	db $0C,$00,$01,$00,$13,$00,$10,$00,$07,$00,$01,$00,$18,$00,$10,$00
	db $04,$00,$01,$00,$18,$00,$06,$00,$01,$00,$01,$00,$15,$00,$06,$00
	db $04,$00,$01,$00,$08,$00,$08,$00,$0C,$00,$01,$00,$0C,$00,$04,$00
	db $01,$00,$01,$00,$0E,$00,$06,$00,$01,$00,$02,$00,$1E,$00,$08,$00
	db $05,$00,$09,$00,$16,$00,$04,$00,$0A,$00,$10,$00,$0C,$00,$08,$00
	db $0A,$00,$10,$00,$0C,$00,$06,$00,$06,$00,$11,$00,$15,$00,$0A,$00
	db $03,$00,$0E,$00,$10,$00,$0A,$00,$08,$00,$0F,$00,$12,$00,$08,$00
	db $05,$00,$04,$00,$08,$00,$04,$00,$0D,$00,$04,$00,$11,$00,$04,$00
	db $01,$00,$09,$00,$1E,$00,$10,$00,$07,$00,$03,$00,$07,$00,$04,$00
	db $07,$00,$07,$00,$07,$00,$04,$00,$07,$00,$0B,$00,$07,$00,$04,$00
	db $07,$00,$0F,$00,$07,$00,$04,$00,$14,$00,$03,$00,$08,$00,$04,$00
	db $0F,$00,$07,$00,$0D,$00,$06,$00,$0F,$00,$0D,$00,$0D,$00,$06,$00
	db $04,$00,$15,$00,$18,$00,$04,$00,$12,$00,$06,$00,$0D,$00,$08,$00
	db $0C,$00,$01,$00,$0C,$00,$04,$00,$03,$00,$03,$00,$1A,$00,$06,$00
	db $01,$00,$01,$00,$07,$00,$04,$00,$10,$00,$08,$00,$0F,$00,$04,$00
	db $0A,$00,$08,$00,$15,$00,$04,$00,$04,$00,$08,$00,$1B,$00,$04,$00
	db $08,$00,$02,$00,$18,$00,$10,$00,$03,$00,$0B,$00,$0F,$00,$06,$00
	db $04,$00,$01,$00,$08,$00,$0A,$00,$01,$00,$09,$00,$1E,$00,$0A,$00
	db $01,$00,$01,$00,$1C,$00,$06,$00,$0A,$00,$04,$00,$14,$00,$04,$00
	db $0E,$00,$0B,$00,$0F,$00,$10,$00,$16,$00,$08,$00,$09,$00,$04,$00
	db $07,$00,$09,$00,$12,$00,$12,$00

;--------------------------------------------------------------------

DATA_C3E3F8:

;--------------------------------------------------------------------

org $C3E406
AnimatedMenuCursorTiles:
.PointRight:
..Top:
;$C3E406
	db $41,$24,$8D,$26

..Bottom:
	db $51,$24,$9D,$26

org $C3E416
.PointDown:
..Big:
	db $14,$3C

..Small:
	db $15,$3C

..Wait:
	db $11,$BC,$16,$3C,$6D,$2E,$6E,$2E

;--------------------------------------------------------------------

org $C3E4CA
label_C3E4CA:
	REP.b #$31
	SEP.b #$20
	STZ.w $9622
	REP.b #$20
	RTL

;--------------------------------------------------------------------

label_C3E4D4:
	REP.b #$31
	SEP.b #$20
	LDA.b #$01
	STA.w $9622
	REP.b #$20
	RTL

;--------------------------------------------------------------------

label_C3E4E0:
	REP.b #$31
	JSL.l label_C3E4CA
	JSL.l label_C12DD5
	JSL.l label_C3E4D4
	RTL

;--------------------------------------------------------------------

label_C3E4EF:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C3E517

label_C3E4FE:
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $8654,X
	CMP.w #$FFFF
	BNE.b label_C3E512
	LDA.b $0E
	BRA.b label_C3E51F

label_C3E512:
	LDA.b $0E
	INC
	STA.b $0E
label_C3E517:
	CMP.w #$0008
	BNE.b label_C3E4FE
	LDA.w #$FFFF
label_C3E51F:
	PLD
	RTL

;--------------------------------------------------------------------

label_C3E521:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	STA.b $16
	CMP.w #$FFFF
	BNE.b label_C3E535
	JMP.w label_C3E6F4

label_C3E535:
	LDA.b $16
	ASL
	TAX
	LDA.w $88E4,X
	STA.b $04
	CMP.w #$FFFF
	BNE.b label_C3E546
	JMP.w label_C3E6F4

label_C3E546:
	LDA.w $8958
	CMP.b $16
	BNE.b label_C3E553
	LDA.w #$FFFF
	STA.w $8958
label_C3E553:
	LDA.b $16
	JSL.l label_C3E7E3
	LDA.b $04
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.w $8652,X
	STY.b $14
	LDA.w $8650,X
	STA.b $12
	CPY.w #$FFFF
	BNE.b label_C3E577
	STA.w $88E2
	BRA.b label_C3E585

label_C3E577:
	TYA
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.b $12
	STA.w $8650,X
label_C3E585:
	CMP.w #$FFFF
	BNE.b label_C3E591
	LDY.b $14
	STY.w $88E0
	BRA.b label_C3E59F

label_C3E591:
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.b $14
	TYA
	STA.w $8652,X
label_C3E59F:
	LDA.b $04
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	STX.b $10
	LDA.w #$FFFF
	STA.w $8654,X
	LDA.b $16
	ASL
	TAX
	LDA.w #$FFFF
	STA.w $88E4,X
	LDX.b $10
	LDA.w $8656,X
	ASL
	STA.b $02
	LDA.w $8658,X
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	CLC
	ADC.w #$7DFE
	STA.b $02
	STA.b $0E
	LDY.w $8685,X
	STY.b $14
	LDX.w #$0000
	STX.b $10
	BRA.b label_C3E60A

label_C3E5E3:
	LDY.b $14
	LDA.w $0000,Y
	CMP.w #$0040
	BNE.b label_C3E5F2
	CMP.w #$0000
	BEQ.b label_C3E5F9
label_C3E5F2:
	LDA.w $0000,Y
	JSL.l label_C44AF7
label_C3E5F9:
	LDA.w #$0040
	LDY.b $14
	STA.w $0000,Y
	INY
	INY
	STY.b $14
	LDX.b $10
	INX
	STX.b $10
label_C3E60A:
	LDA.b $04
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.w $865A,X
	TAX
	LDA.w $865C,X
	JSL.l label_C09032
	STA.b $02
	LDX.b $10
	TXA
	CMP.b $02
	BCC.b label_C3E5E3
	LDY.w #$0000
	STY.b $10
	BRA.b label_C3E686

label_C3E62F:
	LDA.w #$0000
	STA.b $12
	BRA.b label_C3E64D

label_C3E636:
	LDA.w #$0000
	LDX.b $0E
	STX.b $02
	STA.w $0000,X
	INC.b $02
	INC.b $02
	LDA.b $02
	STA.b $0E
	LDA.b $12
	INC
	STA.b $12
label_C3E64D:
	LDA.b $04
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $865A,X
	TAX
	STX.b $02
	INC.b $02
	INC.b $02
	LDA.b $12
	CMP.b $02
	BNE.b label_C3E636
	STX.b $02
	LDA.w #$0020
	SEC
	SBC.b $02
	DEC
	DEC
	ASL
	PHA
	LDA.b $0E
	STA.b $02
	PLY
	STY.b $02
	CLC
	ADC.b $02
	STA.b $02
	STA.b $0E
	LDY.b $10
	INY
	STY.b $10
label_C3E686:
	LDA.b $04
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	STX.b $12
	LDA.w $865C,X
	STA.b $02
	INC.b $02
	INC.b $02
	LDY.b $10
	TYA
	CMP.b $02
	BNE.b label_C3E62F
	JSL.l label_C45E96
	LDX.b $12
	LDA.w $868B,X
	AND.w #$00FF
	BEQ.b label_C3E6BC
	AND.w #$00FF
	DEC
	ASL
	TAX
	LDA.w #$FFFF
	STA.w $894E,X
label_C3E6BC:
	LDA.b $04
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	SEP.b #$20
	STZ.w $868B,X
	LDA.b #$01
	STA.w $9623
	REP.b #$20
	LDA.w $5E7A
	CMP.b $16
	BNE.b label_C3E6DF
	LDA.w #$FFFF
	STA.w $5E7A
label_C3E6DF:
	LDA.w $5E70
	AND.w #$00FF
	BNE.b label_C3E6EF
	JSL.l label_C3E4E0
	JSL.l label_C3E4CA
label_C3E6EF:
	SEP.b #$20
	STZ.w $5E75
label_C3E6F4:
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C3E6F8:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF2
	TCD
	LDA.w $89CA
	CMP.w #$FFFF
	BEQ.b label_C3E759
	JSL.l label_C08756
	LDA.w $89CA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	STA.b $02
	LDA.w $98A4
	AND.w #$00FF
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	PHA
	ASL
	PLA
	ROR
	STA.b $04
	LDA.w #$0010
	SEC
	SBC.b $04
	CLC
	ADC.b $02
	ASL
	CLC
	ADC.w #$827E
	TAY
	LDX.w #$0007
	BRA.b label_C3E74A

label_C3E741:
	LDA.w #$0000
	STA.w $0000,Y
	INY
	INY
	DEX
label_C3E74A:
	BNE.b label_C3E741
	LDA.w #$FFFF
	STA.w $89CA
	SEP.b #$20
	LDA.b #$01
	STA.w $9623
label_C3E759:
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

org $C3E7E3
label_C3E7E3:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	CMP.w #$FFFF
	BEQ.b label_C3E84C
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAY
	STY.b $0E
	LDA.w $002B,Y
	CMP.w #$FFFF
	BEQ.b label_C3E84C
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAX
label_C3E819:
	LDA.w #$0000
	STA.w $0000,X
	LDA.w $0002,X
	CMP.w #$FFFF
	BEQ.b label_C3E835
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAX
	BRA.b label_C3E819

label_C3E835:
	LDA.w #$FFFF
	LDY.b $0E
	STA.w $002F,Y
	STA.w $002D,Y
	STA.w $002B,Y
	LDA.w #$0001
	STA.w $0031,Y
	STA.w $0033,Y
label_C3E84C:
	PLD
	RTL

;--------------------------------------------------------------------

org $C3EAD0
label_C3EAD0:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	SEP.b #$20
	STA.b $00
	LDX.w #$0000
	STX.b $0E
	BRA.b label_C3EB07

label_C3EAE5:
	SEP.b #$20
	CMP.b $00
	BNE.b label_C3EB02
	LDX.b $0E
	REP.b #$20
	TXA
	JSL.l label_C48ECE
	CMP.w #$0000
	BNE.b label_C3EB1A
	LDX.b $0E
	TXA
	JSL.l label_C48EEB
	BRA.b label_C3EB1A

label_C3EB02:
	LDX.b $0E
	INX
	STX.b $0E
label_C3EB07:
	REP.b #$20
	TXA
	STA.b $04
	ASL
	ASL
	ADC.b $04
	TAX
	LDA.l DATA_D5F4BB,X
	AND.w #$00FF
	BNE.b label_C3EAE5
label_C3EB1A:
	PLD
	RTL

;--------------------------------------------------------------------

label_C3EB1C:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	SEP.b #$20
	STA.b $00
	LDY.w #$0000
	STY.b $14
	BRA.b label_C3EB34

label_C3EB31:
	INY
	STY.b $14
label_C3EB34:
	REP.b #$20
	TYA
	STA.b $04
	ASL
	ASL
	ADC.b $04
	TAX
	LDA.l DATA_D5F4BB,X
	AND.w #$00FF
	BEQ.b label_C3EB4D
	SEP.b #$20
	CMP.b $00
	BNE.b label_C3EB31
label_C3EB4D:
	REP.b #$20
	TYA
	JSL.l label_C48F98
	LDX.w #$0000
	STX.b $12
	BRA.b label_C3EBBB

label_C3EB5B:
	LDA.w $986F,X
	AND.w #$00FF
	DEC
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	STA.b $04
	LDA.w #$0000
	STA.b $02
	STA.b $10
	BRA.b label_C3EB98

label_C3EB78:
	LDA.b $00
	AND.w #$00FF
	STA.b $02
	LDA.b $0E
	CMP.b $02
	BNE.b label_C3EB8E
	LDY.b $14
	TYA
	JSL.l label_C48EEB
	BRA.b label_C3EBC8

label_C3EB8E:
	LDA.b $10
	STA.b $02
	INC.b $02
	LDA.b $02
	STA.b $10
label_C3EB98:
	LDA.w #$000E
	CLC
	SBC.b $02
	BVC.b label_C3EBA4
	BPL.b label_C3EBB6
	BRA.b label_C3EBA6

label_C3EBA4:
	BMI.b label_C3EBB6
label_C3EBA6:
	LDA.b $04
	CLC
	ADC.b $02
	TAX
	LDA.w $0023,X
	AND.w #$00FF
	STA.b $0E
	BNE.b label_C3EB78
label_C3EBB6:
	LDX.b $12
	INX
	STX.b $12
label_C3EBBB:
	LDA.w $98A4
	AND.w #$00FF
	STA.b $02
	TXA
	CMP.b $02
	BCC.b label_C3EB5B
label_C3EBC8:
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to items.

label_C3EBCA:
	REP.b #$31
	PHD
	TDC
	ADC #$FFF0
	TCD
	LDY #$0000
	STY $0E
	BRA label_C3EC00

label_C3EBD9:
	AND.w #$00FF
	TAX
	LDA.w #$00FF
	JSL.l label_C45683
	CMP.w #$0000
	BEQ.b label_C3EBF3
	SEP.b #$20
	LDA.b [$06]
	JSL.l label_C3EAD0
	BRA.b label_C3EBFB

label_C3EBF3:
	SEP.b #$20
	LDA.b [$06]
	JSL.l label_C3EB1C
label_C3EBFB:
	LDY.b $0E
	INY
	STY.b $0E
label_C3EC00:
	LDA.w #DATA_D5F4BB
	STA.b $06
	LDA.w #DATA_D5F4BB>>16
	STA.b $08
	TYA
	STA.b $04
	ASL
	ASL
	ADC.b $04
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	BNE.b label_C3EBD9
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to the text fonts.

org $C3F054
DATA_C3F054:
	dd DATA_E10C7A,EB_MainFontGFX,$00100020
	dd $00E01359,$00E013B9,$00100020
	dd $00E118DA,$00E1193A,$00100010
	dd $00E11F3A,$00E11F9A,$00080008
	dd DATA_E1229A,EB_IntroCutsceneFontGFX,$00100020

;--------------------------------------------------------------------

org $C3F2B1
DATA_C3F2B1:

;--------------------------------------------------------------------

org $C3F2B5
DATA_C3F2B5:

;--------------------------------------------------------------------

org $C3F3C5
label_C3F3C5:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE4
	TCD
	PLA
	TAX
	STX.w $9F75
	LDA.w #$0000
	STA.b $04
	JSL.l label_C08726
	JSL.l label_C0927C
	BRA.b label_C3F3FB

label_C3F3E2:
	ASL
	CLC
	ADC.w #$116A
	TAX
	LDA.w $0000,X
	ORA.w #$8000
	STA.w $0000,X
	LDA.b $1A
	INC
	STA.b $1A
	CMP.w #$001E
	BCC.b label_C3F3E2

label_C3F3FB:
	LDA.w #$000B
	JSL.l label_C08D79
	LDA.w #$0003
	JSL.l label_C08D92
	LDY.w #$0000
	LDX.w #$5800
	TYA
	JSL.l label_C08D9E
	STZ.w $0039
	STZ.w $003B
	STZ.w $0037
	STZ.w $0035
	STZ.w $0033
	STZ.w $0031
	JSL.l label_C08B26
	STZ.w $0039
	STZ.w $003B
	STZ.w $0037
	STZ.w $0035
	STZ.w $0033
	STZ.w $0031
	JSL.l label_C08B26
	JSL.l label_C0EBE0
	SEP.b #$20
	LDA.b #$11
	STA.w $001A
	JSL.l label_C088B1
	LDY.w #$0000
	TYX
	LDA.w #$0314
	JSL.l label_C092F5
	STZ.w $9641
	LDA.w $9F75
	BEQ.b label_C3F465
	JMP.w label_C3F50A

label_C3F465:
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0200
	REP.b #$20
	LDA.w #$0200
	JSL.l label_C08EFC
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	JSL.l label_C08744
	SEP.b #$20
	LDA.b #$0F
	STA.w $000D
	JSL.l label_C08756
	SEP.b #$20
	STZ.w $0030
	REP.b #$20
	LDA.w #InitialTitleScreenAnimationPalette
	STA.b $0E
	LDA.w #InitialTitleScreenAnimationPalette>>16
	STA.b $10
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.w #$0100
	CLC
	ADC.b $06
	STA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	JSL.l label_C496F9
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0200
	REP.b #$20
	LDA.w #$0200
	JSL.l label_C08EFC
	LDX.w #$0100
	LDA.w #$003C
	JSL.l label_C496E7
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	LDX.w #$0000
	STX.b $18
	BRA.b label_C3F4F6

label_C3F4E9:
	JSL.l label_C426ED
	JSL.l label_C1004E
	LDX.b $18
	INX
	STX.b $18
label_C3F4F6:
	STX.b $02
	REP.b #$20
	LDA.w #$003C
	CLC
	SBC.b $02
	BVS.b label_C3F506
	BPL.b label_C3F4E9
	BRA.b label_C3F508

label_C3F506:
	BMI label_C3F4E9

label_C3F508:
	BRA label_C3F534

label_C3F50A:
	LDX.w #$0001
	LDA.w #$0004
	JSL.l label_C0886C
	LDX.w #$0000
	STX.b $1A
	BRA.b label_C3F524

label_C3F51B:
	JSL.l label_C1004E
	LDX.b $1A
	INX
	STX.b $1A
label_C3F524:
	STX.b $02
	LDA.w #$003C
	CLC
	SBC.b $02
	BVS.b label_C3F532
	BPL.b label_C3F51B
	BRA.b label_C3F534

label_C3F532:
	BMI.b label_C3F51B
label_C3F534:
	LDA.w #$0000
	STA.b $02
	BRA.b label_C3F562

label_C3F53B:
	LDA.b $04
	BNE.b label_C3F55E
	LDA.w $006D
	AND.w #$0080
	BNE.b label_C3F557
	LDA.w $006D
	AND.w #$8000
	BNE.b label_C3F557
	LDA.w $006D
	AND.w #$1000
	BEQ.b label_C3F55E
label_C3F557:
	LDA.w #$0001
	STA.b $02
	BRA.b label_C3F56F

label_C3F55E:
	JSL.l label_C1004E
label_C3F562:
	LDA.w $9641
	BEQ.b label_C3F53B
	LDA.w $9641
	CMP.w #$0002
	BEQ.b label_C3F53B
label_C3F56F:
	LDA.w $9F75
	BNE.b label_C3F57F
	LDA.w $9641
	BNE.b label_C3F57F
	JSL.l label_EF04DC
	STA.b $02
label_C3F57F:
	LDY.w #$0000
	LDX.w #$0004
	LDA.w #$0001
	JSL.l label_C08814
	LDA.b $04
	BNE.b label_C3F5A2
	STZ.w $9641
	LDA.w #$0000
	JSL.l label_C474A8
	JSL.l label_C0927C
	LDA.b $02
	BRA.b label_C3F5F7

label_C3F5A2:
	LDY.w #$0000
	STY.b $16
	BRA.b label_C3F5D5

label_C3F5A9:
	TYA
	ASL
	TAX
	LDA.w $0A62,X
	CMP.w #$0314
	BCC.b label_C3F5C0
	CMP.w #$031E
	BEQ.b label_C3F5BB
	BCS.b label_C3F5C0
label_C3F5BB:
	TYA
	JSL.l label_C09C35
label_C3F5C0:
	LDY.b $16
	TYA
	ASL
	CLC
	ADC.w #$116A
	TAX
	LDA.w $0000,X
	AND.w #$7FFF
	STA.w $0000,X
	INY
	STY.b $16
label_C3F5D5:
	CPY.w #$001E
	BCC.b label_C3F5A9
	JSL.l label_C08726
	JSL.l label_C018F3
	JSL.l label_C4800B
	SEP.b #$20
	LDA.b #$17
	STA.w $001A
	LDX.w #$0001
	REP.b #$20
	TXA
	JSL.l label_C0886C
label_C3F5F7:
	PLD
	RTL

;--------------------------------------------------------------------

org $C3FB1F
DATA_C3FB1F:
	db $00,$20,$01,$00

;--------------------------------------------------------------------

; Note: Name entry screen character sprite related.

org $C3FC49
DATA_C3FC49:
	db $01,$00,$F6,$01,$0E,$00,$F7,$01
	db $4F,$01,$F8,$01,$58,$01,$F9,$01
	db $DA,$00,$FA,$01,$00,$00

DATA_C3FC5F:
	db $01,$00,$14,$02,$0E,$00,$23,$00
	db $4F,$01,$23,$00,$58,$01,$23,$00
	db $DA,$00,$23,$00,$00,$00

DATA_C3FC75:
	db $02,$00,$FB,$01,$50,$01,$FC,$01
	db $58,$01,$FD,$01,$BE,$00,$FE,$01
	db $00,$00

DATA_C3FC87:
	db $02,$00,$14,$02,$50,$01,$23,$00
	db $58,$01,$23,$00,$BE,$00,$23,$00
	db $00,$00

DATA_C3FC99:
	db $03,$00,$FF,$01,$DA,$00,$00,$02
	db $DB,$00,$01,$02,$C2,$00,$02,$02
	db $00,$00

DATA_C3FCAB:
	db $03,$00,$14,$02,$DA,$00,$23,$00
	db $DB,$00,$23,$00,$C2,$00,$23,$00
	db $00,$00

DATA_C3FCBD:
	db $04,$00,$03,$02,$6A,$01,$04,$02
	db $14,$00,$05,$02,$F2,$00,$06,$02
	db $00,$00

DATA_C3FCCF:
	db $04,$00,$23,$00,$6A,$01,$23,$00
	db $14,$00,$23,$00,$F2,$00,$07,$02
	db $00,$00

DATA_C3FCE1:
	db $28,$00,$09,$02,$67,$01,$0A,$02
	db $01,$00,$08,$02,$C0,$00,$0B,$02
	db $00,$00

DATA_C3FCF3:
	db $28,$00,$15,$02,$67,$01,$23,$00
	db $01,$00,$14,$02,$C0,$00,$23,$00
	db $00,$00

DATA_C3FD05:
	db $15,$01,$0C,$02,$74,$01,$0E,$02
	db $00,$00

DATA_C3FD0F:
	db $15,$01,$0D,$02,$74,$01,$0F,$02
	db $00,$00

DATA_C3FD19:
	db $15,$01,$10,$02,$DC,$00,$12,$02
	db $00,$00

DATA_C3FD23:
	db $15,$01,$11,$02,$DC,$00,$23,$00
	db $00,$00

DATA_C3FD2D:
	dd DATA_C3FC49
	dd DATA_C3FC75
	dd DATA_C3FC99
	dd DATA_C3FCBD
	dd DATA_C3FCE1
	dd DATA_C3FD05
	dd DATA_C3FD19

DATA_C3FD49:
	dd DATA_C3FC5F
	dd DATA_C3FC87
	dd DATA_C3FCAB
	dd DATA_C3FCCF
	dd DATA_C3FCF3
	dd DATA_C3FD0F
	dd DATA_C3FD23

;--------------------------------------------------------------------

EB_ConfirmationScreenSpriteData:			; Info: Sprite ID (?), Script number, X position, Y position.
;$C3FD65
	dw $0001,$035D,$0028,$002C
	dw $0002,$035D,$0028,$004C
	dw $0003,$035D,$0028,$006C
	dw $0004,$035D,$0028,$008C
	dw $0167,$0216,$0088,$0028

org $C3FDBD
DATA_C3FDBD:
	dw $0037,$004E,$004F,$0034

;--------------------------------------------------------------------

if !Define_EB_Global_DisableCopyDetection == !FALSE
EB_CheckIfSavesShouldBeDeletedDuringFinalBattle:
.Main:
;$C3FDC5
	REP.b #$20
	LDX.w #$0033
	LDA.w #$0000
label_C3FDCD:
	CLC
	ADC.l CheckIfGameShouldRun_Main,X
	DEX
	BPL.b label_C3FDCD
	SEC
	SBC.l DATA_C3FDF2
	BEQ.b label_C3FDF1
	SEP.b #$20
	LDX.w #$6000
	LDA.b #$00
label_C3FDE3:
	STA.l $300000,X
	INX
	BPL.b label_C3FDE3
	LDA.b #$34
	STA.w $0000
label_C3FDEF:
	BRA label_C3FDEF

label_C3FDF1:
	RTL

DATA_C3FDF2:
	dw $2AD8
else
	%FREE_BYTES(NULLROM, 47, $00)
endif

;--------------------------------------------------------------------

	%FREE_BYTES(NULLROM, 524, $00)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankC4Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

;--------------------------------------------------------------------

org $C40015
label_C40015:
	LDX.b $88
	STZ.w $10F2,X
	JSL.l label_C0A4A8
	JSL.l label_C0C6B6
	RTL

;--------------------------------------------------------------------

org $C4002F
label_C4002F:
	REP.b #$30
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$3492
	STA.w $0094
	LDA.w #$0000
	STA.w $0091
	LDA.w #$0010
	STA.w $0092
	LDA.w #$007E
	STA.w $0096
	TXA
	ASL
	ASL
	ASL
	CLC
	ADC.w #$6000
	STA.w $0097
	PHY
	JSL.l label_C08643
	LDA.w $0094
	CLC
	ADC.w #$0010
	STA.w $0094
	PLA
	ASL
	ASL
	ASL
	CLC
	ADC.w #$6000
	STA.w $0097
	JSL.l label_C08643
	LDA.w $000D
	AND.w #$0080
	EOR.w #$0080
	STA.w $9E2B
	RTS

;--------------------------------------------------------------------

label_C40085:
	REP.b #$30
	LDY.w #$0008
	LDA.w #$FFFF
	BRA.b label_C400A9

label_C4008F:
	INY
	INY
	CPY.w #$0040
	BNE.b label_C400A9
	JSL.l label_C10000
	JSL.l label_C10BF8
	JSL.l label_C09451
	LDA.w #$0A2A
	JSL.l label_C08F68
label_C400A9:
	CMP.w $1AD6,Y
	BEQ.b label_C4008F
	LDX.w #$001E
	LDA.w $1AD6,Y
	BRA.b label_C400B9

label_C400B6:
	DEX
	DEX
	ASL
label_C400B9:
	BMI.b label_C400B6
	LDA.w $1AD6,Y
	ORA.l DATA_C44C6C,X
	STA.w $1AD6,Y
	STX.w $288E
	LSR.w $288E
	TYA
	ASL
	ASL
	ASL
	CLC
	ADC.w $288E
	RTS

;--------------------------------------------------------------------

org $C400D4
ScriptPtrs:
;$C400D4					;\ Info: Script ID...
	dl $C2FFB7				;| 0000
	dl Script0001_IntroCutsceneCameraPan
	dl Script0002_UnknownScript
	dl $C3A080				;| 0003
	dl $C3A273				;| 0004
	dl $C3A481				;| 0005
	dl $C3A2E4				;| 0006
	dl $C3A287				;| 0007
	dl Script0008_TrafficLight
	dl $C3A299				;| 0009
	dl $C3A2D3				;| 000A
	dl $C3A2D3				;| 000B
	dl $C3A2E4				;| 000C
	dl $C3A33B				;| 000D
	dl $C3A349				;| 000E
	dl $C3A357				;| 000F
	dl $C3A365				;| 0010
	dl $C3A373				;| 0011
	dl $C3A381				;| 0012
	dl $C3A48A				;| 0013
	dl $C3A4C9				;| 0014
	dl $C3A549				;| 0015
	dl $C3A5C9				;| 0016
	dl $C3A643				;| 0017
	dl $C3A6C4				;| 0018
	dl $C3A714				;| 0019
	dl $C3A780				;| 001A
	dl $C3A7F8				;| 001B
	dl $C3A874				;| 001C
	dl $C3A8D2				;| 001D
	dl $C3A953				;| 001E
	dl $C3A9DA				;| 001F
	dl $C3DE01				;| 0020
	dl $C3DF72				;| 0021
	dl $C3DF1E				;| 0022
	dl Script0023_UnknownNameEntryScreenScript
	dl Script0024_MeteorImpactEffect
	dl $C3AD7A				;| 0025
	dl $C3AE1E				;| 0026
	dl $C3AE78				;| 0027
	dl $C3AEA0				;| 0028
	dl $C3AEAC				;| 0029
	dl $C3AE02				;| 002A
	dl $C3ADE1				;| 002B
	dl $C3AE0F				;| 002C
	dl $C3AF0F				;| 002D
	dl $C3AF4E				;| 002E
	dl $C3AFD8				;| 002F
	dl $C3AFFA				;| 0030
	dl $C3B021				;| 0031
	dl $C3B0EC				;| 0032
	dl $C3B06D				;| 0033
	dl $C3B1A6				;| 0034
	dl $C3B04D				;| 0035
	dl $C3B13E				;| 0036
	dl $C3AFAC				;| 0037
	dl $C3B1E9				;| 0038
	dl $C3B208				;| 0039
	dl $C3B25D				;| 003A
	dl $C3B2B2				;| 003B
	dl $C3B2FA				;| 003C
	dl $C3B35D				;| 003D
	dl $C3B3A2				;| 003E
	dl $C3B3C8				;| 003F
	dl $C3B445				;| 0040
	dl $C3B46F				;| 0041
	dl $C3B4A5				;| 0042
	dl $C3B4FB				;| 0043
	dl $C3B5D6				;| 0044
	dl $C3B538				;| 0045
	dl $C3B633				;| 0046
	dl $C3B69C				;| 0047
	dl $C3B6D4				;| 0048
	dl $C3B757				;| 0049
	dl $C3B784				;| 004A
	dl $C3B7BC				;| 004B
	dl $C3B7EF				;| 004C
	dl $C3B810				;| 004D
	dl $C3B86C				;| 004E
	dl $C3B8A5				;| 004F
	dl $C3B8E8				;| 0050
	dl $C3B902				;| 0051
	dl $C3B926				;| 0052
	dl $C3B95D				;| 0053
	dl $C3B9B6				;| 0054
	dl $C3B9D4				;| 0055
	dl $C3B9F2				;| 0056
	dl $C3BA1C				;| 0057
	dl $C3BA07				;| 0058
	dl $C3BA31				;| 0059
	dl $C3BA4F				;| 005A
	dl $C3BAEA				;| 005B
	dl $C3BB17				;| 005C
	dl $C3BB94				;| 005D
	dl $C3BA64				;| 005E
	dl $C3BA67				;| 005F
	dl $C3BA6A				;| 0060
	dl $C3BA6D				;| 0061
	dl $C3BA70				;| 0062
	dl $C3BB33				;| 0063
	dl $C3BB4C				;| 0064
	dl $C3BD2E				;| 0065
	dl $C3BD0E				;| 0066
	dl $C3BBB7				;| 0067
	dl $C3BC0A				;| 0068
	dl $C3BC5D				;| 0069
	dl $C3BCB0				;| 006A
	dl $C3BD56				;| 006B
	dl $C3BD80				;| 006C
	dl $C3BDA0				;| 006D
	dl $C3BDC3				;| 006E
	dl $C3BE01				;| 006F
	dl $C3BE2C				;| 0070
	dl $C3BE57				;| 0071
	dl $C3BE80				;| 0072
	dl $C3BEEE				;| 0073
	dl $C3BF4E				;| 0074
	dl $C3BFB2				;| 0075
	dl $C3C016				;| 0076
	dl $C3C07C				;| 0077
	dl $C3C236				;| 0078
	dl $C3C258				;| 0079
	dl $C3C2B8				;| 007A
	dl $C3C2C8				;| 007B
	dl $C3C2D1				;| 007C
	dl $C3C2DA				;| 007D
	dl $C3C2E3				;| 007E
	dl $C3C326				;| 007F
	dl $C3C336				;| 0080
	dl $C3C33F				;| 0081
	dl $C3C348				;| 0082
	dl $C3C351				;| 0083
	dl $C3C282				;| 0084
	dl $C3C394				;| 0085
	dl $C3C3ED				;| 0086
	dl $C3C427				;| 0087
	dl $C3C46E				;| 0088
	dl $C3C4CF				;| 0089
	dl $C3C540				;| 008A
	dl $C3C59A				;| 008B
	dl $C3C5C6				;| 008C
	dl $C3C5F0				;| 008D
	dl $C3C60D				;| 008E
	dl $C3C634				;| 008F
	dl $C3C687				;| 0090
	dl $C3C6B5				;| 0091
	dl $C3C6DD				;| 0092
	dl $C3C8A3				;| 0093
	dl $C3C8B2				;| 0094
	dl $C3C8C1				;| 0095
	dl $C3C8D0				;| 0096
	dl $C3C8DF				;| 0097
	dl $C3C8EE				;| 0098
	dl $C3C990				;| 0099
	dl $C3CA3E				;| 009A
	dl $C3C9E0				;| 009B
	dl $C3CA8E				;| 009C
	dl $C3CAEA				;| 009D
	dl $C3CB87				;| 009E
	dl $C3CB38				;| 009F
	dl $C3CBD5				;| 00A0
	dl $C3CCB5				;| 00A1
	dl $C3C747				;| 00A2
	dl $C3CEC7				;| 00A3
	dl $C3CDF0				;| 00A4
	dl $C3C7AE				;| 00A5
	dl $C3CEF5				;| 00A6
	dl $C3CF1B				;| 00A7
	dl $C3CF3C				;| 00A8
	dl $C3CF4B				;| 00A9
	dl $C3CF76				;| 00AA
	dl $C3D04D				;| 00AB
	dl $C3D0C5				;| 00AC
	dl $C3D0EE				;| 00AD
	dl $C3D10E				;| 00AE
	dl $C3D12E				;| 00AF
	dl $C3D159				;| 00B0
	dl $C3D172				;| 00B1
	dl $C3C57A				;| 00B2
	dl $C3D196				;| 00B3
	dl $C3D1C9				;| 00B4
	dl $C3D1F8				;| 00B5
	dl $C3D229				;| 00B6
	dl $C3D251				;| 00B7
	dl $C3D26E				;| 00B8
	dl $C3D2F7				;| 00B9
	dl $C3D31D				;| 00BA
	dl $C3D395				;| 00BB
	dl $C3D3C8				;| 00BC
	dl $C3D3FD				;| 00BD
	dl $C3D423				;| 00BE
	dl $C3D454				;| 00BF
	dl $C3D464				;| 00C0
	dl $C3D486				;| 00C1
	dl $C3D4C9				;| 00C2
	dl $C3D4EF				;| 00C3
	dl $C3D515				;| 00C4
	dl $C3D53B				;| 00C5
	dl $C3D566				;| 00C6
	dl $C3D58C				;| 00C7
	dl $C3D5B2				;| 00C8
	dl Script00C9_UnknownScript
	dl $C3D673				;| 00CA
	dl $C3D6D6				;| 00CB
	dl $C3D732				;| 00CC
	dl $C3D758				;| 00CD
	dl $C3D7E2				;| 00CE
	dl $C3D83C				;| 00CF
	dl $C3D898				;| 00D0
	dl $C3D8BE				;| 00D1
	dl $C3D8E4				;| 00D2
	dl $C3D91C				;| 00D3
	dl $C3D98C				;| 00D4
	dl $C3D9B2				;| 00D5
	dl $C3D9D8				;| 00D6
	dl $C3D9FE				;| 00D7
	dl $C3DA49				;| 00D8
	dl $C3DA97				;| 00D9
	dl $C3DAF8				;| 00DA
	dl $C3DB19				;| 00DB
	dl $C3D966				;| 00DC
	dl $C30195				;| 00DD
	dl $C30235				;| 00DE
	dl $C3024A				;| 00DF
	dl $C30260				;| 00E0
	dl $C302AC				;| 00E1
	dl $C302AC				;| 00E2
	dl $C302AC				;| 00E3
	dl $C302D7				;| 00E4
	dl $C302EF				;| 00E5
	dl $C30303				;| 00E6
	dl $C30317				;| 00E7
	dl $C3032B				;| 00E8
	dl $C3036F				;| 00E9
	dl $C3036F				;| 00EA
	dl $C3036F				;| 00EB
	dl $C3036F				;| 00EC
	dl $C3036F				;| 00ED
	dl $C30394				;| 00EE
	dl $C303C0				;| 00EF
	dl $C303E5				;| 00F0
	dl $C30478				;| 00F1
	dl $C304FA				;| 00F2
	dl $C304FA				;| 00F3
	dl $C30520				;| 00F4
	dl $C3053A				;| 00F5
	dl $C30550				;| 00F6
	dl $C3056E				;| 00F7
	dl $C3056E				;| 00F8
	dl $C30590				;| 00F9
	dl $C305EF				;| 00FA
	dl $C30671				;| 00FB
	dl $C3069F				;| 00FC
	dl $C306BA				;| 00FD
	dl $C306DA				;| 00FE
	dl $C30704				;| 00FF
	dl $C30716				;| 0100
	dl $C30776				;| 0101
	dl $C30796				;| 0102
	dl $C307AB				;| 0103
	dl $C30832				;| 0104
	dl $C30869				;| 0105
	dl $C308BB				;| 0106
	dl $C308E5				;| 0107
	dl $C30962				;| 0108
	dl $C30979				;| 0109
	dl $C30993				;| 010A
	dl $C309B0				;| 010B
	dl $C30A32				;| 010C
	dl $C30A76				;| 010D
	dl $C30A91				;| 010E
	dl $C30ACB				;| 010F
	dl $C30AF8				;| 0110
	dl $C30B4E				;| 0111
	dl $C30BEA				;| 0112
	dl $C30BEA				;| 0113
	dl $C30BEA				;| 0114
	dl $C30C09				;| 0115
	dl $C30C20				;| 0116
	dl $C30C37				;| 0117
	dl $C30C3D				;| 0118
	dl $C30C43				;| 0119
	dl $C30C49				;| 011A
	dl $C30C4F				;| 011B
	dl $C30CE2				;| 011C
	dl $C30D1E				;| 011D
	dl $C30DB6				;| 011E
	dl $C30DCD				;| 011F
	dl $C30E21				;| 0120
	dl $C30E52				;| 0121
	dl $C30E7F				;| 0122
	dl $C30E99				;| 0123
	dl $C30EB9				;| 0124
	dl $C30F20				;| 0125
	dl $C30F9C				;| 0126
	dl $C31068				;| 0127
	dl $C310B1				;| 0128
	dl $C31115				;| 0129
	dl $C31140				;| 012A
	dl $C31182				;| 012B
	dl $C311B4				;| 012C
	dl $C311DF				;| 012D
	dl $C31221				;| 012E
	dl $C3126E				;| 012F
	dl $C312AD				;| 0130
	dl $C312C2				;| 0131
	dl $C312E7				;| 0132
	dl $C3131B				;| 0133
	dl $C3133A				;| 0134
	dl $C31359				;| 0135
	dl $C3137E				;| 0136
	dl $C31389				;| 0137
	dl $C313A9				;| 0138
	dl $C313F7				;| 0139
	dl $C313D5				;| 013A
	dl $C3141E				;| 013B
	dl $C31427				;| 013C
	dl $C31452				;| 013D
	dl $C31485				;| 013E
	dl $C31529				;| 013F
	dl $C31556				;| 0140
	dl $C3155C				;| 0141
	dl $C315CC				;| 0142
	dl $C315F8				;| 0143
	dl $C31626				;| 0144
	dl $C31651				;| 0145
	dl $C31689				;| 0146
	dl $C316BC				;| 0147
	dl $C316E4				;| 0148
	dl $C31717				;| 0149
	dl $C31743				;| 014A
	dl $C3176F				;| 014B
	dl $C3179B				;| 014C
	dl $C317C7				;| 014D
	dl $C317FC				;| 014E
	dl $C31831				;| 014F
	dl $C31869				;| 0150
	dl $C3189A				;| 0151
	dl $C318A5				;| 0152
	dl $C318D0				;| 0153
	dl $C318FD				;| 0154
	dl $C31A42				;| 0155
	dl $C31A83				;| 0156
	dl $C31AB1				;| 0157
	dl $C31ABD				;| 0158
	dl $C31B14				;| 0159
	dl $C31B4B				;| 015A
	dl $C31BED				;| 015B
	dl $C31BFD				;| 015C
	dl $C31BFD				;| 015D
	dl $C31C23				;| 015E
	dl $C31C49				;| 015F
	dl $C31CA4				;| 0160
	dl $C31CFB				;| 0161
	dl $C31D15				;| 0162
	dl $C31D61				;| 0163
	dl $C31D6A				;| 0164
	dl $C31D89				;| 0165
	dl $C31E92				;| 0166
	dl $C31EA6				;| 0167
	dl $C31E66				;| 0168
	dl $C31E79				;| 0169
	dl $C31E89				;| 016A
	dl $C31EAF				;| 016B
	dl $C31EB8				;| 016C
	dl $C32149				;| 016D
	dl $C32342				;| 016E
	dl $C322B3				;| 016F
	dl $C31FE8				;| 0170
	dl $C31DB5				;| 0171
	dl $C323D1				;| 0172
	dl $C3240A				;| 0173
	dl $C32454				;| 0174
	dl $C324A8				;| 0175
	dl $C324B1				;| 0176
	dl $C324BA				;| 0177
	dl $C324CE				;| 0178
	dl $C324D7				;| 0179
	dl $C324E0				;| 017A
	dl $C324E9				;| 017B
	dl $C324F2				;| 017C
	dl $C324F9				;| 017D
	dl $C32507				;| 017E
	dl $C32520				;| 017F
	dl $C328A8				;| 0180
	dl $C32534				;| 0181
	dl $C328B1				;| 0182
	dl $C32818				;| 0183
	dl $C32C46				;| 0184
	dl $C32860				;| 0185
	dl $C32C8A				;| 0186
	dl $C32878				;| 0187
	dl $C32CA2				;| 0188
	dl $C32860				;| 0189
	dl $C32C8A				;| 018A
	dl $C32890				;| 018B
	dl $C32CBA				;| 018C
	dl $C327AA				;| 018D
	dl $C32B9B				;| 018E
	dl $C32CF0				;| 018F
	dl $C32486				;| 0190
	dl $C32DFE				;| 0191
	dl $C32E56				;| 0192
	dl $C32E5F				;| 0193
	dl $C324BA				;| 0194
	dl $C324CE				;| 0195
	dl $C324D7				;| 0196
	dl $C324E0				;| 0197
	dl $C324E9				;| 0198
	dl $C32E68				;| 0199
	dl $C33063				;| 019A
	dl $C32E75				;| 019B
	dl $C331ED				;| 019C
	dl $C33205				;| 019D
	dl $C3320E				;| 019E
	dl $C33217				;| 019F
	dl $C33220				;| 01A0
	dl $C33229				;| 01A1
	dl $C33232				;| 01A2
	dl $C3324E				;| 01A3
	dl $C3326A				;| 01A4
	dl $C332FA				;| 01A5
	dl $C33283				;| 01A6
	dl $C33310				;| 01A7
	dl $C33299				;| 01A8
	dl $C3332C				;| 01A9
	dl $C332C1				;| 01AA
	dl $C33342				;| 01AB
	dl $C332D7				;| 01AC
	dl $C3335E				;| 01AD
	dl $C3337D				;| 01AE
	dl $C3338F				;| 01AF
	dl $C3338F				;| 01B0
	dl $C3338F				;| 01B1
	dl $C3338F				;| 01B2
	dl $C33424				;| 01B3
	dl $C334CF				;| 01B4
	dl $C32E34				;| 01B5
	dl $C334FF				;| 01B6
	dl $C33535				;| 01B7
	dl $C33572				;| 01B8
	dl $C33595				;| 01B9
	dl $C335B5				;| 01BA
	dl $C33980				;| 01BB
	dl $C339D2				;| 01BC
	dl $C33AB5				;| 01BD
	dl $C33A88				;| 01BE
	dl $C33AED				;| 01BF
	dl $C33B0F				;| 01C0
	dl $C33B8B				;| 01C1
	dl $C33B9E				;| 01C2
	dl $C33BB2				;| 01C3
	dl $C33BB7				;| 01C4
	dl $C3DBA0				;| 01C5
	dl $C3DBCC				;| 01C6
	dl $C3DBF2				;| 01C7
	dl $C3DC57				;| 01C8
	dl $C3DC74				;| 01C9
	dl $C3DC91				;| 01CA
	dl $C3DCAE				;| 01CB
	dl $C3DCCB				;| 01CC
	dl $C3DD15				;| 01CD
	dl $C3DD32				;| 01CE
	dl $C3DD4F				;| 01CF
	dl $C3DD6C				;| 01D0
	dl $C33C6C				;| 01D1
	dl $C33CDA				;| 01D2
	dl $C33C30				;| 01D3
	dl $C3C0F3				;| 01D4
	dl $C3C101				;| 01D5
	dl $C3C110				;| 01D6
	dl $C3C11F				;| 01D7
	dl $C3C12E				;| 01D8
	dl $C3C167				;| 01D9
	dl $C3C17A				;| 01DA
	dl $C3C1A8				;| 01DB
	dl Script01DC_IntroCutsceneController1
	dl Script01DD_IntroCutsceneController2
	dl Script01DD_IntroCutsceneController3
	dl $C33DD4				;| 01DF
	dl $C33F0C				;| 01E0
	dl $C33E42				;| 01E1
	dl $C33EC4				;| 01E2
	dl $C34029				;| 01E3
	dl $C34097				;| 01E4
	dl $C340CE				;| 01E5
	dl $C3410B				;| 01E6
	dl $C34114				;| 01E7
	dl $C3411D				;| 01E8
	dl $C34126				;| 01E9
	dl $C3412F				;| 01EA
	dl $C34138				;| 01EB
	dl $C3415D				;| 01EC
	dl $C34182				;| 01ED
	dl $C341A7				;| 01EE
	dl $C341CC				;| 01EF
	dl $C34249				;| 01F0
	dl $C3426E				;| 01F1
	dl $C342B1				;| 01F2
	dl $C3441A				;| 01F3
	dl $C34402				;| 01F4
	dl $C342F4				;| 01F5
	dl Script01F6_MoveNessRightOnNameEntryScreen
	dl Script01F7_UnknownNameEntryScreenScript
	dl Script01F8_UnknownNameEntryScreenScript
	dl Script01F9_UnknownNameEntryScreenScript
	dl Script01FA_UnknownNameEntryScreenScript
	dl Script01FB_UnknownNameEntryScreenScript
	dl Script01FC_UnknownNameEntryScreenScript
	dl Script01FD_UnknownNameEntryScreenScript
	dl Script01FE_UnknownNameEntryScreenScript
	dl Script01FF_UnknownNameEntryScreenScript
	dl Script0200_UnknownNameEntryScreenScript
	dl Script0201_UnknownNameEntryScreenScript
	dl Script0202_UnknownNameEntryScreenScript
	dl Script0203_UnknownNameEntryScreenScript
	dl Script0204_UnknownNameEntryScreenScript
	dl Script0205_UnknownNameEntryScreenScript
	dl Script0206_UnknownNameEntryScreenScript
	dl Script0207_UnknownNameEntryScreenScript
	dl Script0208_UnknownNameEntryScreenScript
	dl Script0209_UnknownNameEntryScreenScript
	dl Script020A_UnknownNameEntryScreenScript
	dl Script020B_UnknownNameEntryScreenScript
	dl Script020C_UnknownNameEntryScreenScript
	dl Script020D_UnknownNameEntryScreenScript
	dl Script020E_UnknownNameEntryScreenScript
	dl Script020F_UnknownNameEntryScreenScript
	dl Script0210_UnknownNameEntryScreenScript
	dl Script0211_UnknownNameEntryScreenScript
	dl Script0212_UnknownNameEntryScreenScript
	dl $C34301				;| 0213
	dl Script0214_UnknownNameEntryScreenScript
	dl Script0215_UnknownNameEntryScreenScript
	dl Script0216_UnknownNameEntryScreenScript
	dl $C34E85				;| 0217
	dl $C34EC8				;| 0218
	dl $C34F31				;| 0219
	dl $C34F9B				;| 021A
	dl $C34FC7				;| 021B
	dl $C34FF8				;| 021C
	dl $C3500E				;| 021D
	dl $C35056				;| 021E
	dl $C350B0				;| 021F
	dl $C350F4				;| 0220
	dl $C35154				;| 0221
	dl $C35198				;| 0222
	dl $C34508				;| 0223
	dl $C34572				;| 0224
	dl $C3459E				;| 0225
	dl $C3456F				;| 0226
	dl $C345CA				;| 0227
	dl $C34635				;| 0228
	dl $C34693				;| 0229
	dl $C346F1				;| 022A
	dl $C3474E				;| 022B
	dl $C3486A				;| 022C
	dl $C34810				;| 022D
	dl $C347C1				;| 022E
	dl $C34767				;| 022F
	dl $C34AF6				;| 0230
	dl $C34A6C				;| 0231
	dl $C34975				;| 0232
	dl $C348FC				;| 0233
	dl $C34BAB				;| 0234
	dl $C34BCD				;| 0235
	dl $C34BF7				;| 0236
	dl $C34C3A				;| 0237
	dl $C34C86				;| 0238
	dl $C34CE0				;| 0239
	dl $C34D5C				;| 023A
	dl $C34D65				;| 023B
	dl $C34D6E				;| 023C
	dl $C34D77				;| 023D
	dl $C34D92				;| 023E
	dl $C34D9B				;| 023F
	dl $C34DA4				;| 0240
	dl $C34DA7				;| 0241
	dl $C34DB0				;| 0242
	dl $C34DB9				;| 0243
	dl $C34DC2				;| 0244
	dl $C34DCB				;| 0245
	dl $C34DE0				;| 0246
	dl $C34DEA				;| 0247
	dl $C36A53				;| 0248
	dl $C36A98				;| 0249
	dl $C36ABF				;| 024A
	dl $C36AE6				;| 024B
	dl $C36AFF				;| 024C
	dl $C36B18				;| 024D
	dl $C36B4B				;| 024E
	dl $C36BC6				;| 024F
	dl $C36BEB				;| 0250
	dl $C36C00				;| 0251
	dl $C36C4A				;| 0252
	dl $C36C94				;| 0253
	dl $C36CDB				;| 0254
	dl $C36D29				;| 0255
	dl $C36D40				;| 0256
	dl $C36D53				;| 0257
	dl $C36D5C				;| 0258
	dl $C36D7B				;| 0259
	dl $C36D9F				;| 025A
	dl $C36DBE				;| 025B
	dl $C36DD9				;| 025C
	dl $C36E19				;| 025D
	dl $C36E2D				;| 025E
	dl $C36E52				;| 025F
	dl $C36E5E				;| 0260
	dl $C36E6A				;| 0261
	dl $C36E76				;| 0262
	dl $C36E82				;| 0263
	dl $C36EB7				;| 0264
	dl $C36ED4				;| 0265
	dl $C36F08				;| 0266
	dl $C36F33				;| 0267
	dl $C36F68				;| 0268
	dl $C36F85				;| 0269
	dl $C36FB9				;| 026A
	dl $C36FE4				;| 026B
	dl $C37010				;| 026C
	dl $C37098				;| 026D
	dl $C370FD				;| 026E
	dl $C3715D				;| 026F
	dl Script0270_SleepingNessHead
	dl $C371FA				;| 0271
	dl Script0272_NessGettingOutOfBed
	dl $C37276				;| 0273
	dl Script0274_SleepingNessZzz
	dl $C372B0				;| 0275
	dl $C373C2				;| 0276
	dl $C37409				;| 0277
	dl $C3740F				;| 0278
	dl $C37456				;| 0279
	dl $C37479				;| 027A
	dl $C3749C				;| 027B
	dl $C374B0				;| 027C
	dl $C374E4				;| 027D
	dl $C3756D				;| 027E
	dl $C37596				;| 027F
	dl $C375C5				;| 0280
	dl $C375EE				;| 0281
	dl $C3763B				;| 0282
	dl $C3765F				;| 0283
	dl $C37698				;| 0284
	dl $C376D8				;| 0285
	dl $C37711				;| 0286
	dl $C37751				;| 0287
	dl $C37778				;| 0288
	dl $C377D2				;| 0289
	dl $C377F4				;| 028A
	dl $C37814				;| 028B
	dl $C3786F				;| 028C
	dl $C378B6				;| 028D
	dl $C378FD				;| 028E
	dl $C37891				;| 028F
	dl $C378D8				;| 0290
	dl $C3791D				;| 0291
	dl $C3793F				;| 0292
	dl $C379C0				;| 0293
	dl $C37987				;| 0294
	dl $C37A0B				;| 0295
	dl $C37A55				;| 0296
	dl $C37A5D				;| 0297
	dl $C37A66				;| 0298
	dl $C37A8A				;| 0299
	dl $C37AB5				;| 029A
	dl $C37B0B				;| 029B
	dl $C37B5A				;| 029C
	dl $C37B7E				;| 029D
	dl $C37BFE				;| 029E
	dl $C37CFD				;| 029F
	dl $C37D33				;| 02A0
	dl $C37D92				;| 02A1
	dl $C37DF1				;| 02A2
	dl $C37EC1				;| 02A3
	dl $C37F65				;| 02A4
	dl $C37F71				;| 02A5
	dl $C37F7D				;| 02A6
	dl $C37FCD				;| 02A7
	dl $C3801C				;| 02A8
	dl $C3804C				;| 02A9
	dl $C3809C				;| 02AA
	dl $C380C0				;| 02AB
	dl $C38146				;| 02AC
	dl $C381B8				;| 02AD
	dl $C381E0				;| 02AE
	dl $C38208				;| 02AF
	dl $C38230				;| 02B0
	dl $C38264				;| 02B1
	dl $C38298				;| 02B2
	dl $C382CC				;| 02B3
	dl $C38309				;| 02B4
	dl $C383D2				;| 02B5
	dl $C3840A				;| 02B6
	dl $C38442				;| 02B7
	dl $C384D8				;| 02B8
	dl $C384E3				;| 02B9
	dl $C384EE				;| 02BA
	dl $C38515				;| 02BB
	dl $C38544				;| 02BC
	dl $C385E2				;| 02BD
	dl $C38678				;| 02BE
	dl $C3868F				;| 02BF
	dl $C386A9				;| 02C0
	dl $C386B2				;| 02C1
	dl $C386FA				;| 02C2
	dl $C38771				;| 02C3
	dl $C3877A				;| 02C4
	dl $C38783				;| 02C5
	dl $C3878C				;| 02C6
	dl $C3886C				;| 02C7
	dl $C387B6				;| 02C8
	dl $C388C3				;| 02C9
	dl $C38939				;| 02CA
	dl $C389BD				;| 02CB
	dl $C389DD				;| 02CC
	dl $C389FB				;| 02CD
	dl $C38AB1				;| 02CE
	dl $C38ADC				;| 02CF
	dl $C38B3A				;| 02D0
	dl $C38B5D				;| 02D1
	dl $C38B7F				;| 02D2
	dl $C38BC5				;| 02D3
	dl $C38BFC				;| 02D4
	dl $C38C7C				;| 02D5
	dl $C38CB0				;| 02D6
	dl $C38CE4				;| 02D7
	dl $C38D18				;| 02D8
	dl $C38D50				;| 02D9
	dl $C38DB3				;| 02DA
	dl $C38DD8				;| 02DB
	dl $C38DFC				;| 02DC
	dl $C38E32				;| 02DD
	dl $C38E61				;| 02DE
	dl $C38E89				;| 02DF
	dl $C38EB9				;| 02E0
	dl $C38EEA				;| 02E1
	dl $C38EF1				;| 02E2
	dl $C38EF8				;| 02E3
	dl $C38EFF				;| 02E4
	dl $C38F1B				;| 02E5
	dl $C38F39				;| 02E6
	dl $C38F91				;| 02E7
	dl $C38FDF				;| 02E8
	dl $C39022				;| 02E9
	dl $C39025				;| 02EA
	dl $C39030				;| 02EB
	dl $C390B3				;| 02EC
	dl $C39053				;| 02ED
	dl $C390E6				;| 02EE
	dl $C39155				;| 02EF
	dl $C3918A				;| 02F0
	dl $C391AE				;| 02F1
	dl $C391E3				;| 02F2
	dl $C39072				;| 02F3
	dl $C39080				;| 02F4
	dl $C39213				;| 02F5
	dl $C3924D				;| 02F6
	dl $C3928F				;| 02F7
	dl $C392AB				;| 02F8
	dl $C393C7				;| 02F9
	dl $C393DD				;| 02FA
	dl $C393FC				;| 02FB
	dl $C39440				;| 02FC
	dl $C39AD9				;| 02FD
	dl $C39AFA				;| 02FE
	dl $C39B25				;| 02FF
	dl $C39B86				;| 0300
	dl $C39CD7				;| 0301
	dl $C39D3D				;| 0302
	dl $C39D85				;| 0303
	dl $C39DCF				;| 0304
	dl $C39E13				;| 0305
	dl $C39E22				;| 0306
	dl $C39E50				;| 0307
	dl $C39E8B				;| 0308
	dl $C39E7B				;| 0309
	dl $C39E83				;| 030A
	dl $C39EB6				;| 030B
	dl $C39ECA				;| 030C
	dl $C39EDE				;| 030D
	dl $C39EF2				;| 030E
	dl $C39FA0				;| 030F
	dl $C39FBA				;| 0310
	dl $C40E24				;| 0311
	dl $C0AD8A				;| 0312
	dl script0313_UnknownFileSelectScript
	dl script0314_UnknownTitleScreenScript
	dl script0315_C4222A
	dl script0316_C422E9
	dl script0317_C42304
	dl script0318_C4231F
	dl script0319_C4233A
	dl script031A_C42355
	dl script031B_C42370
	dl script031C_C4238B
	dl script031D_C423A6
	dl script031E_C423C1
	dl $C351FD				;| 031F
	dl $C35214				;| 0320
	dl $C3523F				;| 0321
	dl $C35FE2				;| 0322
	dl $C35FF1				;| 0323
	dl $C36356				;| 0324
	dl $C3639E				;| 0325
	dl $C363C6				;| 0326
	dl $C36447				;| 0327
	dl $C36405				;| 0328
	dl $C36000				;| 0329
	dl $C36073				;| 032A
	dl $C36093				;| 032B
	dl $C360B3				;| 032C
	dl $C360EC				;| 032D
	dl $C3610A				;| 032E
	dl $C36144				;| 032F
	dl $C36169				;| 0330
	dl $C361AA				;| 0331
	dl $C361BB				;| 0332
	dl $C361CC				;| 0333
	dl $C361DB				;| 0334
	dl $C361FB				;| 0335
	dl $C36219				;| 0336
	dl $C36239				;| 0337
	dl $C3626E				;| 0338
	dl $C3629F				;| 0339
	dl $C362E1				;| 033A
	dl $C36311				;| 033B
	dl $C36320				;| 033C
	dl $C36338				;| 033D
	dl $C366BF				;| 033E
	dl $C3661C				;| 033F
	dl $C36647				;| 0340
	dl $C36692				;| 0341
	dl $C366DC				;| 0342
	dl $C36726				;| 0343
	dl $C36474				;| 0344
	dl $C364B1				;| 0345
	dl $C3652A				;| 0346
	dl $C365A3				;| 0347
	dl $C3675D				;| 0348
	dl $C3678E				;| 0349
	dl $C367A4				;| 034A
	dl $C367E6				;| 034B
	dl $C36814				;| 034C
	dl $C3683F				;| 034D
	dl $C36852				;| 034E
	dl $C36867				;| 034F
	dl $C3687C				;| 0350
	dl $C36891				;| 0351
	dl $C368A6				;| 0352
	dl $C368CF				;| 0353
	dl $C368F8				;| 0354
	dl $C3699B				;| 0355
	dl $C369BA				;| 0356
	dl $C369C9				;| 0357
	dl $C369E2				;| 0358
	dl $C369FB				;| 0359
	dl $C36A2A				;| 035A
	dl $C4279F				;| 035B
	dl Script035C_WarOnGiygasScreenFlashing
	dl Script035D_HandleConfirmationScreenWalkingCharacters
	dl Script035E_Mailbox
	dl $C394CC				;| 035F
	dl $C394FD				;| 0360
	dl $C3952E				;| 0361
	dl $C3955F				;| 0362
	dl $C39590				;| 0363
	dl $C395C1				;| 0364
	dl $C395F2				;| 0365
	dl $C39623				;| 0366
	dl $C39654				;| 0367
	dl $C39685				;| 0368
	dl $C396B6				;| 0369
	dl $C396E7				;| 036A
	dl $C39718				;| 036B
	dl $C39749				;| 036C
	dl $C3977A				;| 036D
	dl $C397AB				;| 036E
	dl $C397DC				;| 036F
	dl $C3980D				;| 0370
	dl $C3983E				;| 0371
	dl $C3986F				;| 0372
	dl $C398A0				;| 0373
	dl $C398D1				;| 0374
	dl $C39902				;| 0375
	dl $C39933				;| 0376
	dl $C39964				;| 0377
	dl $C39995				;| 0378
	dl $C399C6				;| 0379
	dl $C399F7				;| 037A
	dl $C39A28				;| 037B
	dl $C39A59				;| 037C
	dl $C39A8A				;| 037D
	dl $C3A099				;/ 037E

;--------------------------------------------------------------------

label_C40B51:
	REP.b #$31
	JSL.l label_C0ABC6
	LDA.w #$0001
label_C40B59:
	JSL.l label_C08D79
	LDY.w #$0000
	LDX.w #$4000
	TYA
	JSL.l label_C08E1C
	SEP.b #$20
	LDA.b #$04
	STA.w $001A
	JSL.l label_C08726
	RTL

;--------------------------------------------------------------------

label_C40B75:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w #$0000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$0000
	LDX.w #$0A00
	SEP.b #$20
	TYA
	JSL.l label_C08616
	LDA.w #$4000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$4000
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #SpecialStartupScreenPalette
	STA.b $0E
	LDA.w #SpecialStartupScreenPalette>>16
	STA.b $10
	LDX.w #$0010
	LDA.w #$0200
	JSL.l label_C08ED2
	LDA.w #$0018
	JSL.l label_C0856B
	LDY.w #$0000
	LDX.w #$0001
	TXA
	JSL.l label_C087CE
label_C40BD2:
	BRA.b label_C40BD2

;--------------------------------------------------------------------

DATA_C40BD4:
	dw $0000,$0000,$0000,$0000
	dw $0015,$000F,$0000,$0000
	dw $0014,$0013

;--------------------------------------------------------------------

DATA_C40BE8:
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00

;--------------------------------------------------------------------

org $C40E31
DATA_C40E31:
	db $04

DATA_C40E32:
	dw $00DB,$0100,$00E2,$FF00
	dw $015C,$FF00,$015D,$FF00

;--------------------------------------------------------------------

org $C40EB0
DATA_C40EB0:

org $C40EE4
DATA_C40EE4:

org $C40EF0
DATA_C40EF0:

org $C40F04
DATA_C40F04:

;--------------------------------------------------------------------

org $C40F18
DATA_C40F18:
	db $06,$01
	db $1D : dw $0100
	db $42 : dl label_C468B5
	db $0A : dw DATA_C40F2E

DATA_C40F24:
	db $1D : dw $FFF4
	db $42 : dl label_C468B5
	db $0A : dw DATA_C40F42

DATA_C40F2E:
	db $1D : dw $00E0
	db $42 : dl label_C468DC
	db $0A : dw DATA_C40F18

DATA_C40F38:
	db $1D : dw $FFF4
	db $42 : dl label_C468DC
	db $0B : dw DATA_C40F18

DATA_C40F42:
	db $19 : dw DATA_C40F45

DATA_C40F45:
	db $42 : dl label_C020F1
	db $00

DATA_C40F4A:
	db $25 : dw label_C09FC8
	db $23 : dw label_C0A0BB
	db $42 : dl label_C0AAFD
	db $0E,$00 : dw $0001
	db $1B

DATA_C40F59:
	db $25 : dw label_C09FC8
	db $23 : dw label_C0A0BB
	db $42 : dl label_C0AAFD
	db $0E,$00 : dw $0000
	db $1B

Script01F6_MoveNessRightOnNameEntryScreen:
;$C40F68
	db $1A : dw DATA_C40F4A
	db $19 : dw DATA_C41036

Script01F7_UnknownNameEntryScreenScript:			; Note: Something to do with Ness doing the V gesture.
;$C40F6E
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C4116C

Script01F8_UnknownNameEntryScreenScript:			; Note: Something to do with Ness jumping
;$C40F74
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C4119D

Script01F9_UnknownNameEntryScreenScript:			; Note: Something to do with the shadow under Ness when he jumps.
;$C40F7A
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C411EB

Script01FA_UnknownNameEntryScreenScript:			; Note: Something to do with the shock tiles above Ness
;$C40F80
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C4121F

;--------------------------------------------------------------------

Script01FB_UnknownNameEntryScreenScript:			; Note: Something related to Paula on the name entry screen.
;$C40F86
	db $1A : dw DATA_C40F4A
	db $19 : dw DATA_C41253

Script01FC_UnknownNameEntryScreenScript:
;$C40F8C
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C41382

Script01FD_UnknownNameEntryScreenScript:
;$C40F92
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C413D6

Script01FE_UnknownNameEntryScreenScript:
;$C40F98
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C41402

;--------------------------------------------------------------------

Script01FF_UnknownNameEntryScreenScript:					; Note: Something related to Jeff on the name entry screen.
;$C40F9E
	db $1A : dw DATA_C40F4A
	db $19 : dw DATA_C4144C

Script0200_UnknownNameEntryScreenScript:
;$C40FA4
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C4152A

Script0201_UnknownNameEntryScreenScript:
;$C40FAA
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C4154E

Script0202_UnknownNameEntryScreenScript:
;$C40FB0
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C4158A

;--------------------------------------------------------------------

Script0203_UnknownNameEntryScreenScript:					; Note: Something related to Poo on the name entry screen.
;$C40FB6
	db $1A : dw DATA_C40F4A
	db $19 : dw DATA_C4163F

Script0204_UnknownNameEntryScreenScript:
;$C40FBC
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C4160A

Script0205_UnknownNameEntryScreenScript:
;$C40FC2
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C416AC

Script0206_UnknownNameEntryScreenScript:
;$C40FC8
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C415BA

;--------------------------------------------------------------------

Script0207_UnknownNameEntryScreenScript:					; Note: Something related to King on the name entry screen
;$C40FCE
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C415E7

Script0208_UnknownNameEntryScreenScript:
;$C40FD4
	db $1A : dw DATA_C40F4A
	db $19 : dw DATA_C4170E

Script0209_UnknownNameEntryScreenScript:
;$C40FDA
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C41822

Script020A_UnknownNameEntryScreenScript:
;$C40FE0
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C41900

Script020B_UnknownNameEntryScreenScript:
;$C40FE6
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C41900

;--------------------------------------------------------------------

Script020C_UnknownNameEntryScreenScript:				; Note: Something related to the ? plate on the name entry screen
;$C40FEC
	db $1A : dw DATA_C40F59
	db $43,$00
	db $19 : dw DATA_C41938

Script020D_UnknownNameEntryScreenScript:
;$C40FF4
	db $1A : dw DATA_C40F59
	db $07 : dw DATA_C40F18
	db $19 : dw DATA_C41974

Script020E_UnknownNameEntryScreenScript:
;$C40FFD
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C4198D

;--------------------------------------------------------------------

Script020F_UnknownNameEntryScreenScript:				; Note: Something related to the sparkling ? on the name entry screen
;$C41003
	db $1A : dw DATA_C40F59
	db $07 : dw DATA_C40F18
	db $19 : dw DATA_C419B2

Script0210_UnknownNameEntryScreenScript:
;$C4100C
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C419BF

Script0211_UnknownNameEntryScreenScript:
;$C41012
	db $1A : dw DATA_C40F59
	db $19 : dw DATA_C41A2A

Script0212_UnknownNameEntryScreenScript:
;$C41018
	db $1A : dw DATA_C40F59
	db $43,$00
	db $19 : dw DATA_C41A7D

;--------------------------------------------------------------------

Script0216_UnknownNameEntryScreenScript:				; Note: Seems to display King on the name entry confirmation screen
;$C41020
	db $1A : dw DATA_C40F59
DATA_C41023:
	db $42 : dl label_C0AA6E : db $03,$00
	db $06,$14
	db $42 : dl label_C0AA6E : db $01,$00
	db $06,$14
	db $19 : dw DATA_C41023

;--------------------------------------------------------------------

DATA_C41036:
	db $28 : dw $FFF8
	db $29 : dw $0028
	db $3F : dw $0100
	db $40 : dw $0000
DATA_C41042:
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$08
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C41042
	db $3F : dw $0000
	db $40 : dw $0000
	db $42 : dl label_C0AA6E : db $03,$00
	db $06,$08
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$08
DATA_C4106F:
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$0A
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $08 : dw DATA_C4106F
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$B4
	db $42 : dl label_C0AA6E : db $03,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $05,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $03,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$3C
	db $3B,$FF
	db $06,$3C
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$3C
DATA_C410CA:
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $02 : dw DATA_C410CA
DATA_C410E1:
	db $15 : dw $7EB4B4,$0001
	db $3B,$FF
	db $06,$14
	db $15 : dw $7EB4B4,$0000
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$1E
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C410E1
	db $42 : dl label_C0AA6E : db $03,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $01,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$08
DATA_C4111E:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $08 : dw DATA_C4111E
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$5A
	db $42 : dl label_C0AA6E : db $01,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $03,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$1E
	db $3B,$FF
	db $06,$3C
	db $19 : dw DATA_C4106F

DATA_C4116C:
	db $28 : dw $0018
	db $29 : dw $0028
	db $3B,$FF
	db $06,$30
DATA_C41176:
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$CD
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$3C
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$4A
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$3C
	db $19 : dw DATA_C41176

DATA_C4119D:
	db $3B,$FF
	db $06,$30
DATA_C411A1:
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$82
DATA_C411AD:
	db $28 : dw $0018
	db $29 : dw $0028
	db $3F : dw $0000
	db $40 : dw $FF00
	db $42 : dl label_C0AA6E : db $01,$00
	db $06,$0A
	db $3F : dw $0000
	db $40 : dw $0100
	db $42 : dl label_C0AA6E : db $01,$00
	db $06,$0A
	db $3F : dw $0000
	db $40 : dw $0000
	db $3B,$FF
	db $06,$1E
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C411AD
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$A9
	db $19 : dw DATA_C411A1

DATA_C411EB:
	db $3B,$FF
	db $06,$30
DATA_C411EF:
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$82
DATA_C411FB:
	db $28 : dw $0018
	db $29 : dw $002A
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$14
	db $3B,$FF
	db $06,$1E
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C411FB
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$A9
	db $19 : dw DATA_C411EF

DATA_C4121F:
	db $3B,$FF
	db $06,$30
DATA_C41223:
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$D9
DATA_C41233:
	db $28 : dw $0018
	db $29 : dw $0013
	db $42 : dl label_C0AA6E : db $03,$00
	db $06,$0A
	db $3B,$FF
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $02 : dw DATA_C41233
	db $3B,$FF
	db $06,$7A
	db $19 : dw DATA_C41223

;--------------------------------------------------------------------

DATA_C41253:
;$C41253
	db $28 : dw $FFF8
	db $29 : dw $0028
	db $3F : dw $0100
	db $40 : dw $0000
DATA_C4125F:
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$08
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C4125F
	db $3F : dw $0000
	db $40 : dw $0000
	db $42 : dl label_C0AA6E : db $03,$01
	db $06,$0A
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$0A
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$3C
DATA_C41294:
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $08 : dw DATA_C41294
DATA_C412AB:
	db $42 : dl label_C0AA6E : db $03,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $01,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $07,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $05,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$0A
	db $42 : dl label_C0AA6E : db $05,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $07,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $01,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $03,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$05
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$0A
DATA_C4134B:
	db $15 : dw $7EB4B4,$0001
	db $3B,$FF
	db $06,$3C
	db $15 : dw $7EB4B4,$0000
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$14
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C4134B
DATA_C41368:
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $08 : dw DATA_C41368
	db $19 : dw DATA_C412AB

DATA_C41382:
;$C41382
	db $28 : dw $0018
	db $29 : dw $0028
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$25
DATA_C41390:
	db $3B,$FF
	db $06,$78
DATA_C41394:
	db $3F : dw $0000
	db $40 : dw $FF00
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$0A
	db $3F : dw $0000
	db $40 : dw $0000
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$28
	db $3F : dw $0000
	db $40 : dw $0100
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$0A
	db $3F : dw $0000
	db $40 : dw $0000
	db $3B,$FF
	db $06,$14
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C41394
	db $3B,$FF
	db $06,$B4
	db $19 : dw DATA_C41390

DATA_C413D6:
;$C413D6
	db $28 : dw $0018
	db $29 : dw $002A
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$25
DATA_C413E4:
	db $3B,$FF
	db $06,$78
DATA_C413E8:
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$3C
	db $3B,$FF
	db $06,$14
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C413E8
	db $3B,$FF
	db $06,$B4
	db $19 : dw DATA_C413E4

DATA_C41402:
;$C41402
	db $28 : dw $000C
	db $29 : dw $0014
	db $3B,$FF
	db $06,$70
DATA_C4140C:
	db $42 : dl label_C0AA6E : db $01,$00
	db $06,$0A
	db $3B,$FF
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $08 : dw DATA_C4140C
DATA_C4141F:
	db $42 : dl label_C0AA6E : db $01,$00
	db $06,$0A
	db $3B,$FF
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $05 : dw DATA_C4141F
	db $3B,$FF
	db $06,$A0
DATA_C41436:
	db $42 : dl label_C0AA6E : db $01,$00
	db $06,$0A
	db $3B,$FF
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $08 : dw DATA_C41436
	db $19 : dw DATA_C4141F

;--------------------------------------------------------------------

DATA_C4144C:
;$C4144C
	db $28 : dw $FFF8
	db $29 : dw $0028
	db $3F : dw $0100
	db $40 : dw $0000
DATA_C41458:
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$08
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C41458
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$0A
	db $3F : dw $0000
	db $40 : dw $0000
DATA_C4147D:
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $08 : dw DATA_C4147D
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$3C
	db $3F : dw $FF00
	db $40 : dw $0000
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$02
	db $3F : dw $0000
	db $40 : dw $0000
	db $42 : dl label_C0AA6E : db $03,$01
	db $06,$08
DATA_C414C0:
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$B4
	db $42 : dl label_C0AA6E : db $05,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $07,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$FF
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$A5
	db $42 : dl label_C0AA6E : db $01,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $03,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$08
DATA_C41510:
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $08 : dw DATA_C41510
	db $19 : dw DATA_C414C0

DATA_C4152A:
;$C4152A
	db $28 : dw $0024
	db $29 : dw $0015
	db $3B,$FF
	db $06,$E1
DATA_C41534:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$08
	db $3B,$FF
	db $06,$08
	db $42 : dl label_C0AAD5 : db $02 : dw DATA_C41534
DATA_C41547:
	db $3B,$FF
	db $06,$01
	db $19 : dw DATA_C41547

DATA_C4154E:
;$C4154E
	db $28 : dw $000B
	db $29 : dw $001F
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$33
DATA_C4155C:
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$09
DATA_C41564:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$0A
	db $3B,$FF
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $05 : dw DATA_C41564
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$89
	db $19 : dw DATA_C4155C

DATA_C4158A:
;$C4158A
	db $28 : dw $0019
	db $29 : dw $000F
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$33
DATA_C41598:
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$F9
DATA_C415A0:
	db $42 : dl label_C0AA6E : db $03,$00
	db $06,$0A
	db $3B,$FF
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $05 : dw DATA_C415A0
	db $3B,$FF
	db $06,$D4
	db $19 : dw DATA_C41598

;--------------------------------------------------------------------

DATA_C415BA:
	db $28 : dw $0018
	db $29 : dw $0028
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$08
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$08
	db $42 : dl label_C0AA6E : db $06,$00
	db $06,$08
DATA_C415E0:
	db $3B,$FF
	db $06,$01
	db $19 : dw DATA_C415E0

DATA_C415E7:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$08
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$08
	db $42 : dl label_C0AA6E : db $06,$00
	db $06,$08
	db $19 : dw DATA_C40F45

DATA_C4160A:
	db $28 : dw $0018
	db $29 : dw $0028
	db $3B,$FF
	db $06,$20
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$FF
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$2D
DATA_C41624:
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$D5
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$FF
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$2D
	db $19 : dw DATA_C41624

DATA_C4163F:
	db $28 : dw $0018
	db $29 : dw $0028
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$4D
DATA_C4164D:
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$78
	db $42 : dl label_C0AA6E : db $05,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $07,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$3C
	db $3B,$FF
	db $06,$78
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$3C
	db $42 : dl label_C0AA6E : db $01,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $03,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$3C
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$2D
	db $19 : dw DATA_C4164D

DATA_C416AC:
	db $28 : dw $0018
	db $29 : dw $0028
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$4D
DATA_C416BA:
	db $3B,$FF
	db $06,$CC
DATA_C416BE:
	db $42 : dl label_C0AA6E : db $06,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C416BE
DATA_C416D5:
	db $42 : dl label_C0AA6E : db $06,$00
	db $06,$05
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$05
	db $42 : dl label_C0AAD5 : db $03 : dw DATA_C416D5
DATA_C416EC:
	db $42 : dl label_C0AA6E : db $06,$00
	db $06,$02
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$03
	db $42 : dl label_C0AAD5 : db $07 : dw DATA_C416EC
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$BD
	db $19 : dw DATA_C416BA

DATA_C4170E:							; Note: Something related to Ness, when King is on the name entry screen
	db $28 : dw $FFF8
	db $29 : dw $0030
	db $3F : dw $0100
	db $40 : dw $0000
DATA_C4171A:
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$08
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C4171A
	db $3F : dw $0000
	db $40 : dw $0000
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$1E
	db $42 : dl label_C0AA6E : db $03,$01
	db $06,$0A
DATA_C41747:
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$0A
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C41747
	db $42 : dl label_C0AA6E : db $05,$01
	db $06,$0A
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$0A
	db $3F : dw $FF00
	db $40 : dw $0000
DATA_C41774:
	db $42 : dl label_C0AA6E : db $06,$00
	db $06,$08
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$08
	db $42 : dl label_C0AAD5 : db $02 : dw DATA_C41774
	db $3B,$FF
	db $06,$06
DATA_C4178F:
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$1C
	db $28 : dw $FFF8
	db $29 : dw $0030
	db $3F : dw $0100
	db $40 : dw $0000
DATA_C417A7:
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$08
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C417A7
	db $3F : dw $0000
	db $40 : dw $0000
	db $42 : dl label_C0AA6E : db $03,$01
	db $06,$0A
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$0A
	db $42 : dl label_C0AA6E : db $01,$01
	db $06,$0A
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$3C
	db $42 : dl label_C0AA6E : db $07,$01
	db $06,$0A
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$0A
	db $3F : dw $FF00
	db $40 : dw $0000
DATA_C417FA:
	db $42 : dl label_C0AA6E : db $06,$00
	db $06,$08
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$08
	db $42 : dl label_C0AAD5 : db $02 : dw DATA_C417FA
	db $3F : dw $0000
	db $40 : dw $0000
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$2B
	db $19 : dw DATA_C4178F

DATA_C41822:							; Note: Something related to King being awake on the name entry screen
	db $28 : dw $FFF4
	db $29 : dw $0028
	db $3F : dw $0100
	db $40 : dw $0000
DATA_C4182E:
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$08
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$08
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C4182E
	db $3F : dw $0000
	db $40 : dw $0000
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$72
DATA_C41853:
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C41853
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$14
DATA_C41872:
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$78
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$FF
	db $42 : dl label_C0AA6E : db $06,$00
	db $06,$60
DATA_C4188A:
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$0A
	db $42 : dl label_C0AA6E : db $06,$00
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $02 : dw DATA_C4188A
DATA_C418A1:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $02 : dw DATA_C418A1
DATA_C418B8:
	db $42 : dl label_C0AA6E : db $02,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $02,$01
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $02 : dw DATA_C418B8
DATA_C418CF:
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $04,$01
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $02 : dw DATA_C418CF
DATA_C418E6:
	db $42 : dl label_C0AA6E : db $06,$01
	db $06,$0A
	db $42 : dl label_C0AA6E : db $06,$00
	db $06,$0A
	db $42 : dl label_C0AAD5 : db $02 : dw DATA_C418E6
	db $19 : dw DATA_C41872

DATA_C41900:							; Note: Something related to King sleeping on the name entry screen
	db $28 : dw $0014
	db $29 : dw $0028
	db $3B,$FF
	db $06,$CE
DATA_C4190A:
	db $3B,$FF
	db $06,$78
	db $42 : dl label_C0AA6E : db $01,$00
	db $06,$1E
DATA_C41916:
	db $42 : dl label_C0AA6E : db $03,$00
	db $06,$14
	db $42 : dl label_C0AA6E : db $01,$00
	db $06,$14
	db $42 : dl label_C0AAD5 : db $0B : dw DATA_C41916
	db $3B,$FF
	db $06,$FF
	db $3B,$FF
	db $06,$8D
	db $19 : dw DATA_C4190A

;--------------------------------------------------------------------

DATA_C41938:
	db $28 : dw $0018
	db $29 : dw $FFE0
	db $3F : dw $0000
	db $40 : dw $0200
DATA_C41944:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$04
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$04
	db $42 : dl label_C0AAD5 : db $03 : dw DATA_C41944
	db $3F : dw $0000
	db $40 : dw $0000
DATA_C41961:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$0A
	db $19 : dw DATA_C41961

DATA_C41974:
	db $3F : dw $0000
	db $40 : dw $FE00
DATA_C4197A:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$04
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$04
	db $19 : dw DATA_C4197A

DATA_C4198D:
	db $28 : dw $FFD8
	db $29 : dw $0029
	db $3F : dw $0200
	db $40 : dw $0000
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$20
	db $3F : dw $0000
	db $40 : dw $0000
DATA_C419A7:
	db $42 : dl label_C0AA6E : db $04,$00
	db $06,$01
	db $19 : dw DATA_C419A7

;--------------------------------------------------------------------

DATA_C419B2:
	db $3F : dw $FE00
	db $40 : dw $0000
	db $42 : dl label_C0AA6E : db $04,$00
	db $09
DATA_C419BF:
	db $28 : dw $0018
	db $29 : dw $0020
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$05
	db $3B,$FF
	db $06,$0A
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$05
	db $3B,$FF
	db $06,$0A
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$05
	db $3B,$FF
	db $06,$05
DATA_C419E9:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$01
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$01
	db $3B,$FF
	db $06,$02
	db $42 : dl label_C0AAD5 : db $03 : dw DATA_C419E9
DATA_C41A04:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$01
	db $3B,$FF
	db $06,$01
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C41A04
DATA_C41A17:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$0A
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$0A
	db $19 : dw DATA_C41A17

DATA_C41A2A:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$01
	db $3B,$FF
	db $06,$01
	db $42 : dl label_C0AAD5 : db $01 : dw DATA_C41A2A
DATA_C41A3D:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$01
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$01
	db $3B,$FF
	db $06,$02
	db $42 : dl label_C0AAD5 : db $03 : dw DATA_C41A3D
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$05
	db $3B,$FF
	db $06,$05
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$05
	db $3B,$FF
	db $06,$0A
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$05
	db $3B,$FF
	db $06,$0A
	db $00

DATA_C41A7D:
	db $28 : dw $0018
	db $29 : dw $0020
	db $3B,$FF
	db $06,$3C
DATA_C41A87:
	db $42 : dl label_C0AA6E : db $00,$00
	db $06,$05
	db $42 : dl label_C0AA6E : db $00,$01
	db $06,$05
	db $3B,$FF
	db $06,$05
	db $19 : dw DATA_C41A87

;--------------------------------------------------------------------


org $C41A9E
GraphicsDecompressionRoutines:
.Main:
;$C41A9E
	LDA.b $0E
	STA.w $00CC
	LDA.b $10
	STA.w $00CE
	LDX.b $12
	STX.w $00CF
	PHB
	SEP.b #$20
	LDA.b $14
	PHA
	PLB
	REP.b #$20
	PHD
	PEA.w $0000
	PLD
	PHP
	SEP.b #$20
	LDY.w #$0000
label_C41AC1:
	LDA.b [$CC],Y
	CMP.b #$FF
	BNE.b label_C41ACB
	PLP
	PLD
	PLB
	RTL

label_C41ACB:
	AND.b #$E0
	CMP.b #$E0
	BNE.b label_C41AED
	LDA.b [$CC],Y
	ASL
	ASL
	ASL
	AND.b #$E0
	PHA
	LDA.b [$CC],Y
	INY
	AND.b #$03
	STA.b $D2
	LDA.b [$CC],Y
	INY
	STA.b $D1
	REP.b #$20
	INC.b $D1
	SEP.b #$20
	BRA.b label_C41AF8

label_C41AED:
	PHA
	LDA.b [$CC],Y
	INY
	AND.b #$1F
	INC
	STA.b $D1
	STZ.b $D2
label_C41AF8:
	PLA
	BPL.b label_C41AFE
	JMP.w label_C41B56

label_C41AFE:
	CMP.b #$20
	BEQ.b label_C41B1C
	CMP.b #$40
	BEQ.b label_C41B2D
	CMP.b #$60
	BEQ.b label_C41B44
label_C41B0A:
	LDA.b [$CC],Y
	INY
	STA.w $0000,X
	INX
	REP.b #$20
	DEC.b $D1
	SEP.b #$20
	BNE.b label_C41B0A
	JMP.w label_C41AC1

label_C41B1C:
	LDA.b [$CC],Y
	INY
	PHY
	LDY.b $D1
label_C41B22:
	STA.w $0000,X
	INX
	DEY
	BNE.b label_C41B22
	PLY
	JMP.w label_C41AC1

label_C41B2D:
	REP.b #$20
	LDA.b [$CC],Y
	INY
	INY
	PHY
	LDY.b $D1
label_C41B36:
	STA.w $0000,X
	INX
	INX
	DEY
	BNE.b label_C41B36
	PLY
	SEP.b #$20
	JMP.w label_C41AC1

label_C41B44:
	LDA.b [$CC],Y
	INY
	PHY
	LDY.b $D1
label_C41B4A:
	STA.w $0000,X
	INX
	INC
	DEY
	BNE.b label_C41B4A
	PLY
	JMP.w label_C41AC1

label_C41B56:
	STA.b $D3
	REP.b #$20
	LDA.b [$CC],Y
	XBA
	CLC
	ADC.b $CF
	INY
	INY
	PHY
	TAY
	SEP.b #$20
	LDA.b $D3
	CMP.b #$80
	BEQ.b label_C41B74
	CMP.b #$A0
	BEQ.b label_C41B88
	CMP.b #$C0
	BEQ.b label_C41BB6
label_C41B74:
	LDA.w $0000,Y
	STA.w $0000,X
	INY
	INX
	REP.b #$20
	DEC.b $D1
	SEP.b #$20
	BNE.b label_C41B74
	PLY
	JMP.w label_C41AC1

label_C41B88:
	LDA.w $0000,Y
	STA.b $D3
	ASL.b $D3
	ROR
	ASL.b $D3
	ROR
	ASL.b $D3
	ROR
	ASL.b $D3
	ROR
	ASL.b $D3
	ROR
	ASL.b $D3
	ROR
	ASL.b $D3
	ROR
	ASL.b $D3
	ROR
	STA.w $0000,X
	INY
	INX
	REP.b #$20
	DEC.b $D1
	SEP.b #$20
	BNE.b label_C41B88
	PLY
	JMP.w label_C41AC1

label_C41BB6:
	LDA.w $0000,Y
	STA.w $0000,X
	DEY
	INX
	REP.b #$20
	DEC.b $D1
	SEP.b #$20
	BNE.b label_C41BB6
	PLY
	JMP.w label_C41AC1

;--------------------------------------------------------------------

org $C41EFF
label_C41EFF:
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$0010
	TCD
	PLA
	STA.b $00
	STX.b $02
	STY.b $04
	LDA.b $1E
	STA.b $06
	LDA.b $00
	SEC
	SBC.b $04
	PHA
	BPL.b label_C41F20
	EOR.w #$FFFF
	INC
label_C41F20:
	TAY
	LDA.b $02
	SEC
	SBC.b $06
	PHA
	BPL.b label_C41F2D
	EOR.w #$FFFF
	INC
label_C41F2D:
	STA.b $0C
	TYA
label_C41F30:
	CMP.w #$0100
	BCC.b label_C41F3A
	LSR
	LSR.b $0C
	BRA.b label_C41F30

label_C41F3A:
	STA.b $0A
	PLA
	BEQ.b label_C41F46
	BPL.b label_C41F4B
	LDA.w #$0000
	BRA.b label_C41F4E

label_C41F46:
	LDA.w #$0008
	BRA.b label_C41F4E

label_C41F4B:
	LDA.w #$0002
label_C41F4E:
	PLX
	BEQ.b label_C41F55
	BPL.b label_C41F5A
	BRA.b label_C41F5D

label_C41F55:
	ORA.w #$0004
	BRA.b label_C41F6D

label_C41F5A:
	ORA.w #$0001
label_C41F5D:
	BIT.w #$000C
	BEQ.b label_C41F6D
	ASL
	TAX
	LDA.l $C41FC5,X
	STA.b $0E
	JMP.w label_C41FC1

label_C41F6D:
	STA.b $0E
	ASL
	STA.b $08
	LDA.b $0C
	XBA
	BIT.w #$00FF
	BEQ.b label_C41F7D
	LDA.w #$FFFF
label_C41F7D:
	STA.l !REGISTER_DividendLo
	LDA.b $0A
	SEP.b #$20
	STA.l !REGISTER_Divisor
	REP.b #$20
	NOP #5
	LDA.l !REGISTER_QuotientLo
	LDX.w #$0000
label_C41F97:
	CMP.l DATA_C41FDF,X
	BCC.b label_C41FA4
	INX
	INX
	CPX.w #$0020
	BCC.b label_C41F97
label_C41FA4:
	LDA.b $0E
	BEQ.b label_C41FB7
	EOR.w #$0003
	BEQ.b label_C41FB7
	STX.b $0E
	LDA.w #$0020
	SEC
	SBC.b $0E
	BRA.b label_C41FB8

label_C41FB7:
	TXA
label_C41FB8:
	ASL
	XBA
	LDX.b $08
	CLC
	ADC.l DATA_C41FC5,X
label_C41FC1:
	PLD
	REP.b #$30
	RTL

DATA_C41FC5:									; Note: Something related to Ness's movement speed?
	dw $4000,$8000,$0000,$C000,$8000,$FFFF,$0000,$FFFF
	dw $4000,$C000,$FFFF,$FFFF,$0000

DATA_C41FDF:
	dw $000D,$0026,$0040,$005C,$0079,$0099,$00BE,$00E8
	dw $011A,$0159,$01AB,$021D,$02CB,$03FD,$06BB,$143D

;--------------------------------------------------------------------

org $C41FFF
label_C41FFF:
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$000E
	TCD
	PLA
	TXY
	PHY
	XBA
	AND.w #$00FC
	LSR
	PHA
	TAX
	LDA.l DATA_C4205D,X
	CMP.w #$0100
	BNE.b label_C4201F
	TYA
	BRA.b label_C42022
label_C4201F:
	JSR.w label_C4213F
label_C42022:
	PLX
	PLY
	PHA
	LDA.l DATA_C420BD,X
	PHX
	CMP.w #$0100
	BNE.b label_C42032
	TYA
	BRA.b label_C42035

label_C42032:
	JSR.w label_C4213F
label_C42035:
	PLX
	CPX.w #$0020
	BCC.b label_C42040
	CPX.w #$0062
	BCC.b label_C42044
label_C42040:
	EOR.w #$FFFF
	INC
label_C42044:
	TAY
	PLA
	CPX.w #$0042
	BCC.b label_C42054
	CPX.w #$0080
	BCS.b label_C42054
	EOR.w #$FFFF
	INC
label_C42054:
	TAX
	STX.b $16
	STY.b $14
	PLD
	REP.b #$30
	RTL

DATA_C4205D:
	dw $0000,$0019,$0032,$004A,$0062,$0079,$008E,$00A2
	dw $00B5,$00C6,$00D5,$00E2,$00EC,$00F5,$00FB,$00FE
	dw $0100,$00FE,$00FB,$00F5,$00ED,$00E2,$00D5,$00C6
	dw $00B5,$00A2,$008E,$0079,$0062,$004A,$0032,$0019
	dw $0000,$0019,$0032,$004A,$0062,$0079,$008E,$00A2
	dw $00B5,$00C6,$00D5,$00E2,$00EC,$00F5,$00FB,$00FE

DATA_C420BD:
	dw $0100,$00FE,$00FB,$00F5,$00EC,$00E2,$00D5,$00C6
	dw $00B5,$00A3,$008E,$0079,$0062,$004B,$0032,$0019
	dw $0000,$0019,$0032,$004A,$0062,$0079,$008E,$00A2
	dw $00B5,$00C6,$00D5,$00E2,$00EC,$00F5,$00FB,$00FE
	dw $0100,$00FE,$00FB,$00F5,$00ED,$00E2,$00D5,$00C6
	dw $00B5,$00A2,$008E,$0079,$0062,$004A,$0032,$0019
	dw $0000,$0019,$0032,$004A,$0062,$0079,$008E,$00A2
	dw $00B5,$00C6,$00D5,$00E2,$00EC,$00F5,$00FB,$00FE
	dw $0100

label_C4213F:
	STY.b $00
	STA.b $02
	TYA
	SEP.b #$20
	LDA.b $02
	REP.b #$20
	STA.l !REGISTER_Multiplicand
	NOP
	CLC
	LDA.l !REGISTER_ProductOrRemainderLo
	STA.b $04
	SEP.b #$20
	LDA.b $00
	STA.l !REGISTER_Multiplier
	NOP #2
	REP.b #$20
	LDA.l !REGISTER_ProductOrRemainderLo
	XBA
	SEP.b #$20
	STA.b $02
	REP.b #$20
	LDA.b $02
	ADC.b $04
	RTS

;--------------------------------------------------------------------

org $C42172
script0313_UnknownFileSelectScript:
;$C42172
	db $42 : dl label_C2DB3F
	db $06,$01
	db $19 : dw script0313_UnknownFileSelectScript

;--------------------------------------------------------------------

; Note: This table's address gets stored to $7E13FE
; The second byte in each two byte row seems to control how long each part of the flash animation should last.

Script035C_WarOnGiygasScreenFlashing:
;$C4217B
	db $42 : dl FlashWarOnGiygasScreen_Main
	db $06,$0F
	db $42 : dl UnflashWarOnGiygasScreen_Main
	db $06,$64
	db $42 : dl FlashWarOnGiygasScreen_Main
	db $06,$0F
	db $42 : dl UnflashWarOnGiygasScreen_Main
	db $06,$50
	db $42 : dl FlashWarOnGiygasScreen_Main
	db $06,$0F
	db $42 : dl UnflashWarOnGiygasScreen_Main
	db $06,$3C
	db $42 : dl FlashWarOnGiygasScreen_Main
	db $06,$0A
	db $42 : dl UnflashWarOnGiygasScreen_Main
	db $06,$28
	db $42 : dl FlashWarOnGiygasScreen_Main
	db $06,$0A
	db $42 : dl UnflashWarOnGiygasScreen_Main
	db $06,$1E
	db $42 : dl FlashWarOnGiygasScreen_Main
	db $06,$0A
	db $42 : dl UnflashWarOnGiygasScreen_Main
	db $06,$14
	db $F5 : dl FlashWarOnGiygasScreen_Main
	db $42 : dl UnflashWarOnGiygasScreen_Main
	db $06,$0F
	db $F5 : dl FlashWarOnGiygasScreen_Main
	db $42 : dl UnflashWarOnGiygasScreen_Main
	db $06,$0A
	db $F3 : dl FlashWarOnGiygasScreen_Main
	db $42 : dl UnflashWarOnGiygasScreen_Main
	db $06,$08
	db $F2 : dl FlashWarOnGiygasScreen_Main
	db $F6 : dl UnflashWarOnGiygasScreen_Main
	db $F2 : dl FlashWarOnGiygasScreen_Main
	db $F4 : dl UnflashWarOnGiygasScreen_Main
	db $F2 : dl FlashWarOnGiygasScreen_Main
	db $F3 : dl UnflashWarOnGiygasScreen_Main
	db $F2 : dl FlashWarOnGiygasScreen_Main
	db $F2 : dl UnflashWarOnGiygasScreen_Main
	db $F2 : dl FlashWarOnGiygasScreen_Main
	db $F2 : dl UnflashWarOnGiygasScreen_Main
	db $F2 : dl FlashWarOnGiygasScreen_Main
	db $00

;--------------------------------------------------------------------

; Note: Seems to be related to the title screen?

org $C4220E
DATA_C4220E:
	db $1C : dl DATA_E1CF9D
	db $22 : dw label_C0A0FA
	db $43,$01
	db $23 : dw label_C0A0BB
	db $42 : dl label_C0EE53
	db $1B

;--------------------------------------------------------------------

DATA_C4221F:
	db $42 : dl label_C0ED14
	db $06,$02

;--------------------------------------------------------------------

DATA_C42225:
	db $42 : dl label_C0ED39
	db $0C

;--------------------------------------------------------------------

script0315_C4222A:
	db $1E : dw $9F75
	db $0A : dw DATA_C42235

;--------------------------------------------------------------------

DATA_C42230:
	db $42 : dl label_C0ED5C
	db $00

;--------------------------------------------------------------------

DATA_C42235:
	db $06,$96

;--------------------------------------------------------------------

DATA_C42237:
	db $06,$1E

;--------------------------------------------------------------------

DATA_C42239:
	db $07 : dw DATA_C4221F
	db $1D : dw $0000
	db $42 : dl label_C0EC77
	db $0E,$00 : dw $0000
	db $0E,$01 : dw $0008
	db $0E,$02 : dw $000E
	db $01,$0E
	db $42 : dl label_C0EDDA
	db $06,$02

;--------------------------------------------------------------------

DATA_C42257:
	db $02

;--------------------------------------------------------------------

DATA_C42258:
	db $06,$20

;--------------------------------------------------------------------

DATA_C4225A:
	db $06,$1E

;--------------------------------------------------------------------

DATA_C4225C:
	db $42 : dl label_C0ECB7
	db $01,$A5
	db $42 : dl label_C426ED
	db $06,$01

;--------------------------------------------------------------------

DATA_C42268:
	db $02
	db $42 : dl label_C49740
	db $1D : dw $0001
	db $42 : dl label_C0EC77
	db $0E,$00 : dw $0000
	db $0E,$01 : dw $0007
	db $0E,$02 : dw $0014
	db $01,$14
	db $42 : dl label_C0EDDA
	db $06,$08

;--------------------------------------------------------------------

DATA_C42288:
	db $02
	db $42 : dl label_C0EDD1
	db $06,$85

;--------------------------------------------------------------------

DATA_C4228F:
	db $00

;--------------------------------------------------------------------

; Note: Seems to be related to the intial title screen palette animation (where the letter B fades in)?

script0314_UnknownTitleScreenScript:
;$C42290
	db $1E : dw $9F75
	db $0B,$98,$22
	db $06,$3C

	db $42 : dl label_C09E71
	dw $0315				; Index for C400D4?
	db $42 : dl label_C09E71
	dw $0316
	db $42 : dl label_C09E71
	dw $0317
	db $42 : dl label_C09E71
	dw $0318
	db $42 : dl label_C09E71
	dw $0319
	db $42 : dl label_C09E71
	dw $031A
	db $42 : dl label_C09E71
	dw $031B
	db $42 : dl label_C09E71
	dw $031C
	db $42 : dl label_C09E71
	dw $031D
	db $42 : dl label_C09E71
	dw $031E
	db $06,$96

;--------------------------------------------------------------------

DATA_C422D6:
	db $06,$1E

;--------------------------------------------------------------------

DATA_C422D8:
	db $06,$3C

;--------------------------------------------------------------------

DATA_C422DA:
	db $06,$1E

;--------------------------------------------------------------------

DATA_C422DC:
	db $06,$A5

;--------------------------------------------------------------------

DATA_C422DE:
	db $06,$A1

;--------------------------------------------------------------------

DATA_C422E0:
	db $06,$8C

;--------------------------------------------------------------------

DATA_C422E2:
	db $06,$1D

;--------------------------------------------------------------------

DATA_C422E4:
	db $42 : dl label_C46E46
	db $09

;--------------------------------------------------------------------

script0316_C422E9:
;$C422E9
	db $1A : dw DATA_C4220E

;--------------------------------------------------------------------

DATA_C422EC:				; Note: Seems to handle the E in "earthBound"
;$C422EC
	db $3B,$00
	db $29 : dw $0064
	db $1E : dw $9F75
	db $0B,$00,$23
	db $28 : dw $FD6B
	db $3F : dw $04A2
	db $06,$96

;--------------------------------------------------------------------

DATA_C422FF:
;$C422FF
	db $39
	db $28 : dw $0022
	db $09

;--------------------------------------------------------------------

script0317_C42304:				; Note: Seems to handle the A in "earthBound"
;$C42304
	db $1A : dw DATA_C4220E
	db $3B,$01
	db $29 : dw $0064
	db $1E : dw $9F75
	db $0B,$1B,$23
	db $28 : dw $FE0B
	db $3F : dw $03B3
	db $06,$96

;--------------------------------------------------------------------

DATA_C4231A:
;$C4231A
	db $39
	db $28 : dw $0036
	db $09

;--------------------------------------------------------------------

script0318_C4231F:				; Note: Seems to handle the R in "earthBound"
;$C4231F
	db $1A : dw DATA_C4220E
	db $3B,$02
	db $29 : dw $0064
	db $1E : dw $9F75
	db $0B,$36,$23
	db $28 : dw $FEAB
	db $3F : dw $02C7
	db $06,$96

;--------------------------------------------------------------------

DATA_C42335:
;$C42335
	db $39
	db $28 : dw $004C
	db $09

;--------------------------------------------------------------------

script0319_C4233A:				; Note: Seems to handle the T in "earthBound"
;$C4233A
	db $1A : dw DATA_C4220E
	db $3B : db $03
	db $29 : dw $0064
	db $1E : dw $9F75
	db $0B,$51,$23
	db $28 : dw $FF4B
	db $3F : dw $01D5
	db $06,$96

;--------------------------------------------------------------------

DATA_C42350:
;$C42350
	db $39
	db $28 : dw $005E
	db $09

;--------------------------------------------------------------------

script031A_C42355:				; Note: Seems to handle the H in "earthBound"
;$C42355
	db $1A : dw DATA_C4220E
	db $3B,$04
	db $29 : dw $0064
	db $1E : dw $9F75
	db $0B,$6C,$23
	db $28 : dw $FFEB
	db $3F : dw $00E2
	db $06,$96

;--------------------------------------------------------------------

DATA_C4236B:
;$C4236B
	db $39
	db $28 : dw $0070
	db $09

;--------------------------------------------------------------------

script031B_C42370:				; Note: Seems to handle the O in "earthBound"
;$C42370
	db $1A : dw DATA_C4220E
	db $3B,$05
	db $29 : dw $0064
	db $1E : dw $9F75
	db $0B,$87,$23
	db $28 : dw $0153
	db $3F : dw $FECF
	db $06,$96

;--------------------------------------------------------------------

DATA_C42386:
;$C42386
	db $39
	db $28 : dw $00A0
	db $09

;--------------------------------------------------------------------

script031C_C4238B:				; Note: Seems to handle the U in "earthBound"
;$C4238B
	db $1A : dw DATA_C4220E
	db $3B,$06
	db $29 : dw $0064
	db $1E : dw $9F75
	db $0B,$A2,$23
	db $28 : dw $021B
	db $3F : dw $FD9C
	db $06,$96

;--------------------------------------------------------------------

DATA_C423A1:
;$C423A1
	db $39
	db $28 : dw $00B4
	db $09

;--------------------------------------------------------------------

script031D_C423A6:				; Note: Seems to handle the N in "earthBound"
;$C423A6
	db $1A : dw DATA_C4220E
	db $3B,$07
	db $29 : dw $0064
	db $1E : dw $9F75
	db $0B,$BD,$23
	db $28 : dw $02E3
	db $3F : dw $FC6A
	db $06,$96

;--------------------------------------------------------------------

DATA_C423BC:
;$C423BC
	db $39
	db $28 : dw $00C9
	db $09

;--------------------------------------------------------------------

script031E_C423C1:				; Note: Seems to handle the D in "earthBound"
;$C423C1
	db $1A : dw DATA_C4220E
	db $3B,$08
	db $29 : dw $0064
	db $1E : dw $9F75
	db $0B,$D8,$23
	db $28 : dw $03AB
	db $3F : dw $FB39
	db $06,$96

;--------------------------------------------------------------------

DATA_C423D7:
;$C423D7
	db $39
	db $28 : dw $00DE
	db $09

;--------------------------------------------------------------------

org $C4249A
label_C4249A:
	SEP.b #$30
	STA.l !REGISTER_ColorMathSelectAndEnable
	LDA.b #$20
	STA.l !REGISTER_ObjectAndColorWindowSettings
	LDA.b #$00
	STA.l !REGISTER_Window1LeftPositionDesignation
	LDA.b #$FF
	STA.l !REGISTER_Window1RightPositionDesignation
	LDA.b #$13
	STA.w $212E
	LDA.b #$00
	STA.l !REGISTER_BGWindowLogicSettings
	STA.l !REGISTER_ColorAndObjectWindowLogicSettings
	LDA.b #$10
	STA.l !REGISTER_ColorMathInitialSettings
	TXA
	ORA.b #$E0
	STA.l !REGISTER_FixedColorData
	REP.b #$30
	RTL

;--------------------------------------------------------------------

org $C42631
label_C42631:
	REP.b #$30
	STZ.w $3C22
	STZ.w $3C24
	STZ.w $3C26
	STZ.w $3C28
	TAY
	TXA
	CLC
	ADC.w #$0080
	AND.w #$00FF
	TAX
	PHX
	TYA
	JSL.l label_C0B40B
	STA.w $3C23
	LDA.w $3C23
	BPL.b label_C42660
	LDA.w #$FF00
	ORA.w $3C24
	STA.w $3C24
label_C42660:
	PLX
	TYA
	JSL.l label_C0B400
	STA.w $3C27
	LDA.w $3C27
	BPL.b label_C42677
	LDA.w #$FF00
	ORA.w $3C28
	STA.w $3C28
label_C42677:
	LDA.w $0031
	STA.w $3C2C
	LDA.w $0033
	STA.w $3C30
	STZ.w $3C2A
	STZ.w $3C2E
	RTL

;--------------------------------------------------------------------

label_C4268A:
	LDA.w $3C22
	CLC
	ADC.w $3C2A
	STA.w $3C2A
	LDA.w $3C24
	ADC.w $3C2C
	STA.w $3C2C
	STA.w $0031
	STA.w $0035
	LDA.w $3C26
	CLC
	ADC.w $3C2E
	STA.w $3C2E
	LDA.w $3C28
	ADC.w $3C30
	STA.w $3C30
	STA.w $0033
	STA.w $0037
	LDA.w $0031
	LDX.w $0033
	JSL.l label_C01731
	RTL

;--------------------------------------------------------------------

label_C426C7:
	REP.b #$30
	LDX.w #$0000
label_C426CC:
	LDA.w $0A62,X
	BMI.b label_C426E5
	LDA.w $0B8E,X
	SEC
	SBC.w $0031
	STA.w $0B16,X
	LDA.w $0BCA,X
	SEC
	SBC.w $0033
	STA.w $0B52,X
label_C426E5:
	INX
	INX
	CPX.w #$003C
	BNE label_C426CC
	RTL

;--------------------------------------------------------------------

label_C426ED:
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$0002
	TCD
	PLA
	LDX.w #$0000
label_C426FB:
	LDA.l $7F0200,X
	CLC
	ADC.l $7F0800,X
	STA.l $7F0800,X
	BPL.b label_C42713
	LDA.w #$0000
	STA.l $7F0200,X
	BRA.b label_C42725

label_C42713:
	AND.w #$1F00
	CMP.w #$1F00
	BNE.b label_C42725
	LDA.w #$0000
	STA.l $7F0200,X
	LDA.w #$1F00
label_C42725:
	XBA
	STA.b $00
	LDA.l $7F0400,X
	CLC
	ADC.l $7F0A00,X
	STA.l $7F0A00,X
	BPL.b label_C42740
	LDA.w #$0000
	STA.l $7F0400,X
	BRA.b label_C42752

label_C42740:
	AND.w #$1F00
	CMP.w #$1F00
	BNE.b label_C42752
	LDA.w #$0000
	STA.l $7F0400,X
	LDA.w #$1F00
label_C42752:
	LSR
	LSR
	LSR
	ORA.b $00
	STA.b $00
	LDA.l $7F0600,X
	CLC
	ADC.l $7F0C00,X
	STA.l $7F0C00,X
	BPL.b label_C42771
	LDA.w #$0000
	STA.l $7F0400,X
	BRA.b label_C42783

label_C42771:
	AND.w #$1F00
	CMP.w #$1F00
	BNE.b label_C42783
	LDA.w #$0000
	STA.l $7F0600,X
	LDA.w #$1F00
label_C42783:
	ASL
	ASL
	ORA.b $00
	STA.w $0200,X
	INX
	INX
	CPX.w #$0200
	BEQ.b label_C42794
	JMP.w label_C426FB

label_C42794:
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

org $C4283F
label_C4283F:
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$0008
	TCD
	PLA
	PHY
	STX.b $04
	ASL
	TAY
	LDA.w #$007F
	STA.b $06
	LDA.w $2A06,Y
	STA.b $02
	LDA.w $2AF6,Y
	ASL
	TAX
	LDA.l DATA_C0A623,X
	ASL
	ASL
	CLC
	ADC.w $29CA,Y
	ADC.w $10F2,Y
	STA.b $00
	LDA.b [$00]
	AND.w #$FFF0
	STA.b $00
	LDA.w $2A42,Y
	STA.b $02
	PLY
label_C4287A:
	LDA.b [$00],Y
	STA.b [$04],Y
	DEY
	DEY
	BPL.b label_C4287A
	PLD
	RTL

;--------------------------------------------------------------------

label_C42884:
	REP.b #$20
	PHD
	PHA
	TDC
	SEC
	SBC.w #$0008
	TCD
	PLA
	PHY
	STX.b $04
	ASL
	TAY
	LDA.w #$007F
	STA.b $06
	LDA.w $2A06,Y
	STA.b $02
	LDA.w $29CA,Y
	STA.b $00
	LDA.w $2AF6,Y
	ASL
	TAX
	LDA.l DATA_C0A60B,X
	BEQ.b label_C428BA
	TAX
	LDA.b $00
	CLC
label_C428B2:
	ADC.w #$0004
	DEX
	BNE.b label_C428B2
	STA.b $00
label_C428BA:
	LDA.b [$00]
	AND.w #$FFF0
	STA.b $00
	LDA.w $2A42,Y
	STA.b $02
	PLY
label_C428C7:
	LDA.b [$00],Y
	STA.b [$04],Y
	DEY
	DEY
	BPL.b label_C428C7
	PLD
	RTL

;--------------------------------------------------------------------

org $C429E8
label_C429E8:
	TAY
	ASL
	ASL
	ASL
	ASL
	TAX
	SEP.b #$20
	LDA.b #$7EADB8>>16
	STA.l HDMA[$00].SourceBank,X
	STA.l HDMA[$00].IndirectSourceBank,X
	LDA.b #!REGISTER_MainScreenLayers
	STA.l HDMA[$00].Destination,X
	LDA.b #$01
	STA.l HDMA[$00].Parameters,X
	REP.b #$20
	LDA.w #$7EADB8
	STA.l HDMA[$00].SourceLo,X
	SEP.b #$20
	TYX
	LDA.w $001F
	ORA.l DATA_C0AE16,X
	STA.w $001F
	REP.b #$20
	RTL

;--------------------------------------------------------------------

org $C42A1F
DATA_C42A1F:
	db $08,$00,$08,$00,$0C,$00,$10,$00
	db $18,$00,$08,$00,$0C,$00,$08,$00
	db $10,$00,$18,$00,$0C,$00,$08,$00
	db $10,$00,$18,$00,$20,$00,$20,$00
	db $20,$00

DATA_C42A41:
	db $08,$00,$08,$00,$08,$00,$08,$00
	db $08,$00,$18,$00,$18,$00,$18,$00
	db $18,$00,$18,$00,$20,$00,$28,$00
	db $28,$00,$28,$00,$28,$00,$38,$00
	db $48,$00

DATA_C42A63:
	db $10,$00,$10,$00,$20,$00,$20,$00
	db $30,$00,$10,$00,$18,$00,$10,$00
	db $20,$00,$30,$00,$18,$00,$10,$00
	db $20,$00,$30,$00,$40,$00,$40,$00
	db $40,$00

org $C42AA7
DATA_C42AA7:
	db $02,$00,$00,$00,$02,$00,$04,$00
	db $06,$00,$02,$00,$03,$00,$02,$00
	db $04,$00,$06,$00,$00,$00,$02,$00
	db $04,$00,$06,$00,$08,$00,$00,$00
	db $06,$00

DATA_C42AC9:
	db $01,$00,$00,$00,$01,$00,$01,$00
	db $01,$00,$01,$00,$01,$00,$01,$00
	db $02,$00,$02,$00,$00,$00,$01,$00
	db $02,$00,$02,$00,$02,$00,$00,$00
	db $02,$00

;--------------------------------------------------------------------

; Note: Something related to the OAM data used by the title screen characters?

org $C42AEB
DATA_C42AEB:
	db $0A,$00,$00,$00,$0A,$00,$0A,$00
	db $0A,$00,$18,$00,$18,$00,$18,$00
	db $10,$00,$10,$00,$00,$00,$28,$00
	db $20,$00,$20,$00,$20,$00,$00,$00
	db $41,$00

;--------------------------------------------------------------------

; Note: Something related to the OAM data used by the title screen characters?

DATA_C42B0D:
	dd DATA_C42B51
	dd DATA_C42B51
	dd DATA_C42B5D
	dd DATA_C42B73
	dd DATA_C42B89
	dd DATA_C42BA9
	dd DATA_C42BBF
	dd DATA_C42BE9
	dd DATA_C42BFF
	dd DATA_C42C29
	dd DATA_C42C67
	dd DATA_C42CA5
	dd DATA_C42CC5
	dd DATA_C42D03
	dd DATA_C42D5F
	dd DATA_C42DD9
	dd DATA_C42E7B

DATA_C42B51:
	db $01,$00,$F8,$00,$00,$F8,$80,$F8
	db $00,$40,$F8,$80

DATA_C42B5D:
	db $02,$00,$F8,$00,$00,$F4,$00,$F8
	db $02,$00,$04,$80,$F8,$00,$40,$FC
	db $00,$F8,$02,$40,$EC,$80

DATA_C42B73:
	db $02,$00,$F8,$00,$00,$F0,$00,$F8
	db $02,$00,$00,$80,$F8,$00,$40,$00
	db $00,$F8,$02,$40,$F0,$80

DATA_C42B89:
	db $03,$00,$F8,$00,$00,$E8,$00,$F8
	db $02,$00,$F8,$00,$F8,$04,$00,$08
	db $80,$F8,$00,$40,$08,$00,$F8,$02
	db $40,$F8,$00,$F8,$04,$40,$E8,$80

DATA_C42BA9:
	db $02,$01,$E8,$00,$00,$F8,$00,$F8
	db $02,$00,$F8,$80,$E8,$00,$40,$F8
	db $00,$F8,$02,$40,$F8,$80

DATA_C42BBF:
	db $04,$02,$E8,$00,$00,$F4,$00,$E8
	db $02,$00,$04,$00,$F8,$04,$00,$F4
	db $00,$F8,$06,$00,$04,$80,$E8,$00
	db $40,$FC,$00,$E8,$02,$40,$EC,$00
	db $F8,$04,$40,$FC,$00,$F8,$06,$40
	db $EC,$80

DATA_C42BE9:
	db $02,$01,$E8,$00,$00,$F8,$00,$F8
	db $02,$00,$F8,$80,$E8,$00,$40,$F8
	db $00,$F8,$02,$40,$F8,$80

DATA_C42BFF:
	db $04,$02,$E8,$00,$00,$F0,$00,$E8
	db $02,$00,$00,$00,$F8,$04,$00,$F0
	db $00,$F8,$06,$00,$00,$80,$E8,$00
	db $40,$00,$00,$E8,$02,$40,$F0,$00
	db $F8,$04,$40,$00,$00,$F8,$06,$40
	db $F0,$80

DATA_C42C29:
	db $06,$03,$E8,$00,$00,$E8,$00,$E8
	db $02,$00,$F8,$00,$E8,$04,$00,$08
	db $00,$F8,$06,$00,$E8,$00,$F8,$08
	db $00,$F8,$00,$F8,$0A,$00,$08,$80
	db $E8,$00,$40,$08,$00,$E8,$02,$40
	db $F8,$00,$E8,$04,$40,$E8,$00,$F8
	db $06,$40,$08,$00,$F8,$08,$40,$F8
	db $00,$F8,$0A,$40,$E8,$80

DATA_C42C67:
	db $06,$04,$E0,$00,$00,$F4,$00,$E0
	db $02,$00,$04,$00,$F0,$04,$00,$F4
	db $00,$F0,$06,$00,$04,$00,$00,$08
	db $00,$F4,$00,$00,$0A,$00,$04,$80
	db $E0,$00,$40,$FC,$00,$E0,$02,$40
	db $EC,$00,$F0,$04,$40,$FC,$00,$F0
	db $06,$40,$EC,$00,$00,$08,$40,$FC
	db $00,$00,$0A,$40,$EC,$80

DATA_C42CA5:
	db $03,$02,$D8,$00,$00,$F8,$00,$E8
	db $02,$00,$F8,$00,$F8,$04,$00,$F8
	db $80,$D8,$00,$40,$F8,$00,$E8,$02
	db $40,$F8,$00,$F8,$04,$40,$F8,$80

DATA_C42CC5:
	db $06,$04,$D8,$00,$00,$F0,$00,$D8
	db $02,$00,$00,$00,$E8,$04,$00,$F0
	db $00,$E8,$06,$00,$00,$00,$F8,$08
	db $00,$F0,$00,$F8,$0A,$00,$00,$80
	db $D8,$00,$40,$00,$00,$D8,$02,$40
	db $F0,$00,$E8,$04,$40,$00,$00,$E8
	db $06,$40,$F0,$00,$F8,$08,$40,$00
	db $00,$F8,$0A,$40,$F0,$80

DATA_C42D03:
	db $09,$06,$D8,$00,$00,$E8,$00,$D8
	db $02,$00,$F8,$00,$D8,$04,$00,$08
	db $00,$E8,$06,$00,$E8,$00,$E8,$08
	db $00,$F8,$00,$E8,$0A,$00,$08,$00
	db $F8,$0C,$00,$E8,$00,$F8,$0E,$00
	db $F8,$00,$F8,$10,$00,$08,$80,$D8
	db $00,$40,$08,$00,$D8,$02,$40,$F8
	db $00,$D8,$04,$40,$E8,$00,$E8,$06
	db $40,$08,$00,$E8,$08,$40,$F8,$00
	db $E8,$0A,$40,$E8,$00,$F8,$0C,$40
	db $08,$00,$F8,$0E,$40,$F8,$00,$F8
	db $10,$40,$E8,$80

DATA_C42D5F:
	db $0C,$08,$D8,$00,$00,$E0,$00,$D8
	db $02,$00,$F0,$00,$D8,$04,$00,$00
	db $00,$D8,$06,$00,$10,$00,$E8,$08
	db $00,$E0,$00,$E8,$0A,$00,$F0,$00
	db $E8,$0C,$00,$00,$00,$E8,$0E,$00
	db $10,$00,$F8,$10,$00,$E0,$00,$F8
	db $12,$00,$F0,$00,$F8,$14,$00,$00
	db $00,$F8,$16,$00,$10,$80,$D8,$00
	db $40,$10,$00,$D8,$02,$40,$00,$00
	db $D8,$04,$40,$F0,$00,$D8,$06,$40
	db $E0,$00,$E8,$08,$40,$10,$00,$E8
	db $0A,$40,$00,$00,$E8,$0C,$40,$F0
	db $00,$E8,$0E,$40,$E0,$00,$F8,$10
	db $40,$10,$00,$F8,$12,$40,$00,$00
	db $F8,$14,$40,$F0,$00,$F8,$16,$40
	db $E0,$80

DATA_C42DD9:
	db $10,$08,$C8,$00,$00,$E0,$00,$C8
	db $02,$00,$F0,$00,$C8,$04,$00,$00
	db $00,$C8,$06,$00,$10,$00,$D8,$08
	db $00,$E0,$00,$D8,$0A,$00,$F0,$00
	db $D8,$0C,$00,$00,$00,$D8,$0E,$00
	db $10,$00,$E8,$10,$00,$E0,$00,$E8
	db $12,$00,$F0,$00,$E8,$14,$00,$00
	db $00,$E8,$16,$00,$10,$00,$F8,$18
	db $00,$E0,$00,$F8,$1A,$00,$F0,$00
	db $F8,$1C,$00,$00,$00,$F8,$1E,$00
	db $10,$80,$C8,$00,$40,$10,$00,$C8
	db $02,$40,$00,$00,$C8,$04,$40,$F0
	db $00,$C8,$06,$40,$E0,$00,$D8,$08
	db $40,$10,$00,$D8,$0A,$40,$00,$00
	db $D8,$0C,$40,$F0,$00,$D8,$0E,$40
	db $E0,$00,$E8,$10,$40,$10,$00,$E8
	db $12,$40,$00,$00,$E8,$14,$40,$F0
	db $00,$E8,$16,$40,$E0,$00,$F8,$18
	db $40,$10,$00,$F8,$1A,$40,$00,$00
	db $F8,$1C,$40,$F0,$00,$F8,$1E,$40
	db $E0,$80

DATA_C42E7B:
	db $14,$08,$B8,$00,$00,$E0,$00,$B8
	db $02,$00,$F0,$00,$B8,$04,$00,$00
	db $00,$B8,$06,$00,$10,$00,$C8,$08
	db $00,$E0,$00,$C8,$0A,$00,$F0,$00
	db $C8,$0C,$00,$00,$00,$C8,$0E,$00
	db $10,$00,$D8,$10,$00,$E0,$00,$D8
	db $12,$00,$F0,$00,$D8,$14,$00,$00
	db $00,$D8,$16,$00,$10,$00,$E8,$18
	db $00,$E0,$00,$E8,$1A,$00,$F0,$00
	db $E8,$1C,$00,$00,$00,$E8,$1E,$00
	db $10,$00,$F8,$20,$00,$E0,$00,$F8
	db $22,$00,$F0,$00,$F8,$24,$00,$00
	db $00,$F8,$26,$00,$10,$80,$B8,$00
	db $40,$10,$00,$B8,$02,$40,$00,$00
	db $B8,$04,$40,$F0,$00,$B8,$06,$40
	db $E0,$00,$C8,$08,$40,$10,$00,$C8
	db $0A,$40,$00,$00,$C8,$0C,$40,$F0
	db $00,$C8,$0E,$40,$E0,$00,$D8,$10
	db $40,$10,$00,$D8,$12,$40,$00,$00
	db $D8,$14,$40,$F0,$00,$D8,$16,$40
	db $E0,$00,$E8,$18,$40,$10,$00,$E8
	db $1A,$40,$00,$00,$E8,$1C,$40,$F0
	db $00,$E8,$1E,$40,$E0,$00,$F8,$20
	db $40,$10,$00,$F8,$22,$40,$00,$00
	db $F8,$24,$40,$F0,$00,$F8,$26,$40
	db $E0,$80

;--------------------------------------------------------------------

; Note: Something map data related

org $C42F64
DATA_C42F64:
	dd $00D60000
	dd $00D62800
	dd $00D65000
	dd $00D68000
	dd $00D6A800
	dd $00D6D000
	dd $00D70000
	dd $00D72800
	dd $00D75000
	dd $00D78000

;--------------------------------------------------------------------

; Note: Something related to the name entry screen characters

DATA_C42F8C:
	dw $0000,$0020,$0040,$0060,$0080,$00A0,$00C0,$00E0
	dw $0200,$0220,$0240,$0260,$0280,$02A0,$02C0,$02E0
	dw $0400,$0420,$0440,$0460,$0480,$04A0,$04C0,$04E0
	dw $0600,$0620,$0640,$0660,$0680,$06A0,$06C0,$06E0
	dw $0800,$0820,$0840,$0860,$0880,$08A0,$08C0,$08E0
	dw $0A00,$0A20,$0A40,$0A60,$0A80,$0AA0,$0AC0,$0AE0
	dw $0C00,$0C20,$0C40,$0C60,$0C80,$0CA0,$0CC0,$0CE0
	dw $0E00,$0E20,$0E40,$0E60,$0E80,$0EA0,$0EC0,$0EE0
	dw $1000,$1020,$1040,$1060,$1080,$10A0,$10C0,$10E0
	dw $1200,$1220,$1240,$1260,$1280,$12A0,$12C0,$12E0
	dw $1400,$1420,$1440,$1460,$1480,$14A0,$14C0,$14E0

DATA_C4303C:
	dw $0000,$0002,$0004,$0006,$0008,$000A,$000C,$000E
	dw $0020,$0022,$0024,$0026,$0028,$002A,$002C,$002E
	dw $0040,$0042,$0044,$0046,$0048,$004A,$004C,$004E
	dw $0060,$0062,$0064,$0066,$0068,$006A,$006C,$006E
	dw $0080,$0082,$0084,$0086,$0088,$008A,$008C,$008E
	dw $00A0,$00A2,$00A4,$00A6,$00A8,$00AA,$00AC,$00AE
	dw $00C0,$00C2,$00C4,$00C6,$00C8,$00CA,$00CC,$00CE
	dw $00E0,$00E2,$00E4,$00E6,$00E8,$00EA,$00EC,$00EE
	dw $0100,$0102,$0104,$0106,$0108,$010A,$010C,$010E
	dw $0120,$0122,$0124,$0126,$0128,$012A,$012C,$012E
	dw $0140,$0142,$0144,$0146,$0148,$014A,$014C,$014E

;--------------------------------------------------------------------

; Note: Something player movement related. Putting an RTL here prevented Ness from moving after the intro ended.

label_C430EC:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDY.w #$0000
	STY.b $14
	JMP.w label_C432A5

label_C430FC:
	TYA
	ASL
	ASL
	TAX
	LDA.w #DATA_C3E0BC
	STA.b $0A
	LDA.w #DATA_C3E0BC>>16
	STA.b $0C
	TXA
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	LDY.b $14
	TYA
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $12
	CLC
	ADC.w #$4DE6
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$4DD6
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$4FAE
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$4F9E
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	LDA.b $12
	CLC
	ADC.w #$4FA6
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$4DDE
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	SEC
	LDA.w #$0000
	SBC.b $06
	STA.b $06
	LDA.w #$0000
	SBC.b $08
	STA.b $08
	LDA.b $12
	CLC
	ADC.w #$4F96
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$4DEE
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.w #DATA_C3E0F4
	STA.b $0A
	LDA.w #DATA_C3E0F4>>16
	STA.b $0C
	TXA
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $12
	CLC
	ADC.w #$4FAA
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$4FA2
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$4DE2
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$4DDA
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $0E
	STA.b $06
	LDA.b $10
	STA.b $08
	SEC
	LDA.w #$0000
	SBC.b $06
	STA.b $06
	LDA.w #$0000
	SBC.b $08
	STA.b $08
	LDA.b $12
	CLC
	ADC.w #$4FB2
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$4F9A
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$4DEA
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDA.b $12
	CLC
	ADC.w #$4DF2
	TAY
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	LDY.b $14
	INY
	STY.b $14
label_C432A5:
	CPY.w #$000E
	BCS.b label_C432AF
	BEQ.b label_C432AF
	JMP.w label_C430FC

label_C432AF:
	PLD
	RTL

;--------------------------------------------------------------------

org $C432B1
label_C432B1:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w #$0000
	STA.b $10
	BRA.b label_C432CA

label_C432C0:
	ASL
	TAX
	STZ.w $2BAA,X
	LDA.b $10
	INC
	STA.b $10

label_C432CA:
	CMP.w #$001E
	BCC.b label_C432C0
	LDX.w #$0000
	STX.b $0E
	BRA.b label_C43309

label_C432D6:
	LDA.w #$0000
	STA.b $10
	BRA.b label_C432FF

label_C432DD:
	STA.b $02
	LDX.b $0E
	TXA
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99DC
	CLC
	ADC.b $02
	TAX
	SEP.b #$20
	LDA.b #$00
	STA.w $0000,X
	REP.b #$20
	LDA.b $10
	INC
	STA.b $10

label_C432FF:
	CMP.w #$0007
	BCC.b label_C432DD
	LDX.b $0E
	INX
	STX.b $0E

label_C43309:
	CPX.w #$0006
	BCC.b label_C432D6
	SEP.b #$20
	STZ.w $9840
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C43317:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C4333D

label_C43326:
	ASL
	TAX
	LDA.b $0E
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	STA.w $4DC8,X
	LDA.b $0E
	INC
	STA.b $0E

label_C4333D:
	CMP.w #$0006
	BCC.b label_C43326
	PLD
	RTL

;--------------------------------------------------------------------

label_C43344:
	REP #$31
	STA $5D98
	RTL

;--------------------------------------------------------------------

label_C4334A:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $02
	ASL
	TAX
	LDA.w $9877
	LSR
	LSR
	LSR
	CLC
	ADC.l DATA_C3E230,X
	STA.b $10
	LDA.b $02
	CMP.w #$0004
	BNE.b label_C4337C
	LDA.w $987B
	INC
	LSR
	LSR
	LSR
	CLC
	ADC.l DATA_C3E240,X
	STA.b $04
	BRA.b label_C43389

label_C4337C:
	LDA.w $987B
	LSR
	LSR
	LSR
	CLC
	ADC.l DATA_C3E240,X
	STA.b $04
label_C43389:
	LDA.b $02
	STA.b $0E
	LDY.w $9889
	LDA.b $04
	ASL
	ASL
	ASL
	TAX
	LDA.b $10
	ASL
	ASL
	ASL
	JSL.l label_C05CD7
	AND.w #$0082
	CMP.w #$0082
	BNE.b label_C433BD
	LDA.b $02
	ASL
	TAX
	LDA.l DATA_C3E230,X
	CLC
	ADC.b $10
	STA.b $10
	LDA.b $04
	CLC
	ADC.l DATA_C3E240,X
	STA.b $04
label_C433BD:
	LDX.b $04
	LDA.b $10
	JSL.l label_C07477
	REP.b #$20
	AND.w #$00FF
	TAX
	CPX.w #$00FF
	BNE.b label_C433DF
	LDX.b $04
	LDA.b $10
	INC
	JSL.l label_C07477
	REP.b #$20
	AND.w #$00FF
	TAX
label_C433DF:
	CPX.w #$00FF
	BNE.b label_C433F3
	LDX.b $04
	LDA.b $10
	DEC
	JSL.l label_C07477
	REP.b #$20
	AND.w #$00FF
	TAX
label_C433F3:
	CPX.w #$00FF
	BEQ.b label_C4343C
	CPX.w #$0005
	BNE.b label_C4343C
	LDA.w #EB_DoorDestinationTable
	STA.b $06
	LDA.w #EB_DoorDestinationTable>>16
	STA.b $08
	LDA.w $5DBC
	AND.w #$7FFF
	CLC
	ADC.b $06
	STA.b $06
	LDA.w $5DBE
	STA.w $5DDC
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.w $5DDE
	LDA.b $08
	STA.w $5DE0
	LDA.w #$FFFE
	STA.w $5D62
label_C4343C:
	PLD
	RTL

;--------------------------------------------------------------------

org $C436D7
label_C436D7:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STX.b $12
	ASL
	TAX
	LDY.w $88E4,X
	STY.b $10
	TYA
	LDY.w #$0052
	JSL.l label_C08FF7
	PHA
	TAX
	LDY.w $865A,X
	LDX.b $12
	TXA
	JSL.l label_C09032
	ASL
	ASL
	PLX
	CLC
	ADC.w $8685,X
	TAX
	STX.b $0E
	LDA.w #$0000
	STA.b $12
	BRA.b label_C43720

label_C4370F:
	LDA.w #$0040
	LDX.b $0E
	STA.w $0000,X
	INX
	INX
	STX.b $0E
	LDA.b $12
	INC
	STA.b $12
label_C43720:
	LDY.b $10
	TYA
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $865A,X
	ASL
	STA.b $02
	LDA.b $12
	CMP.b $02
	BNE.b label_C4370F
	PLD
	RTL

;--------------------------------------------------------------------

label_C43739:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STA.b $02
	STA.b $12
	LDA.b $02
	ASL
	TAX
	LDA.w $88E4,X
	STA.b $04
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.w $865A,X
	LDA.w $8660,X
	JSL.l label_C09032
	ASL
	ASL
	CLC
	ADC.w $8685,X
	TAY
	STY.b $10
	LDX.w #$0000
	STX.b $0E
	BRA.b label_C43784

label_C43772:
	LDY.b $10
	LDA.w $0000,Y
	INY
	INY
	STY.b $10
	JSL.l label_C44AF7
	LDX.b $0E
	INX
	STX.b $0E
label_C43784:
	LDA.b $04
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $865A,X
	ASL
	STA.b $02
	LDX.b $0E
	TXA
	CMP.b $02
	BNE.b label_C43772
	LDA.b $12
	STA.b $02
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $8660,X
	TAX
	LDA.b $02
	JSL.l label_C436D7
	PLD
	RTL

;--------------------------------------------------------------------

label_C437B8:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	STA.b $18
	ASL
	TAX
	LDA.w $88E4,X
	STA.b $16
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $8685,X
	STA.b $14
	LDA.w $865A,X
	ASL
	ASL
	STA.b $02
	LDA.b $14
	CLC
	ADC.b $02
	STA.b $04
	LDA.b $14
	STA.b $02
	LDX.b $02
	STX.b $12
	TAY
	STY.b $14
	LDX.w #$0000
	STX.b $10
	BRA.b label_C4380A

label_C437F8:
	LDY.b $14
	LDA.w $0000,Y
	INY
	INY
	STY.b $14
	JSL.l label_C44AF7
	LDX.b $10
	INX
	STX.b $10
label_C4380A:
	LDA.b $16
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $865A,X
	ASL
	STA.b $02
	LDX.b $10
	TXA
	CMP.b $02
	BNE.b label_C437F8
	LDX.w #$0000
	STX.b $14
	BRA.b label_C43845

label_C43828:
	LDX.b $04
	LDA.w $0000,X
	LDX.b $12
	STX.b $02
	STA.w $0000,X
	INC.b $04
	INC.b $04
	INC.b $02
	INC.b $02
	LDA.b $02
	STA.b $12
	LDX.b $14
	INX
	STX.b $14
label_C43845:
	LDA.b $16
	LDY.w #$0052
	JSL.l label_C08FF7
	TAY
	LDA.w $865C,Y
	STA.b $0E
	LDA.w $865A,Y
	TAY
	LDA.b $0E
	DEC
	DEC
	JSL.l label_C09032
	STA.b $02
	TXA
	CMP.b $02
	BNE.b label_C43828
	LDA.b $0E
	LSR
	TAX
	DEX
	LDA.b $18
	JSL.l label_C436D7
	PLD
	RTL

;--------------------------------------------------------------------

label_C43874:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STY.b $02
	TXY
	STY.b $10
	STA.b $0E
	JSL.l label_C43CAA
	LDA.b $0E
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDY.b $10
	TYA
	STA.w $865E,X
	LDA.b $02
	STA.w $8660,X
	PLD
	RTL

;--------------------------------------------------------------------

label_C438A5:
	REP.b #$31
	TXY
	TAX
	LDA.w $8958
	JSL.l label_C43874
	RTL

;--------------------------------------------------------------------

label_C438B1:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w $8958
	CMP.w #$FFFF
	BEQ.b label_C43913
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAY
	STY.b $10
	JSL.l label_C45E96
	LDY.b $10
	LDA.w $0015,Y
	BEQ.b label_C438E6
	JSL.l label_C45E96
label_C438E6:
	LDY.b $10
	TYA
	CLC
	ADC.w #$0010
	TAX
	LDA.w $0000,X
	STA.b $0E
	LDA.w $000C,Y
	LSR
	DEC
	STA.b $02
	LDA.b $0E
	CMP.b $02
	BEQ.b label_C43906
	INC
	STA.w $0000,X
	BRA.b label_C4390D

label_C43906:
	LDA.w $8958
	JSL.l label_C437B8
label_C4390D:
	LDY.b $10
	TYX
	STZ.w $000E,X
label_C43913:
	PLD
	RTL

;--------------------------------------------------------------------

DATA_C43915:
	db $01,$01,$01,$01,$01,$01,$01,$01
	db $01,$01,$01,$01,$01,$01,$01,$01
	db $01,$01,$01,$01,$01,$01,$01,$01
	db $01,$01,$01,$01,$01,$01,$01,$01
	db $01,$01,$01,$01,$01,$01,$01,$01
	db $01,$01,$01,$01,$01,$01,$01,$01
	db $01,$01,$01,$01,$01,$01,$01,$01
	db $01,$01,$01,$01,$01,$01,$01,$01
	db $01,$01,$01,$01,$01,$01,$01,$01
	db $01,$01,$01,$01,$00,$00,$00,$01
	db $01,$01,$01,$01,$01,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$01
	db $01,$01,$01,$01,$01,$01,$01,$01
	db $01,$01,$00,$00,$00,$00,$00,$00
	db $01,$01,$01,$01,$01,$01,$01,$01
	db $01,$01,$00,$00,$00,$00,$00,$00
	db $01,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $01,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00

;--------------------------------------------------------------------

; Note: Something related to selecting an option in a text box.

label_C43B15:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEC
	TCD
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAX
	STX.b $12
	LDA.w $0013,X
	STA.b $10
	LDA.w $000A,X
	STA.b $04
	LDY.b $04
	LDA.w $0010,X
	JSL.l label_C09032
	ASL
	ASL
	CLC
	ADC.w $0035,X
	TAY
	LDA.b $04
	DEC
	STA.b $02
	STA.b $0E
	BRA.b label_C43B5F

label_C43B56:
	LDA.b $0E
	STA.b $02
	DEC
	STA.b $02
	STA.b $0E
label_C43B5F:
	LDA.b $02
	ASL
	STA.b $02
	TYA
	CLC
	ADC.b $02
	TAX
	LDA.w $0000,X
	CMP.w #$0040
	BEQ.b label_C43B56
	LDX.b $12
	LDA.w $000E,X
	STA.b $12
	ASL
	STA.b $02
	TYA
	CLC
	ADC.b $02
	TAX
	LDA.b $12
	STA.b $12
	BRA label_C43BAD

label_C43B86:
	LDA.w $0000,X
	AND.w #$03FF
	ORA.b $10
	STA.w $0000,X
	LDA.b $04
	ASL
	STA.b $02
	TXA
	CLC
	ADC.b $02
	TAY
	LDA.w $0000,Y
	AND.w #$03FF
	ORA.b $10
	STA.w $0000,Y
	INX
	INX
	LDA.b $12
	INC
	STA.b $12
label_C43BAD:
	LDY.b $0E
	STY.b $02
	INC.b $02
	CMP.b $02
	BCC.b label_C43B86
	PLD
	RTL

;--------------------------------------------------------------------

label_C43BB9:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	STX.b $18
	STA.b $16
	LDA.b $28
	STA.b $06
	LDA.b $2A
	STA.b $08
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	CMP.w #$FFFF
	BNE.b label_C43BDF
	JMP.w label_C43CA6

label_C43BDF:
	LDA.w $8958
	CMP.w #$0018
	BEQ.b label_C43C02
	LDA.w $8958
	CMP.w #$0019
	BEQ.b label_C43C02
	LDA.w $8958
	CMP.w #$0014
	BEQ.b label_C43C02
	LDA.w $8958
	CMP.w #$0024
	BEQ.b label_C43C02
	JMP.w label_C43CA6

label_C43C02:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	STA.b $02
	STA.b $14
	LDX.b $02
	LDA.w $0013,X
	STA.b $12
	LDX.b $02
	LDA.w $000E,X
	STA.b $10
	LDX.b $02
	LDA.w $0010,X
	STA.b $0E
	LDA.b $10
	ASL
	PHA
	LDX.b $02
	LDY.w $000A,X
	LDA.b $0E
	JSL.l label_C09032
	ASL
	ASL
	LDX.b $02
	CLC
	ADC.w $0035,X
	PLY
	STY.b $02
	CLC
	ADC.b $02
	STA.b $04
	BRA.b label_C43C8D

label_C43C4F:
	LDX.b $04
	LDA.w $0000,X
	CMP.w #$0040
	BEQ.b label_C43C98
	LDA.b $18
	BEQ.b label_C43C71
	LDY.b $12
	LDA.b $14
	STA.b $02
	LDX.b $02
	LDA.w $000A,X
	TAX
	LDA.b $04
	JSL.l label_EF00E6
	BRA.b label_C43C83

label_C43C71:
	LDY.b $12
	LDA.b $14
	STA.b $02
	LDX.b $02
	LDA.w $000A,X
	TAX
	LDA.b $04
	JSL.l label_EF00BB
label_C43C83:
	INC.b $10
	INC.b $04
	INC.b $04
	INC.b $06
	DEC.b $16
label_C43C8D:
	LDA.b [$06]
	AND.w #$00FF
	BEQ.b label_C43C98
	LDA.b $16
	BNE.b label_C43C4F
label_C43C98:
	LDA.b $10
	LDX.b $14
	STX.b $02
	STA.w $000E,X
	SEP.b #$20
	STZ.w $9622
label_C43CA6:
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C43CAA:
	REP.b #$31
	LDA.w $9E25
	INC
	STA.w $9E25
	CMP.w #$0033
	BCC.b label_C43CC2
	BEQ.b label_C43CC2
	STZ.w $9E25
	STZ.w $9E23
	BRA.b label_C43CC8

label_C43CC2:
	ASL
	ASL
	ASL
	STA.w $9E23
label_C43CC8:
	STZ.w $9654
	LDA.w $9E23
	STA.w $9652
	RTL

;--------------------------------------------------------------------

label_C43CD2:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEF
	TCD
	PLA
	STY.b $02
	TXY
	STA.b $04
	LDX.b $02
	TYA
	JSL.l label_C10C72
	LDX.b $04
	LDA.w $002C,X
	AND.w #$00FF
	BEQ.b label_C43D1B
	AND.w #$00FF
	CLC
	ADC.w $9E23
	STA.w $9E23
	LDA.w $9E25
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$3492
	STA.b $0F
	SEP.b #$20
	LDA.b #$FF
	STA.b $0E
	LDX.w #$0020
	REP.b #$20
	LDA.b $0F
	JSL.l label_C08EFC
label_C43D1B:
	SEP.b #$20
	STZ.w $5E79
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C43D24:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEF
	TCD
	PLA
	JSL.l label_C10C72
	LDA.w $5E72
	AND.w #$00FF
	BEQ.b label_C43D71
	LDA.w $5E72
	AND.w #$00FF
	CLC
	ADC.w $9E23
	STA.w $9E23
	LDA.w $9E25
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$3492
	STA.b $0F
	SEP.b #$20
	LDA.b #$FF
	STA.b $0E
	LDX.w #$0020
	REP.b #$20
	LDA.b $0F
	JSL.l label_C08EFC
	SEP.b #$20
	LDA.w $5E72
	STA.w $5E73
	STZ.w $5E72
label_C43D71:
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C43D75:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	SEP.b #$20
	AND.b #$07
	STA.w $5E72
	REP.b #$20
	LDA.b $0E
	LSR
	LSR
	LSR
	JSL.l label_C43D24
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to deleting a file

label_C43D95:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $10
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	TAX
	LDA.w $865E,X
	ASL
	ASL
	ASL
	STA.b $02
	LDA.b $10
	CLC
	ADC.b $02
	STA.b $10
	LDA.w $5E73
	AND.w #$00FF
	STA.b $02
	LDA.b $10
	CLC
	ADC.b $02
	STA.b $0E
	LDA.w $8660,X
	TAX
	LDA.b $0E
	JSL.l label_C43D75
	PLD
	RTL

;--------------------------------------------------------------------

org $C43DDB
label_C43DDB:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $02
	CLC
	ADC.w #$0008
	STA.b $04
	LDA.b $02
	CLC
	ADC.w #$000A
	TAY
	STY.b $10
	LDA.w $0000,Y
	TAX
	STX.b $0E
	LDX.b $04
	LDA.w $0000,X
	LDX.b $0E
	JSL.l label_C10C72
	LDA.w #$002F
	JSL.l label_C43F77
	JSL.l label_C43CAA
	LDX.b $02
	LDA.w $002C,X
	AND.w #$00FF
	BEQ.b label_C43E2F
	LDY.b $10
	LDA.w $0000,Y
	TAY
	LDX.b $04
	LDA.w $0000,X
	TAX
	INX
	LDA.b $02
	JSL.l label_C43CD2
label_C43E2F:
	PLD
	RTL

;--------------------------------------------------------------------

label_C43E31:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	TAY
	STY.b $14
	LDA.b $24
	STA.b $06
	LDA.b $26
	STA.b $08
	LDX.w #$0000
	STX.b $12
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	STA.b $02
	STA.b $10
	JMP.w label_C43EE5

label_C43E65:
	DEY
	STY.b $14
	AND.w #$00FF
	SEC
	SBC.w #$0050
	AND.w #$007F
	STA.b $0E
	INC.b $06
	LDA.w $B4CE
	AND.w #$00FF
	BEQ.b label_C43E98
	LDA.l DATA_C3F054
	STA.b $0A
	LDA.l DATA_C3F054+$02
	STA.b $0C
	LDA.b $0E
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	BRA.b label_C43ECF

label_C43E98:
	LDA.w #DATA_C3F054
	STA.b $0A
	LDA.w #DATA_C3F054>>16
	STA.b $0C
	LDA.b $10
	STA.b $02
	LDX.b $02
	LDA.w $0015,X
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $0A
	STY.b $0C
	LDA.b $0E
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
label_C43ECF:
	STA.b $02
	LDA.w $5E6D
	AND.w #$00FF
	CLC
	ADC.b $02
	STA.b $04
	LDX.b $12
	TXA
	CLC
	ADC.b $04
	TAX
	STX.b $12
label_C43EE5:
	LDA.b [$06]
	AND.w #$00FF
	BEQ.b label_C43EF3
	LDY.b $14
	BEQ.b label_C43EF3
	JMP.w label_C43E65

label_C43EF3:
	LDX.b $12
	TXA
	PLD
	RTL

;--------------------------------------------------------------------

label_C43EF8:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	STA.b $16
	LDA.b $26
	STA.b $06
	LDA.b $28
	STA.b $08
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAX
	STX.b $14
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $16
	JSL.l label_C43E31
	STA.b $02
	LDX.b $14
	LDA.w $000A,X
	ASL
	ASL
	ASL
	SEC
	SBC.b $02
	LSR
	STA.b $12
	LDA.w $0010,X
	TAX
	LDA.b $12
	JSL.l label_C43D75
	SEP.b #$20
	STZ.w $5E74
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C43F53:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C43F70

label_C43F62:
	ASL
	TAX
	LDA.l DATA_C20958,X
	STA.w $1AD6,X
	LDA.b $0E
	INC
	STA.b $0E
label_C43F70:
	CMP.w #$0020
	BCC.b label_C43F62
	PLD
	RTL

;--------------------------------------------------------------------

label_C43F77:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $02
	LDA.w $8958
	CMP.w #$FFFF
	BNE.b label_C43F8E
	JMP.w label_C44068

label_C43F8E:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAX
	CLC
	ADC.w #$000A
	TAY
	STY.b $10
	LDA.w $000E,X
	ASL
	STA.b $04
	LDA.w $0000,Y
	TAY
	LDA.w $0010,X
	JSL.l label_C09032
	ASL
	ASL
	CLC
	ADC.w $0035,X
	CLC
	ADC.b $04
	TAX
	STX.b $0E
	LDA.w $0000,X
	JSL.l label_C44E4D
	LDY.b $10
	LDA.w $0000,Y
	ASL
	STA.b $04
	LDX.b $0E
	TXA
	CLC
	ADC.b $04
	TAX
	LDA.w $0000,X
	JSL.l label_C44E4D
	LDA.b $02
	CMP.w #$002F
	BNE.b label_C43FEF
	SEP.b #$20
	STZ.w $5E75
label_C43FEF:
	REP.b #$20
	LDA.b $02
	JSL.l label_C10C80
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	CMP.w $88E2
	BEQ.b label_C4400B
	SEP.b #$20
	LDA.b #$01
	STA.w $9623
label_C4400B:
	REP.b #$20
	LDA.w $964F
	CMP.w #$0002
	BNE.b label_C4401A
	LDX.w #$0001
	BRA.b label_C44032

label_C4401A:
	LDA.w $964F
	CMP.w #$0003
	BNE.b label_C44027
	LDX.w #$0000
	BRA.b label_C44032

label_C44027:
	LDX.w #$0000
	LDA.w $964D
	BNE.b label_C44032
	LDX.w #$0001
label_C44032:
	CPX.w #$0000
	BEQ.b label_C4404D
	LDA.w $9622
	AND.w #$00FF
	BNE.b label_C4404D
	LDA.b $02
	CMP.w #$0020
	BEQ.b label_C4404D
	LDA.w #$0007
	JSL.l label_C0ABE0
label_C4404D:
	LDA.w $9622
	AND.w #$00FF
	BNE.b label_C44068
	LDX.w $9625
	INX
	STX.b $10
	BRA.b label_C44066

label_C4405D:
	JSL.l label_C12DD5
	LDX.b $10
	DEX
	STX.b $10
label_C44066:
	BNE.b label_C4405D
label_C44068:
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to typing a letter on the name entry screen.

label_C4406A:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF2
	TCD
	PLA
	STA.b $02
	LDA.w #DATA_EFA6D3
	STA.b $0A
	LDA.w #DATA_EFA6D3>>16
	STA.b $0C
	TYA
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	TXA
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ADC.b $04
	ASL
	CLC
	ADC.b $02
	TAX
	LDA.l EB_NameEntryLetterCharacterTable,X
	AND.w #$00FF
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to selecting "Nope" on the name entry confirmation screen

label_C440B5:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STX.b $04
	STA.b $02
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0018
	REP.b #$20
	LDA.w #$1B6E
	JSL.l label_C08EFC
	LDY.w #$0000
	STY.b $10
	BRA.b label_C44132

label_C440DA:
	LDA.b $0F
	AND.w #$00FF
	SEC
	SBC.w #$0050
	AND.w #$007F
	TAX
	SEP.b #$20
	LDA.b $0F
	STA.w $1B86,Y
	REP.b #$20
	TXA
	SEP.b #$20
	STA.w $1B56,Y
	REP.b #$20
	LDA.l DATA_C3F054
	STA.b $06
	LDA.l DATA_C3F054+$02
	STA.b $08
	TXA
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	TAX
	SEP.b #$20
	CLC
	ADC.w $5E6D
	STA.w $1B6E,Y
	LDX.b $02
	REP.b #$20
	LDA.w $0000,X
	AND.w #$00FF
	TAX
	LDA.w #$0000
	JSL.l label_C44E61
	LDY.b $10
	INY
	STY.b $10
	INC.b $02
label_C44132:
	LDX.b $02
	SEP.b #$20
	LDA.w $0000,X
	STA.b $0F
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C44147
	TYA
	CMP.b $04
	BNE.b label_C440DA
label_C44147:
	STY.w $9662
	TYA
	CMP.b $04
	BCS.b label_C441B5
	SEP.b #$20
	LDA.b #$20
	STA.w $1B56,Y
	LDA.b #$06
	STA.w $1B6E,Y
	LDX.w #$0070
	REP.b #$20
	LDA.w #$0000
	JSL.l label_C44E61
	LDY.b $10
	TYX
	SEP.b #$20
	STZ.w $1B86,X
	INY
	STY.b $10
	REP.b #$20
	LDA.b $04
	STY.b $04
	SEC
	SBC.b $04
	STA.b $02
	CLC
	SBC.w #$0000
	BVC.b label_C44187
	BPL.b label_C441B5
	BRA.b label_C44189

label_C44187:
	BMI.b label_C441B5
label_C44189:
	BRA.b label_C441B1

label_C4418B:
	SEP.b #$20
	LDA.b #$03
	STA.w $1B56,Y
	LDX.w #$0053
	REP.b #$20
	LDA.w #$0000
	JSL.l label_C44E61
	SEP.b #$20
	LDA.b #$03
	LDY.b $10
	STA.w $1B6E,Y
	REP.b #$20
	LDA.b $02
	DEC
	STA.b $02
	INY
	STY.b $10
label_C441B1:
	LDA.b $02
	BNE.b label_C4418B
label_C441B5:
	PLD
	RTL

;--------------------------------------------------------------------

label_C441B7:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEF
	TCD
	PLA
	STA.b $04
	SEP.b #$20
	LDA.b #$FF
	STA.b $0E
	LDX.w #$0680
	REP.b #$20
	LDA.w #$3492
	JSL.l label_C08EFC
	LDA.w #$0003
	STA.b $02
	STZ.w $9662
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0018
	REP.b #$20
	LDA.w #$1B86
	JSL.l label_C08EFC
	LDX.w #$0070
	LDA.w #$0000
	JSL.l label_C44E61
	SEP.b #$20
	LDA.b #$20
	STA.w $1B56
	LDY.w #$0001
	STY.b $0F
	BRA.b label_C44241

label_C44205:
	LDA.b $02
	SEP.b #$20
	STA.w $1B56,Y
	REP.b #$20
	LDA.l DATA_C3F054
	STA.b $06
	LDA.l DATA_C3F054+$02
	STA.b $08
	LDA.b $02
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	TAX
	SEP.b #$20
	CLC
	ADC.w $5E6D
	STA.w $1B6E,Y
	LDX.w #$0053
	REP.b #$20
	LDA.w #$0000
	JSL.l label_C44E61
	LDY.b $0F
	INY
	STY.b $0F
label_C44241:
	REP.b #$20
	TYA
	CMP.b $04
	BCC.b label_C44205
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to backing out of the name entry screen

org $C4424A
label_C4424A:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	CMP.w #$0070
	BNE.b label_C44265
	LDX.w $9662
	SEP.b #$20
	STZ.w $1B86,X
	BRA.b label_C4426D

label_C44265:
	SEP.b #$20
	LDX.w $9662
	STA.w $1B86,X
label_C4426D:
	REP.b #$20
	LDA.b $0E
	SEC
	SBC.w #$0050
	AND.w #$007F
	STA.b $0E
	SEP.b #$20
	LDX.w $9662
	STA.w $1B56,X
	REP.b #$20
	LDA.l DATA_C3F054
	STA.b $06
	LDA.l DATA_C3F054+$02
	STA.b $08
	LDA.b $0E
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	SEP.b #$20
	CLC
	ADC.w $5E6D
	LDX.w $9662
	STA.w $1B6E,X
	REP.b #$20
	PLD
	RTS

label_C442AC:						; Note: Main entry
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE2
	TCD
	PLA
	STY.b $1C
	STX.b $1A
	JSL.l label_C08756
	STZ.w $9E25
	STZ.w $9E23
	SEP.b #$20
	LDA.b #$FF
	STA.b $0E
	LDX.w #$0340
	REP.b #$20
	LDA.w #$3492
	JSL.l label_C08EFC
	STZ.w $9654
	STZ.w $9652
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	STA.b $18
	LDA.b $1C
	CMP.w #$FFFF
	BNE.b label_C4431B
	LDA.w $9662
	BNE.b label_C44303
	LDA.w #$0001
	JMP.w label_C444F9

label_C44303:
	LDA.w $9662
	CMP.b $1A
	BCS.b label_C44310
	LDA.w #$0053
	JSR.w label_C4424A
label_C44310:
	DEC.w $9662
	LDA.w #$0070
	JSR.w label_C4424A
	BRA.b label_C4433F

label_C4431B:
	LDA.b $1A
	DEC
	CMP.w $9662
	BCS.b label_C44329
	LDA.w #$0000
	JMP.w label_C444F9

label_C44329:
	LDA.b $1C
	JSR.w label_C4424A
	LDA.w $9662
	INC
	STA.w $9662
	CMP.b $1A
	BCS.b label_C4433F
	LDA.w #$0070
	JSR.w label_C4424A
label_C4433F:
	LDA.w #DATA_C3F054
	STA.b $06
	LDA.w #DATA_C3F054>>16
	STA.b $08
	LDY.w #$000A
	LDA.b [$06],Y
	STA.b $04
	LDX.b $18
	STZ.w $000E,X
	LDY.w #$0008
	LDA.b [$06],Y
	STA.b $16
	LDA.w #$0000
	STA.b $02
	BRA.b label_C443C8

label_C44363:
	LDA.l DATA_C3F054+$04
	STA.b $06
	LDA.l DATA_C3F054+$06
	STA.b $08
	LDX.b $02
	LDA.w $1B56,X
	AND.w #$00FF
	TAY
	LDA.b $16
	JSL.l label_C09032
	CLC
	ADC.b $06
	STA.b $06
	LDX.b $02
	LDA.w $1B6E,X
	AND.w #$00FF
	TAY
	STY.b $14
	BRA.b label_C443B2

label_C44390:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.b $04
	LDA.w #$0008
	JSL.l label_C44B3A
	LDY.b $14
	TYA
	SEC
	SBC.w #$0008
	TAY
	STY.b $14
	LDA.b $04
	CLC
	ADC.b $06
	STA.b $06
label_C443B2:
	CPY.w #$0008
	BCS.b label_C44390
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.b $04
	TYA
	JSL.l label_C44B3A
	INC.b $02
label_C443C8:
	LDA.b $02
	CMP.b $1A
	BCC.b label_C44363
	LDX.b $18
	STZ.w $000E,X
	LDA.w #$7700
	STA.b $04
	LDY.w #$000A
	LDA.b ($18),Y
	STA.b $12
	LDA.w #$0000
	STA.b $02
	STA.b $14
	BRA.b label_C44452

label_C443E8:
	LDA.b $14
	STA.b $02
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $18
	CLC
	ADC.w #$7E3492
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.b $04
	LDX.w #$0010
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.b $18
	CLC
	ADC.w #$7E34A2
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $04
	CLC
	ADC.w #$0008
	TAY
	LDX.w #$0010
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.b $04
	CLC
	ADC.w #$0010
	STA.b $04
	INC.b $02
	LDA.b $02
	STA.b $14
label_C44452:
	LDA.b $02
	PHA
	LDA.b $12
	STA.b $02
	INC.b $02
	PLA
	CMP.b $02
	BCS.b label_C44465
	BEQ.b label_C44465
	JMP.w label_C443E8

label_C44465:
	LDA.w #$0001
	STA.w $9E2B
	LDY.w #$0000
	STY.b $1A
	BRA.b label_C44482

label_C44472:
	TYA
	ASL
	CLC
	ADC.w #$02E0
	TAX
	INX
	JSR.w label_C44C8C
	LDY.b $1A
	INY
	STY.b $1A
label_C44482:
	LDA.b $12
	STA.b $02
	INC.b $02
	TYA
	CMP.b $02
	BCC.b label_C44472
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	CMP.w $88E2
	BEQ.b label_C444A1
	SEP.b #$20
	LDA.b #$01
	STA.w $9623
label_C444A1:
	REP.b #$20
	LDA.w $964F
	CMP.w #$0002
	BNE.b label_C444B0
	LDX.w #$0001
	BRA.b label_C444C8

label_C444B0:
	LDA.w $964F
	CMP.w #$0003
	BNE.b label_C444BD
	LDX.w #$0000
	BRA.b label_C444C8

label_C444BD:
	LDX.w #$0000
	LDA.w $964D
	BNE.b label_C444C8
	LDX.w #$0001
label_C444C8:
	CPX.w #$0000
	BEQ.b label_C444E3
	LDA.w $9622
	AND.w #$00FF
	BNE.b label_C444E3
	LDA.b $1C
	CMP.w #$0020
	BEQ.b label_C444E3
	LDA.w #$0007
	JSL.l label_C0ABE0
label_C444E3:
	LDX.w $9625
	INX
	STX.b $1C
	BRA.b label_C444F4

label_C444EB:
	JSL.l label_C12DD5
	LDX.b $1C
	DEX
	STX.b $1C
label_C444F4:
	BNE.b label_C444EB
	LDA.w #$0000
label_C444F9:
	PLD
	RTL

;--------------------------------------------------------------------

org $C445E1
label_C445E1:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	TAY
	LDA.b $28
	STA.b $0A
	LDA.b $2A
	STA.b $0C
	LDX.w #$0000
	STX.b $18
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.b $06
	STA.b $14
	LDA.b $08
	STA.b $16
	LDA.w $8958
	CMP.w #$FFFF
	BNE.b label_C44616
	JMP.w label_C447F7

label_C44616:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAY
	STY.b $12
label_C4462C:
	LDA.b [$0A]
	AND.w #$00FF
	BEQ.b label_C4463A
	AND.w #$00FF
	INC.b $0A
	BRA.b label_C44651

label_C4463A:
	LDA.b $14
	STA.b $06
	LDA.b $16
	STA.b $08
	LDA.b [$06]
	AND.w #$00FF
	INC.b $06
	LDX.b $06
	STX.b $14
	LDX.b $08
	STX.b $16
label_C44651:
	CMP.w #$0015
	BEQ.b label_C44666
	CMP.w #$0016
	BEQ.b label_C446AE
	CMP.w #$0017
	BNE.b label_C44663
	JMP.w label_C446F5

label_C44663:
	JMP.w label_C4473A

label_C44666:
	LDA.b $14
	STA.b $06
	LDA.b $16
	STA.b $08
	LDA.b [$06]
	AND.w #$00FF
	ASL
	ASL
	PHA
	LDA.w #EB_TextMacroBank1Ptrs
	STA.b $06
	LDA.w #EB_TextMacroBank1Ptrs>>16
	STA.b $08
	PLA
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $0A
	STY.b $0C
	LDA.b $14
	STA.b $06
	LDA.b $16
	STA.b $08
	INC.b $06
	LDA.b $06
	STA.b $14
	LDA.b $08
	STA.b $16
	LDA.b [$0A]
	AND.w #$00FF
	INC.b $0A
	JMP.w label_C4473A

label_C446AE:
	LDA.b $14
	STA.b $06
	LDA.b $16
	STA.b $08
	LDA.b [$06]
	AND.w #$00FF
	ASL
	ASL
	PHA
	LDA.w #EB_TextMacroBank2Ptrs
	STA.b $06
	LDA.w #EB_TextMacroBank2Ptrs>>16
	STA.b $08
	PLA
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $0A
	STY.b $0C
	LDA.b $14
	STA.b $06
	LDA.b $16
	STA.b $08
	INC.b $06
	LDA.b $06
	STA.b $14
	LDA.b $08
	STA.b $16
	LDA.b [$0A]
	AND.w #$00FF
	INC.b $0A
	BRA.b label_C4473A

label_C446F5:
	LDA.b $14
	STA.b $06
	LDA.b $16
	STA.b $08
	LDA.b [$06]
	AND.w #$00FF
	ASL
	ASL
	PHA
	LDA.w #EB_TextMacroBank3Ptrs
	STA.b $06
	LDA.w #EB_TextMacroBank3Ptrs>>16
	STA.b $08
	PLA
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $0A
	STY.b $0C
	LDA.b $14
	STA.b $06
	LDA.b $16
	STA.b $08
	INC.b $06
	LDA.b $06
	STA.b $14
	LDA.b $08
	STA.b $16
	LDA.b [$0A]
	AND.w #$00FF
	INC.b $0A
label_C4473A:
	CMP.w #$0050
	BEQ.b label_C447AE
	CMP.w #$0020
	BCC.b label_C447AE
	INC.w $9660
	CMP.w #$002F
	BNE.b label_C44751
	LDA.w #$0008
	BRA.b label_C447A0

label_C44751:
	SEC
	SBC.w #$0050
	AND.w #$007F
	STA.b $02
	LDY.b $12
	LDA.w $0015,Y
	STA.b $10
	LDA.w #DATA_C3F054
	STA.b $06
	LDA.w #DATA_C3F054>>16
	STA.b $08
	LDA.b $10
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.b $02
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	STA.b $10
	LDA.w $5E6D
	AND.w #$00FF
	STA.b $02
	LDA.b $10
	CLC
	ADC.b $02
label_C447A0:
	STA.b $02
	LDX.b $18
	TXA
	CLC
	ADC.b $02
	TAX
	STX.b $18
	JMP.w label_C4462C

label_C447AE:
	LDY.b $12
	LDA.w $000E,Y
	STA.b $0E
	BEQ.b label_C447D2
	LDA.w $9E23
	AND.w #$0007
	STA.b $04
	LDA.b $0E
	DEC
	ASL
	ASL
	ASL
	CLC
	ADC.b $04
	STA.b $02
	LDX.b $18
	TXA
	CLC
	ADC.b $02
	BRA.b label_C447E0

label_C447D2:
	LDA.w $9E23
	AND.w #$0007
	STA.b $02
	LDX.b $18
	TXA
	CLC
	ADC.b $02
label_C447E0:
	STA.b $02
	LDA.w $000A,Y
	ASL
	ASL
	ASL
	CMP.b $02
	BCS.b label_C447F7
	JSL.l label_C10C79
	SEP.b #$20
	LDA.b #$01
	STA.w $5E75
label_C447F7:
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

org $C44963
label_C44963:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	CMP.w #$0001
	BEQ.b label_C44982
	CMP.w #$0000
	BEQ.b label_C4499A
	CMP.w #$0002
	BNE.b label_C4497F
	JMP.w label_C44A2D

label_C4497F:
	JMP.w label_C44AD5

label_C44982:
	LDA.w #$2000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$7000
	LDX.w #$1800
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
label_C4499A:
	LDA.w #$0000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$6000
	LDX.w #$0450
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #$04F0
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$6278
	LDX.w #$0060
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #$05F0
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$62F8
	LDX.w #$00B0
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #$0700
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$6380
	LDX.w #$00A0
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #$0800
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$6400
	LDX.w #$0010
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #$0900
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$6480
	LDX.w #$0010
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	JMP.w label_C44AD5

label_C44A2D:
	LDA.w #$0000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$6000
	LDX.w #$0450
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C085B7
	LDA.w #$04F0
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$6278
	LDX.w #$0060
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C085B7
	LDA.w #$05F0
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$62F8
	LDX.w #$00B0
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C085B7
	LDA.w #$0700
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$6380
	LDX.w #$00A0
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C085B7
	LDA.w #$0800
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$6400
	LDX.w #$0010
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C085B7
	LDA.w #$0900
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$6480
	LDX.w #$0010
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C085B7
	LDA.w #$2000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$7000
	LDX.w #$1800
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C085B7
label_C44AD5:
	PLD
	RTL

;--------------------------------------------------------------------

DATA_C44AD7:
	dw $FFFE,$FFFD,$FFFB,$FFF7
	dw $FFEF,$FFDF,$FFBF,$FF7F
	dw $FEFF,$FDFF,$FBFF,$F7FF
	dw $EFFF,$DFFF,$BFFF,$7FFF

label_C44AF7:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	AND.w #$03FF
	STA.b $10
	TAX
	LDA.l DATA_C43915,X
	AND.w #$00FF
	BNE.b label_C44B38
	LDA.b $10
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA.b $10
	AND.w #$000F
	STA.b $10
	TXA
	ASL
	CLC
	ADC.w #$1AD6
	TAX
	STX.b $0E
	LDA.b $10
	ASL
	PHA
	LDA.w $0000,X
	PLX
	AND.l DATA_C44AD7,X
	LDX.b $0E
	STA.w $0000,X
label_C44B38:
	PLD
	RTL

;--------------------------------------------------------------------

label_C44B3A:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE9
	TCD
	PLA
	STX.b $04
	STA.b $15
	LDA.b $25
	STA.b $0A
	LDA.b $27
	STA.b $0C
	LDA.w $9E23
	AND.w #$0007
	STA.b $02
	STA.b $13
	LDA.w $9E25
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$3492
	TAY
	STY.b $11
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $02
	BNE.b label_C44B86
	SEP.b #$20
	LDA.b #$FF
	STA.b $0E
	REP.b #$20
	LDA.b $04
	ASL
	TAX
	TYA
	JSL.l label_C08EFC
label_C44B86:
	LDY.b $11
	TYX
	INX
	STX.b $0F
	LDA.w #$0000
	STA.b $11
	BRA.b label_C44BC4

label_C44B93:
	LDA.b [$06]
	AND.w #$00FF
	PHA
	LDA.b $13
	STA.b $02
	XBA
	AND.w #$FF00
	PLY
	STY.b $02
	CLC
	ADC.b $02
	PHA
	SEP.b #$20
	LDA.w $0000,X
	PLX
	AND.l DATA_EFC51B,X
	LDX.b $0F
	STA.w $0000,X
	REP.b #$20
	INC.b $06
	INX
	INX
	STX.b $0F
	LDA.b $11
	INC
	STA.b $11
label_C44BC4:
	CMP.b $04
	BCC.b label_C44B93
	LDA.w $9E23
	CLC
	ADC.b $15
	STA.w $9E23
	CMP.w #$01A0
	BCC.b label_C44BDD
	SEC
	SBC.w #$01A0
	STA.w $9E23
label_C44BDD:
	LDA.w $9E23
	LSR
	LSR
	LSR
	STA.b $15
	CMP.w $9E25
	BNE.b label_C44BED
	JMP.w label_C44C6A

label_C44BED:
	STA.w $9E25
	LDA.b $13
	STA.b $02
	LDA.w #$0008
	SEC
	SBC.b $02
	STA.b $02
	STA.b $13
	LDA.b $15
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w #$3492
	TAY
	STY.b $11
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	SEP.b #$20
	LDA.b #$FF
	STA.b $0E
	REP.b #$20
	LDA.b $04
	ASL
	TAX
	TYA
	JSL.l label_C08EFC
	LDA.b $02
	CMP.w #$0008
	BEQ.b label_C44C6A
	LDY.b $11
	TYX
	INX
	STX.b $0F
	LDA.w #$0000
	STA.b $11
	BRA.b label_C44C66

label_C44C39:
	LDA.b [$06]
	AND.w #$00FF
	PHA
	LDA.b $13
	STA.b $02
	XBA
	AND.w #$FF00
	PLY
	STY.b $02
	CLC
	ADC.b $02
	TAX
	SEP.b #$20
	LDA.l DATA_EFCD1B,X
	LDX.b $0F
	STA.w $0000,X
	REP.b #$20
	INC.b $06
	INX
	INX
	STX.b $0F
	LDA.b $11
	INC
	STA.b $11
label_C44C66:
	CMP.b $04
	BCC.b label_C44C39
label_C44C6A:
	PLD
	RTL

;--------------------------------------------------------------------

DATA_C44C6C:
	dw $0001,$0002,$0004,$0008,$0010,$0020,$0040,$0080
	dw $0100,$0200,$0400,$0800,$1000,$2000,$4000,$8000

;--------------------------------------------------------------------

label_C44C8C:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	STX.b $18
	STA.b $16
	LDA.w $8958
	CMP.w #$FFFF
	BNE.b label_C44CA5
	JMP.w label_C44DC8

label_C44CA5:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	CMP.w #$FFFF
	BNE.b label_C44CB5
	JMP.w label_C44DC8

label_C44CB5:
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	STA.b $02
	STA.b $14
	LDX.b $02
	LDA.w $000E,X
	STA.b $04
	LDX.b $02
	LDA.w $0010,X
	STA.b $12
	LDX.b $02
	LDA.w $0013,X
	STA.b $10
	LDX.b $02
	LDA.b $04
	CMP.w $000A,X
	BNE.b label_C44D15
	LDA.w #$0000
	STA.b $04
	LDX.b $02
	LDA.w $000C,X
	LSR
	DEC
	CMP.b $12
	BEQ.b label_C44CF6
	INC.b $12
	BRA.b label_C44D09

label_C44CF6:
	LDA.l $7EB49D
	AND.w #$00FF
	BEQ.b label_C44D02
	JMP.w label_C44DB8

label_C44D02:
	LDA.w $8958
	JSL.l label_C10CAF
label_C44D09:
	LDA.w $5E6E
	BEQ.b label_C44D15
	SEP.b #$20
	LDA.b #$01
	STA.w $5E75
label_C44D15:
	REP.b #$20
	LDA.w $964D
	BEQ.b label_C44D43
	LDA.b $04
	BNE.b label_C44D43
	LDA.b $16
	CMP.w #$0020
	BEQ.b label_C44D2E
	LDA.b $16
	CMP.w #$0070
	BNE.b label_C44D43
label_C44D2E:
	LDA.w $964D
	CMP.w #$0001
	BNE.b label_C44D39
	JMP.w label_C44DB8

label_C44D39:
	CMP.w #$0002
	BNE.b label_C44D43
	LDA.w #$0020
	STA.b $16
label_C44D43:
	LDA.b $04
	ASL
	PHA
	LDX.b $02
	LDY.w $000A,X
	LDA.b $12
	JSL.l label_C09032
	ASL
	ASL
	LDX.b $02
	CLC
	ADC.w $0035,X
	PLY
	STY.b $02
	CLC
	ADC.b $02
	TAY
	STY.b $0E
	LDA.w $0000,Y
	BEQ.b label_C44D6C
	JSL.l label_C44E4D
label_C44D6C:
	LDA.b $16
	CMP.w #$0022
	BNE.b label_C44D78
	LDX.w #$0C00
	BRA.b label_C44D7A

label_C44D78:
	LDX.b $10
label_C44D7A:
	TXA
	CLC
	ADC.b $16
	LDY.b $0E
	STA.w $0000,Y
	LDA.b $14
	STA.b $02
	LDX.b $02
	LDA.w $000A,X
	ASL
	STA.b $02
	TYA
	CLC
	ADC.b $02
	TAY
	STY.b $16
	LDA.w $0000,Y
	BEQ.b label_C44D9F
	JSL.l label_C44E4D
label_C44D9F:
	LDA.b $18
	CMP.w #$0022
	BNE.b label_C44DAB
	LDX.w #$0C00
	BRA.b label_C44DAD

label_C44DAB:
	LDX.b $10
label_C44DAD:
	TXA
	CLC
	ADC.b $18
	LDY.b $16
	STA.w $0000,Y
	INC.b $04
label_C44DB8:
	LDA.b $04
	LDX.b $14
	STX.b $02
	STA.w $000E,X
	LDA.b $12
	LDX.b $02
	STA.w $0010,X
label_C44DC8:
	PLD
	RTS

;--------------------------------------------------------------------

label_C44DCA:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDA.w #$9652
	STA.b $14
	LDA.w $9E23
	LSR
	LSR
	LSR
	STA.b $12
	LDA.b ($14)
	LSR
	LSR
	LSR
	STA.b $02
	LDY.w #$0002
	LDA.b ($14),Y
	STA.b $10
	BEQ.b label_C44DFF
	LDY.w #$0004
	LDA.b ($14),Y
	TAY
	LDA.b $10
	TAX
	LDA.b $02
	JSR.w label_C4002F
	BRA.b label_C44E37

label_C44DFF:
	LDA.b $02
	DEC
	STA.b $02
	BRA.b label_C44E37

label_C44E06:
	JSR.w label_C40085
	STA.b $0E
	LDY.w #$0002
	STA.b ($14),Y
	JSR.w label_C40085
	STA.b $04
	LDY.w #$0004
	STA.b ($14),Y
	LDX.b $02
	INX
	CPX.w #$0034
	BNE.b label_C44E25
	LDX.w #$0000
label_C44E25:
	STX.b $02
	LDY.b $04
	LDX.b $0E
	LDA.b $02
	JSR.w label_C4002F
	LDX.b $04
	LDA.b $0E
	JSR.w label_C44C8C
label_C44E37:
	LDA.b $02
	CMP.b $12
	BNE.b label_C44E06
	LDA.w $9E23
	STA.b ($14)
	PLD
	RTL

;--------------------------------------------------------------------

label_C44E44:
	REP.b #$31
	STZ.w $9654
	STZ.w $9652
	RTL

;--------------------------------------------------------------------

label_C44E4D:
	REP.b #$31
	AND.w #$03FF
	CMP.w #$0040
	BEQ.b label_C44E60
	CMP.w #$0000
	BEQ.b label_C44E60
	JSL.l label_C44AF7
label_C44E60:
	RTL

;--------------------------------------------------------------------

label_C44E61:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE2
	TCD
	PLA
	TXY
	STY.b $1C
	STA.b $02
	LDA.w $8958
	CMP.w #$FFFF
	BNE.b label_C44E7B
	JMP.w label_C44FF1

label_C44E7B:
	CPY.w #$002F
	BEQ.b label_C44E8A
	CPY.w #$0022
	BEQ.b label_C44E8A
	CPY.w #$0020
	BNE.b label_C44E96
label_C44E8A:
	TYA
	JSL.l label_C43F77
	JSL.l label_C43CAA
	JMP.w label_C44FF1

label_C44E96:
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	TAX
	LDY.b $1C
	CPY.w #$0050
	BNE.b label_C44EBE
	LDA.w $5E75
	AND.w #$00FF
	BEQ.b label_C44EBC
	JMP.w label_C44FF1

label_C44EBC:
	BRA.b label_C44EDE

label_C44EBE:
	LDA.w $5E75
	AND.w #$00FF
	BEQ.b label_C44EDE
	STZ.w $000E,X
	CPY.w #$0070
	BEQ.b label_C44ED9
	LDA.w $0010,X
	TAX
	LDA.w #$0006
	JSL.l label_C43D75
label_C44ED9:
	SEP.b #$20
	STZ.w $5E75
label_C44EDE:
	LDY.b $1C
	REP.b #$20
	TYA
	SEP.b #$20
	STA.w $5E76
	REP.b #$20
	TYA
	SEC
	SBC.w #$0050
	AND.w #$007F
	STA.b $1A
	LDA.w #$F054
	STA.b $0A
	LDA.w #$00C3
	STA.b $0C
	LDA.b $02
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	TAY
	STY.b $18
	TYA
	CLC
	ADC.w #$0008
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	TAX
	TYA
	INC
	INC
	INC
	INC
	LDY.b $0A
	STY.b $06
	LDY.b $0C
	STY.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.b $1A
	TAY
	TXA
	JSL.l label_C09032
	CLC
	ADC.b $06
	STA.b $06
	STA.b $14
	LDA.b $08
	STA.b $16
	LDY.b $18
	TYA
	CLC
	ADC.w #$000A
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	STA.b $02
	TYA
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $0A
	STY.b $0C
	LDA.b $1A
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	STA.b $1A
	LDA.w $5E6D
	AND.w #$00FF
	STA.b $04
	LDA.b $1A
	CLC
	ADC.b $04
	TAY
	STY.b $12
	CPY.w #$0008
	BCC.b label_C44FD6
	BEQ.b label_C44FD6
label_C44F9F:
	LDA.b $14
	STA.b $06
	LDA.b $16
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.b $02
	LDA.w #$0008
	JSL.l label_C44B3A
	LDY.b $12
	TYA
	SEC
	SBC.w #$0008
	TAY
	STY.b $12
	LDA.b $02
	CLC
	ADC.b $06
	STA.b $06
	STA.b $14
	LDA.b $08
	STA.b $16
	CPY.w #$0008
	BEQ.b label_C44FD6
	BCS.b label_C44F9F
label_C44FD6:
	LDA.b $14
	STA.b $06
	LDA.b $16
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.b $02
	TYA
	JSL.l label_C44B3A
	JSL.l label_C44DCA
label_C44FF1:
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to the name entry confirmation screen?

label_C44FF3:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	STX.b $04
	STX.b $14
	STA.b $02
	STA.b $12
	LDA.b $24
	STA.b $06
	LDA.b $26
	STA.b $08
	LDY.w #$0000
	STY.b $10
	TYX
	BRA.b label_C4506E

label_C45015:
	LDA.b [$06]
	AND.w #$00FF
	INC.b $06
	SEC
	SBC.w #$0050
	AND.w #$007F
	STA.b $0E
	LDA.w $5E6D
	AND.w #$00FF
	STA.b $02
	LDA.w #DATA_C3F054
	STA.b $0A
	LDA.w #DATA_C3F054>>16
	STA.b $0C
	LDA.b $14
	STA.b $04
	STA.b $04
	ASL
	ADC.b $04
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $0A
	STY.b $0C
	LDA.b $0E
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	CLC
	ADC.b $02
	STA.b $02
	LDY.b $10
	TYA
	CLC
	ADC.b $02
	TAY
	STY.b $10
	INX
label_C4506E:
	LDA.b $12
	STA.b $02
	TXA
	CMP.b $02
	BCC.b label_C45015
	TYA
	PLD
	RTL

;--------------------------------------------------------------------

org $C451FA
label_C451FA:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFD2
	TCD
	PLA
	STY.b $2C
	STX.b $2A
	STA.b $28
	LDA.w #$0000
	STA.b $04
	STA.b $02
	LDA.w $8958
	ASL
	TAX
	LDA.w $88E4,X
	LDY.w #$0052
	JSL.l label_C08FF7
	CLC
	ADC.w #$8650
	STA.b $26
	CLC
	ADC.w #$002B
	TAX
	LDA.w $0000,X
	CMP.w #$FFFF
	BNE.b label_C45236
	JMP.w label_C454F0

label_C45236:
	LDA.b $28
	LDY.w #$0031
	STA.b ($26),Y
	LDA.w $0000,X
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAY
	STY.b $24
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0004
	REP.b #$20
	LDA.w #$968D
	JSL.l label_C08EFC
	SEP.b #$20
	LDA.b #$FF
	STA.b $0E
	LDX.w #$0004
	REP.b #$20
	LDA.w #$9691
	JSL.l label_C08EFC
	LDA.b $2C
	BNE.b label_C45277
	JMP.w label_C45327

label_C45277:
	LDY.b $24
	TYA
	CLC
	ADC.w #$0013
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$001E
	JSL.l label_C43E31
	SEP.b #$20
	CLC
	ADC.b #$08
	LDX.b $04
	STA.w $968D,X
	REP.b #$20
	AND.w #$00FF
	PHA
	LDA.b $02
	PLY
	STY.b $02
	CLC
	ADC.b $02
	STA.b $02
	LDY.b $24
	LDA.w $0002,Y
	CMP.w #$FFFF
	BEQ.b label_C452CF
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAY
	STY.b $24
	INC.b $04
	BRA.b label_C45277

label_C452CF:
	LDY.w #$000A
	LDA.b ($26),Y
	LDY.w #$0800
	JSL.l label_C09032
	LDY.b $02
	JSL.l label_C0915B
	STA.b $22
	BRA.b label_C45306

label_C452E5:
	LDX.b $04
	LDA.w $968D,X
	AND.w #$00FF
	TAY
	LDA.b $22
	JSL.l label_C09032
	XBA
	AND.w #$00FF
	SEP.b #$20
	LDX.b $04
	STA.w $9691,X
	REP.b #$20
	LDA.b $04
	DEC
	STA.b $04
label_C45306:
	LDA.b $04
	CMP.w #$FFFF
	BNE.b label_C452E5
	LDY.w #$002B
	LDA.b ($26),Y
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAY
	STY.b $24
	LDA.w #$0000
	STA.b $04
	BRA.b label_C4533E

label_C45327:
	LDY.b $2A
	LDA.b $28
	DEC
	JSL.l label_C09032
	LDY.w #$000A
	CLC
	ADC.b ($26),Y
	LDY.b $28
	JSL.l label_C0915B
	STA.b $20
label_C4533E:
	LDY.w #$000C
	LDA.b ($26),Y
	LSR
	TAX
	STX.b $1E
	LDY.w #$002B
	LDA.b ($26),Y
	JSL.l label_C10C49
	LDX.b $1E
	STX.b $02
	LDY.b $28
	CLC
	ADC.b $28
	DEC
	JSL.l label_C0915B
	CMP.b $02
	BCC.b label_C45366
	BEQ.b label_C45366
	DEX
	DEX
label_C45366:
	STX.b $1E
	LDA.w #$0000
	STA.b $22
	LDA.w #$0001
	STA.b $1C
label_C45372:
	LDY.w #$0010
	LDA.b ($26),Y
	STA.b $02
	STA.b $1A
	LDA.b $1E
	STA.b $2A
	JMP.w label_C45459

label_C45382:
	LDX.b $28
	STX.b $18
	JMP.w label_C45443

label_C45389:
	LDA.b $2C
	BNE.b label_C45390
	JMP.w label_C4540C

label_C45390:
	LDA.b $04
	CLC
	ADC.w #$9691
	STA.b $16
	LDX.b $04
	SEP.b #$20
	LDA.b ($16)
	SEC
	SBC.w $968D,X
	REP.b #$20
	AND.w #$00FF
	PHA
	ASL
	PLA
	ROR
	ASL
	PHP
	LSR
	LSR
	LSR
	LSR
	PLP
	BCC.b label_C453B7
	ORA.w #$F000
label_C453B7:
	STA.b $02
	LDA.b $22
	CLC
	ADC.b $02
	LDY.b $24
	STA.w $0008,Y
	LDA.b $1A
	STA.b $02
	STA.w $000A,Y
	LDA.b $1C
	STA.w $0006,Y
	LDA.w $0002,Y
	TAY
	CPY.w #$FFFF
	BNE.b label_C453DB
	JMP.w label_C45465

label_C453DB:
	LDA.b ($16)
	AND.w #$00FF
	CLC
	ADC.w #$0007
	ASL
	PHP
	LSR
	LSR
	LSR
	LSR
	PLP
	BCC.b label_C453F0
	ORA.w #$F000
label_C453F0:
	STA.b $02
	LDA.b $22
	CLC
	ADC.b $02
	STA.b $22
	INC.b $04
	TYA
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAY
	STY.b $24
	BRA.b label_C4543E

label_C4540C:
	LDA.b $22
	LDY.b $24
	STA.w $0008,Y
	LDA.b $1A
	STA.b $02
	STA.w $000A,Y
	LDA.b $1C
	STA.w $0006,Y
	LDA.w $0002,Y
	TAY
	CPY.w #$FFFF
	BEQ.b label_C45465
	LDA.b $22
	CLC
	ADC.b $20
	STA.b $22
	TYA
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAY
	STY.b $24
label_C4543E:
	LDX.b $18
	DEX
	STX.b $18
label_C45443:
	BEQ.b label_C45448
	JMP.w label_C45389

label_C45448:
	LDA.w #$0000
	STA.b $22
	LDA.b $1A
	STA.b $02
	INC.b $02
	LDA.b $02
	STA.b $1A
	DEC.b $2A
label_C45459:
	LDA.b $2A
	BEQ.b label_C45460
	JMP.w label_C45382

label_C45460:
	INC.b $1C
	JMP.w label_C45372

label_C45465:
	LDA.b $26
	CLC
	ADC.w #$002B
	TAX
	STX.b $20
	LDA.w $0000,X
	JSL.l label_C10C49
	STA.b $2C
	LDY.w #$000C
	LDA.b ($26),Y
	LSR
	STA.b $02
	LDY.b $28
	LDA.b $2C
	CLC
	ADC.b $28
	DEC
	JSL.l label_C0915B
	CMP.b $02
	BCC.b label_C454F0
	BEQ.b label_C454F0
	LDX.b $20
	LDA.w $0000,X
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAX
	LDY.b $28
	DEY
	STY.b $20
	BRA.b label_C454BB

label_C454A9:
	DEY
	STY.b $20
	LDA.w $0002,X
	LDY.w #$002D
	JSL.l label_C08FF7
	CLC
	ADC.w #$89D4
	TAX
label_C454BB:
	LDY.b $20
	BNE.b label_C454A9
	LDA.w #$E44C
	STA.b $0E
	LDA.w #$00C3
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$0000
	STA.b $14
	LDY.w #$000C
	LDA.b ($26),Y
	LSR
	TAY
	DEY
	LDX.w #$0000
	TXA
	JSL.l label_C10BFE
	LDY.w #$002D
	LDA.b ($26),Y
	JSL.l label_C08FF7
	TAX
	STZ.w $89DA,X
label_C454F0:
	PLD
	RTL

;--------------------------------------------------------------------

org $C4550E
DATA_C4550E:
	db $00,$00,$00,$00,$0C,$F5,$97,$18
	db $01,$98,$06,$19,$98,$06,$1F,$98
	db $0C,$25,$98,$84,$31,$98,$84,$35
	db $98,$05,$CE,$99,$81,$D3,$99,$84

;--------------------------------------------------------------------

org $C4562F
DATA_C4562F:
	db $01,$02,$04,$08,$10,$20,$40,$80

;--------------------------------------------------------------------

org $C45637
label_C45637:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STX.b $04
	TAX
	DEC
	STA.b $0E
	LDA.w #$0000
	STA.b $02
	BRA.b label_C45670

label_C4564E:
	LDA.b $0E
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99F1
	CLC
	ADC.b $02
	TAX
	LDA.w $0000,X
	AND.w #$00FF
	CMP.b $04
	BNE.b label_C4566E
	LDA.b $0E
	INC
	BRA.b label_C45681

label_C4566E:
	INC.b $02
label_C45670:
	LDA.w #$000E
	CLC
	SBC.b $02
	BVS.b label_C4567C
	BPL.b label_C4564E
	BRA.b label_C4567E

label_C4567C:
	BMI.b label_C4564E
label_C4567E:
	LDA.w #$0000
label_C45681:
	PLD
	RTS

label_C45683:							; Note: Main entry
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STX.b $04
	CMP.w #$00FF
	BNE.b label_C456DD
	LDA.w #$0000
	STA.b $02
	STA.b $10
	BRA.b label_C456C8

label_C4569D:
	LDA.b $10
	STA.b $02
	CLC
	ADC.w #$986F
	TAY
	STY.b $0E
	LDX.b $04
	LDA.w $0000,Y
	AND.w #$00FF
	JSR.w label_C45637
	CMP.w #$0000
	BEQ.b label_C456C2
	LDY.b $0E
	LDA.w $0000,Y
	AND.w #$00FF
	BRA.b label_C456E2

label_C456C2:
	INC.b $02
	LDA.b $02
	STA.b $10
label_C456C8:
	LDA.w $98A4
	AND.w #$00FF
	PHA
	LDA.b $02
	PLY
	STY.b $02
	CMP.b $02
	BCC.b label_C4569D
	LDA.w #$0000
	BRA.b label_C456E2

label_C456DD:
	LDX.b $04
	JSR.w label_C45637
label_C456E2:
	PLD
	RTL

;--------------------------------------------------------------------

org $C45A27
DATA_C45A27:
	dw $0007,$0160,$0161,$0162,$0163,$0164,$0165,$0166
	dw $0167,$0000,$0000,$0000,$0000,$0000,$0168,$0169
	dw $0007,$0007,$0007,$0000,$0000,$016A,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0007,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0007,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0007,$0007,$0007,$0007,$0000,$0000
	dw $0000

DATA_C45A89:
	dw $0020,$000D,$000E,$000F,$001D,$001E,$001F,$001C
	dw $012F,$0020,$0020,$0020,$0020,$0020,$000C,$013F
	dw $0020,$0020,$0020,$0020,$0020,$000B,$0020,$0020
	dw $0020,$0020,$0020,$0020,$0020,$0020,$0020,$0020
	dw $0020,$0020,$0020,$0020,$0020,$0020,$0020,$0020
	dw $0020,$0020,$0020,$0020,$0020,$0020,$0020,$0020
	dw $0000

;--------------------------------------------------------------------

DATA_C45AEB:
	dw $0002,$0006,$0006,$0006,$0006,$0006,$0006,$0006
	dw $0006,$0000,$0000,$0000,$0000,$0000,$0006,$0006
	dw $0006,$0006,$0006,$0000,$0000,$0006,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0004,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0004,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0004,$0004,$0004,$0004,$0000,$0000
	dw $0000

;--------------------------------------------------------------------

StatusMenuText:
;$C45B4D
	table "Tables/Fonts/MainFont.txt"

	db "@Press the -A- Button for PSI info."
	db "Unconscious",$00,$00,$00,$00,$00
	db "Diamondized",$00,$00,$00,$00,$00
	db "Paralyzed",$00,$00,$00,$00,$00,$00,$00
	db "Nauseous",$00,$00,$00,$00,$00,$00,$00,$00
	db "Poisoned",$00,$00,$00,$00,$00,$00,$00,$00
	db "Sunstroke",$00,$00,$00,$00,$00,$00,$00
	db "Sniffling",$00,$00,$00,$00,$00,$00,$00
	db "Mashroomized",$00,$00,$00,$00
	db "Possessed",$00,$00,$00,$00,$00,$00,$00
	db "Homesick",$00,$00,$00,$00,$00,$00,$00,$00

;--------------------------------------------------------------------

EquipmentSubmenuText:
;$C45C10
	db "Stored Goods"
	db "Offense:"
	db "Defense:  "
	db "Weapon",$00,$00,$00
	db "      Body",$00
	db "     Arms",$00,$00
	db "     Other",$00
	db "Weapons",$00
	db "Body",$00,$00,$00,$00
	db "Arms",$00,$00,$00,$00
	db "Others",$00,$00
	db "(Nothing) "
	db "None",$00
	db "To:",$00
	
cleartable

;--------------------------------------------------------------------

org $C45E96
label_C45E96:
	REP.b #$31
label_C45E98:
	LDA.w $9E2B
	BNE.b label_C45E98
	LDX.w #$0000
	BRA.b label_C45EAA

label_C45EA2:
	SEP.b #$20
	LDA.b #$FF
	STA.w $9D23,X
	INX
label_C45EAA:
	CPX.w #$0020
	BCC.b label_C45EA2
	REP.b #$20
	STZ.w $9E25
	STZ.w $9E23
	LDX.w $9E27
	INX
	STX.w $9E27
	CPX.w #$0030
	BCC.b label_C45EC6
	STZ.w $9E27
label_C45EC6:
	STZ.w $9E29
	JSL.l label_C44E44
	RTL

;--------------------------------------------------------------------

org $C45F7B
label_C45F7B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TAX
	STX.b $0E
	JSL.l label_C08E9A
	LDX.b $0E
	TXY
	INY
	JSL.l label_C09231
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to advancing to the next name entry screen

org $C46028
label_C46028:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TAX
	STX.b $10
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C46050

label_C4603C:
	ASL
	PHA
	LDX.b $10
	TXA
	PLX
	CMP.w $2CD6,X
	BNE.b label_C4604B
	LDA.b $0E
	BRA.b label_C46058

label_C4604B:
	LDA.b $0E
	INC
	STA.b $0E
label_C46050:
	CMP.w #$001E
	BCC.b label_C4603C
	LDA.w #$FFFF
label_C46058:
	PLD
	RTL

;--------------------------------------------------------------------

label_C4605A:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TAX
	STX.b $10
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C46082

label_C4606E:
	ASL
	PHA
	LDX.b $10
	TXA
	PLX
	CMP.w $2C9A,X
	BNE.b label_C4607D
	LDA.b $0E
	BRA.b label_C4608A

label_C4607D:
	LDA.b $0E
	INC
	STA.b $0E
label_C46082:
	CMP.w #$001E
	BCC.b label_C4606E
	LDA.w #$FFFF
label_C4608A:
	PLD
	RTL

;--------------------------------------------------------------------

label_C4608C:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF1
	TCD
	PLA
	SEP.b #$20
	STA.b $0E
	REP.b #$20
	AND.w #$00FF
	CMP.w #$00FF
	BNE.b label_C460A9
	LDA.w $9889
	BRA.b label_C460CC

label_C460A9:
	LDX.w #$0000
	BRA.b label_C460C2

label_C460AE:
	SEP.b #$20
	LDA.b $0E
	CMP.w $988B,X
	BNE.b label_C460C1
	REP.b #$20
	TXA
	ASL
	TAX
	LDA.w $9897,X
	BRA.b label_C460CC

label_C460C1:
	INX
label_C460C2:
	CPX.w #$0006
	BCC.b label_C460AE
	REP.b #$20
	LDA.w #$FFFF
label_C460CC:
	PLD
	RTL

;--------------------------------------------------------------------

label_C460CE:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	TXY
	STY.b $14
	TAX
	JSL.l label_C4605A
	STA.b $12
	CMP.w #$FFFF
	BEQ.b label_C46123
	ASL
	TAX
	LDA.w $0B8E,X
	STA.w $9E2D
	LDA.w $0BCA,X
	STA.w $9E2F
	LDA.w $2AF6,X
	STA.w $9E31
	LDY.b $14
	CPY.w #$0006
	BEQ.b label_C4610E
	LDA.w #DATA_C3A209
	STA.b $0E
	LDA.w #DATA_C3A209>>16
	STA.b $10
	BRA.b label_C46118

label_C4610E:
	LDA.w #DATA_C3A204
	STA.b $0E
	LDA.w #DATA_C3A204>>16
	STA.b $10
label_C46118:
	LDY.b $10
	LDA.b $12
	TAX
	LDA.b $0E
	JSL.l label_C093F9
label_C46123:
	PLD
	RTL

;--------------------------------------------------------------------

org $C461CC
label_C461CC:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TXY
	STY.b $10
	TAX
	JSL.l label_C46028
	TAX
	CPX.w #$FFFF
	BEQ.b label_C4621A
	LDA.w #ScriptPtrs
	STA.b $06
	LDA.w #ScriptPtrs>>16
	STA.b $08
	LDY.b $10
	TYA
	STA.b $04
	ASL
	ADC.b $04
	STA.b $0E
	INC
	INC
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	TAY
	LDA.b $0E
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	JSL.l label_C093F9
label_C4621A:
	PLD
	RTL

;--------------------------------------------------------------------

org $C463F4
label_C463F4:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	JSL.l label_C07C5B
	STZ.w $5D58
	LDA.b $0E
	CMP.w #$00FF
	BEQ.b label_C4642A
	SEP.b #$20
	JSL.l label_C4608C
	CMP.w #$FFFF
	BEQ.b label_C46458
	ASL
	CLC
	ADC.w #$116A
	TAX
	LDA.w $0000,X
	ORA.w #$8000
	STA.w $0000,X
	BRA.b label_C46458

label_C4642A:
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C4644A

label_C46431:
	ASL
	TAX
	LDA.w $9897,X
	ASL
	CLC
	ADC.w #$116A
	TAX
	LDA.w $0000,X
	ORA.w #$8000
	STA.w $0000,X
	LDA.b $0E
	INC
	STA.b $0E
label_C4644A:
	LDA.w $98A3
	AND.w #$00FF
	STA.b $02
	LDA.b $0E
	CMP.b $02
	BCC.b label_C46431
label_C46458:
	PLD
	RTL

;--------------------------------------------------------------------

label_C4645A:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	CMP.w #$00FF
	BEQ.b label_C46485
	SEP.b #$20
	JSL.l label_C4608C
	CMP.w #$FFFF
	BEQ.b label_C464B3
	ASL
	CLC
	ADC.w #$116A
	TAX
	LDA.w $0000,X
	AND.w #$7FFF
	STA.w $0000,X
	BRA.b label_C464B3

label_C46485:
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C464A5

label_C4648C:
	ASL
	TAX
	LDA.w $9897,X
	ASL
	CLC
	ADC.w #$116A
	TAX
	LDA.w $0000,X
	AND.w #$7FFF
	STA.w $0000,X
	LDA.b $0E
	INC
	STA.b $0E
label_C464A5:
	LDA.w $98A3
	AND.w #$00FF
	STA.b $02
	LDA.b $0E
	CMP.b $02
	BCC.b label_C4648C
label_C464B3:
	PLD
	RTL

;--------------------------------------------------------------------

org $C46507
label_C46507:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	STA.b $14
	LDA.w $9E2D
	STA.b $0E
	LDA.w $9E2F
	STA.b $10
	LDY.w #$FFFF
	LDA.b $14
	JSL.l label_C01E49
	STA.b $12
	ASL
	TAX
	LDA.w $9E31
	STA.w $2AF6,X
	LDA.b $12
	PLD
	RTL

;--------------------------------------------------------------------

org $C4655E
label_C4655E:
	REP.b #$31
	JSL.l label_C4605A
	CMP.w #$FFFF
	BEQ.b label_C46578
	ASL
	CLC
	ADC.w #$10B6
	TAX
	LDA.w $0000,X
	ORA.w #$C000
	STA.w $0000,X
label_C46578:
	RTL

;--------------------------------------------------------------------

label_C46579:
	REP.b #$31
	JSL.l label_C46028
	CMP.w #$FFFF
	BEQ.b label_C46593
	ASL
	CLC
	ADC.w #$10B6
	TAX
	LDA.w $0000,X
	ORA.w #$C000
	STA.w $0000,X
label_C46593:
	RTL

;--------------------------------------------------------------------

org $C46594
label_C46594:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	CMP.w #$00FF
	BEQ.b label_C465BF
	SEP.b #$20
	JSL.l label_C4608C
	CMP.w #$FFFF
	BEQ.b label_C465F9
	ASL
	CLC
	ADC.w #$10B6
	TAX
	LDA.w $0000,X
	ORA.w #$C000
	STA.w $0000,X
	BRA.b label_C465F9

label_C465BF:
	LDX.w #$10E4
	LDA.w $0000,X
	ORA.w #$C000
	STA.w $0000,X
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C465EB

label_C465D2:
	ASL
	TAX
	LDA.w $9897,X
	ASL
	CLC
	ADC.w #$10B6
	TAX
	LDA.w $0000,X
	ORA.w #$C000
	STA.w $0000,X
	LDA.b $0E
	INC
	STA.b $0E
label_C465EB:
	LDA.w $98A3
	AND.w #$00FF
	STA.b $02
	LDA.b $0E
	CMP.b $02
	BCC.b label_C465D2
label_C465F9:
	PLD
	RTL

;--------------------------------------------------------------------

label_C465FB:
	REP.b #$31
	JSL.l label_C4605A
	CMP.w #$FFFF
	BEQ.b label_C46615
	ASL
	CLC
	ADC.w #$10B6
	TAX
	LDA.w $0000,X
	AND.w #$3FFF
	STA.w $0000,X
label_C46615:
	RTL

;--------------------------------------------------------------------

org $C46631
label_C46631:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	CMP.w #$00FF
	BEQ.b label_C4665C
	SEP.b #$20
	JSL.l label_C4608C
	CMP.w #$FFFF
	BEQ.b label_C46696
	ASL
	CLC
	ADC.w #$10B6
	TAX
	LDA.w $0000,X
	AND.w #$3FFF
	STA.w $0000,X
	BRA.b label_C46696

label_C4665C:
	LDX.w #$7E10E4
	LDA.w $0000,X
	AND.w #$3FFF
	STA.w $0000,X
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C46688

label_C4666F:
	ASL
	TAX
	LDA.w $9897,X
	ASL
	CLC
	ADC.w #$10B6
	TAX
	LDA.w $0000,X
	AND.w #$3FFF
	STA.w $0000,X
	LDA.b $0E
	INC
	STA.b $0E
label_C46688:
	LDA.w $98A3
	AND.w #$00FF
	STA.b $02
	LDA.b $0E
	CMP.b $02
	BCC.b label_C4666F
label_C46696:
	PLD
	RTL

;--------------------------------------------------------------------

org $C466A8
label_C466A8:
	REP.b #$31
	JSL.l label_C46028
	STA.w $9E33
	LDA.w #$0002
	STA.w $98A5
	RTL

;--------------------------------------------------------------------

org $C466B8
EB_TextBoxCommand1F_ArgED_RestorePlayerMovement:
.Main:
;$C466B8
	REP.b #$31
	STZ.w $9885
	STZ.w $98A5
	RTL

;--------------------------------------------------------------------

org $C46881
label_C46881:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.b $20
	STA.b $06
	LDA.b $22
	STA.b $08
	LDA.w #$00FF
	JSL.l label_C46594
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0008
	JSL.l label_C064E3
	PLD
	RTL

;--------------------------------------------------------------------

org $C468B5
label_C468B5:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $10
	LDX.w #$0000
	STX.b $0E
	LDA.w $1A42
	ASL
	TAX
	LDA.b $10
	CMP.w $0B8E,X
	BCS.b label_C468D7
	LDX.w #$0001
	STX.b $0E
label_C468D7:
	LDX.b $0E
	TXA
	PLD
	RTL

;--------------------------------------------------------------------

label_C468DC:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	STA.b $10
	LDX.w #$0000
	STX.b $0E
	LDA.w $1A42
	ASL
	TAX
	LDA.b $10
	CMP.w $0BCA,X
	BCS.b label_C468FE
	LDX.w #$0001
	STX.b $0E
label_C468FE:
	LDX.b $0E
	TXA
	PLD
	RTL

;--------------------------------------------------------------------

org $C46A7A
DATA_C46A7A:
	dw $0000,$0002,$0002,$0002
	dw $0004,$0006,$0006,$0006

DATA_C46A8A:
	dw $0000,$0000,$0002,$0004
	dw $0004,$0004,$0006,$0000

label_C46A9A:
	REP.b #$31
	ASL
	TAX
	LDA.l DATA_C46A8A,X
	RTL

label_C46AA3:
	REP.b #$31
	ASL
	TAX
	LDA.l DATA_C46A8A,X
	RTL

;--------------------------------------------------------------------

org $C46ADB
label_C46ADB:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEC
	TCD
	LDA.w $1A42
	ASL
	STA.b $12
	TAX
	LDA.w $1002,X
	STA.b $0E
	LDA.b $12
	TAX
	LDY.w $0FC6,X
	TAX
	LDA.w $0BCA,X
	TAX
	STX.b $10
	LDA.b $12
	TAX
	LDA.w $0B8E,X
	LDX.b $10	
	JSL.l label_C41EFF
	PLD
	RTL

;--------------------------------------------------------------------

label_C46B0A:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	LDY.w #$2000
	CLC
	ADC.w #$1000
	JSL.l label_C0915B
	STA.b $0E
	LDA.w $1A42
	ASL
	TAX
	LDA.b $0E
	STA.w $1A86,X
	PLD
	RTL

;--------------------------------------------------------------------

org $C46B37
label_C46B37:
	REP.b #$31
	INC
	INC
	INC
	INC
	AND.w #$0007
	RTL

;--------------------------------------------------------------------

org $C46C9B
label_C46C9B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	LDX.w $1A42
	STX.b $10
	JSL.l label_C4608C
	STA.b $0E
	LDX.b $10
	TXA
	ASL
	TAY
	LDA.b $0E
	ASL
	TAX
	LDA.w $0B8E,X
	STA.w $0B8E,Y
	LDA.w $0BCA,X
	STA.w $0BCA,Y
	PLD
	RTL

;--------------------------------------------------------------------

org $C46E46
label_C46E46:
	REP.b #$31
	LDA.w #$0001
	STA.w $9641
	RTL

;--------------------------------------------------------------------

label_C46E4F:

;--------------------------------------------------------------------

org $C46E74
label_C46E74:

;--------------------------------------------------------------------

; Note: Something related to sprite movement.

org $C47044
label_C47044:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	STA.b $04
	LDA.w $1A42
	STA.b $02
	ASL
	TAY
	STY.b $16
	LDA.w $2B32,Y
	TAX
	LDA.b $04
	JSL.l label_C41FFF
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	STA.b $14
	AND.w #$8000
	BEQ.b label_C4709C
	SEP.b #$10
	LDY.b #$08
	LDA.b $14
	JSL.l label_C09251
	ORA.w #$FF00
	REP.b #$10
	LDY.b $16
	STA.w $0CF6,Y
	SEP.b #$10
	LDY.b #$08
	LDA.b $14
	JSL.l label_C0923E
	ORA.w #$00FF
	REP.b #$10
	LDY.b $16
	STA.w $0DAA,Y
	BRA.b label_C470C4

label_C4709C:
	SEP.b #$10
	LDY.b #$08
	LDA.b $14
	JSL.l label_C09251
	AND.w #$00FF
	REP.b #$10
	LDY.b $16
	STA.w $0CF6,Y
	SEP.b #$10
	LDY.b #$08
	LDA.b $14
	JSL.l label_C0923E
	AND.w #$FF00
	REP.b #$10
	LDY.b $16
	STA.w $0DAA,Y
label_C470C4:
	LDA.b $0E
	STA.b $14
	AND.w #$8000
	BEQ.b label_C47107
	LDA.b $02
	ASL
	TAX
	STX.b $12
	SEP.b #$20
	LDA.b #$08
	SEP.b #$10
	TAY
	REP.b #$20
	LDA.b $14
	JSL.l label_C09251
	ORA.w #$FF00
	REP.b #$10
	LDX.b $12
	STA.w $0D32,X
	SEP.b #$20
	LDA.b #$08
	SEP.b #$10
	TAY
	REP.b #$20
	LDA.b $14
	JSL.l label_C0923E
	ORA.w #$00FF
	REP.b #$10
	LDX.b $12
	STA.w $0DE6,X
	BRA.b label_C4713F

label_C47107:
	LDA.b $02
	ASL
	TAX
	STX.b $12
	SEP.b #$20
	LDA.b #$08
	SEP.b #$10
	TAY
	REP.b #$20
	LDA.b $14
	JSL.l label_C09251
	AND.w #$00FF
	REP.b #$10
	LDX.b $12
	STA.w $0D32,X
	SEP.b #$20
	LDA.b #$08
	SEP.b #$10
	TAY
	REP.b #$20
	LDA.b $14
	JSL.l label_C0923E
	AND.w #$FF00
	REP.b #$10
	LDX.b $12
	STA.w $0DE6,X
label_C4713F:
	LDA.b $04
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to stoping movement? Putting an RTL here caused Ness to endlessly walking after getting out of bed.

label_C47143:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	TXY
	STY.b $16
	STA.b $04
	LDA.w $1A42
	STA.b $02
	STA.b $14
	LDA.b $02
	ASL
	TAX
	LDA.w $0FC6,X
	SEC
	SBC.w $0B8E,X
	STA.b $12
	STA.b $02
	LDA.w #$0000
	CLC
	SBC.b $02
	BVC.b label_C47174
	BPL.b label_C47180
	BRA.b label_C47176

label_C47174:
	BMI.b label_C47180
label_C47176:
	LDA.b $12
	EOR.w #$FFFF
	INC
	STA.b $12
	BRA.b label_C47184

label_C47180:
	LDA.b $12
	STA.b $12
label_C47184:
	LDA.b $14
	STA.b $02
	ASL
	TAX
	LDA.b $12
	CMP.w $0F8A,X
	BCS.b label_C471CA
	LDA.w $1002,X
	SEC
	SBC.w $0BCA,X
	STA.b $12
	STA.b $02
	LDA.w #$0000
	CLC
	SBC.b $02
	BVC.b label_C471A8
	BPL.b label_C471B4
	BRA.b label_C471AA

label_C471A8:
	BMI.b label_C471B4
label_C471AA:
	LDA.b $12
	EOR.w #$FFFF
	INC
	STA.b $12
	BRA.b label_C471B8

label_C471B4:
	LDA.b $12
	STA.b $12
label_C471B8:
	LDA.b $14
	STA.b $02
	ASL
	TAX
	LDA.b $12
	CMP.w $0F8A,X
	BCS.b label_C471CA
	LDA.w #$0001
	BRA.b label_C47223

label_C471CA:
	JSL.l label_C46ADB
	TAX
	STX.b $12
	TXA
	JSL.l label_C47044
	LDY.b $16
	BNE.b label_C47220
	LDX.b $12
	TXA
	JSL.l label_C46B0A
	TAX
	STX.b $10
	LDA.b $04
	BEQ.b label_C471F0
	TXA
	JSL.l label_C46B37
	TAX
	STX.b $10
label_C471F0:
	LDA.b $02
	ASL
	CLC
	ADC.w #$2AF6
	TAY
	LDA.w $0000,Y
	STA.b $0E
	TXA
	STA.w $0000,Y
	LDA.b $0E
	JSL.l label_C46AA3
	TAY
	STY.b $16
	LDX.b $10
	TXA
	JSL.l label_C46AA3
	STA.b $04
	LDY.b $16
	TYA
	CMP.b $04
	BEQ.b label_C47220
	LDA.b $02
	JSL.l label_C0A48F
label_C47220:
	LDA.w #$0000
label_C47223:
	PLD
	RTL

;--------------------------------------------------------------------

org $C47370
label_C47370:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF2
	TCD
	PLA
	STX.b $02
	STA.b $04
	JSL.l label_C08726
	LDA.w #$0009
	JSL.l label_C08D79
	LDY.w #$0000
	LDX.w #$5800
	TYA
	JSL.l label_C08D9E
	LDY.w #$1000
	LDX.w #$5C00
	LDA.w #$0000
	JSL.l label_C08DDE
	LDY.w #$0004
	LDX.b $02
	LDA.b $04
	JSL.l label_C2D121
	JSL.l label_C08744
	PLD
	RTL

;--------------------------------------------------------------------

org $C474A8
label_C474A8:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w $1A42
	ASL
	TAX
	LDA.w $0E5E,X
	STA.b $0E
	STA.b $02
	LDA.w #$0000
	CLC
	SBC.b $02
	BVS.b label_C474C8
	BPL.b label_C474CF
	BRA.b label_C474CA

label_C474C8:
	BMI.b label_C474CF
label_C474CA:
	LDA.b $0E
	TAX
	BRA.b label_C474D6

label_C474CF:
	LDA.b $0E
	EOR.w #$FFFF
	INC
	TAX
label_C474D6:
	LDA.b $0E
	STA.b $02
	LDA.w #$0000
	CLC
	SBC.b $02
	BVS.b label_C474E6
	BPL.b label_C474ED
	BRA.b label_C474E8

label_C474E6:
	BMI.b label_C474ED
label_C474E8:
	LDA.w #$0033
	BRA.b label_C474F0

label_C474ED:
	LDA.w #$00B3
label_C474F0:
	JSL.l label_C4249A
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to the file select screen or text boxes.

org $C47C3F
label_C47C3F:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFD4
	TCD
	LDA.w #FileSelectAndBattlePartyWindowsGFX
	STA.b $0E
	LDA.w #FileSelectAndBattlePartyWindowsGFX>>16
	STA.b $10
	LDA.w #$7F0000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #$7F2000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDA.w #$1000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	LDA.w #$2A00
	JSL.l label_C08EED
	LDA.w #$7F3200
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDX.w #$0600
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08F15
	LDA.w $99CD
	AND.w #$00FF
	DEC
	STA.b $04
	ASL
	ADC.b $04
	TAX
	INX
	INX
	LDA.l DATA_E01FB9,X
	AND.w #$00FF
	CMP.w #$0008
	BNE.b label_C47CC2
	LDA.w #EB_FlavoredTextWindowGFX
	STA.b $0E
	LDA.w #EB_FlavoredTextWindowGFX>>16
	STA.b $10
	LDA.w #$7F0100
	STA.b $12
	LDA.w #$007F
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
label_C47CC2:
	LDA.w #DATA_C3F054
	STA.b $06
	LDA.w #DATA_C3F054>>16
	STA.b $08
	LDY.w #$0020
	LDA.b [$06],Y
	STA.b $2A
	LDY.w #$0022
	LDA.b [$06],Y
	STA.b $28
	LDA.w #$2A00
	STA.b $24
	LDA.w #$007F
	STA.b $26
	LDA.w #$0006
	STA.b $22
	LDA.w #$0000
	STA.b $04
	JMP.w label_C47E27

label_C47CF1:
	STZ.w $9E25
	STZ.w $9E23
	SEP.b #$20
	LDA.b #$FF
	STA.b $0E
	LDX.w #$0340
	REP.b #$20
	LDA.w #$3492
	JSL.l label_C08EFC
	STZ.w $9654
	STZ.w $9652
	LDA.b $04
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	STA.b $0A
	PHB
	SEP.b #$20
	PLA
	STA.b $0C
	STZ.b $0D
	REP.b #$20
	LDA.w #$0002
	STA.w $9E23
	LDA.w #$0000
	STA.b $02
	BRA.b label_C47D69

label_C47D35:
	AND.w #$00FF
	INC.b $0A
	SEC
	SBC.w #$0050
	AND.w #$007F
	TAY
	LDA.l $C3F070
	STA.b $06
	LDA.l $C3F070+$02
	STA.b $08
	LDA.b $2A
	JSL.l label_C09032
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.b $28
	LDA.b $22
	JSL.l label_C44B3A
	INC.b $02
label_C47D69:
	LDA.b [$0A]
	AND.w #$00FF
	BNE.b label_C47D35
	LDY.w #$0000
	STY.b $20
	JMP.w label_C47E1B

label_C47D78:
	TYA
	ASL
	ASL
	ASL
	ASL
	STA.b $02
	LDA.b $04
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	STX.b $1E
	LDA.w #$3492
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	TYA
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $02
	LDA.b $24
	STA.b $06
	LDA.b $26
	STA.b $08
	TXA
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	LDX.b $1A
	STX.b $06
	LDX.b $1C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.w #$0010
	JSL.l label_C08EED
	LDA.b $24
	STA.b $06
	LDA.b $26
	STA.b $08
	LDX.b $1E
	TXA
	CLC
	ADC.w #$0100
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $02
	CLC
	ADC.w #$0010
	LDX.b $1A
	STX.b $06
	LDX.b $1C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.w #$0010
	JSL.l label_C08EED
	LDY.b $20
	INY
	STY.b $20
label_C47E1B:
	CPY.w #$0004
	BCS.b label_C47E25
	BEQ.b label_C47E25
	JMP.w label_C47D78

label_C47E25:
	INC.b $04
label_C47E27: 
	LDA.b $04
	CMP.w #$0004
	BCS.b label_C47E33
	BEQ.b label_C47E33
	JMP.w label_C47CF1

label_C47E33:
	LDY.w #$0000
	BRA.b label_C47E9D

label_C47E38:
	LDA.w #$0070
	STA.b $06
	LDA.w #$007F
	STA.b $08
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	LDX.w #$0000
	BRA.b label_C47E97

label_C47E4F:
	LDA.b [$24]
	STA.b $1E
	XBA
	AND.w #$00FF
	EOR.w #$00FF
	STA.b $02
	LDA.b [$06]
	AND.w #$00FF
	STA.b $04
	LDA.b $1E
	AND.w #$FF00
	ORA.b $04
	ORA.b $02
	STA.b [$24]
	LDA.b $24
	STA.b $06
	LDA.b $26
	STA.b $08
	INC.b $06
	INC.b $06
	LDA.b $06
	STA.b $24
	LDA.b $08
	STA.b $26
	LDA.b $1A
	STA.b $06
	LDA.b $1C
	STA.b $08
	INC.b $06
	INC.b $06
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	INX
label_C47E97:
	CPX.w #$0008
	BCC.b label_C47E4F
	INY
label_C47E9D:
	CPY.w #$0020
	BCC.b label_C47E38
	LDA.w #$2C00
	STA.b $16
	LDA.w #$007F
	STA.b $18
	LDA.w #$5A89
	STA.b $24
	LDA.w #$00C4
	STA.b $26
	JMP.w label_C47F7E

label_C47EB9:
	CMP.w #$0020
	BNE.b label_C47EC1
	JMP.w label_C47F6A

label_C47EC1:
	STA.b $02
	AND.w #$FFF0
	CLC
	ADC.b $02
	ASL
	ASL
	ASL
	ASL
	STA.b $0A
	STZ.b $0C
	CLC
	LDA.b $0A
	ADC.w #$0000
	STA.b $0A
	LDA.b $0C
	ADC.w #$007F
	STA.b $0C
	LDA.w #$0070
	STA.b $06
	LDA.w #$007F
	STA.b $08
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	LDX.w #$0000
	BRA.b label_C47F65

label_C47EF7:
	LDA.b [$0A]
	STA.b $1E
	XBA
	AND.w #$00FF
	EOR.w #$00FF
	STA.b $02
	LDA.b [$06]
	AND.w #$00FF
	STA.b $04
	LDA.b $1E
	AND.w #$FF00
	ORA.b $04
	ORA.b $02
	STA.b [$16]
	LDY.w #$0100
	LDA.b [$0A],Y
	STA.b $1E
	XBA
	AND.w #$00FF
	EOR.w #$00FF
	STA.b $02
	LDA.b [$06],Y
	AND.w #$00FF
	STA.b $04
	LDA.b $1E
	AND.w #$FF00
	ORA.b $04
	ORA.b $02
	STA.b [$16],Y
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	INC.b $06
	INC.b $06
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	INC.b $0A
	INC.b $0A
	LDA.b $1A
	STA.b $06
	LDA.b $1C
	STA.b $08
	INC.b $06
	INC.b $06
	LDA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	INX
label_C47F65:
	CPX.w #$0008
	BCC.b label_C47EF7
label_C47F6A:
	LDA.b $24
	STA.b $06
	LDA.b $26
	STA.b $08
	INC.b $06
	INC.b $06
	LDA.b $06
	STA.b $24
	LDA.b $08
	STA.b $26
label_C47F7E:
	LDA.b [$24]
	BEQ.b label_C47F85
	JMP.w label_C47EB9

label_C47F85:
	PLD
	RTL

;--------------------------------------------------------------------

label_C47F87:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w $98A4
	AND.w #$00FF
	TAX
	DEX
	LDA.w $9891,X
	AND.w #$00FF
	ASL
	TAX
	LDA.w $4DC8,X
	TAX
	LDA.w $000E,X
	AND.w #$00FF
	TAX
	CPX.w #$0001
	BEQ.b label_C47FB4
	CPX.w #$0002
	BNE.b label_C47FCF
label_C47FB4:
	LDA.w $B4B6
	BNE.b label_C47FCF
	LDA.w #$2108
	STA.b $0E
	LDA.w #$00E0
	STA.b $10
	LDX.w #$0040
	LDA.w #$0200
	JSL.l label_C08ED2
	BRA.b label_C47FFF

label_C47FCF:
	LDA.w #$1FC8
	STA.b $06
	LDA.w #$00E0
	STA.b $08
	LDA.w $99CD
	AND.w #$00FF
	DEC
	STA.b $04
	ASL
	ADC.b $04
	TAX
	LDA.l DATA_E01FB9,X
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0040
	LDA.w #$0200
	JSL.l label_C08ED2
label_C47FFF:
	STZ.w $0200
	LDA.w #$0008
	JSL.l label_C0856B
	PLD
	RTL

;--------------------------------------------------------------------

label_C4800B:
	REP.b #$31
	LDY.w #$6000
	LDX.w #$7C00
	LDA.w #$0000
	JSL.l label_C08E1C
	JSL.l label_C2038B
	JSL.l label_C47C3F
	LDA.w #$0002
	JSL.l label_C44963
	JSL.l label_C47F87
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	REP.b #$20
	RTL

;--------------------------------------------------------------------

LumineHallText:
;$C48037
	table "Tables/Fonts/MainFont.txt"
	db "I'm ....  It's been a long road getting here...  Soon, I'll be...  Soon, I'll be...  Soon, I'll be...  What will happen to us?  W...what's happening?  My thoughts are being written out on the wall...  or are they?  "
cleartable

;--------------------------------------------------------------------

org $C48BE1
label_C48BE1:
	REP.b #$31
	LDA.w $1A42
	ASL
	TAX
	LDA.w $0B8E,X
	SEC
	SBC.w $0031
	STA.w $0B16,X
	LDA.w $1A42
	ASL
	TAX
	LDA.w $0BCA,X
	SEC
	SBC.w $0033
	STA.w $0B52,X
	RTL

;--------------------------------------------------------------------

org $C48C2B
label_C48C2B:
	REP.b #$31
	LDA.w $1A42
	ASL
	TAY
	LDA.w $0BCA,Y
	TAX
	LDA.w $0B8E,Y
	JSL.l label_C0400E
	RTL

;--------------------------------------------------------------------

org $C48ECE
label_C48ECE:
	REP.b #$31
	LDY.w #$0000
	ASL
	ASL
	TAX
	LDA.w $9F1D,X
	AND.w #$00FF
	BNE.b label_C48EE6
	LDA.w $9F1B,X
	AND.w #$00FF
	BEQ.b label_C48EE9
label_C48EE6:
	LDY.w #$0001
label_C48EE9:
	TYA
	RTL

;--------------------------------------------------------------------

label_C48EEB:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TAX
	STX.b $10
	TXA
	JSL.l label_C48ECE
	CMP.w #$0000
	BNE.b label_C48F0E
	SEP.b #$20
	LDA.b #$3C
	STA.w $9F2C
	REP.b #$20
	INC.w $9F2A
label_C48F0E:
	LDX.b $10
	TXA
	ASL
	ASL
	CLC
	ADC.w #$9F1A
	TAY
	STY.b $0E
	LDA.w #DATA_D5F4BB
	STA.b $06
	LDA.w #DATA_D5F4BB>>16
	STA.b $08
	TXA
	STA.b $04
	ASL
	ASL
	ADC.b $04
	TAX
	STX.b $10
	TXA
	INC
	PHA
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	PLA
	CLC
	ADC.b $0A
	STA.b $0A
	SEP.b #$20
	LDA.b [$0A]
	STA.w $0000,Y
	REP.b #$20
	TXA
	INC
	INC
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	SEP.b #$20
	LDA.b [$0A]
	STA.b $00
	STA.w $0001,Y
	REP.b #$20
	LDA.w #$0002
	JSL.l label_C45F7B
	SEP.b #$20
	PHA
	LDA.b $00
	SEP.b #$10
	PLX
	STX.b $00
	CLC
	ADC.b $00
	DEC
	REP.b #$10
	LDY.b $0E
	STA.w $0002,Y
	LDX.b $10
	REP.b #$20
	TXA
	INC
	INC
	INC
	INC
	CLC
	ADC.b $06
	STA.b $06
	SEP.b #$20
	LDA.b [$06]
	STA.w $0003,Y
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C48F98:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	TAX
	STX.b $0E
	TXA
	JSL.l label_C48ECE
	CMP.w #$0000
	BEQ.b label_C48FC0
	DEC.w $9F2A
	LDX.b $0E
	TXA
	ASL
	ASL
	TAX
	SEP.b #$20
	STZ.w $9F1B,X
	STZ.w $9F1D,X
label_C48FC0:
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C48FC4:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDA.w $4DBA
	CLC
	ADC.w $5D60
	BEQ.b label_C48FD8
	JMP.w label_C490EC

label_C48FD8:
	LDA.w $B4B6
	BEQ.b label_C48FE0
	JMP.w label_C490EC

label_C48FE0:
	LDA.w $98A5
	CMP.w #$0002
	BNE.b label_C48FEB
	JMP.w label_C490EC

label_C48FEB:
	SEP.b #$20
	LDA.w $9F2C
	DEC
	STA.w $9F2C
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C48FFE
	JMP.w label_C490EC

label_C48FFE:
	SEP.b #$20
	LDA.b #$3C
	STA.w $9F2C
	REP.b #$20
	LDA.w #$7E9F1A
	STA.b $02
	LDA.w #$0001
	STA.b $14
	LDA.w #$0000
	STA.b $04
	STA.b $12
	JMP.w label_C490E0

label_C4901B:
	LDA.b $14
	BEQ.b label_C4906B
	LDY.b $02
	INY
	STY.b $10
	LDA.w $0000,Y
	AND.w #$00FF
	BEQ.b label_C4906B
	LDX.b $02
	INX
	INX
	STX.b $0E
	SEP.b #$20
	LDA.w $0000,X
	DEC
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	BNE.b label_C4906B
	LDA.w #$0002
	JSL.l label_C45F7B
	SEP.b #$20
	STA.b $00
	LDY.b $10
	LDA.w $0000,Y
	CLC
	ADC.b $00
	DEC
	LDX.b $0E
	STA.w $0000,X
	LDX.b $02
	REP.b #$20
	LDA.w $0000,X
	AND.w #$00FF
	JSL.l label_C0ABE0
	STZ.b $14
label_C4906B:
	LDX.b $02
	INX
	INX
	INX
	LDA.w $0000,X
	AND.w #$00FF
	BEQ.b label_C490CE
	SEP.b #$20
	DEC
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	BNE.b label_C490CE
	LDA.w #DATA_D5F4BB
	STA.b $06
	LDA.w #DATA_D5F4BB>>16
	STA.b $08
	LDA.b $04
	STA.b $04
	ASL
	ASL
	ADC.b $04
	TAY
	STY.b $0E
	TYA
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	TAX
	LDA.w #$00FF
	JSL.l label_C18EAD
	STA.b $10
	LDY.b $0E
	TYA
	INC
	INC
	INC
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	TAX
	LDA.b $10
	JSL.l label_C18BC6
label_C490CE:
	INC.b $02
	INC.b $02
	INC.b $02
	INC.b $02
	LDA.b $12
	STA.b $04
	INC.b $04
	LDA.b $04
	STA.b $12
label_C490E0:
	LDA.b $04
	CMP.w #$0004
	BCS.b label_C490EC
	BEQ.b label_C490EC
	JMP.w label_C4901B

label_C490EC:
	PLD
	RTL

;--------------------------------------------------------------------

org $C491EE
label_C491EE:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF2
	TCD
	PLA
	STA.b $02
	TXA
	SEC
	SBC.b $02
	XBA
	AND.w #$FF00
	JSL.l label_C090E6
	PLD
	RTS

;--------------------------------------------------------------------

org $C49496
label_C49496:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	STA.b $12
	CPX.w #$0032
	BCS.b label_C49515
	TXA
	STA.b $04
	ASL
	ASL
	ADC.b $04
	TAY
	STY.b $10
	LDA.b $12
	AND.w #$001F
	JSL.l label_C09032
	STA.b $02
	LDY.b $10
	LDA.b $12
	LSR
	LSR
	LSR
	LSR
	LSR
	AND.w #$001F
	JSL.l label_C09032
	TAX
	STX.b $0E
	SEP.b #$20
	LDA.b #$0A
	SEP.b #$10
	TAY
	REP.b #$20
	LDA.b $12
	JSL.l label_C09251
	AND.w #$001F
	REP.b #$10
	LDY.b $10
	JSL.l label_C09032
	STA.b $12
	LDA.b $02
	CMP.w #$1E45
	BCC.b label_C494F9
	BEQ.b label_C494F9
	LDA.w #$1F00
	STA.b $02
label_C494F9:
	LDX.b $0E
	CPX.w #$1E45
	BCC.b label_C49505
	BEQ.b label_C49505
	LDX.w #$1F00
label_C49505:
	LDA.b $12
	CMP.w #$1E45
	BCC.b label_C49522
	BEQ.b label_C49522
	LDA.w #$1F00
	STA.b $12
	BRA.b label_C49522

label_C49515:
	CPX.w #$0032
	BEQ.b label_C49548
	LDA.w #$1F00
	STA.b $12
	TAX
	STX.b $02
label_C49522:
	LDA.b $02
	XBA
	AND.w #$00FF
	STA.b $02
	TXA
	XBA
	AND.w #$00FF
	ASL
	ASL
	ASL
	ASL
	ASL
	STA.b $04
	SEP.b #$10
	LDY.b #$0A
	LDA.b $12
	XBA
	AND.w #$00FF
	JSL.l label_C0923E
	ORA.b $04
	ORA.b $02
label_C49548:
	REP.b #$10
	PLD
	RTS

;--------------------------------------------------------------------

label_C4954C:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $02
	LDA.b $1E
	STA.b $0A
	LDA.b $20
	STA.b $0C
	LDA.w #$0000
	STA.b $06
	LDA.w #$007F
	STA.b $08
	LDY.w #$0000
	STY.b $0E
	BRA.b label_C49587

label_C49571:
	LDA.b [$0A]
	INC.b $0A
	INC.b $0A
	LDX.b $02
	JSR.w label_C49496
	STA.b [$06]
	INC.b $06
	INC.b $06
	LDY.b $0E
	INY
	STY.b $0E
label_C49587:
	CPY.w #$0100
	BCC.b label_C49571
	PLD
	RTL

;--------------------------------------------------------------------

label_C4958E:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFDE
	TCD
	PLA
	STY.b $20
	STX.b $1E
	STA.b $1C
	LDA.w #$0000
	STA.b $06
	LDA.w #$007F
	STA.b $08
	LDA.w #$0200
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDX.w #$1000
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08F15
	STZ.b $1A
	JMP.w label_C496D9

label_C495C2:
	LDA.b $1A
	STA.b $18
	JMP.w label_C4966E

label_C495C9:
	LDA.b $1E
	AND.w #$0001
	BEQ.b label_C495E6
	LDA.b $18
	ASL
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	STA.b $02
	BRA.b label_C49603

label_C495E6:
	LDA.b $18
	ASL
	STA.b $16
	TAY
	LDA.b ($20),Y
	STA.b $02
	LDA.b $16
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b $02
	STA.b [$0A]
label_C49603:
	LDA.b $18
	ASL
	STA.b $04
	LDY.b $04
	LDA.b ($20),Y
	STA.b $14
	LDY.b $1C
	LDA.b $02
	AND.w #$001F
	TAX
	LDA.b $14
	AND.w #$001F
	JSR.w label_C491EE
	LDX.b $04
	STA.l $7F0200,X
	LDY.b $1C
	LDA.b $02
	AND.w #$03E0
	LSR
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA.b $14
	AND.w #$03E0
	LSR
	LSR
	LSR
	LSR
	LSR
	JSR.w label_C491EE
	LDX.b $04
	STA.l $7F0400,X
	LDY.b $1C
	STY.b $12
	LDY.w #$0400
	LDA.b $02
	AND.w #$7C00
	JSL.l label_C0915B
	TAX
	LDY.w #$0400
	LDA.b $14
	AND.w #$7C00
	JSL.l label_C0915B
	LDY.b $12
	JSR.w label_C491EE
	LDX.b $04
	STA.l $7F0600,X
	INC.b $18
label_C4966E:
	LDA.b $1A
	CLC
	ADC.w #$0010
	CMP.b $18
	BEQ.b label_C4967D
	BCC.b label_C4967D
	JMP.w label_C495C9

label_C4967D:
	LDA.b $1A
	STA.b $16
	BRA.b label_C496C2

label_C49683:
	ASL
	STA.b $02
	CLC
	ADC.b $20
	TAX
	STX.b $14
	LDA.w $0000,X
	AND.w #$001F
	XBA
	AND.w #$FF00
	LDX.b $02
	STA.l $7F0800,X
	LDX.b $14
	LDA.w $0000,X
	AND.w #$03E0
	ASL
	ASL
	ASL
	LDX.b $02
	STA.l $7F0A00,X
	LDX.b $14
	LDA.w $0000,X
	AND.w #$7C00
	LSR
	LSR
	LDX.b $02
	STA.l $7F0C00,X
	LDA.b $16
	INC
	STA.b $16
label_C496C2:
	LDA.b $1A
	CLC
	ADC.w #$0010
	STA.b $02
	LDA.b $16
	CMP.b $02
	BCC.b label_C49683
	LDA.b $1E
	LSR
	STA.b $1E
	LDA.b $02
	STA.b $1A
label_C496D9:
	LDA.b $1A
	CMP.w #$0100
	BCS.b label_C496E5
	BEQ.b label_C496E5
	JMP.w label_C495C2

label_C496E5:
	PLD
	RTS

;--------------------------------------------------------------------

label_C496E7:
	REP.b #$31
	LDY.w #$0200
	JSR.w label_C4958E
	RTL

;--------------------------------------------------------------------

label_C496F0:
	REP.b #$31
	LDY.w #$4476
	JSR.w label_C4958E
	RTL

;--------------------------------------------------------------------

label_C496F9:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE6
	TCD
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.w #$007E
	STA.b $18
	LDA.w #$0000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.w #$0200
	JSL.l label_C08EED
	PLD
	RTL

;--------------------------------------------------------------------

label_C49740:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE6
	TCD
	LDA.w #$0200
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $16
	LDA.b $08
	STA.b $18
	LDA.w #$007E
	STA.b $18
	LDA.b $16
	STA.b $06
	LDA.b $18
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$0000
	STA.b $12
	LDA.w #$007F
	STA.b $14
	LDA.w #$0200
	JSL.l label_C08EED
	LDA.w #$0018
	JSL.l label_C0856B
	PLD
	RTL

;--------------------------------------------------------------------

org $C4984B
label_C4984B:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w #$3492
	STA.b $0E
	LDY.w #$0340
	BRA.b label_C4986E

label_C4985D:
	TAX
	LDA.w $0000,X
	EOR.w #$FFFF
	STA.w $0000,X
	DEY
	LDA.b $0E
	INC
	INC
	STA.b $0E
label_C4986E:
	CPY.w #$0000
	BNE.b label_C4985D
	PLD
	RTS

;--------------------------------------------------------------------

label_C49875:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE6
	TCD
	PLA
	STY.b $18
	STA.b $16
	LDA.b $28
	STA.b $0A
	LDA.b $2A
	STA.b $0C
	LDY.w #$0008
	LDA.w $9F2F
	JSL.l label_C09231
	STA.b $14
	LDA.w $9F31
	CLC
	ADC.b $18
	STA.b $02
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	LDA.b $02
	STA.b $12
	LDA.w #$0000
	STA.b $04
	BRA.b label_C498F9

label_C498B2:
	LDY.w #$0000
	STY.b $10
	BRA.b label_C498EA

label_C498B9:
	SEP.b #$20
	LDA.b [$06]
	EOR.b #$FF
	LDY.b $14
	SEP.b #$10
	JSL.l label_C09251
	EOR.b #$FF
	REP.b #$10
	LDX.b $02
	INX
	STA.b $00
	LDA.w $0000,X
	AND.b $00
	STA.w $0000,X
	LDX.b $02
	STA.w $0000,X
	REP.b #$20
	INC.b $02
	INC.b $02
	LDY.b $10
	INY
	STY.b $10
	INC.b $06
label_C498EA:
	CPY.w #$0008
	BCC.b label_C498B9
	LDA.b $12
	CLC
	ADC.w #$01A0
	STA.b $02
	INC.b $04
label_C498F9:
	LDA.w #$0002
	CLC
	SBC.b $04
	BVS.b label_C49905
	BPL.b label_C498B2
	BRA.b label_C49907

label_C49905:
	BMI.b label_C498B2
label_C49907:
	LDA.w $9F2F
	CLC
	ADC.b $16
	STA.w $9F2F
	LSR
	LSR
	LSR
	CMP.w $9F31
	BNE.b label_C4991B
	JMP.w label_C49999

label_C4991B:
	ASL
	ASL
	ASL
	ASL
	STA.b $16
	STA.w $9F31
	LDA.w #$0008
	SEC
	SBC.b $14
	STA.b $12
	LDA.b $16
	CLC
	ADC.b $18
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	STA.b $14
	STA.b $02
	LDA.w #$0000
	STA.b $04
	BRA.b label_C4998B

label_C49944:
	LDY.w #$0000
	STY.b $0E
	BRA.b label_C4997C

label_C4994B:
	SEP.b #$20
	LDA.b [$06]
	EOR.b #$FF
	LDY.b $12
	SEP.b #$10
	JSL.l label_C0923E
	EOR.b #$FF
	REP.b #$10
	LDX.b $02
	INX
	STA.b $00
	LDA.w $0000,X
	AND.b $00
	STA.w $0000,X
	LDX.b $02
	STA.w $0000,X
	REP.b #$20
	INC.b $02
	INC.b $02
	LDY.b $0E
	INY
	STY.b $0E
	INC.b $06
label_C4997C:
	CPY.w #$0008
	BCC.b label_C4994B
	LDA.b $14
	CLC
	ADC.w #$01A0
	STA.b $02
	INC.b $04
label_C4998B:
	LDA.w #$0002
	CLC
	SBC.b $04
	BVS.b label_C49997
	BPL.b label_C49944
	BRA.b label_C49999

label_C49997:
	BMI.b label_C49944
label_C49999:
	PLD
	RTL

;--------------------------------------------------------------------

label_C4999B:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	SEC
	SBC.w #$0050
	AND.w #$007F
	STA.b $12
	LDA.w #DATA_C3F054
	STA.b $0A
	LDA.w #DATA_C3F054>>16
	STA.b $0C
	LDY.w #$0038
	LDA.b [$0A],Y
	TAX
	LDY.w #$0034
	LDA.b [$0A],Y
	PHA
	INY
	INY
	LDA.b [$0A],Y
	STA.b $08
	PLA
	STA.b $06
	LDA.b $12
	TAY
	TXA
	JSL.l label_C09032
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$003A
	LDA.b [$0A],Y
	STA.b $04
	LDY.w #$0030
	LDA.b [$0A],Y
	PHA
	INY
	INY
	LDA.b [$0A],Y
	STA.b $0C
	PLA
	STA.b $0A
	LDA.b $12
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	TAX
	STX.b $02
	INC.b $02
	LDA.b $02
	CMP.w #$0008
	BCC.b label_C49A36
	BEQ.b label_C49A36
label_C49A0A:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$3492
	LDX.b $04
	LDA.w #$0008
	JSL.l label_C49875
	LDA.b $02
	SEC
	SBC.w #$0008
	STA.b $02
	LDA.b $04
	CLC
	ADC.b $06
	STA.b $06
	LDA.b $02
	CMP.w #$0008
	BEQ.b label_C49A36
	BCS.b label_C49A0A
label_C49A36:
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$3492
	LDX.b $04
	LDA.b $02
	JSL.l label_C49875
	PLD
	RTL

;--------------------------------------------------------------------

org $C49A56
label_C49A56:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEA
	TCD
	LDA.w #$0000
	STA.b $06
	LDA.w #$007F
	STA.b $08
	JSL.l label_C08726
	LDY.w #$6000
	LDX.w #$7C00
	LDA.w #$0000
	JSL.l label_C08E1C
	LDA.w #$0000
	STA.b [$06]
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$6000
	LDX.w #$3800
	SEP.b #$20
	LDA.b #$03
	JSL.l label_C08616
	LDA.w #DATA_E02188
	STA.b $0E
	LDA.w #DATA_E02188>>16
	STA.b $10
	LDX.w #$0008
	LDA.w #$0200
	JSL.l label_C08ED2
	SEP.b #$20
	LDA.b #$18
	STA.w $0030
	LDA.b #$FF
	STA.b $0E
	LDX.w #$0680
	REP.b #$20
	LDA.w #$3492
	JSL.l label_C08EFC
	LDY.w #$0010
	LDX.w #$0000
	STX.b $14
	BRA.b label_C49B20

label_C49AC9:
	TXA
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	TAX
	STZ.w $7DFE,X
	TAX
	STZ.w $7E00,X
	TAX
	STZ.w $7E02,X
	LDA.w #$0003
	STA.b $12
	BRA.b label_C49B01

label_C49AE3:
	ASL
	STA.b $02
	LDX.b $14
	TXA
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.b $02
	TAX
	TYA
	CLC
	ADC.w #$2000
	STA.w $7DFE,X
	INY
	LDA.b $12
	INC
	STA.b $12
label_C49B01:
	CMP.w #$001D
	BCC.b label_C49AE3
	LDX.b $14
	TXA
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	TAX
	STZ.w $7E38,X
	TAX
	STZ.w $7E3A,X
	TAX
	STZ.w $7E3C,X
	LDX.b $14
	INX
	STX.b $14
label_C49B20:
	CPX.w #$0020
	BCC.b label_C49AC9
	LDA.w #$7E7DFE
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$7C00
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #$001A
	STA.w $3C18
	STZ.w $3C1C
	LDA.w #$FFFF
	STA.w $3C1E
	STZ.w $3C20
	STZ.w $3C14
	STZ.w $3C16
	STZ.w $9F2F
	STZ.w $9F31
	JSL.l label_C08744
	PLD
	RTL

;--------------------------------------------------------------------

label_C49B6E:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	JSR.w label_C4984B
	LDY.w #$01A0
	LDA.w $9F2D
	JSL.l label_C09032
	STA.b $14
	CLC
	ADC.w #$04E0
	CMP.w #$3400
	BEQ.b label_C49B92
	BCS.b label_C49B95
label_C49B92:
	JMP.w label_C49C16

label_C49B95:
	LDA.b $14
	STA.b $02
	LDA.w #$3400
	SEC
	SBC.b $02
	STA.b $12
	BEQ.b label_C49BD4
	LDA.w #$7E3492
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w $9F2D
	LDY.w #$00D0
	JSL.l label_C08FF7
	CLC
	ADC.w #$6150
	TAY
	LDA.b $12
	TAX
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
label_C49BD4:
	LDY.w #$01A0
	LDA.w $9F2D
	JSL.l label_C09032
	STA.b $14
	CLC
	ADC.w #$04E0
	SEC
	SBC.w #$3400
	TAX
	BEQ.b label_C49C47
	LDA.b $14
	STA.b $02
	LDA.w #$6892
	SEC
	SBC.b $02
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$6150
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	BRA.b label_C49C47

label_C49C16:
	LDA.w #$7E3492
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w $9F2D
	LDY.w #$00D0
	JSL.l label_C08FF7
	CLC
	ADC.w #$6150
	TAY
	LDX.w #$04E0
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
label_C49C47:
	LDA.w #$FFFF
	STA.w $3C1E
	STZ.w $3C20
	JSL.l label_C08756
	PLD
	RTL

;--------------------------------------------------------------------

label_C49C56:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF1
	TCD
	PLA
	CLC
	ADC.w $3C16
	STA.w $3C16
	STZ.w $3C14
	LSR
	LSR
	LSR
	INC
	CLC
	ADC.w $9F2D
	STA.w $9F2D
	CMP.w #$0020
	BCC.b label_C49C81
	SEC
	SBC.w #$0020
	STA.w $9F2D
label_C49C81:
	JSL.l label_C08F8B
	SEP.b #$20
	LDA.b #$FF
	STA.b $0E
	LDX.w #$0680
	REP.b #$20
	LDA.w #$3492
	JSL.l label_C08EFC
	LDA.w $3C16
	AND.w #$0007
	STA.w $3C16
	STZ.w $9F2F
	STZ.w $9F31
	PLD
	RTL

;--------------------------------------------------------------------

label_C49CA8:
	REP.b #$31
	AND.w #$00FF
	CLC
	ADC.w #$0008
	CLC
	ADC.w $9F2F
	STA.w $9F2F
	LSR
	LSR
	LSR
	ASL
	ASL
	ASL
	ASL
	STA.w $9F31
	RTL

;--------------------------------------------------------------------

label_C49CC3:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TAX
	DEC
	LDY.w #$005F
	JSL.l label_C08FF7
	CLC
	ADC.w #$99CE
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	LDX.w #$0000
	STX.b $10
	BRA.b label_C49CF8

label_C49CEB:
	INC.b $06
	LDA.b $0E
	JSL.l label_C4999B
	LDX.b $10
	INX
	STX.b $10
label_C49CF8:
	CPX.w #$0005
	BCS.b label_C49D12
	REP.b #$20
	LDA.b [$06]
	AND.w #$00FF
	STA.b $0E
	CLC
	SBC.w #$004F
	BVS.b label_C49D10
	BPL.b label_C49CEB
	BRA.b label_C49D12

label_C49D10:
	BMI.b label_C49CEB
label_C49D12:
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

label_C49D16:
	REP.b #$31
	TAX
	JSL.l label_C4999B
	RTL

;--------------------------------------------------------------------

; Note: Routine that writes the intro cutscene text.

org $C49EA4
DATA_C49EA4:
	dd EB_Year199XString
	dd EB_OnettLocationString
	dd EB_NessHouseString
	dd $00E10BD2
	dd $00E10BFD
	dd $00E10C1B
	dd $00E10C38
	dd $00E10C61

label_C49EC4:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	LDX.w #$10E4
	LDA.w $0000,X
	STA.b $02
	ORA.w #$C000
	STA.w $0000,X
	JSL.l label_C49A56
	LDA.w #DATA_C49EA4
	STA.b $0A
	LDA.w #DATA_C49EA4>>16
	STA.b $0C
	LDA.b $0E
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	STZ.w $5E6E
label_C49F04:
	LDA.b [$06]
	AND.w #$00FF
	INC.b $06
	CMP.w #$0000
	BEQ.b label_C49F72
	CMP.w #$0002
	BEQ.b label_C49F26
	CMP.w #$0009
	BEQ.b label_C49F32
	CMP.w #$0001
	BEQ.b label_C49F46
	CMP.w #$0008
	BEQ.b label_C49F54
	BRA.b label_C49F66

label_C49F26:
	LDA.b [$06]
	AND.w #$00FF
	STA.w $9F2D
	INC.b $06
	BRA.b label_C49F04

label_C49F32:
	LDA.w #$0018
	JSL.l label_C49B6E
	JSL.l label_C08756
	LDA.w #$0018
	JSL.l label_C49C56
	BRA.b label_C49F04

label_C49F46:
	SEP.b #$20
	LDA.b [$06]
	REP.b #$20
	INC.b $06
	JSL.l label_C49CA8
	BRA.b label_C49F04

label_C49F54:
	LDA.b [$06]
	AND.w #$00FF
	TAY
	INC.b $06
	LDX.w #$000C
	TYA
	JSL.l label_C49CC3
	BRA.b label_C49F04

label_C49F66:
	LDY.w #$000C
	LDX.w #$0000
	JSL.l label_C49D16
	BRA.b label_C49F04

label_C49F72:
	SEP.b #$20
	LDA.b #$04
	STA.w $001A
	LDY.w #$0000
	LDX.w #$0003
	REP.b #$20
	LDA.w #$0001
	JSL.l label_C087CE
	LDX.w #$0000
	STX.b $0E
	BRA.b label_C49F98

label_C49F8F:
	JSL.l label_C08756
	LDX.b $0E
	INX
	STX.b $0E
label_C49F98:
	CPX.w #$00B4
	BCC.b label_C49F8F
	LDY.w #$0000
	LDX.w #$0003
	LDA.w #$0001
	JSL.l label_C08814
	SEP.b #$20
	LDA.b #$17
	STA.w $001A
	LDY.w #$7DFE
	LDX.w #$0380
	BRA.b label_C49FC4

label_C49FB9:
	REP.b #$20
	LDA.w #$0000
	STA.w $0000,Y
	INY
	INY
	DEX
label_C49FC4:
	BNE.b label_C49FB9
	REP.b #$20
	LDA.w #$00FF
	STA.w $5E6E
	JSL.l label_C08726
	JSL.l label_C4800B
	LDA.b $02
	STA.w $10E4
	JSL.l label_C08744
	PLD
	RTL

;--------------------------------------------------------------------

org $C49FE1
BattleCommandText:
;$C49FE1
	table "Tables/Fonts/MainFont.txt"
	db "Bash",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Goods",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Auto Fight",$00,$00,$00,$00,$00,$00
	db "PSI",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Defend",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Pray",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Shoot",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Spy",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Run Away",$00,$00,$00,$00,$00,$00,$00,$00
	db "Mirror",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Do Nothing"
cleartable

;--------------------------------------------------------------------

org $C4A309
PrayerTextPointers:
;$C4A309
	dd $00C8F9CE
	dd $00C8F956
	dd $00C8F935
	dd $00C8F9F0
	dd $00C8F9B3
	dd $00C8F973
	dd $00C8FA0D
	dd $00C8FA2F
	dd $00C8FA51
	dd $00C8F992

;--------------------------------------------------------------------

; Note: Seems to be the routine that decompresses Giygas's graphics for the "War On Giygas" screen.

org $C4A377
label_C4A377:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE0
	TCD
	LDA.w #$0003
	JSL.l label_C08D79
	LDY.w #$0000
	LDX.w #$7800
	TYA
	JSL.l label_C08D9E
	LDY.w #$6000
	LDX.w #$7C00
	LDA.w #$0000
	JSL.l label_C08DDE
	LDA.w #DATA_CAF038
	STA.b $0A
	LDA.w #DATA_CAF038>>16
	STA.b $0C
	LDA.w #$0000
	STA.b $06
	LDA.w #$007F
	STA.b $08
	LDA.b $06
	STA.b $1C
	LDA.b $08
	STA.b $1E
	LDA.w #DATA_CAD7A1
	STA.b $06
	LDA.w #DATA_CAD7A1>>16
	STA.b $08
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $1C
	STA.b $06
	LDA.b $1E
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.w #$6000
	LDX.w #$2000
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	PHA
	LDA.w #DATA_CAD93D
	STA.b $0A
	LDA.w #DATA_CAD93D>>16
	STA.b $0C
	PLA
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $1C
	STA.b $06
	LDA.b $1E
	STA.b $08
	LDA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	JSL.l GraphicsDecompressionRoutines_Main
	LDA.w #$0000
	STA.b $1A
	BRA.b label_C4A47A

label_C4A455:
	STA.b $06
	STZ.b $08
	CLC
	LDA.b $06
	ADC.w #$0001
	STA.b $06
	LDA.b $08
	ADC.w #$007F
	STA.b $08
	SEP.b #$20
	LDA.b [$06]
	AND.b #$DF
	ORA.b #$08
	STA.b [$06]
	REP.b #$20
	LDA.b $1A
	INC
	INC
	STA.b $1A
label_C4A47A:
	CMP.w #$0800
	BCC.b label_C4A455
	LDA.w #$0000
	STA.b $0E
	LDA.w #$007F
	STA.b $10
	LDY.w #$7C00
	LDX.w #$0800
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.w #DATA_CADCA1
	STA.b $0A
	LDA.w #DATA_CADCA1>>16
	STA.b $0C
	LDA.w #$1397
	LDX.b $0A
	STX.b $06
	LDX.b $0C
	STX.b $08
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w #$ADD4
	JSL.l label_C2CFE5
	LDA.w #$AE20
	STA.b $02
	LDA.w #$0240
	LDX.b $02
	STA.w $0000,X
	LDY.w #$ADE0
	STY.b $18
	LDA.w #DATA_CADAD9
	STA.b $06
	LDA.w #DATA_CADAD9>>16
	STA.b $08
	LDA.b $06
	STA.b $1C
	LDA.b $08
	STA.b $1E
	LDA.w #$1398
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	LDY.w #$0002
	LDA.b [$06],Y
	TAY
	LDA.b [$06]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDY.b $18
	TYA
	JSL.l label_C08ED2
	LDA.b [$0A]
	AND.w #$00FF
	ASL
	ASL
	LDX.b $1C
	STX.b $06
	LDX.b $1E
	STX.b $08
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	LDA.w #$AE00
	JSL.l label_C08ED2
	LDY.b $18
	TYA
	STA.b $06
	PHB
	SEP.b #$20
	PLA
	STA.b $08
	STZ.b $09
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0020
	STX.b $16
	LDX.b $02
	LDA.w $0000,X
	LDX.b $16
	JSL.l label_C08ED2
	SEP.b #$20
	LDA.b #$02
	STA.w $ADD4
	LDX.w #$0000
	REP.b #$20
	LDA.w #$ADD4
	JSL.l label_C2C92D
	SEP.b #$20
	STZ.w $AE4B
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

org $C4A591
DATA_C4A591:
	db $00,$0E,$17,$17,$0C,$FB,$EE,$F0
	db $00,$0F,$0C,$FA,$F2,$00,$0D,$02
	db $F5,$00,$0A,$FC,$F9,$08,$00,$FA
	db $07,$FE,$FD,$06,$FB,$03,$00,$FE
	db $03,$FC,$04,$FC,$04,$FD,$03,$FD
	db $03,$FE,$02,$FF,$00,$01,$FE,$02
	db $FF,$FF,$02,$FF,$00,$01,$FF,$FF
	db $01,$00,$FF,$00,$01,$3D,$00,$80

;--------------------------------------------------------------------

org $C4A67E
label_C4A67E:

;--------------------------------------------------------------------

org $C4A7B0
label_C4A7B0:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFE9
	TCD
	LDA.w $AEC2
	AND.w #$00FF
	BNE.b label_C4A7C3
	JMP.w label_C4AC53

label_C4A7C3:
	LDY.w #$AECC
	LDA.w #$0000
	STA.b $06
	LDA.w #$0000
	STA.b $08
	LDA.w $0000,Y
	STA.b $0A
	LDA.w $0002,Y
	STA.b $0C
	CMP.b $08
	BNE.b label_C4A7E2
	LDA.b $0A
	CMP.b $06
label_C4A7E2:
	BNE.b label_C4A7E7
	JMP.w label_C4AA1A

label_C4A7E7:
	LDX.w #$AEC2
	SEP.b #$20
	LDA.w $0000,X
	DEC
	STA.w $AEC2
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C4A7FD
	JMP.w label_C4A915

label_C4A7FD:
	LDA.w $0000,Y
	STA.b $0A
	LDA.w $0002,Y
	STA.b $0C
	SEP.b #$20
	LDA.b [$0A]
	STA.w $AEC2
	REP.b #$20
	AND.w #$00FF
	BNE.b label_C4A822
	LDA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
	JMP.w label_C4AC53

label_C4A822:
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDY.w #$0002
	LDA.b [$06],Y
	CMP.w #$8000
	BEQ.b label_C4A839
	STA.w $AED0
label_C4A839:
	LDA.w $AECC
	STA.b $06
	LDA.w $AECE
	STA.b $08
	LDY.w #$0004
	LDA.b [$06],Y
	CMP.w #$8000
	BEQ.b label_C4A850
	STA.w $AED2
label_C4A850:
	LDA.w $AECC
	STA.b $06
	LDA.w $AECE
	STA.b $08
	LDY.w #$0006
	LDA.b [$06],Y
	CMP.w #$8000
	BEQ.b label_C4A867
	STA.w $AED4
label_C4A867:
	LDA.w $AECC
	STA.b $06
	LDA.w $AECE
	STA.b $08
	LDY.w #$0008
	LDA.b [$06],Y
	CMP.w #$8000
	BEQ.b label_C4A87E
	STA.w $AED6
label_C4A87E:
	LDY.w #$AECC
	STY.b $15
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDY.w #$000A
	LDA.b [$06],Y
	STA.w $AED8
	LDY.b $15
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDY.w #$000C
	LDA.b [$06],Y
	STA.w $AEDA
	LDY.b $15
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDY.w #$000E
	LDA.b [$06],Y
	STA.w $AEDC
	LDY.b $15
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDY.w #$0010
	LDA.b [$06],Y
	STA.w $AEDE
	LDY.b $15
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDY.w #$0012
	LDA.b [$06],Y
	STA.w $AEE0
	LDY.b $15
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDY.w #$0014
	LDA.b [$06],Y
	STA.w $AEE2
	LDY.b $15
	LDA.w $0000,Y
	STA.b $06
	LDA.w $0002,Y
	STA.b $08
	LDA.w #$0016
	CLC
	ADC.b $06
	STA.b $06
	STA.w $0000,Y
	LDA.b $08
	STA.w $0002,Y
label_C4A915:
	LDX.w #$AED0
	LDA.w $0000,X
	CLC
	ADC.w $AED8
	STA.w $0000,X
	LDX.w #$AED2
	LDA.w $0000,X
	CLC
	ADC.w $AEDA
	STA.w $0000,X
	LDX.w #$AEDC
	LDA.w $0000,X
	CLC
	ADC.w $AEE0
	STA.w $0000,X
	LDY.w #$AEDE
	LDA.w $0000,Y
	CLC
	ADC.w $AEE2
	STA.w $0000,Y
	LDA.w $0000,X
	STA.b $15
	STA.b $02
	LDA.w #$0000
	CLC
	SBC.b $02
	BVC.b label_C4A95C
	BPL.b label_C4A978
	BRA.b label_C4A95E

label_C4A95C:
	BMI.b label_C4A978
label_C4A95E:
	LDX.w #$AED4
	LDA.b $15
	EOR.w #$FFFF
	INC
	STA.b $02
	LDA.w $0000,X
	CMP.b $02
	BCS.b label_C4A978
	LDA.w #$0000
	STA.w $0000,X
	BRA.b label_C4A985

label_C4A978:
	LDX.w #$AED4
	LDA.w $0000,X
	CLC
	ADC.w $AEDC
	STA.w $0000,X
label_C4A985:
	LDA.w $AEDE
	STA.b $15
	STA.b $02
	LDA.w #$0000
	CLC
	SBC.b $02
	BVC.b label_C4A998
	BPL.b label_C4A9B4
	BRA.b label_C4A99A

label_C4A998:
	BMI.b label_C4A9B4
label_C4A99A:
	LDX.w #$AED6
	LDA.b $15
	EOR.w #$FFFF
	INC
	STA.b $02
	LDA.w $0000,X
	CMP.b $02
	BCS.b label_C4A9B4
	LDA.w #$0000
	STA.w $0000,X
	BRA.b label_C4A9C1

label_C4A9B4:
	LDX.w #$AED6
	LDA.w $0000,X
	CLC
	ADC.w $AEDE
	STA.w $0000,X

label_C4A9C1:
	LDA.w $AED4
	BNE.b label_C4A9E1
	LDA.w $AED6
	BNE.b label_C4A9E1
	SEP.b #$20
	STZ.w $AEC2
	REP.b #$20
	LDA.w #$0000
	STA.w $AECC
	LDA.w #$0000
	STA.w $AECE
	JMP.w label_C4AC53

label_C4A9E1:
	LDA.w $AED6
	XBA
	AND.w #$00FF
	STA.b $0E
	LDA.w $AED4
	XBA
	AND.w #$00FF
	TAY
	LDX.w $AED2
	LDA.w $AED0
	JSL.l $C0B149
	LDX.w #$0041
	LDA.w #$0003
	JSL.l $C0B0EF
	LDA.w $AEC6
	AND.w #$00FF
	TAX
	LDA.w $AEC8
	AND.w #$00FF
	JSL.l label_C0B047
	JMP.w label_C4AC53

label_C4AA1A:
	LDX.w #$AEC2
	SEP.b #$20
	LDA.w $0000,X
	DEC
	STA.w $AEC2
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C4AA30
	JMP.w label_C4AC53

label_C4AA30:
	LDX.w #$AEC4
	STX.b $15
	REP.b #$20
	LDA.w $0000,X
	AND.w #$00FF
	BNE.b label_C4AA42
	JMP.w label_C4AB20

label_C4AA42:
	SEP.b #$20
	LDA.w $AEC3
	STA.w $AEC2
	LDY.w #$AEC9
	STY.b $13
	REP.b #$20
	LDA.w $0000,Y
	AND.w #$00FF
	INC
	INC
	INC
	JSL.l label_C0AE34
	LDY.b $13
	SEP.b #$20
	LDA.w $0000,Y
	INC
	STA.w $0000,Y
	AND.b #$01
	STA.w $0000,Y
	REP.b #$20
	LDA.w $AEC7
	AND.w #$00FF
	BNE.b label_C4AAC3
	LDX.w #$AEC5
	STX.b $15
	SEP.b #$20
	LDA.w $0000,X
	STA.b $12
	REP.b #$20
	LDA.w #$0000
	STA.b $06
	LDA.w #$00CE
	STA.b $08
	LDA.b $12
	AND.w #$00FF
	ASL
	TAX
	LDA.l $CEDC45,X
	CLC
	ADC.b $06
	STA.b $06
	SEP.b #$20
	LDA.b $12
	INC
	LDX.b $15
	STA.w $0000,X
	REP.b #$20
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w $0000,Y
	AND.w #$00FF
	INC
	INC
	INC
	JSL.l $C0B0B8
	BRA label_C4AB00

label_C4AAC3:
	LDX.w #$AEC5
	SEP.b #$20
	LDA.w $0000,X
	DEC
	STA.b $12
	STA.w $0000,X
	REP.b #$20
	LDA.w #$0000
	STA.b $06
	LDA.w #$00CE
	STA.b $08
	LDA.b $12
	AND.w #$00FF
	ASL
	TAX
	LDA.l $CEDC45,X
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.w $0000,Y
	AND.w #$00FF
	INC
	INC
	INC
	JSL.l $C0B0B8
label_C4AB00:
	LDA.w $AEC6
	AND.w #$00FF
	TAX
	LDA.w $AEC8
	AND.w #$00FF
	JSL.l label_C0B047
	LDX.w #$AEC4
	SEP.b #$20
	LDA.w $0000,X
	DEC
	STA.w $0000,X
	JMP.w label_C4AC53

label_C4AB20:
	LDA.w #$AEE4
	STA.b $02
	LDX.b $02
	LDA.w $0000,X
	AND.w #$00FF
	BNE.b label_C4AB32
	JMP.w label_C4AC07

label_C4AB32:
	LDY.b #$E6
	LDX.w $20E2
	LDA.w $0000,Y
	DEC
	STA.w $0000,Y
	REP.b #$20
	AND.w #$00FF
	BEQ.b label_C4ABB0
	LDA.w #$DD41
	STA.b $06
	LDA.w #$00CE
	STA.b $08
	LDX.b $02
	LDA.w $0000,X
	AND.w #$00FF
	ASL
	ASL
	INC
	INC
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	SEP.b #$20
	LDA.b [$0A]
	LDX.b $15
	STA.w $0000,X
	LDY.w #$AEC5
	LDX.b $02
	REP.b #$20
	LDA.w $0000,X
	AND.w #$00FF
	ASL
	ASL
	INC
	CLC
	ADC.b $06
	STA.b $06
	SEP.b #$20
	LDA.b [$06]
	STA.b $12
	STA.w $0000,Y
	REP.b #$20
	LDA.w $AEC7
	AND.w #$00FF
	BNE.b label_C4AB9C
	JMP.w label_C4AA30

label_C4AB9C:
	LDX.b $15
	SEP.b #$20
	LDA.w $0000,X
	STA.b $00
	LDA.b $12
	CLC
	ADC.b $00
	STA.w $0000,Y
	JMP.w label_C4AA30

label_C4ABB0:
	LDX.w #$AEE5
	SEP.b #$20
	LDA.w $0000,X
	INC
	STA.w $0000,X
	REP.b #$20
	AND.w #$00FF
	CMP.w #$0001
	BEQ.b label_C4ABD2
	CMP.w #$0002
	BEQ.b label_C4ABE0
	CMP.w #$0003
	BEQ.b label_C4ABEE
	BRA.b label_C4ABFA

label_C4ABD2:
	SEP.b #$20
	LDA.b #$04
	STA.w $0000,Y
	LDA.b #$03
	STA.w $AEC3
	BRA.b label_C4ABFA

label_C4ABE0:
	SEP.b #$20
	LDA.b #$06
	STA.w $0000,Y
	LDA.b #$02
	STA.w $AEC3
	BRA.b label_C4ABFA

label_C4ABEE:
	SEP.b #$20
	LDA.b #$0C
	STA.w $0000,Y
	LDA.b #$01
	STA.w $AEC3
label_C4ABFA:
	REP.b #$20
	LDA.w $AEE6
	AND.w #$00FF
	BEQ.b label_C4AC07
	JMP.w label_C4AA30

label_C4AC07:
	LDX.w #$AECA
	LDA.w $0000,X
	AND.w #$00FF
	BEQ.b label_C4AC22
	SEP.b #$20
	LDA.b #$01
	STA.w $AEC2
	LDA.w $0000,X
	DEC
	STA.w $0000,X
	BRA.b label_C4AC53

label_C4AC22:
	LDA.w $AECB
	AND.w #$00FF
	BEQ.b label_C4AC53
	LDA.w $AEC9
	AND.w #$00FF
	INC
	INC
	INC
	JSL.l label_C0AE34
	LDX.w #$0000
	TXA
	JSL.l label_C0B047
	JSL.l label_C2DE96
	LDY.w #$0000
	TYX
	TYA
	JSL.l label_C0B01A
	LDA.w $AD8A
	JSL.l label_C0AFCD

label_C4AC53:
	REP.b #$20
	PLD
	RTL

;--------------------------------------------------------------------

org $C4B1B8
label_C4B1B8:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	STY.b $16
	STA.b $04
	CPY.w #$00FF
	BNE.b label_C4B1D0
	LDA.b $04
	JMP.w label_C4B269

label_C4B1D0:
	LDA.w #DATA_EF133F
	STA.b $0A
	LDA.w #DATA_EF133F>>16
	STA.b $0C
	TXA
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	SEP.b #$20
	LDY.w #$0001
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	ASL
	STA.b $02
	SEP.b #$20
	LDY.w #$0008
	LDA.b [$06],Y
	REP.b #$20
	AND.w #$00FF
	STA.b $14
	LDY.b $16
	TYA
	ASL
	CLC
	ADC.w #$0009
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$FFFE
	STA.b $12
	STA.b $06
	LDA.b $14
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDY.b $04
	LDX.b $02
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.b $02
	CLC
	ADC.b $12
	STA.b $12
	STA.b $06
	LDA.b $14
	STA.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $04
	CLC
	ADC.w #$0100
	TAY
	LDX.b $02
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08616
	LDA.b $02
	LSR
	STA.b $02
	LDA.b $04
	CLC
	ADC.b $02
label_C4B269:
	PLD
	RTS

label_C4B26B:							; Note: Main entry
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEC
	TCD
	LDA.w #$5600
	STA.b $12
	LDA.w #DATA_C40E32
	STA.b $0A
	LDA.w #DATA_C40E32>>16
	STA.b $0C
	LDA.w #$0000
	STA.b $02
	BRA.b label_C4B2C9

label_C4B289:
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	SEP.b #$20
	LDY.w #$0002
	LDA.b [$0A],Y
	REP.b #$20
	AND.w #$00FF
	TAY
	LDA.b [$06]
	TAX
	LDA.b $12
	JSR.w label_C4B1B8
	STA.b $10
	SEP.b #$20
	LDY.w #$0003
	LDA.b [$0A],Y
	REP.b #$20
	AND.w #$00FF
	TAY
	LDA.b [$06]
	TAX
	LDA.b $10
	JSR.w label_C4B1B8
	STA.b $12
	LDA.w #$0004
	CLC
	ADC.b $0A
	STA.b $0A
	INC.b $02
label_C4B2C9:
	LDA.l DATA_C40E31
	AND.w #$00FF
	STA.b $04
	LDA.b $02
	CMP.b $04
	BCC.b label_C4B289
	LDA.w #$0000
	STA.b $0E
	BRA.b label_C4B322

label_C4B2DF:
	ASL
	TAX
	LDA.w #DATA_C40EE4
	STA.b $06
	LDA.w #DATA_C40EE4>>16
	STA.b $08
	LDA.b $06
	STA.w $2EB6,X
	LDA.w #DATA_C40EB0
	STA.b $06
	LDA.w #DATA_C40EB0>>16
	STA.b $08
	LDA.b $06
	STA.w $2F6A,X
	LDA.w #DATA_C40EF0
	STA.b $06
	LDA.w #DATA_C40EF0>>16
	STA.b $08
	LDA.b $06
	STA.w $301E,X
	LDA.w #DATA_C40F04
	STA.b $06
	LDA.w #DATA_C40F04>>16
	STA.b $08
	LDA.b $06
	STA.w $30D2,X
	LDA.b $0E
	INC
	STA.b $0E
label_C4B322:
	CMP.w #$001E
	BCC.b label_C4B2DF
	PLD
	RTL

;--------------------------------------------------------------------

org $C4B587
label_C4B587:
	REP.b #$31
	LDX.w $B43A
	CLC
	ADC.w $B43A
	STA.w $B43A
	TXA
	RTS

;--------------------------------------------------------------------

label_C4B595:
	REP.b #$31
	LDA.w $B43A
	SEC
	SBC.w $B438
	RTL

;--------------------------------------------------------------------

label_C4B59F:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFCC
	TCD
	PLA
	STY.b $04
	STX.b $02
	STA.b $32
	LDA.b $54
	STA.b $30
	LDY.b $52
	STY.b $2E
	LDA.b $50
	STA.b $2C
	LDA.b $4E
	STA.b $2A
	LDX.b $4C
	STX.b $28
	LDA.b $4A
	STA.b $26
	LDA.b $48
	STA.b $24
	LDX.b $46
	STX.b $22
	LDA.b $42
	STA.b $06
	LDA.b $44
	STA.b $08
	STZ.b $20
	LDA.b $02
	STA.w $B438
	LDA.b $02
	STA.w $B43A
	LDA.b $02
	CLC
	ADC.b $32
	STA.w $B43C
	LDX.b $04
	LDA.w $0000,X
	STA.w $B400
	LDX.b $04
	LDY.w $0002,X
	STY.w $B402
	LDX.b $22
	STX.w $B404
	JSL.l label_C09032
	STA.w $B406
	LDA.b $06
	STA.w $B3FC
	LDA.b $08
	STA.w $B3FE
	LDA.b $30
	ASL
	STA.b $02
	INC
	INC
	JSR.w label_C4B587
	STA.b $1E
	STA.w $B408
	CLC
	ADC.b $02
	STA.w $B40A
	LDA.b $1E
	STA.w $B40E
	STA.w $B40C
	LDA.w $B402
	EOR.w #$FFFF
	INC
	STA.w $B410
	LDA.w #$0001
	STA.w $B412
	LDA.w $B402
	STA.w $B414
	LDA.w #$FFFF
	STA.w $B416
	STA.w $B418
	STZ.w $B41A
	STZ.w $B41C
	LDA.w #$0001
	STA.w $B41E
	STA.w $B420
	STZ.w $B422
	STZ.w $B424
	LDA.w #$FFFF
	STA.w $B426
	STA.w $B428
	LDA.w #$0001
	STA.w $B42A
	STA.w $B42C
	STA.w $B42E
	STA.w $B430
	LDA.w #$FFFF
	STA.w $B432
	STA.w $B434
	STA.w $B436
	LDA.b $2E
	CMP.w #$00FB
	BCC.b label_C4B692
	LDA.w #$00FB
	STA.b $2E
label_C4B692:
	LDA.b $28
	ASL
	JSR.w label_C4B587
	STA.b $1C
	LDY.b $1C
	LDX.b $2A
	LDA.b $28
	JSR.w label_C4B859
	LDA.b $2E
	ASL
	ASL
	JSR.w label_C4B587
	STA.b $2A
	JSR.w label_C4B7A5
	STZ.b $1A
	STZ.b $18
	LDA.w #$0000
	STA.b $04
	JMP.w label_C4B796

label_C4B6BB:
	LDA.b $04
	ASL
	TAY
	LDA.b ($1C),Y
	STA.b $02
	STA.b $32
	LDX.b $02
	LDA.w $0002,X
	CMP.b $1A
	BNE.b label_C4B6D7
	LDX.b $02
	LDA.w $0004,X
	CMP.b $18
	BEQ.b label_C4B734
label_C4B6D7:
	LDY.w #$0001
	STY.b $16
	LDX.b $02
	LDA.w $0002,X
	STA.b $1A
	LDX.b $02
	LDA.w $0004,X
	STA.b $18
	LDA.b $04
	INC
	STA.b $1E
	BRA.b label_C4B70E

label_C4B6F1:
	ASL
	TAY
	LDA.b ($1C),Y
	TAX
	LDA.w $0002,X
	CMP.b $1A
	BNE.b label_C4B712
	LDA.w $0004,X
	CMP.b $18
	BNE.b label_C4B712
	LDY.b $16
	INY
	STY.b $16
	LDA.b $1E
	INC
	STA.b $1E
label_C4B70E:
	CMP.b $28
	BCC.b label_C4B6F1
label_C4B712:
	LDA.b $04
	ASL
	CLC
	ADC.b $1C
	TAX
	LDY.b $16
	TYA
	JSR.w label_C4B923
	LDY.b $16
	STY.b $0E
	LDA.b $2E
	STA.b $10
	LDA.b $2C
	STA.b $12
	LDY.b $02
	LDX.b $26
	LDA.b $24
	JSR.w label_C4BAF6
label_C4B734:
	LDY.b $2A
	LDX.b $2E
	LDA.b $02
	CLC
	ADC.w #$0006
	JSR.w label_C4BD9A
	LDX.b $02
	STA.w $000E,X
	LDX.b $2A
	JSR.w label_C4BF7F
	STA.b $14
	ASL
	ASL
	JSR.w label_C4B587
	STA.b $22
	STZ.b $1E
	BRA.b label_C4B778

label_C4B758:
	LDA.b $1E
	ASL
	ASL
	TAX
	STX.b $02
	LDA.b $22
	CLC
	ADC.b $02
	TAY
	TXA
	CLC
	ADC.b $2A
	TAX
	LDA.w $0000,X
	STA.w $0000,Y
	LDA.w $0002,X
	STA.w $0002,Y
	INC.b $1E
label_C4B778:
	LDA.b $1E
	CMP.b $14
	BCC.b label_C4B758
	LDA.b $14
	LDX.b $32
	STX.b $02
	STA.w $000A,X
	LDA.b $22
	LDX.b $02
	STA.w $000C,X
	LDA.b $14
	BEQ.b label_C4B794
	INC.b $20
label_C4B794:
	INC.b $04
label_C4B796:
	LDA.b $04
	CMP.b $28
	BCS.b label_C4B7A1
	BEQ.b label_C4B7A1
	JMP.w label_C4B6BB

label_C4B7A1:
	LDA.b $20
	PLD
	RTL

;--------------------------------------------------------------------

label_C4B7A5:

;--------------------------------------------------------------------

org $C4B859
label_C4B859:

;--------------------------------------------------------------------

org $C4B923
label_C4B923:

;--------------------------------------------------------------------

org $C4BAF6
label_C4BAF6:

;--------------------------------------------------------------------

org $C4BD9A
label_C4BD9A:

;--------------------------------------------------------------------

org $C4BF7F
label_C4BF7F:

;--------------------------------------------------------------------

org $C4C05E
NameEntryScreenStrings:
;$C4C05E
	table "Tables/Fonts/MainFont.txt"
	
	db ": "
	db "Start New Game"
.Level:
	db "Level:"
.TextSpeed:
	db "Text Speed:"
.Fast:
	db "Fast",$00,$00,$00
	db "Medium",$00
	db "Slow",$00,$00,$00
.Continue:
	db "Continue",$00
.CopyFile:
	db "Copy",$00
.DeleteFile:
	db "Delete",$00
.SetUp:
	db "Set Up",$00
.CopyToWhere:
	db "Copy to where?"
.WantToDelete:
	db "Are you sure you want to delete?"
.DeleteNo:
	db "No",$00
.DeleteYes:
	db "Yes",$00
	db "Please select text speed."
.SoundSettings:
	db "Please select sound setting."
.Stereo:
	db "Stereo",$00
	db "Mono",$00,$00,$00
.WindowStyle:
	db "Which style of windows do you prefer?"
.PlainFlavor:
	db "Plain flavor",$00
.MintFlavor:
	db "Mint flavor",$00
.StrawberryFlavor:
	db "Strawberry flavor",$00
.BananaFlavor:
	db "Banana flavor",$00
.PeanutFlavor:
	db "Peanut flavor",$00
.NameNess:
	db "Please name him.",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Name her, too.",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Name your friend.",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Name another friend.",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Name your pet.",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Favorite homemade food?",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "What's your favorite thing?",$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db "Favorite food:"
.Coolest:
	db "Coolest thing:"
.AreYouSure:
	db "Are you sure?"
.ConfirmYes:
	db "Yep",$00
.ConfirmNo:
	db "Nope",$00
	
cleartable

;--------------------------------------------------------------------

org $C4C8A4
label_C4C8A4:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	STZ.w $B4A4
	STZ.w $B4A6
	LDA.w #$7F7C00
	STA.b $06
	LDA.w #$7F7C00>>16
	STA.b $08
	LDA.b $06
	STA.w $B4AA
	LDA.b $08
	STA.w $B4AC
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDX.w #$0400
	SEP.b #$20
	LDA.b #$00
	JSL.l label_C08F15
	PLD
	RTS

;--------------------------------------------------------------------

label_C4C8DB:
	REP.b #$31
	LDX.w $B4A4
	CLC
	ADC.w $B4A4
	STA.w $B4A4
	TXA
	RTS

;--------------------------------------------------------------------

label_C4C8E9:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF2
	TCD
	PLA
	STA.b $06
	STZ.b $08
	CLC
	LDA.b $06
	ADC.w #$0000
	STA.b $06
	LDA.b $08
	ADC.w #$007F
	STA.b $08
	BRA.b label_C4C913

label_C4C908:
	SEP.b #$20
	LDA.b #$00
	STA.b [$06]
	REP.b #$20
	INC.b $06
	DEX
label_C4C913:
	CPX.w #$0000
	BNE.b label_C4C908
	PLD
	RTS

;--------------------------------------------------------------------

label_C4C91A:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFDE
	TCD
	PLA
	STX.b $02
	STX.b $20
	STA.b $04
	STA.b $1E
	LDA.b $02
	BNE.b label_C4C933
	JMP.w label_C4CB4D

label_C4C933:
	LDA.b $02
	CMP.w #$0001
	BNE.b label_C4C93D
	JMP.w label_C4CB4D

label_C4C93D:
	LDA.b $02
	CMP.w #$0006
	BNE.b label_C4C947
	JMP.w label_C4CB4D

label_C4C947:
	LDA.b $04
	ASL
	TAX
	LDA.w $2ABA,X
	BNE.b label_C4C953
	JMP.w label_C4CB4D

label_C4C953:
	LDA.w $B4A8
	CMP.w #$FFFF
	BNE.b label_C4C978
	JSR.w label_C4C8A4
	STZ.w $0A3E
	STZ.w $0A3C
	STZ.w $0A3A
	STZ.w $0A38
	LDY.w #$0000
	TYX
	LDA.w #$035B
	JSL.l label_C092F5
	STA.w $B4A8
label_C4C978:
	LDA.w $B4AA
	STA.b $06
	LDA.w $B4AC
	STA.b $08
	LDA.w $B4A6
	STA.b $04
	ASL
	ASL
	ADC.b $04
	ASL
	ASL
	CLC
	ADC.b $06
	STA.b $06
	STA.b $1A
	LDA.b $08
	STA.b $1C
	LDA.b $1E
	STA.b $04
	LDY.w #$0000
	STA.b [$1A],Y
	LDA.b $04
	ASL
	TAY
	STY.b $18
	TYA
	CLC
	ADC.w #$116A
	TAX
	LDA.w $0000,X
	ORA.w #$4000
	STA.w $0000,X
	LDA.b $02
	LDY.w #$0002
	STA.b [$1A],Y
	LDY.b $18
	LDA.w $2B6E,Y
	STA.b $16
	LDA.b $1A
	STA.b $0A
	LDA.b $1C
	STA.b $0C
	LDA.w #$0006
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b $16
	ASL
	TAX
	LDA.l DATA_C42A63,X
	STA.b [$0A]
	LDA.w $2ABA,Y
	ASL
	ASL
	ASL
	STA.b $16
	LDY.w #$0008
	STA.b [$1A],Y
	LDA.b $1A
	STA.b $06
	LDA.b $1C
	STA.b $08
	LDA.w #$000E
	CLC
	ADC.b $06
	STA.b $06
	STA.b $12
	LDA.b $08
	STA.b $14
	LDA.b $16
	TAY
	LDA.b [$0A]
	JSL.l label_C09032
	LSR
	STA.b $16
	STA.b [$06]
	LDA.b $1A
	STA.b $0A
	LDA.b $1C
	STA.b $0C
	LDA.w #$000A
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b $16
	ASL
	JSR.w label_C4C8DB
	STA.b $18
	STA.b [$0A]
	LDA.b [$06]
	ASL
	TAX
	LDA.b $18
	JSR.w label_C4C8E9
	LDA.b $1A
	STA.b $06
	LDA.b $1C
	STA.b $08
	LDA.w #$000C
	CLC
	ADC.b $06
	STA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	LDA.b $12
	STA.b $06
	LDA.b $14
	STA.b $08
	LDA.b [$06]
	STA.b $02
	LDA.b [$0A]
	CLC
	ADC.b $02
	STA.b [$0E]
	LDA.w #$0000
	LDY.w #$0012
	STA.b [$1A],Y
	LDY.w #$0010
	STA.b [$1A],Y
	LDA.b $20
	STA.b $02
	CMP.w #$0002
	BEQ.b label_C4CA86
	LDA.b $02
	CMP.w #$0003
	BEQ.b label_C4CA86
	LDA.b $02
	CMP.w #$0004
	BEQ.b label_C4CA86
	LDA.b $02
	CMP.w #$0005
	BNE.b label_C4CA8F
label_C4CA86:
	LDY.w #$000A
	LDA.b [$1A],Y
	STA.b $16
	BRA.b label_C4CA93

label_C4CA8F:
	LDA.b [$0E]
	STA.b $16
label_C4CA93:
	LDA.b $04
	CMP.w #$0018
	BCC.b label_C4CAAB
	LDY.w #$000E
	LDA.b [$1A],Y
	TAY
	LDA.b $16
	TAX
	LDA.b $04
	JSL.l label_C4283F
	BRA.b label_C4CABA

label_C4CAAB:
	LDY.w #$000E
	LDA.b [$1A],Y
	TAY
	LDA.b $16
	TAX
	LDA.b $04
	JSL.l label_C42884
label_C4CABA:
	LDA.w $B4A8
	STA.b $16
	LDA.b $02
	CMP.w #$0002
	BEQ.b label_C4CAEB
	CMP.w #$0007
	BEQ.b label_C4CAEB
	CMP.w #$0003
	BEQ.b label_C4CAFC
	CMP.w #$0008
	BEQ.b label_C4CAFC
	CMP.w #$0004
	BEQ.b label_C4CB10
	CMP.w #$0009
	BEQ.b label_C4CB10
	CMP.w #$0005
	BEQ.b label_C4CB24
	CMP.w #$000A
	BEQ.b label_C4CB24
	BRA.b label_C4CB34

label_C4CAEB:
	LDA.b $16
	ASL
	TAX
	LDA.w #$0001
	STA.w $0E5E,X
	LDY.w #$0004
	STA.b [$1A],Y
	BRA.b label_C4CB34

label_C4CAFC:
	LDA.b $16
	ASL
	TAX
	LDA.w #$0001
	STA.w $0E9A,X
	LDA.w #$0002
	LDY.w #$0004
	STA.b [$1A],Y
	BRA.b label_C4CB34

label_C4CB10:
	LDA.b $16
	ASL
	TAX
	LDA.w #$0001
	STA.w $0ED6,X
	LDA.w #$0003
	LDY.w #$0004
	STA.b [$1A],Y
	BRA.b label_C4CB34

label_C4CB24:
	LDA.b $16
	ASL
	TAX
	LDA.w #$0001
	STA.w $0F12,X
	LDA.w #$0004
	TAY
	STA.b [$1A],Y
label_C4CB34:
	LDA.b $16
	ASL
	TAX
	LDA.w $0E5E,X
	CLC
	ADC.w $0E9A,X
	CLC
	ADC.w $0ED6,X
	CLC
	ADC.w $0F12,X
	STA.w $0F4E,X
	INC.w $B4A6
label_C4CB4D:
	PLD
	RTL

;--------------------------------------------------------------------

org $C4D7D9
label_C4D7D9:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFE8
	TCD
	PLA
	STA.b $16
	LDA.w #DATA_C3FD2D
	STA.b $0A
	LDA.w #DATA_C3FD2D>>16
	STA.b $0C
	LDA.b $16
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	BRA.b label_C4D825

label_C4D806:
	STZ.b $0E
	STZ.b $10
	LDY.w #$FFFF
	STY.b $14
	LDY.w #$0002
	LDA.b [$06],Y
	TAX
	LDA.b $12
	LDY.b $14
	JSL.l label_C01E49
	LDA.w #$0004
	CLC
	ADC.b $06
	STA.b $06
label_C4D825:
	LDA.b [$06]
	STA.b $12
	BNE.b label_C4D806
	STZ.w $B4B4
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to advancing to the next name entry screen.

label_C4D830:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	STA.b $14
	BRA.b label_C4D842

label_C4D83E:
	JSL.l label_C1004E
label_C4D842:
	LDA.w $B4B4
	BNE.b label_C4D83E
	LDA.w #DATA_C3FD49
	STA.b $0A
	LDA.w #DATA_C3FD49>>16
	STA.b $0C
	LDA.b $14
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	BRA.b label_C4D8C9

label_C4D868:
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	INC.b $0A
	INC.b $0A
	JSL.l label_C46028
	TAX
	CPX.w #$FFFF
	BEQ.b label_C4D8BD
	LDA.w #ScriptPtrs
	STA.b $06
	LDA.w #ScriptPtrs>>16
	STA.b $08
	LDA.b $06
	STA.b $10
	LDA.b $08
	STA.b $12
	LDA.b [$0A]
	STA.b $04
	ASL
	ADC.b $04
	STA.b $0E
	INC
	INC
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w #$00FF
	TAY
	LDA.b $0E
	PHA
	LDA.b $10
	STA.b $06
	LDA.b $12
	STA.b $08
	PLA
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	JSL.l label_C093F9
label_C4D8BD:
	LDA.b $0A
	STA.b $06
	LDA.b $0C
	STA.b $08
	INC.b $06
	INC.b $06
label_C4D8C9:
	LDA.b [$06]
	BNE.b label_C4D868
label_C4D8CD:
	LDY.w #$0A62
	LDA.w #$FFFF
	STA.b $0E
	LDX.w #$0000
	BRA.b label_C4D8E8

label_C4D8DA:
	LDA.w $0000,Y
	STA.b $02
	LDA.b $0E
	AND.b $02
	STA.b $0E
	INY
	INY
	INX
label_C4D8E8:
	CPX.w #$0017
	BCC.b label_C4D8DA
	JSL.l label_C1004E
	LDA.b $0E
	CMP.w #$FFFF
	BNE.b label_C4D8CD
	PLD
	RTL

;--------------------------------------------------------------------

; Note: Something related to the name entry confirmation screen, specifically the character sprites

label_C4D8FA:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEC
	TCD
	LDA.w #$0000
	STA.b $04
	BRA.b label_C4D97B

label_C4D909:
	LDA.w #EB_ConfirmationScreenSpriteData
	STA.b $06
	LDA.w #EB_ConfirmationScreenSpriteData>>16
	STA.b $08
	LDA.b $04
	ASL
	ASL
	ASL
	STA.b $12
	INC
	INC
	INC
	INC
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	TAX
	LDA.b $12
	CLC
	ADC.w #$0006
	LDY.b $06
	STY.b $0A
	LDY.b $08
	STY.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	TAY
	LDA.b $12
	INC
	INC
	PHA
	LDA.b $06
	STA.b $0A
	LDA.b $08
	STA.b $0C
	PLA
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	STA.b $02
	LDA.b $12
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	STX.b $0E
	STY.b $10
	LDY.w #$FFFF
	LDX.b $02
	JSL.l label_C01E49
	ASL
	TAX
	LDA.w #$0004
	STA.w $2AF6,X
	INC.b $04
label_C4D97B:
	LDA.b $04
	CMP.w #$0005
	BCS.b label_C4D987
	BEQ.b label_C4D987
	JMP.w label_C4D909

label_C4D987:
	PLD
	RTL

;--------------------------------------------------------------------

label_C4D989:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEA
	TCD
	PLA
	STA.b $02
	JSL.l label_C0927C
	JSL.l label_C01A86
	LDX.w #$0000
	LDA.w #$8000
	JSL.l label_C01C11
	JSL.l label_C01A69
	LDA.w #$0001
	STA.w $4A58
	STZ.w $4A5A
	LDA.w #$0000
	JSL.l label_C4FD45
	LDA.w #$0017
	STA.w $0A4C
	LDA.w #$0018
	STA.w $0A4E
	LDY.w #$0000
	TYX
	LDA.w #$0001
	JSL.l label_C09321
	JSL.l label_C02D29
	LDX.w #$0000
	BRA.b label_C4D9E1

label_C4D9DB:
	SEP.b #$20
	STZ.w $986F,X
	INX
label_C4D9E1:
	CPX.w #$0006
	BCC.b label_C4D9DB
	LDX.w #$0B08
	REP.b #$20
	LDA.w #$1D60
	JSL.l label_C0B65F
	JSL.l label_C03A24
	SEP.b #$20
	STZ.b $0E
	LDX.w #$0200
	REP.b #$20
	LDA.w #$0200
	JSL.l label_C08EFC
	JSL.l label_C0004B
	SEP.b #$20
	STZ.w $001A
	REP.b #$20
	LDA.w #$0000
	JSL.l $C2EA15
	JSL.l label_C4A7B0
	STZ.w $9641
	LDX.w #$0000
	STX.b $14
	TXY
	STY.b $12
	LDA.w #$FD8D
	STA.b $0A
	LDA.w #$00C3
	STA.b $0C
	LDA.b $02
	ASL
	ASL
	CLC
	ADC.b $0A
	STA.b $0A
	LDY.w #$0002
	LDA.b [$0A],Y
	TAY
	LDA.b [$0A]
	STA.b $06
	STY.b $08
	LDA.b $06
	STA.b $0E
	LDA.b $08
	STA.b $10
	JSL.l EB_ProcessTextboxData_Main
	BRA.b label_C4DA8E

label_C4DA54:
	JSL.l label_C4A7B0
	LDA.w $006D
	AND.w #$0080
	BNE.b label_C4DA70
	LDA.w $006D
	AND.w #$8000
	BNE.b label_C4DA70
	LDA.w $006D
	AND.w #$1000
	BEQ.b label_C4DA77
label_C4DA70:
	LDY.w #$0001
	STY.b $12
	BRA.b label_C4DA95

label_C4DA77:
	JSL.l label_C1004E
	LDX.b $14
	BEQ.b label_C4DA84
	CPX.w #$0001
	BNE.b label_C4DA8B
label_C4DA84:
	SEP.b #$20
	LDA.b #$13
	STA.w $001A
label_C4DA8B:
	INX
	STX.b $14
label_C4DA8E:
	REP.b #$20
	LDA.w $9641
	BEQ.b label_C4DA54
label_C4DA95:
	JSL.l $C2EA74
	BRA.b label_C4DAA3

label_C4DA9B:
	JSL.l label_C1004E
	JSL.l label_C4A7B0
label_C4DAA3:
	JSL.l $C2EACF
	CMP.w #$0000
	BNE.b label_C4DA9B
	LDX.w #$0001
	TXA
	JSL.l label_C0887A
	BRA.b label_C4DABA

label_C4DAB6:
	JSL.l label_C1004E
label_C4DABA:
	LDA.w $0028
	AND.w #$00FF
	BNE.b label_C4DAB6
	JSL.l label_C2EAAA
	STZ.w $9641
	JSL.l label_C021E6
	LDY.b $12
	TYA
	PLD
	RTL

;--------------------------------------------------------------------

org $C4DAD2
label_C4DAD2:
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFF0
	TCD
	LDA.w #$0000
	STA.b $02
	LDA.w #$0001
	STA.w $B4B6
	LDA.w #$0002
	JSL.l label_C0AC0C
	JSL.l label_C0927C
	JSL.l label_C200D9
	JSL.l label_C432B1
	LDA.w #$0001
	STA.w $5DD8
	STZ.w $0039
	STZ.w $003B
	STZ.w $0037
	STZ.w $0035
	STZ.w $0033
	STZ.w $0031
	JSL.l label_C08B26
	STZ.w $0039
	STZ.w $003B
	STZ.w $0037
	STZ.w $0035
	STZ.w $0033
	STZ.w $0031
	JSL.l label_C08B26

label_C4DB2A:
	LDA.b $02
	BEQ.b label_C4DB81
	CMP.w #$0001
	BNE.b label_C4DB36
	JMP.w label_C4DBCA

label_C4DB36:
	CMP.w #$0002
	BNE.b label_C4DB3E
	JMP.w label_C4DC2D

label_C4DB3E:
	CMP.w #$0003
	BNE.b label_C4DB46
	JMP.w label_C4DC40

label_C4DB46:
	CMP.w #$0004
	BNE.b label_C4DB4E
	JMP.w label_C4DC53

label_C4DB4E:
	CMP.w #$0005
	BNE.b label_C4DB56
	JMP.w label_C4DC5F

label_C4DB56:
	CMP.w #$0006
	BNE.b label_C4DB5E
	JMP.w label_C4DC6B

label_C4DB5E:
	CMP.w #$0007
	BNE.b label_C4DB66
	JMP.w label_C4DC77

label_C4DB66:
	CMP.w #$0008
	BNE.b label_C4DB6E
	JMP.w label_C4DC83

label_C4DB6E:
	CMP.w #$0009
	BNE.b label_C4DB76
	JMP.w label_C4DC8F

label_C4DB76:
	CMP.w #$000A
	BNE.b label_C4DB7E
	JMP.w label_C4DC9B

label_C4DB7E:
	JMP.w label_C4DCA7

label_C4DB81:
	JSL.l label_C0F009
	CMP.w #$0000
	BEQ.b label_C4DBC2
	LDA.w #$0002
	JSL.l label_C0AC0C
	LDA.w $000D
	AND.w #$00FF
	CMP.w #$0080
	BEQ.b label_C4DBA9
	LDY.w #$0000
	LDX.w #$0001
	LDA.w #$0004
	JSL.l label_C08814

label_C4DBA9:
	LDA.w #$00AF
	JSL.l label_C4FBBD
	LDA.w #$0001
	JSL.l label_C3F3C5
	TAX
	STX.b $0E
	LDA.w #$0002
	STA.b $02
	JMP.w label_C4DCAC

label_C4DBC2:
	LDX.w #$0000
	STX.b $0E
	JMP.w label_C4DCAC

label_C4DBCA:
	LDA.w #$0001
	JSL.l label_C4FBBD
	JSL.l label_C0F33C
	CMP.w #$0000
	BEQ.b label_C4DC25
	LDA.w #$0002
	JSL.l label_C0AC0C
	LDA.w $000D
	AND.w #$00FF
	CMP.w #$0080
	BEQ.b label_C4DBF9
	LDY.w #$0000
	LDX.w #$0001
	LDA.w #$0004
	JSL.l label_C08814

label_C4DBF9:
	SEP.b #$20
	LDA.b #$00
	STA.l !REGISTER_ColorMathSelectAndEnable
	STA.l !REGISTER_ColorMathInitialSettings
	LDA.b #$01
	STA.w $001A
	STZ.w $001B
	REP.b #$20
	LDA.w #$00AF
	JSL.l label_C4FBBD
	LDA.w #$0001
	JSL.l label_C3F3C5
	TAX
	STX.b $0E
	INC.b $02
	JMP.w label_C4DCAC

label_C4DC25:
	LDX.w #$0000
	STX.b $0E
	JMP.w label_C4DCAC

label_C4DC2D:
	LDA.w #$00AF
	JSL.l label_C4FBBD
	LDA.w #$0000
	JSL.l label_C3F3C5
	TAX
	STX.b $0E
	BRA.b label_C4DCAC

label_C4DC40:
	LDA.w #$009D
	JSL.l label_C4FBBD
	LDA.w #$0000
	JSL.l label_C4D989
	TAX
	STX.b $0E
	BRA.b label_C4DCAC

label_C4DC53:
	LDA.w #$0002
	JSL.l label_C4D989
	TAX
	STX.b $0E
	BRA.b label_C4DCAC

label_C4DC5F:
	LDA.w #$0003
	JSL.l label_C4D989
	TAX
	STX.b $0E
	BRA.b label_C4DCAC

label_C4DC6B:
	LDA.w #$0004
	JSL.l label_C4D989
	TAX
	STX.b $0E
	BRA.b label_C4DCAC

label_C4DC77:
	LDA.w #$0005
	JSL.l label_C4D989
	TAX
	STX.b $0E
	BRA.b label_C4DCAC

label_C4DC83:
	LDA.w #$0006
	JSL.l label_C4D989
	TAX
	STX.b $0E
	BRA.b label_C4DCAC

label_C4DC8F:
	LDA.w #$0007
	JSL.l label_C4D989
	TAX
	STX.b $0E
	BRA.b label_C4DCAC

label_C4DC9B:
	LDA.w #$0009
	JSL.l label_C4D989
	TAX
	STX.b $0E
	BRA.b label_C4DCAC

label_C4DCA7:
	LDA.w #$0001
	STA.b $02

label_C4DCAC:
	INC.b $02
	LDX.b $0E
	BNE.b label_C4DCB5
	JMP.w label_C4DB2A

label_C4DCB5:
	LDA.w #$0002
	JSL.l label_C0AC0C
	SEP.b #$20
	STZ.w $0028
	REP.b #$20
	LDA.w $000D
	AND.w #$00FF
	CMP.w #$0080
	BEQ.b label_C4DCDB
	LDY.w #$0000
	LDX.w #$0001
	LDA.w #$0004
	JSL.l label_C08814

label_C4DCDB:
	SEP.b #$20
	LDA.b #$00
	STA.l !REGISTER_ColorMathSelectAndEnable
	STA.l !REGISTER_ColorMathInitialSettings
	LDA.b #$01
	STA.w $001A
	STZ.w $001B
	REP.b #$20
	STZ.w $5DD8
	PLD
	RTL

;--------------------------------------------------------------------

org $C4F70A
DATA_C4F70A:
	db $00,$FF,$01,$02,$03,$04,$02,$03
	db $04,$05,$FF,$FF,$05,$FF,$FF,$05
	db $FF,$FF,$05,$FF,$06,$05,$FF,$FF
	db $05,$FF,$FF,$05,$FF,$FF,$05,$FF
	db $FF,$05,$FF,$FF,$05,$FF,$FF,$05
	db $FF,$FF,$05,$FF,$07,$05,$08,$09
	db $05,$08,$0A,$05,$08,$0B,$05,$08
	db $0C,$05,$08,$0D,$05,$08,$0E,$05
	db $08,$0F,$05,$08,$10,$05,$08,$11
	db $05,$08,$12,$05,$08,$13,$05,$08
	db $13,$05,$08,$14,$05,$15,$16,$05
	db $FF,$17,$05,$FF,$17,$05,$18,$19
	db $05,$18,$19,$05,$18,$19,$05,$18
	db $19,$05,$18,$19,$05,$18,$19,$05
	db $18,$19,$05,$18,$19,$05,$15,$1A
	db $05,$1B,$1C,$05,$1B,$1D,$05,$1B
	db $1E,$05,$1B,$1F,$05,$08,$20,$05
	db $21,$22,$05,$23,$24,$05,$25,$26
	db $05,$25,$27,$05,$28,$29,$05,$2A
	db $2B,$05,$2C,$2D,$05,$08,$2E,$05
	db $2F,$30,$05,$2F,$31,$05,$32,$33
	db $05,$34,$35,$05,$36,$37,$05,$38
	db $39,$05,$3A,$3B,$05,$3C,$3D,$05
	db $3C,$3E,$05,$3C,$3F,$05,$40,$41
	db $05,$42,$43,$05,$18,$44,$05,$18
	db $45,$05,$46,$47,$05,$48,$49,$05
	db $4A,$4B,$05,$4C,$4D,$05,$4C,$4D
	db $05,$4E,$4F,$05,$50,$51,$05,$52
	db $53,$05,$54,$55,$05,$54,$56,$05
	db $54,$57,$05,$46,$58,$05,$59,$5A
	db $05,$2C,$5B,$05,$5C,$5D,$05,$2C
	db $5E,$05,$2C,$5E,$05,$5F,$60,$05
	db $2C,$61,$05,$62,$63,$05,$23,$64
	db $05,$FF,$65,$05,$FF,$66,$05,$FF
	db $67,$05,$54,$68,$05,$69,$6A,$05
	db $54,$6B,$6C,$FF,$6D,$05,$6E,$6F
	db $05,$6E,$70,$05,$6E,$71,$05,$72
	db $73,$05,$74,$75,$05,$76,$77,$05
	db $76,$78,$05,$15,$79,$05,$7A,$7B
	db $05,$7C,$7D,$05,$7E,$7F,$05,$7E
	db $80,$05,$15,$81,$05,$2C,$5E,$05
	db $2C,$5E,$05,$FF,$82,$05,$83,$0E
	db $05,$83,$0E,$05,$83,$84,$05,$FF
	db $FF,$05,$83,$85,$05,$15,$86,$05
	db $83,$84,$05,$FF,$87,$05,$08,$88
	db $05,$83,$84,$05,$21,$22,$05,$FF
	db $FF,$05,$FF,$89,$05,$2F,$8A,$05
	db $FF,$67,$05,$FF,$67,$05,$8B,$8C
	db $05,$8B,$8D,$05,$54,$57,$05,$08
	db $8E,$05,$FF,$8F,$05,$1B,$90,$05
	db $72,$91,$05,$FF,$FF,$05,$25,$26
	db $05,$08,$0A,$05,$08,$0A,$05,$08
	db $0A,$05,$59,$92,$05,$72,$73,$05
	db $FF,$93,$05,$18,$94,$05,$36,$37
	db $05,$1B,$1C,$05,$2C,$61,$05,$83
	db $95,$05,$54,$96,$05,$54,$96,$05
	db $83,$85,$05,$1B,$97,$05,$83,$95
	db $05,$83,$85,$05,$83,$98,$05,$FF
	db $91,$05,$83,$95,$02,$99,$9A,$02
	db $03,$04,$05,$2C,$9B,$05,$9C,$9D
	db $05,$9C,$9D,$05,$9C,$9D,$05,$9C
	db $9D,$05,$9C,$9D,$05,$9C,$9D,$05
	db $9C,$9D,$05,$9C,$9D,$05,$9C,$9D
	db $05,$18,$9E,$05,$38,$9F,$05,$2F
	db $A0,$05,$A1,$A2,$05,$08,$88,$00
	db $FF,$01,$02,$99,$A3,$05,$FF,$FF
	db $05,$83,$85,$05,$3C,$A4,$05,$A5
	db $A6,$05,$A1,$A2,$05,$FF,$66,$05
	db $52,$53,$05,$FF,$FF,$05,$FF,$FF
	db $05,$4E,$4F,$05,$4C,$A7,$05,$4E
	db $4F,$05,$2F,$A8,$05,$9C,$9D,$05
	db $52,$53,$05,$50,$51

;--------------------------------------------------------------------

DATA_C4F947:
	db EB_WarOnGiygasAmbientNoise>>16 : dw EB_WarOnGiygasAmbientNoise
	db EB_SPCEngine>>16 : dw EB_SPCEngine
	db EB_UnknownTitleScreenSPCData_E9E084>>16 : dw EB_UnknownTitleScreenSPCData_E9E084
	db EB_FileSelectSampleBank>>16 : dw EB_FileSelectSampleBank
	db EB_FileSelectMusic>>16 : dw EB_FileSelectMusic
	db EB_PeacefulNightOnettAmbienceSamples>>16 : dw EB_PeacefulNightOnettAmbienceSamples
	db $E0FCE1>>16 : dw $E0FCE1
	db $E8FF1B>>16 : dw $E8FF1B
	db $E7,$9C,$84
	db $EE,$4F,$89
	db $ED,$60,$BD
	db $EE,$BB,$42
	db $EE,$B7,$67
	db $EB,$22,$FE
	db $ED,$FD,$DA
	db $EC,$51,$EB
	db $EE,$5D,$36
	db $EE,$8E,$79
	db $E2,$88,$FC
	db $ED,$55,$CF
	db $EE,$FE,$1E
	db $EB,$E8,$29
	db $EE,$37,$77
	db $EE,$9C,$3E
	db $E7,$C8,$C5
	db $EC,$01,$E1
	db $ED,$24,$98
	db $E9,$00,$00
	db $ED,$53,$B7
	db $ED,$9C,$FC
	db $ED,$5C,$E6
	db $EE,$74,$72
	db $E3,$CC,$FD
	db $EB,$8E,$9F
	db $ED,$F7,$27
	db $EA,$90,$C5
	db $E2,$2C,$ED
	db $E3,$FA,$B0
	db $ED,$09,$64
	db $ED,$A7,$4B
	db $EB,$D6,$78
	db $EE,$FF,$90
	db $E4,$4A,$51
	db $ED,$93,$9E
	db $EB,$00,$00
	db $D9,$18,$FC
	db $E8,$72,$F8
	db $E6,$08,$CF
	db $ED,$6B,$43
	db $EE,$CB,$87
	db $E5,$00,$00
	db $EE,$DF,$56
	db $EA,$7A,$33
	db $EE,$D4,$14
	db $EA,$00,$00
	db $EC,$A1,$CA
	db $E5,$4E,$95
	db $ED,$39,$D5
	db $EC,$D8,$A7
	db $CB,$E2,$FE
	db $E8,$66,$40
	db $D8,$B7,$F6
	db $EC,$76,$9B
	db $EE,$FE,$28
	db $E4,$00,$00
	db $DB,$EB,$F2
	db $CB,$2A,$E0
	db $EE,$EE,$19
	db $ED,$E2,$73
	db $EE,$CA,$8A
	db $E3,$64,$5F
	db $CC,$17,$F6
	db $EA,$94,$65
	db $E6,$18,$FF
	db $E6,$D8,$45
	db $DD,$CE,$FE
	db $E6,$9A,$8B
	db $ED,$6E,$C9
	db $E7,$00,$00
	db $DC,$BF,$F8
	db $E9,$74,$3A
	db $EE,$29,$7E
	db $E7,$14,$43
	db $EE,$36,$6D
	db $E8,$00,$00
	db $ED,$12,$AB
	db $ED,$21,$8B
	db $ED,$07,$0A
	db $EE,$DD,$6F
	db $EA,$F6,$96
	db $ED,$89,$83
	db $EE,$DF,$7B
	db $E5,$4A,$4C
	db $EE,$99,$5A
	db $CF,$B5,$F2
	db $EE,$FA,$5D
	db $CF,$38,$FF
	db $EC,$28,$BF
	db $EC,$00,$67
	db $ED,$36,$B1
	db $ED,$AF,$91
	db $EE,$EA,$4E
	db $CE,$C6,$F8
	db $EE,$E6,$52
	db $ED,$B6,$7B
	db $EB,$E8,$C4
	db $EC,$D8,$D5
	db $EC,$92,$45
	db $E2,$00,$00
	db $EC,$EC,$23
	db $E0,$03,$ED
	db $DA,$07,$FB
	db $EE,$54,$05
	db $ED,$83,$F1
	db $EC,$00,$00
	db $EE,$B2,$0F
	db $ED,$FF,$1D
	db $ED,$6C,$C3
	db $E9,$56,$73
	db $ED,$95,$31
	db $ED,$01,$5C
	db $ED,$00,$00
	db $E5,$32,$DD
	db $E1,$81,$F5
	db $E8,$88,$BC
	db $E4,$D0,$EE
	db $E4,$32,$A2
	db $EE,$36,$32
	db $EE,$66,$84
	db $EE,$D7,$74
	db $EE,$65,$8D
	db EB_PoliceCarSirenSample>>16 : dw EB_PoliceCarSirenSample
	db EB_PeacefulNightOnettMusic>>16 : dw EB_PeacefulNightOnettMusic
	db $EC,$8A,$B3
	db $ED,$F4,$EB
	db $EE,$85,$6A
	db $EE,$00,$00
	db $EE,$D6,$8F
	db $EE,$CD,$2D
	db $D0,$B4,$DF
	db $EA,$24,$F1
	db $ED,$9C,$3A
	db $EE,$CE,$46
	db $DE,$DD,$FC
	db $EE,$01,$24
	db $EA,$8B,$FE
	db $ED,$10,$F7
	db $EE,$4D,$80
	db $EE,$7D,$3A
	db EB_MeteorImpactMusic>>16 : dw EB_MeteorImpactMusic
	db $ED,$DF,$53
	db $EE,$8C,$64
	db $EE,$6C,$82
	db EB_UnknownTitleScreenSPCData_E87EA6>>16 : dw EB_UnknownTitleScreenSPCData_E87EA6
	db $EB,$E4,$E9
	db $E4,$92,$FD
	db $DC,$37,$E0
	db $EC,$78,$F5
	db $ED,$AE,$E0
	db $EE,$38,$86
	db $EE,$DF,$4A
	db $ED,$06,$6C
	db $ED,$D7,$A4
	db EB_UnknownTitleScreenSPCData_EE0A8B>>16 : dw EB_UnknownTitleScreenSPCData_EE0A8B
	db $EE,$4C,$61
	db $EC,$64,$88
	db $E5,$38,$FF
	db $EE,$1E,$8C
	db $EE,$A2,$8E

;--------------------------------------------------------------------

label_C4FB42:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFF0
	TCD
	PLA
	STA.b $0E
	LDA.w #$FFFF
	STA.w $B547
	LDA.b $0E
	PLD
	RTS

;--------------------------------------------------------------------

UploadSPCEngine:
.Main:
;$C4FB58
	REP.b #$31
	PHD
	TDC
	ADC.w #$FFEE
	TCD
	LDA.w #$FFFF
	STA.w $B541
	STA.w $B53D
	LDA.l DATA_C4F70A+$02
	AND.w #$00FF
	STA.b $10
	STA.w $B543
	STA.w $B53F
	LDA.w #DATA_C4F947
	STA.b $06
	LDA.w #DATA_C4F947>>16
	STA.b $08
	LDA.b $10
	STA.b $04
	ASL
	ADC.b $04
	TAY
	STY.b $0E
	TYA
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	JSR.w label_C4FB42
	TAX
	LDY.b $0E
	TYA
	INC
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w $B547
	JSL.l UploadDataToSPC700_Main
	LDA.w #$0001
	STA.w $B549
	PLD
	RTL

;--------------------------------------------------------------------

label_C4FBBD:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEC
	TCD
	PLA
	TAX
	STX.b $12
	CPX.w $B53B
	BNE.b label_C4FBD2
	JMP.w label_C4FD16

label_C4FBD2:
	LDA.w $B4B6
	BNE.b label_C4FBDB
	JSL.l label_C0AC01
label_C4FBDB:
	LDX.b $12
	CPX.w #$00A0
	BCC.b label_C4FBE9
	CPX.w #$00A7
	BCC.b label_C4FBF4
	BEQ.b label_C4FBF4
label_C4FBE9:
	LDA.w #$0001
	JSL.l label_C0AC0C
	JSL.l label_C0ABC6
label_C4FBF4:
	LDX.b $12
	STX.w $B53B
	TXY
	DEY
	STY.b $10
	TYA
	STA.b $04
	ASL
	ADC.b $04
	TAX
	LDA.l DATA_C4F70A,X
	AND.w #$00FF
	STA.b $0E
	CMP.w $B53D
	BEQ.b label_C4FC54
	CMP.w #$00FF
	BEQ.b label_C4FC54
	STA.w $B53D
	LDA.w #DATA_C4F947
	STA.b $06
	LDA.w #DATA_C4F947>>16
	STA.b $08
	LDA.b $0E
	STA.b $04
	ASL
	ADC.b $04
	STA.b $02
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	JSR.w label_C4FB42
	TAX
	LDA.b $02
	INC
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w $B547
	JSL.l UploadDataToSPC700_Main
label_C4FC54:
	LDY.b $10
	TYA
	STA.b $04
	ASL
	ADC.b $04
	TAX
	INX
	LDA.l DATA_C4F70A,X
	AND.w #$00FF
	STA.b $0E
	CMP.w $B53F
	BEQ.b label_C4FCB3
	CMP.w #$00FF
	BEQ.b label_C4FCB3
	CMP.w $B543
	BEQ.b label_C4FCB3
	STA.w $B53F
	LDA.w #DATA_C4F947
	STA.b $06
	LDA.w #DATA_C4F947>>16
	STA.b $08
	LDA.b $0E
	STA.b $04
	ASL
	ADC.b $04
	STA.b $02
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	JSR.w label_C4FB42
	TAX
	LDA.b $02
	INC
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w $B547
	JSL.l UploadDataToSPC700_Main
label_C4FCB3:
	LDY.b $10
	TYA
	STA.b $04
	ASL
	ADC.b $04
	TAX
	INX
	INX
	LDA.l DATA_C4F70A,X
	AND.w #$00FF
	STA.b $0E
	CMP.w $B541
	BEQ.b label_C4FD0E
	CMP.w #$00FF
	BEQ.b label_C4FD0E
	STA.w $B541
	LDA.w #DATA_C4F947
	STA.b $06
	LDA.w #DATA_C4F947>>16
	STA.b $08
	LDA.b $0E
	STA.b $04
	ASL
	ADC.b $04
	STA.b $02
	LDX.b $06
	STX.b $0A
	LDX.b $08
	STX.b $0C
	CLC
	ADC.b $0A
	STA.b $0A
	LDA.b [$0A]
	AND.w #$00FF
	JSR.w label_C4FB42
	TAX
	LDA.b $02
	INC
	CLC
	ADC.b $06
	STA.b $06
	LDA.b [$06]
	AND.w $B547
	JSL.l UploadDataToSPC700_Main
label_C4FD0E:
	LDY.b $10
	TYA
	INC
	JSL.l label_C0ABBD
label_C4FD16:
	PLD
	RTL

;--------------------------------------------------------------------

label_C4FD18:
	REP.b #$31
	PHD
	PHA
	TDC
	ADC.w #$FFEE
	TCD
	PLA
	TAX
	BEQ.b label_C4FD31
	LDA.w #$C0AC33
	STA.b $0E
	LDA.w #$C0AC33>>16
	STA.b $10
	BRA.b label_C4FD3B

label_C4FD31:
	LDA.w #$C0AC2C
	STA.b $0E
	LDA.w #$C0AC2C>>16
	STA.b $10
label_C4FD3B:
	LDX.b $10
	LDA.b $0E
	JSL.l UploadDataToSPC700_Main
	PLD
	RTL

;--------------------------------------------------------------------

label_C4FD45:
	REP.b #$31
	STA.w $B549
	RTL

;--------------------------------------------------------------------

	%FREE_BYTES(NULLROM, 693, $00)				; $C4FD4B
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankC5Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

DATA_C50000:

;--------------------------------------------------------------------

org $C58EBB
DATA_C58EBB:

;--------------------------------------------------------------------

org $C51B12
	dw $F215	; "@Hello"
	dw $8915	; " there"
	db "!",$00
	db "  How"
	dw $5E17	; " may"

;--------------------------------------------------------------------

org $C5EA35
DATA_C5EA35:
	db $06 : dw $0012 : dd DATA_C5EA3D
	db $02

DATA_C5EA3D:

;--------------------------------------------------------------------

org $C5E70B
DATA_C5E70B:						; Intro cutscene textbox data
	db $04 : dw $01D5
	db $04 : dw $000B
	db $1F,$EB : db $FF,$06
	db $1F,$15 : dw $006A,$01DC : db $01
	db $08 : dd DATA_C9B4B8
	db $1F,$21 : db $96
	db $1F,$E6 : dw $00BA
	db $1F,$15 : dw $006A,$01DD : db $01
	db $08 : dd DATA_C9B4B8
	db $1F,$21 : db $97
	db $1F,$15 : dw $006A,$01DE : db $01
	db $08 : dd DATA_C9B4B8
	db $04 : dw $01DD
	db $04 : dw $0214
	db $04 : dw $02ED
	db $1F,$21 : db $0A
	db $1F,$E9 : dw $001A
	db $1F,$E9 : dw $001B
	db $10,$78
	db $10,$78
	db $10,$78
	db $10,$78
	db $10,$78
	db $10,$3C
	db $1F,$1E : dw $001B : db $06
	db $1F,$15 : dw $006A,$0024 : db $01
	db $05 : dw $0214
	db $04 : dw $0215
	db $1F,$03
	db $1F,$61
	db $1F,$1E : dw $001A : db $06
	db $1F,$EC : db $FF,$01
	db $1F,$F2 : dw $006A,$0272
	db $1F,$EF : dw $006A
	db $1F,$E8 : db $FF
	db $1F,$61
	db $1F,$ED
	db $04 : dw $01DC
	db $05 : dw $01DD
	db $05 : dw $01D5
	db $1F,$B0
	db $02

%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankC6Macros(StartBank, EndBank)
%BANK_START(<StartBank>)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankC7Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

;--------------------------------------------------------------------

	table "Tables/Fonts/MainFont.txt"

org $C7C59E
DATA_C7C59E:
	db $06 : dw $01B0 : dd DATA_C58EBB
	dw !CText_No
	dw !CText_Pro
	dw !CText_ble
	db "m"
	dw !CText_here
	db $13
	db $02

cleartable

;--------------------------------------------------------------------

; Note: File select screen data?

org $C7C993
DATA_C7C993:
	db $4D,$50,$9E,$A5,$9D,$92,$15,$E0
	db $1C,$0F,$15,$84,$92,$17,$7A,$17
	db $D9,$15,$99,$13,$02,$06,$49,$00
	db $3C,$CA,$C7,$00,$19,$10,$01,$1B
	db $04,$15,$F2,$5C,$10,$0F,$50,$A4
	db $15,$D7,$15,$68,$83,$A4,$9F,$99
	db $93,$50,$73,$9C,$A5,$92,$5E,$03
	db $00,$16,$F3,$5C,$10,$0F,$50,$1C
	db $02,$00,$5C,$50,$1B,$04,$08,$B3
	db $E6,$C7,$00,$51,$10,$14,$00,$17
	db $83,$15,$2A,$16,$91,$16,$FC,$91
	db $50,$17,$51,$95,$A2,$A6,$15,$5E
	db $6F,$50,$03,$00,$70,$73,$95,$A2
	db $A4,$16,$43,$9C,$A9,$5E,$03,$00
	db $70,$87,$16,$72,$16,$2E,$16,$12
	db $A7,$16,$73,$15,$0C,$98,$91,$A6
	db $16,$1F,$15,$3E,$10,$0F,$50,$50
	db $15,$7C,$5E,$03,$00,$70,$73,$9C
	db $15,$FA,$16,$7D,$72,$15,$C9,$5D
	db $92,$15,$C9,$5D,$92,$15,$C9,$15
	db $17,$13,$1F,$02,$0B,$04,$51,$01
	db $02,$70,$89,$9F,$5C,$50,$A4,$15
	db $D7,$15,$68,$6C,$84,$17,$C2,$7C
	db $91,$AA,$A9,$50,$73,$9F,$A7,$A0
	db $17,$09,$50,$83,$A4,$9F,$A0,$57
	db $9E,$50,$77,$9F,$6E,$03,$00,$17
	db $FE,$91,$98,$5C,$16,$85,$16,$94
	db $91,$50,$9E,$95,$A7,$16,$EF,$17
	db $D0,$50,$17,$91,$15,$17,$A7,$95
	db $15,$08,$17,$59,$9E,$95,$16,$29
	db $03,$00,$70,$87,$16,$59,$A4,$16
	db $E9,$6F,$16,$E5,$50,$83,$A4,$9F
	db $99,$93,$50,$73,$9C,$A5,$92,$6F
	db $16,$7D,$84,$15,$C6,$9C,$17,$78
	db $50,$17,$F9,$16,$3B,$17,$F5,$A5
	db $A4,$50,$17,$9F,$50,$16,$01,$17
	db $CD,$97,$9F,$51,$03,$00,$16,$C0
	db $15,$90,$A4,$15,$DD,$A2,$95,$9D
	db $9F,$94,$95,$9C,$15,$4A,$17,$36
	db $93,$95,$51,$03,$00,$16,$ED,$A7
	db $16,$85,$57,$A6,$95,$16,$4D,$9C
	db $9F,$A5,$94,$50,$9D,$A5,$A3,$99
	db $93,$5C,$16,$03,$96,$17,$57,$5C
	db $16,$B8,$15,$12,$17,$5B,$94,$A9

;--------------------------------------------------------------------

org $C7D33E
DATA_C7D33E:

;--------------------------------------------------------------------

org $C7DE2B
DATA_C7DE2B:
	db $05 : dw $017F
	db $02

;--------------------------------------------------------------------

%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankC8Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

	table "Tables/Fonts/MainFont.txt"

org $C8BC2D
TextMacroData:
.Bank1:
..TM00:	db "                ",$00
..TM01:	db " in the ",$00
..TM02:	db " that ",$00
..TM03:	db "...",$00
..TM04:	db " and ",$00
..TM05:	db " this ",$00
..TM06:	db " to the ",$00
..TM07:	db " about ",$00
..TM08:	db " just ",$00
..TM09:	db " of the ",$00
..TM0A:	db " something ",$00
..TM0B:	db " going to ",$00
..TM0C:	db " to ",$00
..TM0D:	db " you have ",$00
..TM0E:	db " your ",$00
..TM0F:	db " for ",$00
..TM10:	db " you're ",$00
..TM11:	db "@You ",$00
..TM12:	db " really ",$00
..TM13:	db " don't ",$00
..TM14:	db "@The ",$00
..TM15:	db "e the ",$00
..TM16:	db "e you ",$00
..TM17:	db "... ",$00
..TM18:	db " the ",$00
..TM19:	db " will ",$00
..TM1A:	db "   ...Brick Road",$00
..TM1B:	db "ing ",$00
..TM1C:	db " some ",$00
..TM1D:	db "              ",$00
..TM1E:	db "@Do you want to ",$00
..TM1F:	db " like ",$00
..TM20:	db "ou don't have ",$00
..TM21:	db " is ",$00
..TM22:	db " you ",$00
..TM23:	db " you",$00
..TM24:	db " anything else",$00
..TM25:	db " the",$00
..TM26:	db " you want to ",$00
..TM27:	db " for the ",$00
..TM28:	db " friend",$00
..TM29:	db " at the ",$00
..TM2A:	db "ould you like ",$00
..TM2B:	db " from ",$00
..TM2C:	db " would ",$00
..TM2D:	db "he Runaway Five",$00
..TM2E:	db " with ",$00
..TM2F:	db " want to ",$00
..TM30:	db "@If you ",$00
..TM31:	db " you don't ",$00
..TM32:	db "s the ",$00
..TM33:	db "ed to ",$00
..TM34:	db "e...",$00
..TM35:	db " something",$00
..TM36:	db "t the ",$00
..TM37:	db "@...",$00
..TM38:	db "@Please ",$00
..TM39:	db "@s ",$00
..TM3A:	db " of your ",$00
..TM3B:	db "@It's ",$00
..TM3C:	db "@Thank you ",$00
..TM3D:	db "@I ",$00
..TM3E:	db " here.",$00
..TM3F:	db " in ",$00
..TM40:	db "@Do you ",$00
..TM41:	db " I'll ",$00
..TM42:	db " have ",$00
..TM43:	db "e of ",$00
..TM44:	db "d you ",$00
..TM45:	db "@I'm ",$00
..TM46:	db "me to ",$00
..TM47:	db "@I don't ",$00
..TM48:	db "@Well, ",$00
..TM49:	db "@This is ",$00
..TM4A:	db "ed the ",$00
..TM4B:	db "@You're ",$00
..TM4C:	db " for a ",$00
..TM4D:	db " anything",$00
..TM4E:	db "ing",$00
..TM4F:	db " of ",$00
..TM50:	db " you should ",$00
..TM51:	db " I ",$00
..TM52:	db " from the ",$00
..TM53:	db "s...",$00
..TM54:	db " it's ",$00
..TM55:	db " time",$00
..TM56:	db "e to ",$00
..TM57:	db "ed ",$00
..TM58:	db "e of the ",$00
..TM59:	db " to you",$00
..TM5A:	db "n't you ",$00
..TM5B:	db " again",$00
..TM5C:	db " for you.",$00
..TM5D:	db "other ",$00
..TM5E:	db "ation",$00
..TM5F:	db " little ",$00
..TM60:	db "ing to ",$00
..TM61:	db " can't ",$00
..TM62:	db " much",$00
..TM63:	db " someone ",$00
..TM64:	db " on the ",$00
..TM65:	db " looks like",$00
..TM66:	db " don't you ",$00
..TM67:	db " very ",$00
..TM68:	db "the ",$00
..TM69:	db " can ",$00
..TM6A:	db "you",$00
..TM6B:	db " that you ",$00
..TM6C:	db " it",$00
..TM6D:	db " you want",$00
..TM6E:	db "ou can't ",$00
..TM6F:	db " able to ",$00
..TM70:	db " already ",$00
..TM71:	db " give you ",$00
..TM72:	db "understand",$00
..TM73:	db "       ",$00
..TM74:	db " my ",$00
..TM75:	db " you can ",$00
..TM76:	db " that",$00
..TM77:	db " what ",$00
..TM78:	db "here's ",$00
..TM79:	db " there ",$00
..TM7A:	db "n the ",$00
..TM7B:	db "@What ",$00
..TM7C:	db "Thank you",$00
..TM7D:	db " I can't ",$00
..TM7E:	db "one",$00
..TM7F:	db "@The",$00
..TM80:	db " thought",$00
..TM81:	db " not ",$00
..TM82:	db "You should",$00
..TM83:	db "ou know",$00
..TM84:	db " has ",$00
..TM85:	db " back",$00
..TM86:	db " of",$00
..TM87:	db "ve been ",$00
..TM88:	db " I'm ",$00
..TM89:	db " there",$00
..TM8A:	db " with you",$00
..TM8B:	db "@I heard ",$00
..TM8C:	db " in",$00
..TM8D:	db " here ",$00
..TM8E:	db " Fourside",$00
..TM8F:	db "I wonder ",$00
..TM90:	db " to",$00
..TM91:	db " could ",$00
..TM92:	db " think ",$00
..TM93:	db " out",$00
..TM94:	db " good ",$00
..TM95:	db "  the ",$00
..TM96:	db "  You ",$00
..TM97:	db " too much",$00
..TM98:	db "ome back",$00
..TM99:	db "t...",$00
..TM9A:	db " here",$00
..TM9B:	db "thing",$00
..TM9C:	db "come ",$00
..TM9D:	db "ly ",$00
..TM9E:	db "ent",$00
..TM9F:	db " strong",$00
..TMA0:	db " money.",$00
..TMA1:	db "@I'll ",$00
..TMA2:	db "an ",$00
..TMA3:	db "ou must ",$00
..TMA4:	db " are you ",$00
..TMA5:	db " with the",$00
..TMA6:	db " on your ",$00
..TMA7:	db "too many ",$00
..TMA8:	db " you.",$00
..TMA9:	db "know",$00
..TMAA:	db " to be ",$00
..TMAB:	db " around ",$00
..TMAC:	db " if you ",$00
..TMAD:	db "@Are you ",$00
..TMAE:	db "ome again",$00
..TMAF:	db "e and ",$00
..TMB0:	db " more ",$00
..TMB1:	db "think",$00
..TMB2:	db "e your ",$00
..TMB3:	db "@Don't ",$00
..TMB4:	db "nd the ",$00
..TMB5:	db "t to ",$00
..TMB6:	db "rea",$00
..TMB7:	db " he",$00
..TMB8:	db " me",$00
..TMB9:	db " strange",$00
..TMBA:	db " for you",$00
..TMBB:	db "ight",$00
..TMBC:	db " a ",$00
..TMBD:	db " be",$00
..TMBE:	db "ther",$00
..TMBF:	db "all ",$00
..TMC0:	db " cannot ",$00
..TMC1:	db "here is ",$00
..TMC2:	db "You have",$00
..TMC3:	db "Monotoli",$00
..TMC4:	db " was ",$00
..TMC5:	db "ll you ",$00
..TMC6:	db "hat ",$00
..TMC7:	db ", but ",$00
..TMC8:	db " stuff",$00
..TMC9:	db "eep",$00
..TMCA:	db " it ",$00
..TMCB:	db " didn't ",$00
..TMCC:	db " like th",$00
..TMCD:	db "ll right",$00
..TMCE:	db " should",$00
..TMCF:	db " over",$00
..TMD0:	db "@Oh, ",$00
..TMD1:	db " hear",$00
..TMD2:	db " every",$00
..TMD3:	db "I'm not ",$00
..TMD4:	db " about t",$00
..TMD5:	db " zombies",$00
..TMD6:	db " damage",$00
..TMD7:	db "his is ",$00
..TMD8:	db "all",$00
..TMD9:	db " some",$00
..TMDA:	db "@It ",$00
..TMDB:	db " attack",$00
..TMDC:	db " right ",$00
..TMDD:	db "ally ",$00
..TMDE:	db "orry",$00
..TMDF:	db "ess",$00
..TME0:	db "er ",$00
..TME1:	db "@That's ",$00
..TME2:	db "carry it",$00
..TME3:	db "ake",$00
..TME4:	db "t was ",$00
..TME5:	db ", the ",$00
..TME6:	db "n you ",$00
..TME7:	db "sn't ",$00
..TME8:	db " help",$00
..TME9:	db "king ",$00
..TMEA:	db "ear",$00
..TMEB:	db "ing the",$00
..TMEC:	db "  It's ",$00
..TMED:	db "very",$00
..TMEE:	db " talking",$00
..TMEF:	db "ou've ",$00
..TMF0:	db "that's ",$00
..TMF1:	db " to me",$00
..TMF2:	db "@Hello",$00
..TMF3:	db " enemy",$00
..TMF4:	db " you are",$00
..TMF5:	db " by ",$00
..TMF6:	db " IBNT",$00
..TMF7:	db "ight ",$00
..TMF8:	db "on't ",$00
..TMF9:	db "est",$00
..TMFA:	db "ick",$00
..TMFB:	db " power ",$00
..TMFC:	db "s that ",$00
..TMFD:	db "s are ",$00
..TMFE:	db " call",$00
..TMFF:	db "t is ",$00

.Bank2:
..TM00:	db " is",$00
..TM01:	db "age",$00
..TM02:	db ", and ",$00
..TM03:	db " great ",$00
..TM04:	db "@Thanks",$00
..TM05:	db " people",$00
..TM06:	db "ter",$00
..TM07:	db "not",$00
..TM08:	db "ill",$00
..TM09:	db "ness",$00
..TM0A:	db "@This ",$00
..TM0B:	db " into ",$00
..TM0C:	db " ha",$00
..TM0D:	db " I can ",$00
..TM0E:	db "t your ",$00
..TM0F:	db " before",$00
..TM10:	db " things",$00
..TM11:	db "tion",$00
..TM12:	db " for",$00
..TM13:	db "be ",$00
..TM14:	db " this",$00
..TM15:	db "Happy",$00
..TM16:	db "  You",$00
..TM17:	db "out",$00
..TM18:	db "enough",$00
..TM19:	db "  I'm ",$00
..TM1A:	db "@You",$00
..TM1B:	db " go",$00
..TM1C:	db "for",$00
..TM1D:	db " all th",$00
..TM1E:	db " though",$00
..TM1F:	db "ing you",$00
..TM20:	db "e you",$00
..TM21:	db "ring ",$00
..TM22:	db "one ",$00
..TM23:	db "get",$00
..TM24:	db "t you ",$00
..TM25:	db "@I'm s",$00
..TM26:	db " the s",$00
..TM27:	db "e's ",$00
..TM28:	db "port",$00
..TM29:	db "d...",$00
..TM2A:	db " out ",$00
..TM2B:	db "@What",$00
..TM2C:	db " get ",$00
..TM2D:	db "I have ",$00
..TM2E:	db "looking",$00
..TM2F:	db "n this ",$00
..TM30:	db " of my ",$00
..TM31:	db " have a",$00
..TM32:	db "ent ",$00
..TM33:	db " do",$00
..TM34:	db "d of ",$00
..TM35:	db "ting",$00
..TM36:	db "ncrease",$00
..TM37:	db " Twoson",$00
..TM38:	db "through",$00
..TM39:	db "s your ",$00
..TM3A:	db "ou'll ",$00
..TM3B:	db " place",$00
..TM3C:	db " right",$00
..TM3D:	db " Onett",$00
..TM3E:	db "     ",$00
..TM3F:	db " our ",$00
..TM40:	db " too",$00
..TM41:	db "ater",$00
..TM42:	db " be ",$00
..TM43:	db "ain",$00
..TM44:	db "ing.",$00
..TM45:	db "take ",$00
..TM46:	db "e is ",$00
..TM47:	db "the",$00
..TM48:	db " please",$00
..TM49:	db " do you",$00
..TM4A:	db "need",$00
..TM4B:	db "use",$00
..TM4C:	db " now.",$00
..TM4D:	db " got ",$00
..TM4E:	db "   ",$00
..TM4F:	db "and ",$00
..TM50:	db "ning",$00
..TM51:	db " sta",$00
..TM52:	db " the t",$00
..TM53:	db "I was ",$00
..TM54:	db "y the ",$00
..TM55:	db "his",$00
..TM56:	db "appe",$00
..TM57:	db "con",$00
..TM58:	db " ho",$00
..TM59:	db "hat's ",$00
..TM5A:	db "Threed",$00
..TM5B:	db "get ",$00
..TM5C:	db "s of ",$00
..TM5D:	db "inter",$00
..TM5E:	db "talk",$00
..TM5F:	db " man",$00
..TM60:	db "day",$00
..TM61:	db "ove",$00
..TM62:	db " ha ha",$00
..TM63:	db "inally",$00
..TM64:	db "monkey",$00
..TM65:	db "s and ",$00
..TM66:	db "ate",$00
..TM67:	db "see",$00
..TM68:	db "town",$00
..TM69:	db "side",$00
..TM6A:	db "y to ",$00
..TM6B:	db "ever ",$00
..TM6C:	db "equip",$00
..TM6D:	db " than",$00
..TM6E:	db " who",$00
..TM6F:	db "long",$00
..TM70:	db "care",$00
..TM71:	db "room",$00
..TM72:	db "e are ",$00
..TM73:	db "ard",$00
..TM74:	db "end",$00
..TM75:	db ", you ",$00
..TM76:	db " the b",$00
..TM77:	db "I know",$00
..TM78:	db "think ",$00
..TM79:	db "s you ",$00
..TM7A:	db "time",$00
..TM7B:	db "ment",$00
..TM7C:	db " so",$00
..TM7D:	db "!  ",$00
..TM7E:	db "I've ",$00
..TM7F:	db "ell",$00
..TM80:	db " wa",$00
..TM81:	db "ious",$00
..TM82:	db "reat",$00
..TM83:	db "live",$00
..TM84:	db "ange",$00
..TM85:	db " we",$00
..TM86:	db "ble",$00
..TM87:	db "@.....",$00
..TM88:	db "ecover",$00
..TM89:	db " only ",$00
..TM8A:	db "thing ",$00
..TM8B:	db "er...",$00
..TM8C:	db "Mr. ",$00
..TM8D:	db "ough",$00
..TM8E:	db " now",$00
..TM8F:	db "  I",$00
..TM90:	db "wor",$00
..TM91:	db "to  ",$00
..TM92:	db "ed.",$00
..TM93:	db "  I ",$00
..TM94:	db "@re ",$00
..TM95:	db " give ",$00
..TM96:	db "ing a ",$00
..TM97:	db "return",$00
..TM98:	db "better",$00
..TM99:	db "ince ",$00
..TM9A:	db " well",$00
..TM9B:	db " one ",$00
..TM9C:	db "still",$00
..TM9D:	db "ying ",$00
..TM9E:	db "me...",$00
..TM9F:	db "sta",$00
..TMA0:	db "ust ",$00
..TMA1:	db "per",$00
..TMA2:	db "lease",$00
..TMA3:	db "ling ",$00
..TMA4:	db "point",$00
..TMA5:	db "ect",$00
..TMA6:	db "ast",$00
..TMA7:	db "pretty",$00
..TMA8:	db "Giygas",$00
..TMA9:	db "ecause",$00
..TMAA:	db "member",$00
..TMAB:	db "carry ",$00
..TMAC:	db " used ",$00
..TMAD:	db "elieve",$00
..TMAE:	db " money",$00
..TMAF:	db "pres",$00
..TMB0:	db "way",$00
..TMB1:	db " di",$00
..TMB2:	db " even",$00
..TMB3:	db "ound ",$00
..TMB4:	db "s to ",$00
..TMB5:	db "ting ",$00
..TMB6:	db "ted ",$00
..TMB7:	db "oing",$00
..TMB8:	db " and",$00
..TMB9:	db "ine",$00
..TMBA:	db "  T",$00
..TMBB:	db "sure",$00
..TMBC:	db " on ",$00
..TMBD:	db "@...I",$00
..TMBE:	db "while",$00
..TMBF:	db "@but ",$00
..TMC0:	db "@We",$00
..TMC1:	db "ice",$00
..TMC2:	db "se ",$00
..TMC3:	db "ive ",$00
..TMC4:	db " rea",$00
..TMC5:	db " com",$00
..TMC6:	db "est ",$00
..TMC7:	db "have",$00
..TMC8:	db " but",$00
..TMC9:	db "away",$00
..TMCA:	db "here",$00
..TMCB:	db " must",$00
..TMCC:	db " but ",$00
..TMCD:	db " want",$00
..TMCE:	db "ready",$00
..TMCF:	db "I'm",$00
..TMD0:	db "carr",$00
..TMD1:	db "my ",$00
..TMD2:	db "ay...",$00
..TMD3:	db " are ",$00
..TMD4:	db "@Hey,",$00
..TMD5:	db "world",$00
..TMD6:	db "ing a",$00
..TMD7:	db " happ",$00
..TMD8:	db " seem",$00
..TMD9:	db " his ",$00
..TMDA:	db "nder",$00
..TMDB:	db " se",$00
..TMDC:	db "ant",$00
..TMDD:	db "item",$00
..TMDE:	db "`But",$00
..TMDF:	db " sho",$00
..TME0:	db "in a ",$00
..TME1:	db "made ",$00
..TME2:	db "night",$00
..TME3:	db "et's ",$00
..TME4:	db " like",$00
..TME5:	db "  The",$00
..TME6:	db "che",$00
..TME7:	db " de",$00
..TME8:	db "ful",$00
..TME9:	db "hat",$00
..TMEA:	db "and",$00
..TMEB:	db "self",$00
..TMEC:	db "ould",$00
..TMED:	db "@No",$00
..TMEE:	db "car",$00
..TMEF:	db " tr",$00
..TMF0:	db " good",$00
..TMF1:	db " stor",$00
..TMF2:	db "ombie",$00
..TMF3:	db "@Oh",$00
..TMF4:	db "@It",$00
..TMF5:	db "s a ",$00
..TMF6:	db "vent",$00
..TMF7:	db "ant ",$00
..TMF8:	db " so ",$00
..TMF9:	db "olla",$00
..TMFA:	db "ree",$00
..TMFB:	db "Your ",$00
..TMFC:	db "make ",$00
..TMFD:	db " work",$00
..TMFE:	db "power",$00
..TMFF:	db " home",$00

.Bank3:
..TM00:	db "also",$00
..TM01:	db "ance",$00
..TM02:	db "@How",$00
..TM03:	db "h...",$00
..TM04:	db "@If",$00
..TM05:	db "ple",$00
..TM06:	db "buy",$00
..TM07:	db "e, ",$00
..TM08:	db "n't",$00
..TM09:	db "oke",$00
..TM0A:	db "n't ",$00
..TM0B:	db "more",$00
..TM0C:	db "Good",$00
..TM0D:	db "t a ",$00
..TM0E:	db " all",$00
..TM0F:	db "take",$00
..TM10:	db "round",$00
..TM11:	db " when",$00
..TM12:	db " name",$00
..TM13:	db "being",$00
..TM14:	db "attle",$00
..TM15:	db "ite",$00
..TM16:	db "ack",$00
..TM17:	db "y...",$00
..TM18:	db "@Whe",$00
..TM19:	db "with",$00
..TM1A:	db "al ",$00
..TM1B:	db "have ",$00
..TM1C:	db " look",$00
..TM1D:	db "t of ",$00
..TM1E:	db "aster",$00
..TM1F:	db " a lo",$00
..TM20:	db " feel",$00
..TM21:	db "here ",$00
..TM22:	db "count",$00
..TM23:	db "monst",$00
..TM24:	db "now",$00
..TM25:	db "ark",$00
..TM26:	db "ous",$00
..TM27:	db "'ll",$00
..TM28:	db " bus",$00
..TM29:	db "head",$00
..TM2A:	db " any ",$00
..TM2B:	db "t you",$00
..TM2C:	db "erson",$00
..TM2D:	db "after",$00
..TM2E:	db "ummer",$00
..TM2F:	db " hard",$00
..TM30:	db "ful ",$00
..TM31:	db "ever",$00
..TM32:	db " kid",$00
..TM33:	db " a b",$00
..TM34:	db "kay",$00
..TM35:	db "tra",$00
..TM36:	db "pla",$00
..TM37:	db "ook",$00
..TM38:	db "ome",$00
..TM39:	db "eat",$00
..TM3A:	db "@Wel",$00
..TM3B:	db " off",$00
..TM3C:	db "turn",$00
..TM3D:	db "I am",$00
..TM3E:	db "oney",$00
..TM3F:	db " any",$00
..TM40:	db "ave",$00
..TM41:	db "any ",$00
..TM42:	db "enem",$00
..TM43:	db " con",$00
..TM44:	db " me ",$00
..TM45:	db "red",$00
..TM46:	db "en ",$00
..TM47:	db " bo",$00
..TM48:	db " re",$00
..TM49:	db "ell ",$00
..TM4A:	db "sell",$00
..TM4B:	db "what",$00
..TM4C:	db "next",$00
..TM4D:	db "ure",$00
..TM4E:	db " bu",$00
..TM4F:	db "pro",$00
..TM50:	db " on",$00
..TM51:	db "res",$00
..TM52:	db "es ",$00
..TM53:	db " lo",$00
..TM54:	db "our",$00
..TM55:	db "use ",$00
..TM56:	db "iste",$00
..TM57:	db "ood",$00
..TM58:	db " no",$00
..TM59:	db "ope",$00
..TM5A:	db "ock",$00
..TM5B:	db "row",$00
..TM5C:	db "@He",$00
..TM5D:	db "how",$00
..TM5E:	db " may",$00
..TM5F:	db " as ",$00
..TM60:	db "stor",$00
..TM61:	db " are",$00
..TM62:	db "ost ",$00
..TM63:	db "mean",$00
..TM64:	db "  We",$00
..TM65:	db "  He",$00
..TM66:	db "@An",$00
..TM67:	db "it ",$00
..TM68:	db "in ",$00
..TM69:	db "ound",$00
..TM6A:	db "one.",$00
..TM6B:	db "come",$00
..TM6C:	db "blue",$00
..TM6D:	db "way,",$00
..TM6E:	db " or ",$00
..TM6F:	db " mo",$00
..TM70:	db ".  ",$00
..TM71:	db "each",$00
..TM72:	db "some",$00
..TM73:	db "@(Th",$00
..TM74:	db "otel",$00
..TM75:	db "hand",$00
..TM76:	db "came",$00
..TM77:	db " ca",$00
..TM78:	db "ame",$00
..TM79:	db "@Hey",$00
..TM7A:	db "een ",$00
..TM7B:	db "spec",$00
..TM7C:	db "red ",$00
..TM7D:	db "ing!",$00
..TM7E:	db " ...",$00
..TM7F:	db "hose",$00
..TM80:	db "ind ",$00
..TM81:	db "ice ",$00
..TM82:	db "ver",$00
..TM83:	db "  W",$00
..TM84:	db "min",$00
..TM85:	db "et ",$00
..TM86:	db "on ",$00
..TM87:	db "ace",$00
..TM88:	db "er.",$00
..TM89:	db "are ",$00
..TM8A:	db "nter",$00
..TM8B:	db "o...",$00
..TM8C:	db "were",$00
..TM8D:	db "help",$00
..TM8E:	db "old ",$00
..TM8F:	db " it.",$00
..TM90:	db "hear",$00
..TM91:	db "stop",$00
..TM92:	db "look",$00
..TM93:	db "com",$00
..TM94:	db "@Do",$00
..TM95:	db " her",$00
..TM96:	db " pro",$00
..TM97:	db "chin",$00
..TM98:	db "ble ",$00
..TM99:	db "e a ",$00
..TM9A:	db "girl",$00
..TM9B:	db "luck",$00
..TM9C:	db "  B",$00
..TM9D:	db "act",$00
..TM9E:	db "ike",$00
..TM9F:	db "down",$00
..TMA0:	db "part",$00
..TMA1:	db " see",$00
..TMA2:	db " use",$00
..TMA3:	db "uch ",$00
..TMA4:	db "from",$00
..TMA5:	db "just",$00
..TMA6:	db "llow",$00
..TMA7:	db "@Her",$00
..TMA8:	db " at ",$00
..TMA9:	db "@So,",$00
..TMAA:	db " ye",$00
..TMAB:	db "ser",$00
..TMAC:	db "ying",$00
..TMAD:	db "ring",$00
..TMAE:	db "eave",$00
..TMAF:	db "big ",$00
..TMB0:	db "ried",$00
..TMB1:	db " was",$00
..TMB2:	db " say",$00
..TMB3:	db " su",$00
..TMB4:	db "her",$00
..TMB5:	db "it.",$00
..TMB6:	db "Man",$00
..TMB7:	db "kin",$00
..TMB8:	db " up",$00
..TMB9:	db "ers",$00
..TMBA:	db "@Why",$00
..TMBB:	db "p...",$00
..TMBC:	db "cour",$00
..TMBD:	db " him",$00
..TMBE:	db "agic",$00
..TMBF:	db "any",$00
..TMC0:	db "fin",$00
..TMC1:	db "eal",$00
..TMC2:	db "he ",$00
..TMC3:	db "ide",$00
..TMC4:	db "oor",$00
..TMC5:	db "ity",$00
..TMC6:	db "got",$00
..TMC7:	db "ens",$00
..TMC8:	db "ish",$00
..TMC9:	db "ive",$00
..TMCA:	db " sa",$00
..TMCB:	db "oon",$00
..TMCC:	db "fee",$00
..TMCD:	db "s a",$00
..TMCE:	db "nce",$00
..TMCF:	db "  D",$00
..TMD0:	db "uck",$00
..TMD1:	db "ass",$00
..TMD2:	db "man",$00
..TMD3:	db "a p",$00
..TMD4:	db "@(I",$00
..TMD5:	db "@Wh",$00
..TMD6:	db " gu",$00
..TMD7:	db "  (",$00
..TMD8:	db "bus",$00
..TMD9:	db "los",$00
..TMDA:	db "ts ",$00
..TMDB:	db " ba",$00
..TMDC:	db "  S",$00
..TMDD:	db " if",$00
..TMDE:	db "@Ha",$00
..TMDF:	db " ma",$00
..TME0:	db "unn",$00
..TME1:	db "ay ",$00
..TME2:	db "ner",$00
..TME3:	db "@A ",$00
..TME4:	db "or ",$00
..TME5:	db "stu",$00
..TME6:	db "ust",$00
..TME7:	db "kya",$00
..TME8:	db "shi",$00
..TME9:	db "pos",$00
..TMEA:	db "  A",$00
..TMEB:	db "int",$00
..TMEC:	db " le",$00
..TMED:	db "ary",$00
..TMEE:	db "ven",$00
..TMEF:	db " ch",$00
..TMF0:	db "own",$00
..TMF1:	db " hu",$00
..TMF2:	db "@My",$00
..TMF3:	db "@So",$00
..TMF4:	db " sp",$00
..TMF5:	db " sh",$00
..TMF6:	db "wan",$00
..TMF7:	db "ool",$00
..TMF8:	db "  Y",$00
..TMF9:	db "old",$00
..TMFA:	db "eas",$00
..TMFB:	db ", I",$00
..TMFC:	db "iki",$00
..TMFD:	db "`Ky",$00
..TMFE:	db "@Ye",$00
..TMFF:	db "spi",$00

cleartable

org $C8CDED
EB_TextMacroBank1Ptrs:
;$C8CDED
	dd TextMacroData_Bank1_TM00,TextMacroData_Bank1_TM01,TextMacroData_Bank1_TM02,TextMacroData_Bank1_TM03,TextMacroData_Bank1_TM04,TextMacroData_Bank1_TM05,TextMacroData_Bank1_TM06,TextMacroData_Bank1_TM07
	dd TextMacroData_Bank1_TM08,TextMacroData_Bank1_TM09,TextMacroData_Bank1_TM0A,TextMacroData_Bank1_TM0B,TextMacroData_Bank1_TM0C,TextMacroData_Bank1_TM0D,TextMacroData_Bank1_TM0E,TextMacroData_Bank1_TM0F
	dd TextMacroData_Bank1_TM10,TextMacroData_Bank1_TM11,TextMacroData_Bank1_TM12,TextMacroData_Bank1_TM13,TextMacroData_Bank1_TM14,TextMacroData_Bank1_TM15,TextMacroData_Bank1_TM16,TextMacroData_Bank1_TM17
	dd TextMacroData_Bank1_TM18,TextMacroData_Bank1_TM19,TextMacroData_Bank1_TM1A,TextMacroData_Bank1_TM1B,TextMacroData_Bank1_TM1C,TextMacroData_Bank1_TM1D,TextMacroData_Bank1_TM1E,TextMacroData_Bank1_TM1F
	dd TextMacroData_Bank1_TM20,TextMacroData_Bank1_TM21,TextMacroData_Bank1_TM22,TextMacroData_Bank1_TM23,TextMacroData_Bank1_TM24,TextMacroData_Bank1_TM25,TextMacroData_Bank1_TM26,TextMacroData_Bank1_TM27
	dd TextMacroData_Bank1_TM28,TextMacroData_Bank1_TM29,TextMacroData_Bank1_TM2A,TextMacroData_Bank1_TM2B,TextMacroData_Bank1_TM2C,TextMacroData_Bank1_TM2D,TextMacroData_Bank1_TM2E,TextMacroData_Bank1_TM2F
	dd TextMacroData_Bank1_TM30,TextMacroData_Bank1_TM31,TextMacroData_Bank1_TM32,TextMacroData_Bank1_TM33,TextMacroData_Bank1_TM34,TextMacroData_Bank1_TM35,TextMacroData_Bank1_TM36,TextMacroData_Bank1_TM37
	dd TextMacroData_Bank1_TM38,TextMacroData_Bank1_TM39,TextMacroData_Bank1_TM3A,TextMacroData_Bank1_TM3B,TextMacroData_Bank1_TM3C,TextMacroData_Bank1_TM3D,TextMacroData_Bank1_TM3E,TextMacroData_Bank1_TM3F
	dd TextMacroData_Bank1_TM40,TextMacroData_Bank1_TM41,TextMacroData_Bank1_TM42,TextMacroData_Bank1_TM43,TextMacroData_Bank1_TM44,TextMacroData_Bank1_TM45,TextMacroData_Bank1_TM46,TextMacroData_Bank1_TM47
	dd TextMacroData_Bank1_TM48,TextMacroData_Bank1_TM49,TextMacroData_Bank1_TM4A,TextMacroData_Bank1_TM4B,TextMacroData_Bank1_TM4C,TextMacroData_Bank1_TM4D,TextMacroData_Bank1_TM4E,TextMacroData_Bank1_TM4F
	dd TextMacroData_Bank1_TM50,TextMacroData_Bank1_TM51,TextMacroData_Bank1_TM52,TextMacroData_Bank1_TM53,TextMacroData_Bank1_TM54,TextMacroData_Bank1_TM55,TextMacroData_Bank1_TM56,TextMacroData_Bank1_TM57
	dd TextMacroData_Bank1_TM58,TextMacroData_Bank1_TM59,TextMacroData_Bank1_TM5A,TextMacroData_Bank1_TM5B,TextMacroData_Bank1_TM5C,TextMacroData_Bank1_TM5D,TextMacroData_Bank1_TM5E,TextMacroData_Bank1_TM5F
	dd TextMacroData_Bank1_TM60,TextMacroData_Bank1_TM61,TextMacroData_Bank1_TM62,TextMacroData_Bank1_TM63,TextMacroData_Bank1_TM64,TextMacroData_Bank1_TM65,TextMacroData_Bank1_TM66,TextMacroData_Bank1_TM67
	dd TextMacroData_Bank1_TM68,TextMacroData_Bank1_TM69,TextMacroData_Bank1_TM6A,TextMacroData_Bank1_TM6B,TextMacroData_Bank1_TM6C,TextMacroData_Bank1_TM6D,TextMacroData_Bank1_TM6E,TextMacroData_Bank1_TM6F
	dd TextMacroData_Bank1_TM70,TextMacroData_Bank1_TM71,TextMacroData_Bank1_TM72,TextMacroData_Bank1_TM73,TextMacroData_Bank1_TM74,TextMacroData_Bank1_TM75,TextMacroData_Bank1_TM76,TextMacroData_Bank1_TM77
	dd TextMacroData_Bank1_TM78,TextMacroData_Bank1_TM79,TextMacroData_Bank1_TM7A,TextMacroData_Bank1_TM7B,TextMacroData_Bank1_TM7C,TextMacroData_Bank1_TM7D,TextMacroData_Bank1_TM7E,TextMacroData_Bank1_TM7F
	dd TextMacroData_Bank1_TM80,TextMacroData_Bank1_TM81,TextMacroData_Bank1_TM82,TextMacroData_Bank1_TM83,TextMacroData_Bank1_TM84,TextMacroData_Bank1_TM85,TextMacroData_Bank1_TM86,TextMacroData_Bank1_TM87
	dd TextMacroData_Bank1_TM88,TextMacroData_Bank1_TM89,TextMacroData_Bank1_TM8A,TextMacroData_Bank1_TM8B,TextMacroData_Bank1_TM8C,TextMacroData_Bank1_TM8D,TextMacroData_Bank1_TM8E,TextMacroData_Bank1_TM8F
	dd TextMacroData_Bank1_TM90,TextMacroData_Bank1_TM91,TextMacroData_Bank1_TM92,TextMacroData_Bank1_TM93,TextMacroData_Bank1_TM94,TextMacroData_Bank1_TM95,TextMacroData_Bank1_TM96,TextMacroData_Bank1_TM97
	dd TextMacroData_Bank1_TM98,TextMacroData_Bank1_TM99,TextMacroData_Bank1_TM9A,TextMacroData_Bank1_TM9B,TextMacroData_Bank1_TM9C,TextMacroData_Bank1_TM9D,TextMacroData_Bank1_TM9E,TextMacroData_Bank1_TM9F
	dd TextMacroData_Bank1_TMA0,TextMacroData_Bank1_TMA1,TextMacroData_Bank1_TMA2,TextMacroData_Bank1_TMA3,TextMacroData_Bank1_TMA4,TextMacroData_Bank1_TMA5,TextMacroData_Bank1_TMA6,TextMacroData_Bank1_TMA7
	dd TextMacroData_Bank1_TMA8,TextMacroData_Bank1_TMA9,TextMacroData_Bank1_TMAA,TextMacroData_Bank1_TMAB,TextMacroData_Bank1_TMAC,TextMacroData_Bank1_TMAD,TextMacroData_Bank1_TMAE,TextMacroData_Bank1_TMAF
	dd TextMacroData_Bank1_TMB0,TextMacroData_Bank1_TMB1,TextMacroData_Bank1_TMB2,TextMacroData_Bank1_TMB3,TextMacroData_Bank1_TMB4,TextMacroData_Bank1_TMB5,TextMacroData_Bank1_TMB6,TextMacroData_Bank1_TMB7
	dd TextMacroData_Bank1_TMB8,TextMacroData_Bank1_TMB9,TextMacroData_Bank1_TMBA,TextMacroData_Bank1_TMBB,TextMacroData_Bank1_TMBC,TextMacroData_Bank1_TMBD,TextMacroData_Bank1_TMBE,TextMacroData_Bank1_TMBF
	dd TextMacroData_Bank1_TMC0,TextMacroData_Bank1_TMC1,TextMacroData_Bank1_TMC2,TextMacroData_Bank1_TMC3,TextMacroData_Bank1_TMC4,TextMacroData_Bank1_TMC5,TextMacroData_Bank1_TMC6,TextMacroData_Bank1_TMC7
	dd TextMacroData_Bank1_TMC8,TextMacroData_Bank1_TMC9,TextMacroData_Bank1_TMCA,TextMacroData_Bank1_TMCB,TextMacroData_Bank1_TMCC,TextMacroData_Bank1_TMCD,TextMacroData_Bank1_TMCE,TextMacroData_Bank1_TMCF
	dd TextMacroData_Bank1_TMD0,TextMacroData_Bank1_TMD1,TextMacroData_Bank1_TMD2,TextMacroData_Bank1_TMD3,TextMacroData_Bank1_TMD4,TextMacroData_Bank1_TMD5,TextMacroData_Bank1_TMD6,TextMacroData_Bank1_TMD7
	dd TextMacroData_Bank1_TMD8,TextMacroData_Bank1_TMD9,TextMacroData_Bank1_TMDA,TextMacroData_Bank1_TMDB,TextMacroData_Bank1_TMDC,TextMacroData_Bank1_TMDD,TextMacroData_Bank1_TMDE,TextMacroData_Bank1_TMDF
	dd TextMacroData_Bank1_TME0,TextMacroData_Bank1_TME1,TextMacroData_Bank1_TME2,TextMacroData_Bank1_TME3,TextMacroData_Bank1_TME4,TextMacroData_Bank1_TME5,TextMacroData_Bank1_TME6,TextMacroData_Bank1_TME7
	dd TextMacroData_Bank1_TME8,TextMacroData_Bank1_TME9,TextMacroData_Bank1_TMEA,TextMacroData_Bank1_TMEB,TextMacroData_Bank1_TMEC,TextMacroData_Bank1_TMED,TextMacroData_Bank1_TMEE,TextMacroData_Bank1_TMEF
	dd TextMacroData_Bank1_TMF0,TextMacroData_Bank1_TMF1,TextMacroData_Bank1_TMF2,TextMacroData_Bank1_TMF3,TextMacroData_Bank1_TMF4,TextMacroData_Bank1_TMF5,TextMacroData_Bank1_TMF6,TextMacroData_Bank1_TMF7
	dd TextMacroData_Bank1_TMF8,TextMacroData_Bank1_TMF9,TextMacroData_Bank1_TMFA,TextMacroData_Bank1_TMFB,TextMacroData_Bank1_TMFC,TextMacroData_Bank1_TMFD,TextMacroData_Bank1_TMFE,TextMacroData_Bank1_TMFF

EB_TextMacroBank2Ptrs:
;$C8D1ED
	dd TextMacroData_Bank2_TM00,TextMacroData_Bank2_TM01,TextMacroData_Bank2_TM02,TextMacroData_Bank2_TM03,TextMacroData_Bank2_TM04,TextMacroData_Bank2_TM05,TextMacroData_Bank2_TM06,TextMacroData_Bank2_TM07
	dd TextMacroData_Bank2_TM08,TextMacroData_Bank2_TM09,TextMacroData_Bank2_TM0A,TextMacroData_Bank2_TM0B,TextMacroData_Bank2_TM0C,TextMacroData_Bank2_TM0D,TextMacroData_Bank2_TM0E,TextMacroData_Bank2_TM0F
	dd TextMacroData_Bank2_TM10,TextMacroData_Bank2_TM11,TextMacroData_Bank2_TM12,TextMacroData_Bank2_TM13,TextMacroData_Bank2_TM14,TextMacroData_Bank2_TM15,TextMacroData_Bank2_TM16,TextMacroData_Bank2_TM17
	dd TextMacroData_Bank2_TM18,TextMacroData_Bank2_TM19,TextMacroData_Bank2_TM1A,TextMacroData_Bank2_TM1B,TextMacroData_Bank2_TM1C,TextMacroData_Bank2_TM1D,TextMacroData_Bank2_TM1E,TextMacroData_Bank2_TM1F
	dd TextMacroData_Bank2_TM20,TextMacroData_Bank2_TM21,TextMacroData_Bank2_TM22,TextMacroData_Bank2_TM23,TextMacroData_Bank2_TM24,TextMacroData_Bank2_TM25,TextMacroData_Bank2_TM26,TextMacroData_Bank2_TM27
	dd TextMacroData_Bank2_TM28,TextMacroData_Bank2_TM29,TextMacroData_Bank2_TM2A,TextMacroData_Bank2_TM2B,TextMacroData_Bank2_TM2C,TextMacroData_Bank2_TM2D,TextMacroData_Bank2_TM2E,TextMacroData_Bank2_TM2F
	dd TextMacroData_Bank2_TM30,TextMacroData_Bank2_TM31,TextMacroData_Bank2_TM32,TextMacroData_Bank2_TM33,TextMacroData_Bank2_TM34,TextMacroData_Bank2_TM35,TextMacroData_Bank2_TM36,TextMacroData_Bank2_TM37
	dd TextMacroData_Bank2_TM38,TextMacroData_Bank2_TM39,TextMacroData_Bank2_TM3A,TextMacroData_Bank2_TM3B,TextMacroData_Bank2_TM3C,TextMacroData_Bank2_TM3D,TextMacroData_Bank2_TM3E,TextMacroData_Bank2_TM3F
	dd TextMacroData_Bank2_TM40,TextMacroData_Bank2_TM41,TextMacroData_Bank2_TM42,TextMacroData_Bank2_TM43,TextMacroData_Bank2_TM44,TextMacroData_Bank2_TM45,TextMacroData_Bank2_TM46,TextMacroData_Bank2_TM47
	dd TextMacroData_Bank2_TM48,TextMacroData_Bank2_TM49,TextMacroData_Bank2_TM4A,TextMacroData_Bank2_TM4B,TextMacroData_Bank2_TM4C,TextMacroData_Bank2_TM4D,TextMacroData_Bank2_TM4E,TextMacroData_Bank2_TM4F
	dd TextMacroData_Bank2_TM50,TextMacroData_Bank2_TM51,TextMacroData_Bank2_TM52,TextMacroData_Bank2_TM53,TextMacroData_Bank2_TM54,TextMacroData_Bank2_TM55,TextMacroData_Bank2_TM56,TextMacroData_Bank2_TM57
	dd TextMacroData_Bank2_TM58,TextMacroData_Bank2_TM59,TextMacroData_Bank2_TM5A,TextMacroData_Bank2_TM5B,TextMacroData_Bank2_TM5C,TextMacroData_Bank2_TM5D,TextMacroData_Bank2_TM5E,TextMacroData_Bank2_TM5F
	dd TextMacroData_Bank2_TM60,TextMacroData_Bank2_TM61,TextMacroData_Bank2_TM62,TextMacroData_Bank2_TM63,TextMacroData_Bank2_TM64,TextMacroData_Bank2_TM65,TextMacroData_Bank2_TM66,TextMacroData_Bank2_TM67
	dd TextMacroData_Bank2_TM68,TextMacroData_Bank2_TM69,TextMacroData_Bank2_TM6A,TextMacroData_Bank2_TM6B,TextMacroData_Bank2_TM6C,TextMacroData_Bank2_TM6D,TextMacroData_Bank2_TM6E,TextMacroData_Bank2_TM6F
	dd TextMacroData_Bank2_TM70,TextMacroData_Bank2_TM71,TextMacroData_Bank2_TM72,TextMacroData_Bank2_TM73,TextMacroData_Bank2_TM74,TextMacroData_Bank2_TM75,TextMacroData_Bank2_TM76,TextMacroData_Bank2_TM77
	dd TextMacroData_Bank2_TM78,TextMacroData_Bank2_TM79,TextMacroData_Bank2_TM7A,TextMacroData_Bank2_TM7B,TextMacroData_Bank2_TM7C,TextMacroData_Bank2_TM7D,TextMacroData_Bank2_TM7E,TextMacroData_Bank2_TM7F
	dd TextMacroData_Bank2_TM80,TextMacroData_Bank2_TM81,TextMacroData_Bank2_TM82,TextMacroData_Bank2_TM83,TextMacroData_Bank2_TM84,TextMacroData_Bank2_TM85,TextMacroData_Bank2_TM86,TextMacroData_Bank2_TM87
	dd TextMacroData_Bank2_TM88,TextMacroData_Bank2_TM89,TextMacroData_Bank2_TM8A,TextMacroData_Bank2_TM8B,TextMacroData_Bank2_TM8C,TextMacroData_Bank2_TM8D,TextMacroData_Bank2_TM8E,TextMacroData_Bank2_TM8F
	dd TextMacroData_Bank2_TM90,TextMacroData_Bank2_TM91,TextMacroData_Bank2_TM92,TextMacroData_Bank2_TM93,TextMacroData_Bank2_TM94,TextMacroData_Bank2_TM95,TextMacroData_Bank2_TM96,TextMacroData_Bank2_TM97
	dd TextMacroData_Bank2_TM98,TextMacroData_Bank2_TM99,TextMacroData_Bank2_TM9A,TextMacroData_Bank2_TM9B,TextMacroData_Bank2_TM9C,TextMacroData_Bank2_TM9D,TextMacroData_Bank2_TM9E,TextMacroData_Bank2_TM9F
	dd TextMacroData_Bank2_TMA0,TextMacroData_Bank2_TMA1,TextMacroData_Bank2_TMA2,TextMacroData_Bank2_TMA3,TextMacroData_Bank2_TMA4,TextMacroData_Bank2_TMA5,TextMacroData_Bank2_TMA6,TextMacroData_Bank2_TMA7
	dd TextMacroData_Bank2_TMA8,TextMacroData_Bank2_TMA9,TextMacroData_Bank2_TMAA,TextMacroData_Bank2_TMAB,TextMacroData_Bank2_TMAC,TextMacroData_Bank2_TMAD,TextMacroData_Bank2_TMAE,TextMacroData_Bank2_TMAF
	dd TextMacroData_Bank2_TMB0,TextMacroData_Bank2_TMB1,TextMacroData_Bank2_TMB2,TextMacroData_Bank2_TMB3,TextMacroData_Bank2_TMB4,TextMacroData_Bank2_TMB5,TextMacroData_Bank2_TMB6,TextMacroData_Bank2_TMB7
	dd TextMacroData_Bank2_TMB8,TextMacroData_Bank2_TMB9,TextMacroData_Bank2_TMBA,TextMacroData_Bank2_TMBB,TextMacroData_Bank2_TMBC,TextMacroData_Bank2_TMBD,TextMacroData_Bank2_TMBE,TextMacroData_Bank2_TMBF
	dd TextMacroData_Bank2_TMC0,TextMacroData_Bank2_TMC1,TextMacroData_Bank2_TMC2,TextMacroData_Bank2_TMC3,TextMacroData_Bank2_TMC4,TextMacroData_Bank2_TMC5,TextMacroData_Bank2_TMC6,TextMacroData_Bank2_TMC7
	dd TextMacroData_Bank2_TMC8,TextMacroData_Bank2_TMC9,TextMacroData_Bank2_TMCA,TextMacroData_Bank2_TMCB,TextMacroData_Bank2_TMCC,TextMacroData_Bank2_TMCD,TextMacroData_Bank2_TMCE,TextMacroData_Bank2_TMCF
	dd TextMacroData_Bank2_TMD0,TextMacroData_Bank2_TMD1,TextMacroData_Bank2_TMD2,TextMacroData_Bank2_TMD3,TextMacroData_Bank2_TMD4,TextMacroData_Bank2_TMD5,TextMacroData_Bank2_TMD6,TextMacroData_Bank2_TMD7
	dd TextMacroData_Bank2_TMD8,TextMacroData_Bank2_TMD9,TextMacroData_Bank2_TMDA,TextMacroData_Bank2_TMDB,TextMacroData_Bank2_TMDC,TextMacroData_Bank2_TMDD,TextMacroData_Bank2_TMDE,TextMacroData_Bank2_TMDF
	dd TextMacroData_Bank2_TME0,TextMacroData_Bank2_TME1,TextMacroData_Bank2_TME2,TextMacroData_Bank2_TME3,TextMacroData_Bank2_TME4,TextMacroData_Bank2_TME5,TextMacroData_Bank2_TME6,TextMacroData_Bank2_TME7
	dd TextMacroData_Bank2_TME8,TextMacroData_Bank2_TME9,TextMacroData_Bank2_TMEA,TextMacroData_Bank2_TMEB,TextMacroData_Bank2_TMEC,TextMacroData_Bank2_TMED,TextMacroData_Bank2_TMEE,TextMacroData_Bank2_TMEF
	dd TextMacroData_Bank2_TMF0,TextMacroData_Bank2_TMF1,TextMacroData_Bank2_TMF2,TextMacroData_Bank2_TMF3,TextMacroData_Bank2_TMF4,TextMacroData_Bank2_TMF5,TextMacroData_Bank2_TMF6,TextMacroData_Bank2_TMF7
	dd TextMacroData_Bank2_TMF8,TextMacroData_Bank2_TMF9,TextMacroData_Bank2_TMFA,TextMacroData_Bank2_TMFB,TextMacroData_Bank2_TMFC,TextMacroData_Bank2_TMFD,TextMacroData_Bank2_TMFE,TextMacroData_Bank2_TMFF

EB_TextMacroBank3Ptrs:
;$C8D5ED
	dd TextMacroData_Bank3_TM00,TextMacroData_Bank3_TM01,TextMacroData_Bank3_TM02,TextMacroData_Bank3_TM03,TextMacroData_Bank3_TM04,TextMacroData_Bank3_TM05,TextMacroData_Bank3_TM06,TextMacroData_Bank3_TM07
	dd TextMacroData_Bank3_TM08,TextMacroData_Bank3_TM09,TextMacroData_Bank3_TM0A,TextMacroData_Bank3_TM0B,TextMacroData_Bank3_TM0C,TextMacroData_Bank3_TM0D,TextMacroData_Bank3_TM0E,TextMacroData_Bank3_TM0F
	dd TextMacroData_Bank3_TM10,TextMacroData_Bank3_TM11,TextMacroData_Bank3_TM12,TextMacroData_Bank3_TM13,TextMacroData_Bank3_TM14,TextMacroData_Bank3_TM15,TextMacroData_Bank3_TM16,TextMacroData_Bank3_TM17
	dd TextMacroData_Bank3_TM18,TextMacroData_Bank3_TM19,TextMacroData_Bank3_TM1A,TextMacroData_Bank3_TM1B,TextMacroData_Bank3_TM1C,TextMacroData_Bank3_TM1D,TextMacroData_Bank3_TM1E,TextMacroData_Bank3_TM1F
	dd TextMacroData_Bank3_TM20,TextMacroData_Bank3_TM21,TextMacroData_Bank3_TM22,TextMacroData_Bank3_TM23,TextMacroData_Bank3_TM24,TextMacroData_Bank3_TM25,TextMacroData_Bank3_TM26,TextMacroData_Bank3_TM27
	dd TextMacroData_Bank3_TM28,TextMacroData_Bank3_TM29,TextMacroData_Bank3_TM2A,TextMacroData_Bank3_TM2B,TextMacroData_Bank3_TM2C,TextMacroData_Bank3_TM2D,TextMacroData_Bank3_TM2E,TextMacroData_Bank3_TM2F
	dd TextMacroData_Bank3_TM30,TextMacroData_Bank3_TM31,TextMacroData_Bank3_TM32,TextMacroData_Bank3_TM33,TextMacroData_Bank3_TM34,TextMacroData_Bank3_TM35,TextMacroData_Bank3_TM36,TextMacroData_Bank3_TM37
	dd TextMacroData_Bank3_TM38,TextMacroData_Bank3_TM39,TextMacroData_Bank3_TM3A,TextMacroData_Bank3_TM3B,TextMacroData_Bank3_TM3C,TextMacroData_Bank3_TM3D,TextMacroData_Bank3_TM3E,TextMacroData_Bank3_TM3F
	dd TextMacroData_Bank3_TM40,TextMacroData_Bank3_TM41,TextMacroData_Bank3_TM42,TextMacroData_Bank3_TM43,TextMacroData_Bank3_TM44,TextMacroData_Bank3_TM45,TextMacroData_Bank3_TM46,TextMacroData_Bank3_TM47
	dd TextMacroData_Bank3_TM48,TextMacroData_Bank3_TM49,TextMacroData_Bank3_TM4A,TextMacroData_Bank3_TM4B,TextMacroData_Bank3_TM4C,TextMacroData_Bank3_TM4D,TextMacroData_Bank3_TM4E,TextMacroData_Bank3_TM4F
	dd TextMacroData_Bank3_TM50,TextMacroData_Bank3_TM51,TextMacroData_Bank3_TM52,TextMacroData_Bank3_TM53,TextMacroData_Bank3_TM54,TextMacroData_Bank3_TM55,TextMacroData_Bank3_TM56,TextMacroData_Bank3_TM57
	dd TextMacroData_Bank3_TM58,TextMacroData_Bank3_TM59,TextMacroData_Bank3_TM5A,TextMacroData_Bank3_TM5B,TextMacroData_Bank3_TM5C,TextMacroData_Bank3_TM5D,TextMacroData_Bank3_TM5E,TextMacroData_Bank3_TM5F
	dd TextMacroData_Bank3_TM60,TextMacroData_Bank3_TM61,TextMacroData_Bank3_TM62,TextMacroData_Bank3_TM63,TextMacroData_Bank3_TM64,TextMacroData_Bank3_TM65,TextMacroData_Bank3_TM66,TextMacroData_Bank3_TM67
	dd TextMacroData_Bank3_TM68,TextMacroData_Bank3_TM69,TextMacroData_Bank3_TM6A,TextMacroData_Bank3_TM6B,TextMacroData_Bank3_TM6C,TextMacroData_Bank3_TM6D,TextMacroData_Bank3_TM6E,TextMacroData_Bank3_TM6F
	dd TextMacroData_Bank3_TM70,TextMacroData_Bank3_TM71,TextMacroData_Bank3_TM72,TextMacroData_Bank3_TM73,TextMacroData_Bank3_TM74,TextMacroData_Bank3_TM75,TextMacroData_Bank3_TM76,TextMacroData_Bank3_TM77
	dd TextMacroData_Bank3_TM78,TextMacroData_Bank3_TM79,TextMacroData_Bank3_TM7A,TextMacroData_Bank3_TM7B,TextMacroData_Bank3_TM7C,TextMacroData_Bank3_TM7D,TextMacroData_Bank3_TM7E,TextMacroData_Bank3_TM7F
	dd TextMacroData_Bank3_TM80,TextMacroData_Bank3_TM81,TextMacroData_Bank3_TM82,TextMacroData_Bank3_TM83,TextMacroData_Bank3_TM84,TextMacroData_Bank3_TM85,TextMacroData_Bank3_TM86,TextMacroData_Bank3_TM87
	dd TextMacroData_Bank3_TM88,TextMacroData_Bank3_TM89,TextMacroData_Bank3_TM8A,TextMacroData_Bank3_TM8B,TextMacroData_Bank3_TM8C,TextMacroData_Bank3_TM8D,TextMacroData_Bank3_TM8E,TextMacroData_Bank3_TM8F
	dd TextMacroData_Bank3_TM90,TextMacroData_Bank3_TM91,TextMacroData_Bank3_TM92,TextMacroData_Bank3_TM93,TextMacroData_Bank3_TM94,TextMacroData_Bank3_TM95,TextMacroData_Bank3_TM96,TextMacroData_Bank3_TM97
	dd TextMacroData_Bank3_TM98,TextMacroData_Bank3_TM99,TextMacroData_Bank3_TM9A,TextMacroData_Bank3_TM9B,TextMacroData_Bank3_TM9C,TextMacroData_Bank3_TM9D,TextMacroData_Bank3_TM9E,TextMacroData_Bank3_TM9F
	dd TextMacroData_Bank3_TMA0,TextMacroData_Bank3_TMA1,TextMacroData_Bank3_TMA2,TextMacroData_Bank3_TMA3,TextMacroData_Bank3_TMA4,TextMacroData_Bank3_TMA5,TextMacroData_Bank3_TMA6,TextMacroData_Bank3_TMA7
	dd TextMacroData_Bank3_TMA8,TextMacroData_Bank3_TMA9,TextMacroData_Bank3_TMAA,TextMacroData_Bank3_TMAB,TextMacroData_Bank3_TMAC,TextMacroData_Bank3_TMAD,TextMacroData_Bank3_TMAE,TextMacroData_Bank3_TMAF
	dd TextMacroData_Bank3_TMB0,TextMacroData_Bank3_TMB1,TextMacroData_Bank3_TMB2,TextMacroData_Bank3_TMB3,TextMacroData_Bank3_TMB4,TextMacroData_Bank3_TMB5,TextMacroData_Bank3_TMB6,TextMacroData_Bank3_TMB7
	dd TextMacroData_Bank3_TMB8,TextMacroData_Bank3_TMB9,TextMacroData_Bank3_TMBA,TextMacroData_Bank3_TMBB,TextMacroData_Bank3_TMBC,TextMacroData_Bank3_TMBD,TextMacroData_Bank3_TMBE,TextMacroData_Bank3_TMBF
	dd TextMacroData_Bank3_TMC0,TextMacroData_Bank3_TMC1,TextMacroData_Bank3_TMC2,TextMacroData_Bank3_TMC3,TextMacroData_Bank3_TMC4,TextMacroData_Bank3_TMC5,TextMacroData_Bank3_TMC6,TextMacroData_Bank3_TMC7
	dd TextMacroData_Bank3_TMC8,TextMacroData_Bank3_TMC9,TextMacroData_Bank3_TMCA,TextMacroData_Bank3_TMCB,TextMacroData_Bank3_TMCC,TextMacroData_Bank3_TMCD,TextMacroData_Bank3_TMCE,TextMacroData_Bank3_TMCF
	dd TextMacroData_Bank3_TMD0,TextMacroData_Bank3_TMD1,TextMacroData_Bank3_TMD2,TextMacroData_Bank3_TMD3,TextMacroData_Bank3_TMD4,TextMacroData_Bank3_TMD5,TextMacroData_Bank3_TMD6,TextMacroData_Bank3_TMD7
	dd TextMacroData_Bank3_TMD8,TextMacroData_Bank3_TMD9,TextMacroData_Bank3_TMDA,TextMacroData_Bank3_TMDB,TextMacroData_Bank3_TMDC,TextMacroData_Bank3_TMDD,TextMacroData_Bank3_TMDE,TextMacroData_Bank3_TMDF
	dd TextMacroData_Bank3_TME0,TextMacroData_Bank3_TME1,TextMacroData_Bank3_TME2,TextMacroData_Bank3_TME3,TextMacroData_Bank3_TME4,TextMacroData_Bank3_TME5,TextMacroData_Bank3_TME6,TextMacroData_Bank3_TME7
	dd TextMacroData_Bank3_TME8,TextMacroData_Bank3_TME9,TextMacroData_Bank3_TMEA,TextMacroData_Bank3_TMEB,TextMacroData_Bank3_TMEC,TextMacroData_Bank3_TMED,TextMacroData_Bank3_TMEE,TextMacroData_Bank3_TMEF
	dd TextMacroData_Bank3_TMF0,TextMacroData_Bank3_TMF1,TextMacroData_Bank3_TMF2,TextMacroData_Bank3_TMF3,TextMacroData_Bank3_TMF4,TextMacroData_Bank3_TMF5,TextMacroData_Bank3_TMF6,TextMacroData_Bank3_TMF7
	dd TextMacroData_Bank3_TMF8,TextMacroData_Bank3_TMF9,TextMacroData_Bank3_TMFA,TextMacroData_Bank3_TMFB,TextMacroData_Bank3_TMFC,TextMacroData_Bank3_TMFD,TextMacroData_Bank3_TMFE,TextMacroData_Bank3_TMFF

;--------------------------------------------------------------------

;$C8D9ED

;--------------------------------------------------------------------

%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankC9Macros(StartBank, EndBank)
%BANK_START(<StartBank>)

org $C9B4B8
DATA_C9B4B8:
	db $10 : db $01
	db $1F,$EF : dw $006A
	db $1F,$E8 : db $FF
	db $1F,$61
	db $1F,$ED
	db $1F,$E5,$FF
	db $02

%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankCAMacros(StartBank, EndBank)
%BANK_START(<StartBank>)
org $CA2042
GiygasGFX:
	incbin "Graphics/Compressed/GiygasGFX.bin"

;--------------------------------------------------------------------

;$CA382D

;--------------------------------------------------------------------

org $CAD7A1
DATA_CAD7A1:					;\ Info: GFX file...
	dd $00CBD897				;| 00
	dd BGGFX01_Hexagons			;| 01
	dd BGGFX02_Unknown			;| 02
	dd $00CB9EF3				;| 03
	dd $00CB71E5				;| 04
	dd $00CB9DE3				;| 05
	dd $00CB9FFA				;| 06
	dd $00CBB441				;| 07
	dd $00CB75AF				;| 08
	dd $00CB4FC7				;| 09
	dd $00CB9124				;| 0A
	dd $00CBCB04				;| 0B
	dd $00CBD71C				;| 0C
	dd $00CBC978				;| 0D
	dd $00CBB800				;| 0E
	dd $00CB8FAB				;| 0F
	dd $00CB7E7B				;| 10
	dd $00CBA100				;| 11
	dd $00CB6E17				;| 12
	dd $00CBC66E				;| 13
	dd $00CBBA2F				;| 14
	dd $00CBC6BD				;| 15
	dd $00CBC79B				;| 16
	dd $00CBC32C				;| 17
	dd $00CBACCB				;| 18
	dd $00CB73CB				;| 19
	dd $00CBCA2D				;| 1A
	dd $00CB9BAB				;| 1B
	dd $00CBCA67				;| 1C
	dd $00CBCBD2				;| 1D
	dd $00CBD705				;| 1E
	dd $00CBC5C1				;| 1F
	dd $00CBBF7D				;| 20
	dd $00CBCA9E				;| 21
	dd $00CBC19A				;| 22
	dd $00CBC9B6				;| 23
	dd $00CBB88E				;| 24
	dd $00CA7314				;| 25
	dd $00CA65D3				;| 26
	dd $00CA8B4F				;| 27
	dd $00CAA8F9				;| 28
	dd $00CA965F				;| 29
	dd $00CA5723				;| 2A
	dd $00CA7F6C				;| 2B
	dd $00CBD6ED				;| 2C
	dd $00CBCB34				;| 2D
	dd $00CBCB87				;| 2E
	dd $00CB9409				;| 2F
	dd $00CBD6B4				;| 30
	dd $00CBD72E				;| 31
	dd $00CBD6D2				;| 32
	dd $00CBC05E				;| 33
	dd $00CB9932				;| 34
	dd $00CB81CC				;| 35
	dd $00CBAB1E				;| 36
	dd $00CBC870				;| 37
	dd $00CAD755				;| 38
	dd $00CBCBAF				;| 39
	dd $00CBCB5E				;| 3A
	dd $00CBC753				;| 3B
	dd $00CA480F				;| 3C
	dd $00CA382D				;| 3D
	dd $00CAA049				;| 3E
	dd $00CA0000				;| 3F
	dd GiygasGFX				;| 40
	dd $00CBBB3C				;| 41
	dd $00CAB75B				;| 42
	dd CheckerboardBGGFX			;| 43
	dd $00CBAA46				;| 44
	dd $00CBC93A				;| 45
	dd $00CBB6CD				;| 46
	dd $00CBD894				;| 47
	dd $00CBD891				;| 48
	dd $00CBD82A				;| 49
	dd $00CBD88E				;| 4A
	dd $00CBD88B				;| 4B
	dd $00CBD888				;| 4C
	dd $00CBD885				;| 4D
	dd $00CBCAD4				;| 4E
	dd $00CBD882				;| 4F
	dd $00CBD87F				;| 50
	dd $00CBD87C				;| 51
	dd $00CB929A				;| 52
	dd $00CBD879				;| 53
	dd $00CB431F				;| 54
	dd $00CBA4EB				;| 55
	dd $00CB16A5				;| 56
	dd $00CBD876				;| 57
	dd $00CBC618				;| 58
	dd $00CBA7A5				;| 59
	dd $00CAD79E				;| 5A
	dd $00CBB767				;| 5B
	dd $00CBC8B6				;| 5C
	dd $00CBA889				;| 5D
	dd $00CBC82A				;| 5E
	dd $00CBC9F3				;| 5F
	dd $00CBC8FB				;| 60
	dd $00CBC7E3				;| 61
	dd $00CB9CC8				;| 62
	dd $00CBABF5				;| 63
	dd $00CBC2C9				;| 64
	dd $00CBB0AD				;| 65
	dd $00CBBDAA				;/ 66

DATA_CAD93D:					;\ Info: Tilemap file...
	dd $00CBD871				;| 00
	dd $00CB899D				;| 01
	dd $00CB556C				;| 02
	dd $00CBB22A				;| 03
	dd $00CB498F				;| 04
	dd $00CB6411				;| 05
	dd $00CB3FC1				;| 06
	dd $00CB4CB3				;| 07
	dd $00CB529E				;| 08
	dd $00CB31A3				;| 09
	dd $00CB2508				;| 0A
	dd $00CBC568				;| 0B
	dd $00CB8501				;| 0C
	dd $00CBB62D				;| 0D
	dd $00CBA6BD				;| 0E
	dd $00CBA200				;| 0F
	dd $00CB2D84				;| 10
	dd $00CBC265				;| 11
	dd $00CBBAB7				;| 12
	dd $00CBC38F				;| 13
	dd $00CBBCB9				;| 14
	dd $00CBC50F				;| 15
	dd $00CBC4B2				;| 16
	dd $00CBB9A5				;| 17
	dd $00CBBC3D				;| 18
	dd $00CBC200				;| 19
	dd $00CB38CC				;| 1A
	dd $00CBAFED				;| 1B
	dd $00CBA3FA				;| 1C
	dd $00CBC133				;| 1D
	dd $00CBBD32				;| 1E
	dd $00CBA96A				;| 1F
	dd $00CBBBC0				;| 20
	dd $00CBC453				;| 21
	dd $00CB955D				;| 22
	dd $00CB8028				;| 23
	dd $00CB7CC9				;| 24
	dd $00CAB092				;| 25
	dd $00CABE1E				;| 26
	dd $00CAC4A1				;| 27
	dd $00CB2958				;| 28
	dd $00CB0B95				;| 29
	dd $00CACB09				;| 2A
	dd $00CB0000				;| 2B
	dd $00CB96AC				;| 2C
	dd $00CBB393				;| 2D
	dd $00CBC3F2				;| 2E
	dd $00CBAE6C				;| 2F
	dd $00CBBF0A				;| 30
	dd $00CB868C				;| 31
	dd $00CB9A71				;| 32
	dd $00CB5D27				;| 33
	dd $00CB6FFF				;| 34
	dd $00CB61D2				;| 35
	dd $00CBB58D				;| 36
	dd $00CBAF2D				;| 37
	dd $00CB662B				;| 38
	dd $00CBBE97				;| 39
	dd $00CBB91A				;| 3A
	dd $00CB6A3D				;| 3B
	dd $00CB05F2				;| 3C
	dd $00CB1C10				;| 3D
	dd $00CB1121				;| 3E
	dd $00CB209F				;| 3F
	dd GiygasTilemap			;| 40
	dd $00CBAD9C				;| 41
	dd $00CB3C59				;| 42
	dd CheckerboardBGTilemap		;| 43
	dd $00CBA2FF				;| 44
	dd $00CBB4ED				;| 45
	dd $00CBB2E1				;| 46
	dd $00CBD86C				;| 47
	dd $00CBD867				;| 48
	dd $00CBD862				;| 49
	dd $00CBD85D				;| 4A
	dd $00CBD858				;| 4B
	dd $00CBD853				;| 4C
	dd $00CBD84E				;| 4D
	dd $00CB8E2A				;| 4E
	dd $00CBD849				;| 4F
	dd $00CBD844				;| 50
	dd $00CBD83F				;| 51
	dd $00CB836A				;| 52
	dd $00CBD83A				;| 53
	dd $00CB5828				;| 54
	dd $00CB8816				;| 55
	dd $00CB5AA8				;| 56
	dd $00CBD835				;| 57
	dd $00CBBE21				;| 58
	dd $00CB6C2B				;| 59
	dd $00CBD830				;| 5A
	dd $00CBBFEE				;| 5B
	dd $00CBC70B				;| 5C
	dd $00CB683F				;| 5D
	dd $00CB794F				;| 5E
	dd $00CB7781				;| 5F
	dd $00CB8CA8				;| 60
	dd $00CB353F				;| 61
	dd $00CB4666				;| 62
	dd $00CB8B24				;| 63
	dd $00CAD149				;| 64
	dd $00CB7B12				;| 65
	dd $00CB97F0				;/ 66

DATA_CADAD9:					;\ Info: Palette file...
	dd $00CBD822				;| 00
	dd $00CBD694				;| 01
	dd $00CBD674				;| 02
	dd $00CBD654				;| 03
	dd $00CBD634				;| 04
	dd $00CBD614				;| 05
	dd $00CBD5F4				;| 06
	dd $00CBD5D4				;| 07
	dd $00CBD5B4				;| 08
	dd $00CBD594				;| 09
	dd $00CBD574				;| 0A
	dd $00CBD554				;| 0B
	dd $00CBD534				;| 0C
	dd $00CBD514				;| 0D
	dd $00CBD4F4				;| 0E
	dd $00CBD4D4				;| 0F
	dd $00CBD4B4				;| 10
	dd $00CBD494				;| 11
	dd $00CBD474				;| 12
	dd $00CBD454				;| 13
	dd $00CBD434				;| 14
	dd $00CBD414				;| 15
	dd $00CBD81A				;| 16
	dd $00CBD3F4				;| 17
	dd $00CBD3D4				;| 18
	dd $00CBD3B4				;| 19
	dd $00CBD394				;| 1A
	dd $00CBD374				;| 1B
	dd $00CBD354				;| 1C
	dd $00CBD334				;| 1D
	dd $00CBD314				;| 1E
	dd $00CBD2F4				;| 1F
	dd $00CBD2D4				;| 20
	dd $00CBD2B4				;| 21
	dd $00CBD294				;| 22
	dd $00CBD274				;| 23
	dd $00CBD254				;| 24
	dd $00CBD234				;| 25
	dd $00CBD214				;| 26
	dd $00CBD1F4				;| 27
	dd $00CBD1D4				;| 28
	dd $00CBD1B4				;| 29
	dd $00CBD194				;| 2A
	dd $00CBD174				;| 2B
	dd $00CBD154				;| 2C
	dd $00CBD134				;| 2D
	dd $00CBD114				;| 2E
	dd $00CBD0F4				;| 2F
	dd $00CBD0D4				;| 30
	dd $00CBD0B4				;| 31
	dd $00CBD094				;| 32
	dd $00CBD074				;| 33
	dd $00CBD054				;| 34
	dd $00CBD034				;| 35
	dd $00CBD014				;| 36
	dd $00CBCFF4				;| 37
	dd $00CBD812				;| 38
	dd $00CBD80A				;| 39
	dd $00CBD802				;| 3A
	dd $00CBD7FA				;| 3B
	dd $00CBD7F2				;| 3C
	dd $00CBD7EA				;| 3D
	dd $00CBD7E2				;| 3E
	dd $00CBD7DA				;| 3F
	dd $00CBD7D2				;| 40
	dd $00CBD7CA				;| 41
	dd $00CBD7C2				;| 42
	dd $00CBD7BA				;| 43
	dd $00CBD7B2				;| 44
	dd $00CBD7AA				;| 45
	dd $00CBCFD4				;| 46
	dd $00CBD7A2				;| 47
	dd $00CBD79A				;| 48
	dd $00CBCFB4				;| 49
	dd $00CBD792				;| 4A
	dd $00CBD78A				;| 4B
	dd $00CBD782				;| 4C
	dd $00CBCF94				;| 4D
	dd $00CBD77A				;| 4E
	dd $00CBCF74				;| 4F
	dd $00CBD772				;| 50
	dd $00CBD76A				;| 51
	dd $00CBCF54				;| 52
	dd GiygasPalette			;| 53
	dd $00CBCF14				;| 54
	dd $00CBCEF4				;| 55
	dd FileSelectScreenBGPalette		;| 56
	dd $00CBCEB4				;| 57
	dd $00CBCE94				;| 58
	dd $00CBCE74				;| 59
	dd $00CBCE54				;| 5A
	dd $00CBCE34				;| 5B
	dd $00CBCE14				;| 5C
	dd $00CBCDF4				;| 5D
	dd $00CBD762				;| 5E
	dd $00CBD75A				;| 5F
	dd $00CBCDD4				;| 60
	dd $00CBCDB4				;| 61
	dd $00CBCD94				;| 62
	dd $00CBCD74				;| 63
	dd $00CBCD54				;| 64
	dd $00CBCD34				;| 65
	dd $00CBD752				;| 66
	dd $00CBCD14				;| 67
	dd $00CBCCF4				;| 68
	dd $00CBCCD4				;| 69
	dd $00CBCCB4				;| 6A
	dd $00CBCC94				;| 6B
	dd $00CBD74A				;| 6C
	dd $00CBCC74				;| 6D
	dd $00CBCC54				;| 6E
	dd $00CBCC34				;| 6F
	dd $00CBCC14				;| 70
	dd $00CBCBF4				;/ 71

;--------------------------------------------------------------------

DATA_CADCA1:
	db $00,$00,$02,$03,$01,$03,$00,$00
	db $1E,$00,$00,$00,$00,$00,$00,$00
	db $00,$01,$01,$04,$03,$02,$0F,$00
	db $00,$08,$4C,$00,$00,$00,$3C,$00
	db $00,$00,$01,$02,$04,$01,$02,$0F
	db $00,$00,$07,$4C,$00,$00,$00,$3D
	db $00,$00,$00,$02,$03,$04,$03,$02
	db $0F,$00,$00,$08,$00,$00,$00,$00
	db $2F,$00,$00,$00,$03,$02,$04,$01
	db $02,$0F,$00,$00,$05,$4C,$00,$00
	db $00,$2B,$00,$00,$00,$04,$04,$04
	db $01,$02,$0F,$00,$00,$08,$46,$47
	db $00,$00,$49,$00,$00,$00,$04,$04
	db $04,$01,$02,$0F,$00,$00,$08,$46

;--------------------------------------------------------------------

org $CAEBE7
DATA_CAEBE7:
	db $43,$56,$04,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00

;--------------------------------------------------------------------

; Todo: Seems to be data for the Giygas BG.
; 1st byte: GFX and tilemap file
; 2nd byte: Palette file

org $CAF038
DATA_CAF038:
	db $40,$53,$04,$01,$01,$0F,$00,$00
	db $03,$00,$00,$00,$00,$72,$00,$00
	db $00

;--------------------------------------------------------------------

; Todo: Seems to be some kind of HDMA data?

org $CAF708
DATA_CAF708:
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$01,$00,$04,$00,$08
	db $00,$00,$00,$00,$00,$00,$00,$02
	db $00,$00,$00,$00,$01,$00,$04,$00
	db $10,$00,$00,$00,$00,$00,$00,$00
	db $02,$00,$00,$00,$00,$01,$00,$04
	db $00,$20,$00,$00,$00,$00,$00,$00
	db $00,$02,$00,$00,$00,$00,$01,$00
	db $04,$00,$40,$00,$00,$00,$00,$00
	db $00,$00,$02,$00,$00,$00,$00,$01
	db $00,$03,$00,$08,$00,$00,$00,$00
	db $00,$00,$00,$02,$00,$00,$00,$00
	db $01,$00,$03,$00,$10,$00,$00,$00
	db $00,$00,$00,$00,$02,$00,$00,$00
	db $00,$01,$00,$03,$00,$20,$00,$00
	db $00,$00,$00,$00,$00,$02,$00,$00
	db $00,$00,$01,$00,$03,$00,$40,$00
	db $00,$00,$00,$00,$00,$00,$02,$00
	db $00,$00,$00,$01,$00,$02,$00,$08
	db $00,$00,$00,$00,$00,$00,$00,$02
	db $00,$00,$00,$00,$01,$00,$02,$00
	db $10,$00,$00,$00,$00,$00,$00,$00
	db $02,$00,$00,$00,$00,$01,$00,$02
	db $00,$20,$00,$00,$00,$00,$00,$00
	db $00,$02,$00,$00,$00,$00,$01,$00
	db $02,$00,$40,$00,$00,$00,$00,$00
	db $00,$00,$02,$00,$00,$00,$00,$01
	db $00,$01,$00,$08,$00,$00,$00,$00
	db $00,$00,$00,$02,$00,$00,$00,$00
	db $01,$00,$01,$00,$10,$00,$00,$00
	db $00,$00,$00,$00,$02,$00,$00,$00
	db $00,$01,$00,$01,$00,$20,$00,$00
	db $00,$00,$00,$00,$00,$02,$00,$00
	db $00,$00,$01,$00,$01,$00,$40,$00
	db $00,$00,$00,$00,$00,$00,$02,$00
	db $00,$00,$00,$01,$00,$04,$00,$80
	db $00,$00,$00,$00,$00,$00,$00,$02
	db $00,$00,$00,$00,$01,$00,$02,$00
	db $80,$00,$00,$00,$00,$00,$00,$00
	db $02,$00,$00,$00,$00,$01,$00,$02
	db $FF,$FF,$00,$00,$00,$00,$00,$00
	db $00,$02,$00,$00,$00,$00,$02,$00
	db $04,$00,$08,$00,$00,$00,$00,$00
	db $00,$00,$02,$00,$00,$00,$00,$02
	db $00,$04,$00,$10,$00,$00,$00,$00
	db $00,$00,$00,$02,$00,$00,$00,$00
	db $02,$00,$04,$00,$20,$00,$00,$00
	db $00,$00,$00,$00,$02,$00,$00,$00
	db $00,$02,$00,$04,$00,$40,$00,$00
	db $00,$00,$00,$00,$00,$02,$00,$00
	db $00,$00,$02,$00,$03,$00,$08,$00
	db $00,$00,$00,$00,$00,$00,$02,$00
	db $00,$00,$00,$02,$00,$03,$00,$10
	db $00,$00,$00,$00,$00,$00,$00,$02
	db $00,$00,$00,$00,$02,$00,$03,$00
	db $20,$00,$00,$00,$00,$00,$00,$00
	db $02,$00,$00,$00,$00,$02,$00,$03
	db $00,$40,$00,$00,$00,$00,$00,$00
	db $00,$02,$00,$00,$00,$00,$02,$00
	db $02,$00,$08,$00,$00,$00,$00,$00
	db $00,$00,$02,$00,$00,$00,$00,$02
	db $00,$02,$00,$10,$00,$00,$00,$00
	db $00,$00,$00,$02,$00,$00,$00,$00
	db $02,$00,$02,$00,$20,$00,$00,$00
	db $00,$00,$00,$00,$02,$00,$00,$00
	db $00,$02,$00,$02,$00,$40,$00,$00
	db $00,$00,$00,$00,$00,$02,$00,$00
	db $00,$00,$02,$00,$01,$00,$08,$00
	db $00,$00,$00,$00,$00,$00,$02,$00
	db $00,$00,$00,$02,$00,$01,$00,$10
	db $00,$00,$00,$00,$00,$00,$00,$02
	db $00,$00,$00,$00,$02,$00,$01,$00
	db $20,$00,$00,$00,$00,$00,$00,$00
	db $02,$00,$00,$00,$00,$02,$00,$01
	db $00,$40,$00,$00,$00,$00,$00,$00
	db $00,$02,$00,$00,$00,$00,$02,$00
	db $04,$00,$80,$00,$00,$00,$00,$00
	db $00,$00,$02,$00,$00,$00,$00,$02
	db $00,$02,$00,$80,$00,$00,$00,$00
	db $00,$00,$00,$02,$00,$00,$00,$00
	db $02,$00,$02,$FF,$FF,$00,$00,$00
	db $00,$00,$00,$00,$02,$00,$00,$00
	db $00,$03,$00,$04,$00,$08,$00,$00
	db $00,$00,$00,$00,$00,$02,$00,$00
	db $00,$00,$03,$00,$04,$00,$10,$00
	db $00,$00,$00,$00,$00,$00,$02,$00
	db $00,$00,$00,$03,$00,$04,$00,$20
	db $00,$00,$00,$00,$00,$00,$00,$02
	db $00,$00,$00,$00,$03,$00,$04,$00
	db $40,$00,$00,$00,$00,$00,$00,$00
	db $02,$00,$00,$00,$00,$03,$00,$03
	db $00,$08,$00,$00,$00,$00,$00,$00
	db $00,$02,$00,$00,$00,$00,$03,$00
	db $03,$00,$10,$00,$00,$00,$00,$00
	db $00,$00,$02,$00,$00,$00,$00,$03
	db $00,$03,$00,$20,$00,$00,$00,$00
	db $00,$00,$00,$02,$00,$00,$00,$00
	db $03,$00,$03,$00,$40,$00,$00,$00
	db $00,$00,$00,$00,$02,$00,$00,$00
	db $00,$03,$00,$02,$00,$08,$00,$00
	db $00,$00,$00,$00,$00,$02,$00,$00
	db $00,$00,$03,$00,$02,$00,$10,$00
	db $00,$00,$00,$00,$00,$00,$02,$00
	db $00,$00,$00,$03,$00,$02,$00,$20
	db $00,$00,$00,$00,$00,$00,$00,$02
	db $00,$00,$00,$00,$03,$00,$02,$00
	db $40,$00,$00,$00,$00,$00,$00,$00
	db $02,$00,$00,$00,$00,$03,$00,$01
	db $00,$08,$00,$00,$00,$00,$00,$00
	db $00,$02,$00,$00,$00,$00,$03,$00
	db $01,$00,$10,$00,$00,$00,$00,$00
	db $00,$00,$02,$00,$00,$00,$00,$03
	db $00,$01,$00,$20,$00,$00,$00,$00
	db $00,$00,$00,$02,$00,$00,$00,$00
	db $03,$00,$01,$00,$40,$00,$00,$00
	db $00,$00,$00,$00,$02,$00,$00,$00
	db $00,$03,$00,$04,$00,$80,$00,$00
	db $00,$00,$00,$00,$00,$02,$00,$00
	db $00,$00,$03,$00,$02,$00,$80,$00
	db $00,$00,$00,$00,$00,$00,$02,$00
	db $00,$00,$00,$03,$00,$02,$FF,$FF
	db $00,$00,$00,$00,$00,$00,$00,$02
	db $00,$00,$00,$00,$04,$00,$04,$00
	db $08,$00,$00,$00,$00,$00,$00,$00
	db $02,$00,$00,$00,$00,$04,$00,$04
	db $00,$10,$00,$00,$00,$00,$00,$00
	db $00,$02,$00,$00,$00,$00,$04,$00
	db $04,$00,$20,$00,$00,$00,$00,$00
	db $00,$00,$02,$00,$00,$00,$00,$04
	db $00,$04,$00,$40,$00,$00,$00,$00
	db $00,$00,$00,$02,$00,$00,$00,$00
	db $04,$00,$03,$00,$08,$00,$00,$00
	db $00,$00,$00,$00,$02,$00,$00,$00
	db $00,$04,$00,$03,$00,$10,$00,$00
	db $00,$00,$00,$00,$00,$02,$00,$00
	db $00,$00,$04,$00,$03,$00,$20,$00
	db $00,$00,$00,$00,$00,$00,$02,$00
	db $00,$00,$00,$04,$00,$03,$00,$40
	db $00,$00,$00,$00,$00,$00,$00,$02
	db $00,$00,$00,$00,$04,$00,$02,$00
	db $08,$00,$00,$00,$00,$00,$00,$00
	db $02,$00,$00,$00,$00,$04,$00,$02
	db $00,$10,$00,$00,$00,$00,$00,$00
	db $00,$02,$00,$00,$00,$00,$04,$00
	db $02,$00,$20,$00,$00,$00,$00,$00
	db $00,$00,$02,$00,$00,$00,$00,$04
	db $00,$02,$00,$40,$00,$00,$00,$00
	db $00,$00,$00,$02,$00,$00,$00,$00
	db $04,$00,$01,$00,$08,$00,$00,$00
	db $00,$00,$00,$00,$02,$00,$00,$00
	db $00,$04,$00,$01,$00,$10,$00,$00
	db $00,$00,$00,$00,$00,$02,$00,$00
	db $00,$00,$04,$00,$01,$00,$20,$00
	db $00,$00,$00,$00,$00,$00,$02,$00
	db $00,$00,$00,$04,$00,$01,$00,$40
	db $00,$00,$00,$00,$00,$00,$00,$02
	db $00,$00,$00,$00,$04,$00,$04,$00
	db $80,$00,$00,$00,$00,$00,$00,$00
	db $02,$00,$00,$00,$00,$04,$00,$02
	db $00,$80,$00,$00,$00,$00,$00,$00
	db $00,$02,$00,$00,$00,$00,$04,$00
	db $02,$FF,$FF,$00,$00,$00,$00,$00
	db $00,$00,$02,$00,$00,$78,$00,$04
	db $00,$02,$00,$20,$00,$00,$00,$00
	db $00,$00,$01,$0A,$00,$00,$78,$00
	db $01,$00,$02,$00,$20,$00,$00,$00
	db $00,$00,$00,$01,$0A,$00,$00,$78
	db $00,$02,$00,$02,$00,$20,$00,$00
	db $00,$00,$00,$00,$01,$0A,$00,$00
	db $78,$00,$03,$00,$02,$00,$20,$00
	db $00,$00,$00,$00,$00,$01,$0A,$00
	db $00,$FF,$00,$03,$00,$02,$00,$00
	db $00,$00,$00,$00,$00,$00,$01,$00
	db $00,$00,$FF,$00,$03,$00,$02,$00
	db $FF,$00,$00,$00,$00,$00,$00,$FF
	db $00,$00,$00,$FF,$00,$01,$00,$02
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $01,$00,$00,$00,$FF,$00,$01,$00
	db $02,$00,$FF,$00,$00,$00,$00,$00
	db $00,$FF,$00,$00,$00,$00,$00,$03
	db $00,$02,$00,$80,$00,$00,$02,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $03,$00,$02,$00,$80,$00,$80,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $01,$03,$00,$04,$00,$40,$00,$00
	db $01,$00,$00,$00,$00,$00,$02,$00
	db $00,$01,$03,$00,$04,$00,$40,$00
	db $00,$03,$00,$00,$00,$00,$00,$FE
	db $FF,$00,$04,$01,$00,$08,$00,$40
	db $80,$00,$00,$FE,$FF,$00,$00,$01
	db $00,$00,$00,$04,$01,$00,$00,$00
	db $40,$80,$00,$00,$02,$00,$00,$00
	db $FF,$00,$00,$58,$02,$03,$00,$00
	db $00,$00,$00,$00,$01,$00,$00,$00
	db $00,$00,$03,$00,$58,$02,$03,$00
	db $00,$00,$00,$00,$08,$08,$00,$00
	db $00,$00,$00,$FD,$FF,$00,$02,$03
	db $00,$00,$00,$00,$00,$00,$02,$00
	db $00,$00,$00,$00,$FF,$FF,$00,$02
	db $03,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$01,$00,$F0
	db $00,$03,$00,$00,$00,$00,$00,$E0
	db $02,$00,$00,$00,$00,$00,$FE,$FF
	db $F0,$00,$03,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$02
	db $00,$F0,$00,$01,$00,$04,$00,$80
	db $01,$00,$00,$FE,$FF,$9C,$FF,$01
	db $00,$00,$F0,$00,$01,$20,$02,$40
	db $22,$F1,$00,$00,$02,$00,$64,$00
	db $FF,$00,$00,$00,$01,$04,$00,$02
	db $00,$40,$02,$00,$01,$02,$00,$00
	db $00,$01,$02,$00,$00,$01,$04,$00
	db $04,$00,$40,$02,$00,$03,$FE,$FF
	db $00,$00,$FF,$FE,$FF,$00,$00,$01
	db $80,$00,$00,$08,$01,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$01
	db $01,$00,$04,$00,$00,$02,$00,$00
	db $00,$00,$80,$00,$00,$00,$00,$00
	db $01,$01,$00,$04,$00,$80,$02,$00
	db $00,$00,$00,$80,$FF,$00,$00,$00
	db $F4,$01,$01,$00,$02,$00,$00,$02
	db $00,$00,$00,$00,$80,$00,$00,$00
	db $00,$F4,$01,$01,$00,$02,$00,$FA
	db $02,$00,$00,$00,$00,$80,$FF,$00
	db $00,$00,$F4,$01,$01,$00,$02,$00
	db $00,$0A,$00,$00,$00,$00,$50,$00
	db $00,$00,$00,$F4,$01,$01,$00,$02
	db $40,$9C,$0A,$00,$00,$00,$00,$B0
	db $FF,$00,$00,$00,$F0,$00,$03,$00
	db $02,$00,$08,$02,$00,$00,$00,$00
	db $00,$00,$00,$01,$00,$E0,$01,$03
	db $00,$02,$00,$08,$02,$00,$F0,$00
	db $00,$00,$00,$00,$FE,$FF,$F0,$00
	db $01,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$B4
	db $00,$01,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $68,$01,$01,$00,$01,$00,$00,$02
	db $00,$00,$00,$00,$80,$00,$00,$00
	db $00,$68,$01,$01,$00,$01,$00,$00
	db $02,$00,$00,$00,$00,$40,$00,$00
	db $00,$00,$00,$00,$02,$00,$10,$80
	db $FA,$0A,$00,$00,$00,$00,$00,$00
	db $00

;--------------------------------------------------------------------
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankCBMacros(StartBank, EndBank)
%BANK_START(<StartBank>)
org $CB5F91
GiygasTilemap:
	incbin "Tilemaps/GiygasTilemap.bin"

;--------------------------------------------------------------------

org $CBA5D4
BGGFX01_Hexagons:
;$CBA5D4
	incbin "Graphics/Compressed/BGGFX01_Hexagons.bin"

;--------------------------------------------------------------------

org $CBB16C
BGGFX02_Unknown:
;$CBB16C
	incbin "Graphics/Compressed/BGGFX02_Unknown.bin"

;--------------------------------------------------------------------

org $CBC0CA
CheckerboardBGTilemap:
;$CBC0CA
	incbin "Tilemaps/Compressed/CheckerboardBGTilemap.bin"

;--------------------------------------------------------------------

org $CBCED4
FileSelectScreenBGPalette:
;$CBCED4
	dw $0000,$4B70,$4FB1,$432F,$3ECD,$368C,$2E4A,$2A09
	dw $6EAD,$76EE,$626C,$5A4B,$5209,$49C8,$41A7,$0000

;--------------------------------------------------------------------

org $CBCF34
GiygasPalette:
;$CBCF34
	dw $0000,$000C,$38CC,$1016,$28D8,$0812,$0890,$18DE
	dw $080A,$300E,$0004,$1806,$03DE,$2016,$1014,$7BDE

;--------------------------------------------------------------------

org $CBD73D
CheckerboardBGGFX:
;$CBD73D
	incbin "Graphics/Compressed/CheckerboardBGGFX.bin"

;--------------------------------------------------------------------

%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankCCMacros(StartBank, EndBank)
%BANK_START(<StartBank>)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankCDMacros(StartBank, EndBank)
%BANK_START(<StartBank>)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankCEMacros(StartBank, EndBank)
%BANK_START(<StartBank>)
%BANK_END(<EndBank>)
endmacro

;#############################################################################################################
;#############################################################################################################

macro EBBankCFMacros(StartBank, EndBank)
%BANK_START(<StartBank>)

EB_DoorDestinationTable:
;$CF0000
	db $0E,$B2,$C9,$00,$79,$82,$9A,$C0,$B1,$03,$04
	db $82,$AF,$C9,$00,$00,$00,$0B,$01,$87,$00,$01
	db $00,$00,$00,$00,$00,$00,$EF,$03,$19,$01,$01
	db $00,$00,$00,$00,$00,$00,$FC,$83,$F3,$00,$01
	db $0B,$B1,$C9,$00,$00,$00,$34,$C4,$58,$01,$01
	db $00,$00,$00,$00,$00,$00,$B9,$80,$67,$03,$01
	db $C9,$A2,$EF,$00,$6C,$80,$BA,$C0,$75,$03,$04
	db $0E,$B2,$C9,$00,$78,$02,$A9,$C0,$F0,$03,$01
	db $0E,$B2,$C9,$00,$78,$02,$BD,$C0,$DC,$03,$06
	db $0E,$B2,$C9,$00,$78,$02,$3D,$C0,$BC,$03,$06
	db $0E,$B2,$C9,$00,$78,$02,$2D,$C0,$FC,$03,$04
	db $0E,$B2,$C9,$00,$78,$02,$4D,$C0,$B8,$03,$04
	db $0E,$B2,$C9,$00,$78,$02,$6A,$C0,$B1,$03,$04
	db $0E,$B2,$C9,$00,$78,$02,$4D,$C0,$EC,$03,$01
	db $0E,$B2,$C9,$00,$78,$02,$BD,$C0,$FC,$03,$01
	db $6A,$9B,$C9,$00,$EA,$82,$BA,$C0,$B9,$03,$04
	db $0E,$B2,$C9,$00,$78,$02,$7D,$C0,$9C,$03,$01
	db $0E,$B2,$C9,$00,$78,$02,$56,$00,$D1,$03,$04
	db $0E,$B2,$C9,$00,$78,$02,$59,$C0,$E4,$03,$06
	db $93,$9A,$C9,$00,$78,$02,$31,$C0,$84,$03,$01
	db $0E,$B2,$C9,$00,$78,$02,$AD,$C0,$98,$03,$06
	db $A1,$99,$C9,$00,$D4,$01,$6D,$C0,$98,$03,$04
	db $25,$B2,$C9,$00,$DA,$01,$2A,$C0,$CD,$03,$04
	db $0E,$B2,$C9,$00,$78,$02,$3D,$C0,$F4,$03,$01
	db $0E,$B2,$C9,$00,$78,$02,$7A,$C0,$71,$03,$04
	db $0E,$B2,$C9,$00,$78,$02,$9D,$C0,$F8,$03,$04
	db $0E,$B2,$C9,$00,$78,$02,$8A,$C0,$B9,$03,$04
	db $0E,$B2,$C9,$00,$78,$02,$9D,$C0,$78,$03,$04
	db $40,$E8,$C5,$00,$54,$81,$2A,$C0,$CD,$03,$00
	db $0E,$B2,$C9,$00,$78,$02,$AD,$C0,$B4,$03,$04
	db $31,$9C,$C9,$00,$00,$00,$E6,$02,$8B,$00,$01
	db $00,$00,$00,$00,$00,$00,$48,$00,$D1,$03,$07
	db $00,$00,$00,$00,$00,$00,$AD,$C0,$D8,$03,$07
	db $00,$00,$00,$00,$00,$00,$CD,$C0,$FC,$03,$07
	db $00,$00,$00,$00,$26,$00,$0D,$80,$E3,$03,$07
	db $66,$9B,$C9,$00,$00,$00,$BD,$80,$E3,$03,$01
	db $00,$00,$00,$00,$00,$00,$6D,$80,$C3,$03,$0F
	db $00,$00,$00,$00,$00,$00,$1A,$C0,$B9,$03,$07
	db $00,$00,$00,$00,$00,$00,$31,$80,$63,$03,$01
	db $00,$00,$00,$00,$00,$00,$0D,$C0,$FC,$03,$01
	db $00,$00,$00,$00,$00,$00,$D6,$00,$FC,$00,$01
	db $00,$00,$00,$00,$00,$00,$7D,$80,$A3,$03,$0F
	db $00,$00,$00,$00,$00,$00,$8E,$00,$D9,$00,$0C
	db $75,$9B,$C9,$00,$D3,$01,$2B,$00,$4B,$01,$0A
	db $00,$00,$00,$00,$00,$00,$8D,$C0,$7C,$03,$07
	db $00,$00,$00,$00,$00,$00,$AD,$C0,$7C,$03,$07
	db $00,$00,$00,$00,$00,$00,$5D,$80,$63,$03,$0F
	db $00,$00,$00,$00,$00,$00,$A1,$00,$9A,$00,$0A
	db $8F,$9A,$C9,$00,$00,$00,$6D,$00,$0A,$01,$01
	db $00,$00,$00,$00,$00,$00,$6D,$80,$63,$03,$0F
	db $00,$00,$00,$00,$00,$00,$6D,$C0,$FC,$03,$07
	db $00,$00,$00,$00,$00,$00,$3D,$80,$C3,$03,$0F
	db $00,$00,$00,$00,$00,$00,$AC,$00,$89,$00,$0A
	db $00,$00,$00,$00,$00,$00,$7C,$00,$B1,$03,$07
	db $00,$00,$00,$00,$00,$00,$11,$C0,$84,$03,$07
	db $00,$00,$00,$00,$00,$00,$6D,$C0,$D4,$03,$07
	db $00,$00,$00,$00,$28,$80,$D1,$40,$C5,$00,$0A
	db $00,$00,$00,$00,$00,$00,$79,$80,$E7,$03,$0F
	db $00,$00,$00,$00,$00,$00,$8D,$C0,$DC,$03,$07
	db $00,$00,$00,$00,$00,$00,$A7,$00,$CF,$00,$01
	db $00,$00,$00,$00,$00,$00,$DA,$00,$C5,$00,$0C
	db $00,$00,$00,$00,$00,$00,$4D,$80,$63,$03,$0F
	db $00,$00,$00,$00,$00,$00,$8C,$00,$21,$01,$0A
	db $6B,$9A,$C9,$00,$00,$00,$2C,$00,$2B,$01,$0A
	db $00,$00,$00,$00,$00,$00,$9D,$C0,$98,$03,$07
	db $00,$00,$00,$00,$00,$00,$D3,$00,$8F,$00,$01
	db $00,$00,$00,$00,$00,$00,$BD,$80,$83,$03,$0F
	db $00,$00,$00,$00,$00,$00,$BC,$00,$85,$00,$0A
	db $00,$00,$00,$00,$00,$00,$5D,$C0,$BC,$03,$07
	db $5D,$99,$C9,$00,$00,$00,$2A,$80,$A6,$03,$0F
	db $00,$00,$00,$00,$00,$00,$8A,$80,$E6,$03,$07
	db $01,$AE,$C9,$00,$00,$00,$1D,$80,$C3,$03,$0F
	db $00,$00,$00,$00,$00,$00,$4D,$80,$C3,$03,$07
	db $00,$00,$00,$00,$00,$00,$BC,$00,$89,$03,$07
	db $00,$00,$00,$00,$00,$00,$58,$00,$71,$03,$07
	db $00,$00,$00,$00,$00,$00,$59,$80,$C7,$03,$0F
	db $00,$00,$00,$00,$00,$00,$38,$00,$CD,$03,$07
	db $00,$00,$00,$00,$00,$00,$C8,$00,$31,$01,$0A
	db $00,$00,$00,$00,$00,$00,$B8,$00,$F1,$03,$07
	db $00,$00,$00,$00,$00,$00,$78,$00,$92,$03,$07
	db $00,$00,$00,$00,$00,$00,$B0,$00,$41,$01,$0A
	db $00,$00,$00,$00,$00,$00,$10,$00,$E5,$00,$0A
	db $0B,$B1,$C9,$00,$1F,$00,$61,$03,$F4,$01,$01
	db $00,$00,$00,$00,$00,$00,$48,$00,$E1,$03,$07
	db $00,$00,$00,$00,$00,$00,$BC,$00,$91,$03,$07
	db $30,$99,$C9,$00,$00,$00,$7D,$C0,$BC,$03,$07
	db $00,$00,$00,$00,$00,$00,$8C,$00,$2D,$01,$0A
	db $00,$00,$00,$00,$00,$00,$38,$00,$D9,$03,$07
	db $00,$00,$00,$00,$00,$00,$43,$40,$B5,$00,$01
	db $00,$00,$00,$00,$00,$00,$48,$00,$B5,$00,$0A
	db $00,$00,$00,$00,$00,$00,$DA,$00,$E8,$00,$0C
	db $00,$00,$00,$00,$00,$00,$7D,$C0,$D8,$03,$07
	db $00,$00,$00,$00,$00,$00,$9D,$C0,$D8,$03,$07
	db $00,$00,$00,$00,$00,$00,$7D,$80,$83,$03,$0F
	db $00,$00,$00,$00,$00,$00,$1C,$01,$C5,$00,$0A
	db $00,$00,$00,$00,$00,$00,$DC,$00,$39,$00,$0A
	db $00,$00,$00,$00,$00,$00,$08,$00,$B1,$03,$07
	db $00,$00,$00,$00,$00,$00,$8E,$00,$C8,$00,$0C
	db $00,$00,$00,$00,$00,$00,$53,$00,$FC,$00,$01
	db $00,$00,$00,$00,$00,$00,$89,$C0,$88,$03,$07
	db $00,$00,$00,$00,$00,$00,$0D,$C0,$CC,$03,$01
	db $1E,$B1,$C9,$00,$00,$00,$B2,$00,$FF,$00,$01
	db $00,$00,$00,$00,$00,$00,$08,$00,$BD,$03,$07
	db $00,$00,$00,$00,$00,$00,$39,$C1,$F5,$02,$01
	db $00,$00,$00,$00,$00,$00,$3B,$00,$85,$00,$01
	db $00,$00,$00,$00,$00,$00,$3A,$00,$9D,$00,$01
	db $00,$00,$00,$00,$00,$00,$D9,$C2,$D5,$01,$01
	db $00,$00,$00,$00,$00,$00,$B9,$C2,$D9,$01,$01
	db $00,$00,$00,$00,$00,$00,$79,$C2,$F5,$01,$01
	db $F6,$9C,$C9,$00,$00,$00,$3F,$00,$B1,$00,$01
	db $00,$00,$00,$00,$00,$00,$27,$04,$29,$01,$01
	db $00,$00,$00,$00,$00,$00,$30,$84,$E7,$00,$01
	db $00,$00,$00,$00,$00,$00,$13,$04,$3D,$01,$01
	db $00,$00,$00,$00,$00,$00,$39,$C1,$8C,$00,$01
	db $00,$00,$00,$00,$00,$00,$F3,$03,$FD,$00,$01
	db $8B,$AF,$C9,$00,$BE,$80,$27,$00,$89,$00,$01
	db $00,$00,$00,$00,$00,$00,$38,$81,$E7,$02,$01
	db $00,$00,$00,$00,$00,$00,$9A,$40,$AC,$03,$01
	db $00,$00,$00,$00,$00,$00,$39,$C1,$BC,$02,$01
	db $00,$00,$00,$00,$00,$00,$79,$83,$E3,$01,$01
	db $00,$00,$00,$00,$00,$00,$09,$C1,$BC,$01,$01
	db $00,$00,$00,$00,$00,$00,$E9,$82,$E3,$01,$01
	db $00,$00,$00,$00,$00,$00,$3B,$81,$A3,$02,$01
	db $00,$00,$00,$00,$00,$00,$09,$C1,$89,$01,$01
	db $B6,$A1,$C9,$00,$54,$81,$75,$00,$92,$00,$00
	db $70,$A2,$C9,$00,$54,$81,$85,$00,$B2,$00,$00
	db $AC,$A2,$C9,$00,$54,$81,$A2,$00,$7F,$00,$00
	db $06,$A3,$C9,$00,$54,$81,$DA,$00,$B4,$00,$00
	db $4C,$63,$C8,$00,$99,$63,$C8,$00,$70,$7B,$C8
	db $00,$DA,$63,$C8,$00,$9E,$7B,$C8,$00,$19,$64
	db $C8,$00,$CF,$7B,$C8,$00,$31,$64,$C8,$00,$67
	db $64,$C8,$00,$77,$64,$C8,$00,$83,$64,$C8,$00
	db $36,$A3,$C9,$00,$54,$81,$A0,$00,$51,$01,$00
	db $81,$A3,$C9,$00,$54,$81,$D8,$00,$21,$01,$00
	db $C5,$A3,$C9,$00,$54,$81,$B2,$00,$0B,$01,$00
	db $32,$A4,$C9,$00,$54,$81,$AE,$00,$17,$01,$00
	db $F5,$7B,$C8,$00,$A7,$64,$C8,$00,$E6,$64,$C8
	db $00,$1D,$7C,$C8,$00,$57,$7C,$C8,$00,$11,$65
	db $C8,$00,$2A,$65,$C8,$00,$79,$62,$C8,$00,$E6
	db $AB,$C9,$00,$54,$81,$0C,$00,$E9,$03,$00,$22
	db $AC,$C9,$00,$54,$81,$0C,$00,$F1,$03,$00,$4D
	db $AC,$C9,$00,$54,$81,$58,$00,$79,$03,$00,$6F
	db $AC,$C9,$00,$54,$81,$58,$00,$7D,$03,$00,$D7
	db $6A,$C8,$00,$10,$6B,$C8,$00,$FF,$7D,$C8,$00
	db $FF,$7D,$C8,$00,$FF,$7D,$C8,$00,$37,$7E,$C8
	db $00,$FF,$7D,$C8,$00,$FF,$7D,$C8,$00,$40,$7C
	db $C6,$00,$00,$00,$00,$00,$00,$00,$8F,$41,$98
	db $00,$01,$00,$00,$00,$00,$00,$00,$FD,$C3,$58
	db $03,$04,$00,$00,$00,$00,$00,$00,$FD,$C3,$98
	db $03,$04,$00,$00,$00,$00,$00,$00,$8D,$C3,$C4
	db $03,$01,$00,$00,$00,$00,$00,$00,$BD,$C3,$78
	db $03,$06,$00,$00,$00,$00,$00,$00,$AB,$C3,$8A
	db $03,$06,$CC,$9A,$C9,$00,$D3,$00,$9D,$C3,$BC
	db $03,$04,$00,$00,$00,$00,$00,$00,$BD,$C3,$D8
	db $03,$04,$00,$00,$00,$00,$00,$00,$FD,$C3,$D4
	db $03,$04,$00,$00,$00,$00,$00,$00,$DD,$C3,$D8
	db $03,$04,$00,$00,$00,$00,$00,$00,$2D,$C4,$A8
	db $03,$06,$00,$00,$00,$00,$00,$00,$CD,$C3,$34
	db $03,$06,$00,$00,$00,$00,$00,$00,$AD,$C3,$C4
	db $03,$04,$00,$00,$00,$00,$00,$00,$FD,$C3,$7C
	db $03,$04,$00,$00,$00,$00,$00,$00,$CD,$C3,$F8
	db $03,$04,$00,$00,$00,$00,$00,$00,$4D,$C4,$EC
	db $03,$01,$00,$00,$00,$00,$00,$00,$8D,$C3,$F8
	db $03,$04,$0B,$B1,$C9,$00,$00,$00,$E9,$84,$63
	db $03,$01,$B9,$9E,$C9,$00,$00,$00,$FC,$84,$E4
	db $02,$01,$05,$9D,$C9,$00,$00,$00,$78,$C3,$C4
	db $01,$01,$00,$00,$00,$00,$00,$00,$EB,$84,$A3
	db $03,$01,$00,$00,$00,$00,$00,$00,$E9,$C4,$7C
	db $03,$01,$00,$00,$00,$00,$00,$00,$19,$01,$16
	db $02,$01,$00,$00,$00,$00,$00,$00,$59,$C4,$C8
	db $03,$07,$00,$00,$00,$00,$00,$00,$15,$C4,$B8
	db $03,$01,$A6,$9D,$C9,$00,$00,$00,$2F,$03,$AB
	db $00,$01,$B6,$A0,$C9,$00,$00,$00,$2F,$03,$BC
	db $00,$0C,$00,$00,$00,$00,$00,$00,$3B,$03,$33
	db $01,$0A,$00,$00,$00,$00,$00,$00,$DC,$03,$69
	db $03,$07,$00,$00,$00,$00,$00,$00,$48,$04,$D1
	db $03,$07,$92,$9D,$C9,$00,$00,$00,$32,$03,$D2
	db $00,$0C,$00,$00,$00,$00,$00,$00,$DC,$03,$71
	db $03,$07,$CE,$9D,$C9,$00,$00,$00,$73,$03,$09
	db $01,$0A,$00,$00,$00,$00,$00,$00,$CD,$C3,$5C
	db $03,$07,$00,$00,$00,$00,$00,$00,$8F,$03,$F7
	db $00,$0A,$00,$00,$00,$00,$00,$00,$77,$03,$1F
	db $01,$0A,$00,$00,$00,$00,$00,$00,$AD,$83,$A3
	db $03,$07,$00,$00,$00,$00,$00,$00,$ED,$83,$43
	db $03,$0F,$00,$00,$00,$00,$00,$00,$FA,$83,$46
	db $03,$0F,$00,$00,$00,$00,$00,$00,$BD,$C3,$5C
	db $03,$07,$00,$00,$00,$00,$00,$00,$BD,$C3,$9C
	db $03,$07,$00,$00,$00,$00,$00,$00,$4D,$84,$C3
	db $03,$0F,$00,$00,$00,$00,$00,$00,$0C,$04,$95
	db $03,$07,$00,$00,$00,$00,$00,$00,$FD,$83,$83
	db $03,$0F,$00,$00,$00,$00,$00,$00,$10,$04,$A9
	db $03,$07,$00,$00,$00,$00,$26,$01,$97,$03,$EF
	db $00,$0A,$00,$00,$00,$00,$00,$00,$ED,$C3,$F8
	db $03,$07,$00,$00,$00,$00,$00,$00,$4F,$03,$22
	db $01,$0A,$00,$00,$00,$00,$00,$00,$5D,$C4,$F8
	db $03,$07,$00,$00,$00,$00,$00,$00,$CA,$83,$46
	db $03,$0F,$00,$00,$00,$00,$00,$00,$DD,$83,$43
	db $03,$0F,$00,$00,$00,$00,$00,$00,$0C,$03,$D9
	db $00,$0A,$00,$00,$00,$00,$00,$00,$97,$03,$1D
	db $01,$0A,$00,$00,$00,$00,$00,$00,$DD,$83,$83
	db $03,$0F,$00,$00,$00,$00,$00,$00,$0C,$03,$F9
	db $00,$0A,$00,$00,$00,$00,$00,$00,$60,$03,$A9
	db $00,$0A,$00,$00,$00,$00,$00,$00,$CD,$83,$E3
	db $03,$07,$00,$00,$00,$00,$00,$00,$CD,$C3,$9C
	db $03,$07,$00,$00,$00,$00,$00,$00,$CD,$C3,$DC
	db $03,$07,$00,$00,$00,$00,$00,$00,$8D,$83,$A3
	db $03,$01,$00,$00,$00,$00,$00,$00,$76,$03,$35
	db $01,$0C,$00,$00,$00,$00,$00,$00,$9D,$C3,$D8
	db $03,$07,$00,$00,$00,$00,$00,$00,$DD,$83,$63
	db $03,$0F,$00,$00,$00,$00,$00,$00,$88,$03,$B9
	db $03,$07,$00,$00,$00,$00,$00,$00,$0E,$03,$1B
	db $01,$01,$00,$00,$00,$00,$00,$00,$E8,$03,$51
	db $03,$07,$00,$00,$00,$00,$35,$01,$35,$C4,$78
	db $03,$07,$00,$00,$00,$00,$00,$00,$BD,$C3,$BC
	db $03,$07,$24,$9D,$C9,$00,$00,$00,$31,$03,$16
	db $01,$0A,$00,$00,$00,$00,$00,$00,$9D,$83,$A3
	db $03,$07,$E0,$9F,$C9,$00,$00,$00,$31,$84,$4B
	db $03,$07,$91,$9F,$C9,$00,$73,$80,$AD,$C3,$FC
	db $03,$07,$00,$00,$00,$00,$00,$00,$98,$03,$B1
	db $03,$07,$D9,$9E,$C9,$00,$F9,$02,$42,$C4,$9F
	db $00,$01,$4B,$9C,$C9,$00,$D3,$80,$9B,$84,$31
	db $02,$01,$6A,$A5,$C9,$00,$54,$81,$47,$03,$2A
	db $01,$00,$04,$A6,$C9,$00,$54,$81,$A3,$03,$0D
	db $01,$00,$CB,$65,$C8,$00,$8C,$7C,$C8,$00,$B8
	db $7C,$C8,$00,$D9,$7C,$C8,$00,$1B,$66,$C8,$00
	db $63,$66,$C8,$00,$89,$66,$C8,$00,$59,$6D,$C8
	db $00,$0B,$B1,$C9,$00,$00,$00,$39,$C1,$9C,$02
	db $01,$0B,$B1,$C9,$00,$00,$00,$A9,$C1,$1C,$02
	db $01,$00,$00,$00,$00,$00,$00,$DD,$C0,$7C,$03
	db $04,$00,$00,$00,$00,$00,$00,$0D,$C1,$BC,$03
	db $04,$39,$A1,$C9,$00,$D3,$00,$22,$C1,$F1,$03
	db $04,$0B,$B1,$C9,$00,$00,$00,$D1,$80,$87,$01
	db $01,$B7,$A0,$C9,$00,$D5,$80,$01,$C1,$F0,$03
	db $04,$00,$00,$00,$00,$00,$00,$CD,$C0,$7C,$03
	db $04,$00,$00,$00,$00,$00,$00,$DD,$C0,$BC,$03
	db $04,$00,$00,$00,$00,$00,$00,$CD,$80,$A3,$03
	db $0F,$1E,$B1,$C9,$00,$00,$00,$F8,$03,$CA,$01
	db $0A,$00,$00,$00,$00,$00,$00,$B8,$03,$02,$02
	db $0A,$00,$00,$00,$00,$00,$00,$CD,$80,$63,$03
	db $0F,$00,$00,$00,$00,$00,$00,$EC,$03,$02,$02
	db $0A,$00,$00,$00,$00,$00,$00,$C3,$03,$D7,$01
	db $0A,$00,$00,$00,$00,$00,$00,$E4,$03,$B9,$01
	db $0A,$00,$00,$00,$00,$00,$00,$F2,$80,$A6,$03
	db $0F,$A7,$A1,$C9,$00,$00,$00,$22,$81,$AE,$03
	db $07,$00,$00,$00,$00,$00,$00,$DA,$80,$E6,$03
	db $0F,$A3,$A1,$C9,$00,$00,$00,$DA,$C0,$F9,$03
	db $07,$23,$A1,$C9,$00,$00,$00,$DC,$03,$DF,$01
	db $0A,$00,$00,$00,$00,$00,$00,$C5,$00,$E9,$02
	db $01,$B2,$A1,$C9,$00,$00,$00,$B4,$83,$BA,$01
	db $01,$00,$00,$00,$00,$00,$00,$8A,$00,$E6,$02
	db $01,$00,$00,$00,$00,$00,$00,$B8,$03,$F7,$01
	db $01,$54,$65,$C8,$00,$68,$65,$C8,$00,$00,$00
	db $00,$00,$00,$00,$A9,$81,$E3,$01,$01,$00,$00
	db $00,$00,$00,$00,$CD,$C4,$74,$03,$04,$0B,$B1
	db $C9,$00,$00,$00,$39,$81,$63,$02,$01,$0B,$B1
	db $C9,$00,$00,$00,$E9,$C4,$DC,$03,$01,$00,$00
	db $00,$00,$00,$00,$9A,$00,$D7,$02,$0A,$B6,$AF
	db $C9,$00,$BF,$80,$F5,$03,$82,$01,$01,$00,$00
	db $00,$00,$00,$00,$C4,$C3,$0C,$02,$01,$82,$AF
	db $C9,$00,$00,$00,$8B,$00,$F1,$01,$01,$0B,$B1
	db $C9,$00,$00,$00,$01,$04,$3C,$02,$01,$00,$00
	db $00,$00,$00,$00,$B1,$04,$3C,$03,$01,$00,$00
	db $00,$00,$00,$00,$CD,$C4,$F8,$03,$04,$00,$00
	db $00,$00,$00,$00,$8D,$C4,$5C,$03,$04,$00,$00
	db $00,$00,$00,$00,$EF,$C4,$FA,$03,$01,$00,$00
	db $00,$00,$00,$00,$BD,$C4,$B8,$03,$04,$C9,$9E
	db $C9,$00,$00,$00,$FC,$C4,$DB,$03,$01,$00,$00
	db $00,$00,$00,$00,$BD,$C4,$74,$03,$04,$00,$00
	db $00,$00,$00,$00,$BD,$C4,$FC,$03,$06,$00,$00
	db $00,$00,$00,$00,$9D,$C4,$74,$03,$06,$00,$00
	db $00,$00,$00,$00,$DD,$C4,$5C,$03,$01,$00,$00
	db $00,$00,$00,$00,$DD,$C4,$F8,$03,$06,$00,$00
	db $00,$00,$00,$00,$DA,$C4,$79,$03,$04,$00,$00
	db $00,$00,$00,$00,$DA,$C4,$B5,$03,$04,$0B,$B1
	db $C9,$00,$00,$00,$FC,$84,$24,$02,$01,$00,$00
	db $00,$00,$00,$00,$89,$C4,$88,$03,$07,$00,$00
	db $00,$00,$00,$00,$8D,$C4,$E4,$03,$01,$1E,$B1
	db $C9,$00,$00,$00,$62,$04,$B3,$02,$0A,$00,$00
	db $00,$00,$00,$00,$DC,$04,$C9,$03,$07,$00,$00
	db $00,$00,$00,$00,$8E,$04,$9C,$02,$0C,$00,$00
	db $00,$00,$00,$00,$88,$04,$51,$03,$07,$00,$00
	db $00,$00,$00,$00,$DC,$04,$D1,$03,$07,$00,$00
	db $00,$00,$00,$00,$88,$04,$CD,$03,$07,$F2,$AD
	db $C9,$00,$00,$00,$9D,$C4,$BC,$03,$07,$00,$00
	db $00,$00,$00,$00,$9D,$C4,$FC,$03,$07,$00,$00
	db $00,$00,$00,$00,$8D,$84,$43,$03,$01,$00,$00
	db $00,$00,$00,$00,$88,$04,$D5,$03,$07,$00,$00
	db $00,$00,$00,$00,$8C,$04,$65,$02,$0A,$00,$00
	db $00,$00,$00,$00,$78,$04,$E9,$02,$0A,$00,$00
	db $00,$00,$00,$00,$8E,$04,$8D,$02,$0C,$00,$00
	db $00,$00,$00,$00,$DD,$C4,$98,$03,$07,$00,$00
	db $00,$00,$00,$00,$8D,$04,$BF,$02,$01,$00,$00
	db $00,$00,$00,$00,$DD,$84,$C3,$03,$0F,$00,$00
	db $00,$00,$00,$00,$91,$04,$02,$03,$0A,$00,$00
	db $00,$00,$00,$00,$D8,$04,$52,$03,$07,$00,$00
	db $00,$00,$00,$00,$97,$04,$19,$03,$0A,$00,$00
	db $00,$00,$00,$00,$8D,$C4,$78,$03,$07,$00,$00
	db $00,$00,$00,$00,$8D,$C4,$B8,$03,$07,$00,$00
	db $00,$00,$00,$00,$DD,$84,$43,$03,$0F,$00,$00
	db $00,$00,$00,$00,$28,$04,$19,$03,$0A,$00,$00
	db $00,$00,$00,$00,$8E,$04,$D1,$02,$0C,$00,$00
	db $00,$00,$00,$00,$76,$04,$BB,$02,$01,$00,$00
	db $00,$00,$00,$00,$13,$04,$90,$02,$01,$00,$00
	db $00,$00,$00,$00,$23,$81,$E3,$01,$01,$00,$00
	db $00,$00,$00,$00,$1D,$C4,$3C,$02,$01,$00,$00
	db $00,$00,$00,$00,$B5,$81,$A2,$02,$01,$00,$00
	db $00,$00,$00,$00,$23,$C1,$FC,$01,$01,$00,$00
	db $00,$00,$00,$00,$83,$82,$E3,$01,$01,$00,$00
	db $00,$00,$00,$00,$BD,$C1,$BC,$02,$01,$00,$00
	db $00,$00,$00,$00,$AD,$82,$E2,$01,$01,$00,$00
	db $00,$00,$00,$00,$CD,$82,$E2,$01,$01,$00,$00
	db $00,$00,$00,$00,$83,$C2,$FC,$01,$01,$00,$00
	db $00,$00,$00,$00,$25,$01,$16,$03,$01,$00,$00
	db $00,$00,$00,$00,$A5,$C2,$FC,$01,$01,$00,$00
	db $00,$00,$00,$00,$30,$04,$F0,$02,$01,$00,$00
	db $00,$00,$00,$00,$E5,$C4,$58,$03,$07,$E5,$FA
	db $C6,$00,$1D,$82,$BD,$84,$22,$03,$07,$00,$00
	db $00,$00,$00,$00,$9B,$C4,$2E,$03,$01,$B8,$9E
	db $C9,$00,$F9,$02,$C2,$83,$40,$01,$01,$00,$00
	db $00,$00,$00,$00,$FC,$C4,$BB,$02,$01,$00,$00
	db $00,$00,$00,$00,$0C,$80,$04,$03,$01,$00,$00
	db $00,$00,$00,$00,$C2,$C3,$87,$01,$01,$9B,$9E
	db $C9,$00,$00,$00,$E6,$84,$32,$00,$01,$3D,$68
	db $C8,$00,$F4,$6C,$C8,$00,$83,$A7,$C9,$00,$54
	db $81,$52,$04,$C1,$02,$00,$E4,$A7,$C9,$00,$54
	db $81,$55,$04,$F5,$02,$00,$3D,$A8,$C9,$00,$54
	db $81,$49,$04,$05,$03,$00,$9B,$A8,$C9,$00,$54
	db $81,$7C,$04,$6D,$02,$00,$B2,$A8,$C9,$00,$54
	db $81,$7A,$04,$D3,$02,$00,$E0,$A8,$C9,$00,$54
	db $81,$62,$04,$0D,$03,$00,$1C,$AA,$C9,$00,$54
	db $81,$87,$04,$DF,$02,$00,$2D,$67,$C8,$00,$1F
	db $7D,$C8,$00,$13,$68,$C8,$00,$94,$7D,$C8,$00
	db $87,$67,$C8,$00,$C5,$67,$C8,$00,$B4,$7D,$C8
	db $00,$F3,$66,$C8,$00,$DD,$66,$C8,$00,$00,$00
	db $00,$00,$00,$00,$41,$C1,$E8,$03,$04,$00,$00
	db $00,$00,$00,$00,$3D,$C1,$B8,$03,$04,$1D,$B2
	db $C9,$00,$00,$00,$F8,$C0,$CB,$03,$01,$1D,$B2
	db $C9,$00,$00,$00,$D8,$C0,$8B,$03,$01,$1D,$B2
	db $C9,$00,$00,$00,$D8,$C0,$CB,$03,$01,$1D,$B2
	db $C9,$00,$00,$00,$F8,$C0,$8B,$03,$01,$82,$AF
	db $C9,$00,$00,$00,$14,$C0,$80,$02,$01,$0B,$B1
	db $C9,$00,$00,$00,$1C,$80,$67,$02,$01,$60,$9B
	db $C9,$00,$00,$00,$B8,$C1,$F8,$00,$01,$0B,$B1
	db $C9,$00,$00,$00,$D0,$81,$8B,$00,$01,$00,$00
	db $00,$00,$00,$00,$69,$C1,$F8,$03,$04,$0B,$B1
	db $C9,$00,$00,$00,$6C,$C2,$5C,$03,$01,$0B,$B1
	db $C9,$00,$00,$00,$C5,$01,$6C,$03,$01,$1D,$B2
	db $C9,$00,$00,$00,$E8,$C2,$0B,$02,$01,$67,$D0
	db $C6,$00,$00,$00,$00,$00,$00,$00,$24,$01,$57
	db $00,$0A,$00,$00,$00,$00,$00,$00,$3C,$01,$DA
	db $03,$07,$00,$00,$00,$00,$00,$00,$3C,$01,$D1
	db $03,$07,$00,$00,$00,$00,$00,$00,$64,$81,$E0
	db $03,$0F,$00,$00,$00,$00,$00,$00,$7C,$01,$DA
	db $03,$07,$00,$00,$00,$00,$00,$00,$7C,$01,$D1
	db $03,$07,$00,$00,$00,$00,$00,$00,$CD,$C0,$D8
	db $03,$07,$00,$00,$00,$00,$00,$00,$CD,$C0,$94
	db $03,$07,$00,$00,$00,$00,$00,$00,$81,$81,$C7
	db $03,$0F,$8B,$9E,$C9,$00,$00,$00,$12,$01,$3E
	db $00,$0A,$00,$00,$00,$00,$00,$00,$63,$02,$28
	db $00,$0A,$00,$00,$00,$00,$00,$00,$F0,$80,$64
	db $03,$0F,$00,$00,$00,$00,$00,$00,$ED,$C0,$D8
	db $03,$07,$00,$00,$00,$00,$00,$00,$ED,$C0,$98
	db $03,$07,$00,$00,$00,$00,$00,$00,$41,$81,$C7
	db $03,$0F,$16,$AE,$C9,$00,$00,$00,$A3,$01,$2B
	db $00,$01,$16,$AE,$C9,$00,$00,$00,$A7,$01,$33
	db $00,$01,$16,$AE,$C9,$00,$00,$00,$A3,$01,$47
	db $00,$01,$16,$AE,$C9,$00,$00,$00,$8F,$01,$63
	db $00,$01,$1E,$B1,$C9,$00,$00,$00,$5B,$01,$43
	db $00,$01,$00,$00,$00,$00,$00,$00,$45,$02,$61
	db $00,$01,$3F,$9B,$C9,$00,$00,$00,$4A,$02,$55
	db $00,$01,$58,$AE,$C9,$00,$00,$00,$15,$02,$35
	db $00,$01,$E1,$AF,$C9,$00,$C0,$80,$E1,$01,$19
	db $00,$01,$00,$00,$00,$00,$00,$00,$34,$84,$67
	db $01,$01,$00,$00,$00,$00,$00,$00,$34,$C0,$98
	db $02,$01,$00,$00,$00,$00,$00,$00,$6C,$82,$07
	db $03,$01,$00,$00,$00,$00,$00,$00,$38,$C4,$BC
	db $01,$01,$5C,$9B,$C9,$00,$00,$00,$61,$02,$51
	db $00,$01,$00,$00,$00,$00,$00,$00,$2A,$42,$2A
	db $00,$01,$00,$00,$00,$00,$00,$00,$E5,$82,$22
	db $03,$01,$00,$00,$00,$00,$00,$00,$D4,$C1,$78
	db $03,$01,$00,$00,$00,$00,$00,$00,$65,$C2,$FC
	db $03,$01,$00,$00,$00,$00,$00,$00,$A5,$C2,$BC
	db $03,$01,$00,$00,$00,$00,$00,$00,$1D,$83,$22
	db $03,$01,$00,$00,$00,$00,$00,$00,$A5,$C2,$DC
	db $03,$01,$00,$00,$00,$00,$00,$00,$7D,$82,$C2
	db $03,$01,$00,$00,$00,$00,$00,$00,$7D,$82,$E6
	db $03,$01,$00,$00,$00,$00,$00,$00,$91,$82,$42
	db $03,$01,$00,$00,$00,$00,$00,$00,$BD,$C2,$FC
	db $03,$01,$00,$00,$00,$00,$00,$00,$49,$C3,$48
	db $03,$01,$00,$00,$00,$00,$00,$00,$B5,$82,$02
	db $03,$01,$00,$00,$00,$00,$00,$00,$CB,$01,$0C
	db $03,$01,$00,$00,$00,$00,$00,$00,$5D,$C3,$9C
	db $03,$01,$00,$00,$00,$00,$00,$00,$DD,$82,$43
	db $03,$04,$00,$00,$00,$00,$00,$00,$2A,$C2,$85
	db $03,$07,$00,$00,$00,$00,$00,$00,$39,$82,$23
	db $03,$07,$00,$00,$00,$00,$00,$00,$19,$C2,$5C
	db $03,$07,$00,$00,$00,$00,$00,$00,$51,$82,$E3
	db $03,$07,$00,$00,$00,$00,$00,$00,$FD,$C2,$DC
	db $03,$07,$00,$00,$00,$00,$00,$00,$FD,$82,$C3
	db $03,$07,$00,$00,$00,$00,$00,$00,$DD,$C2,$58
	db $03,$07,$0B,$B1,$C9,$00,$00,$00,$9B,$81,$A3
	db $03,$01,$0B,$B1,$C9,$00,$00,$00,$C1,$02,$FC
	db $01,$01,$00,$00,$00,$00,$00,$00,$D9,$82,$E3
	db $01,$07,$00,$00,$00,$00,$00,$00,$21,$00,$1C
	db $03,$01,$00,$00,$00,$00,$00,$00,$99,$82,$E3
	db $01,$07,$00,$00,$00,$00,$00,$00,$52,$C2,$49
	db $02,$01,$00,$00,$00,$00,$00,$00,$F9,$C2,$F4
	db $01,$07,$00,$00,$00,$00,$00,$00,$B9,$82,$E3
	db $01,$07,$00,$00,$00,$00,$00,$00,$A9,$C2,$B8
	db $01,$07,$00,$00,$00,$00,$00,$00,$DD,$C2,$A8
	db $01,$07,$00,$00,$00,$00,$00,$00,$B1,$C2,$64
	db $01,$07,$00,$00,$00,$00,$00,$00,$CD,$82,$47
	db $01,$07,$00,$00,$00,$00,$00,$00,$79,$83,$A3
	db $03,$01,$00,$00,$00,$00,$00,$00,$CB,$02,$10
	db $01,$01,$0C,$B0,$C9,$00,$C1,$80,$95,$02,$4E
	db $00,$01,$F0,$AA,$C9,$00,$00,$00,$BD,$02,$66
	db $00,$01,$00,$00,$00,$00,$00,$00,$91,$03,$45
	db $00,$01,$F0,$AA,$C9,$00,$00,$00,$95,$02,$1E
	db $00,$01,$00,$00,$00,$00,$00,$00,$4F,$02,$2E
	db $02,$01,$00,$00,$00,$00,$00,$00,$95,$03,$35
	db $00,$01,$00,$00,$00,$00,$00,$00,$79,$C2,$B9
	db $03,$01,$82,$AF,$C9,$00,$00,$00,$1F,$01,$95
	db $03,$01,$00,$00,$00,$00,$00,$00,$0C,$81,$6B
	db $03,$01,$00,$00,$00,$00,$00,$00,$99,$81,$43
	db $03,$01,$00,$00,$00,$00,$00,$00,$55,$00,$4D
	db $03,$01,$00,$00,$00,$00,$00,$00,$B9,$81,$43
	db $03,$01,$00,$00,$00,$00,$00,$00,$99,$C1,$BD
	db $03,$01,$00,$00,$00,$00,$00,$00,$99,$C1,$FC
	db $03,$01,$4F,$9C,$C9,$00,$00,$00,$E2,$03,$19
	db $00,$01,$7F,$AA,$C9,$00,$54,$81,$21,$00,$1C
	db $03,$01,$0B,$7B,$C8,$00,$00,$00,$00,$00,$00
	db $00,$E9,$C3,$CB,$03,$04,$0B,$B1,$C9,$00,$00
	db $00,$A9,$C1,$50,$03,$01,$0B,$B1,$C9,$00,$00
	db $00,$81,$02,$8C,$01,$01,$0B,$B1,$C9,$00,$00
	db $00,$8D,$82,$83,$01,$01,$0B,$B1,$C9,$00,$00
	db $00,$79,$C3,$F9,$03,$01,$00,$00,$00,$00,$00
	db $00,$E9,$C3,$2B,$03,$04,$00,$00,$00,$00,$00
	db $00,$E9,$C3,$8B,$03,$04,$0B,$B1,$C9,$00,$00
	db $00,$B9,$C1,$5C,$03,$01,$0B,$B1,$C9,$00,$00
	db $00,$8D,$C2,$9C,$01,$01,$0B,$B1,$C9,$00,$00
	db $00,$79,$82,$83,$03,$01,$1E,$B1,$C9,$00,$00
	db $00,$CC,$03,$1B,$00,$0A,$00,$00,$00,$00,$00
	db $00,$C4,$03,$37,$00,$0A,$00,$00,$00,$00,$00
	db $00,$A0,$03,$1B,$00,$0A,$00,$00,$00,$00,$00
	db $00,$A7,$03,$18,$00,$01,$00,$00,$00,$00,$00
	db $00,$B0,$03,$15,$00,$01,$00,$00,$00,$00,$00
	db $00,$AA,$03,$2D,$00,$01,$00,$00,$00,$00,$00
	db $00,$AC,$03,$25,$00,$01,$00,$00,$00,$00,$00
	db $00,$0D,$C1,$D8,$03,$01,$0B,$B1,$C9,$00,$00
	db $00,$0C,$C0,$5B,$03,$01,$00,$00,$00,$00,$00
	db $00,$ED,$C0,$F4,$03,$01,$0B,$B1,$C9,$00,$00
	db $00,$AC,$81,$C4,$02,$01,$0B,$B1,$C9,$00,$00
	db $00,$AC,$81,$C4,$02,$01,$0B,$B1,$C9,$00,$00
	db $00,$5A,$C3,$F8,$03,$01,$0B,$B1,$C9,$00,$00
	db $00,$13,$04,$31,$00,$01,$0B,$B1,$C9,$00,$00
	db $00,$91,$02,$B8,$03,$01,$0B,$B1,$C9,$00,$00
	db $00,$3C,$84,$C4,$03,$01,$0B,$B1,$C9,$00,$00
	db $00,$3C,$C4,$FB,$03,$01,$23,$2D,$C6,$00,$9B
	db $9E,$C9,$00,$00,$00,$B4,$04,$B3,$01,$01,$9B
	db $9E,$C9,$00,$00,$00,$DC,$04,$AF,$00,$01,$00
	db $00,$00,$00,$00,$00,$83,$02,$8D,$03,$01,$00
	db $00,$00,$00,$00,$00,$A3,$02,$F5,$03,$01,$00
	db $00,$00,$00,$00,$00,$93,$02,$05,$03,$01,$00
	db $00,$00,$00,$00,$00,$93,$02,$39,$03,$01,$00
	db $00,$00,$00,$00,$00,$C3,$02,$35,$03,$01,$00
	db $00,$00,$00,$00,$00,$B4,$84,$CC,$01,$01,$00
	db $00,$00,$00,$00,$00,$EA,$02,$B5,$03,$01,$00
	db $00,$00,$00,$00,$00,$EC,$42,$ED,$03,$01,$00
	db $00,$00,$00,$00,$00,$A8,$42,$75,$03,$01,$00
	db $00,$00,$00,$00,$00,$CA,$02,$D5,$03,$01,$00
	db $00,$00,$00,$00,$00,$04,$43,$79,$03,$01,$9B
	db $9E,$C9,$00,$00,$00,$B6,$04,$C9,$01,$01,$00
	db $00,$00,$00,$00,$00,$BC,$44,$C1,$00,$01,$00
	db $00,$00,$00,$E9,$82,$A9,$C2,$10,$03,$01,$00
	db $00,$00,$00,$00,$00,$C9,$C2,$10,$03,$01,$00
	db $00,$00,$00,$00,$00,$A8,$02,$05,$03,$01,$00
	db $00,$00,$00,$00,$00,$E9,$C2,$0C,$03,$01,$00
	db $00,$00,$00,$00,$00,$C8,$02,$05,$03,$01,$00
	db $00,$00,$00,$00,$00,$C8,$02,$0D,$03,$01,$00
	db $00,$00,$00,$00,$00,$09,$C3,$1C,$03,$01,$00
	db $00,$00,$00,$00,$00,$A8,$02,$0D,$03,$01,$00
	db $00,$00,$00,$00,$00,$89,$C2,$2C,$03,$01,$00
	db $00,$00,$00,$00,$00,$88,$02,$29,$03,$01,$00
	db $00,$00,$00,$00,$00,$C9,$C2,$58,$03,$01,$00
	db $00,$00,$00,$00,$00,$88,$02,$25,$03,$01,$00
	db $00,$00,$00,$00,$00,$E9,$C2,$D0,$03,$01,$00
	db $00,$00,$00,$00,$00,$C9,$C2,$F4,$03,$01,$00
	db $00,$00,$00,$00,$00,$E8,$02,$CD,$03,$01,$00
	db $00,$00,$00,$C4,$81,$D9,$C2,$1C,$03,$01,$00
	db $00,$00,$00,$C3,$81,$39,$C3,$1C,$03,$01,$00
	db $00,$00,$00,$00,$00,$99,$82,$83,$03,$01,$00
	db $00,$00,$00,$C6,$81,$F9,$C2,$1C,$03,$01,$00
	db $00,$00,$00,$C5,$81,$19,$C3,$1C,$03,$01,$00
	db $00,$00,$00,$00,$00,$D9,$82,$03,$03,$01,$00
	db $00,$00,$00,$00,$00,$F9,$82,$03,$03,$01,$00
	db $00,$00,$00,$CA,$81,$25,$C3,$08,$03,$01,$00
	db $00,$00,$00,$C9,$81,$49,$C3,$10,$03,$01,$00
	db $00,$00,$00,$00,$00,$1B,$83,$03,$03,$01,$00
	db $00,$00,$00,$00,$00,$08,$03,$05,$03,$01,$00
	db $00,$00,$00,$00,$00,$08,$03,$09,$03,$01,$00
	db $00,$00,$00,$C8,$81,$F9,$C2,$5C,$03,$01,$00
	db $00,$00,$00,$C7,$81,$59,$C3,$1C,$03,$01,$00
	db $00,$00,$00,$00,$00,$39,$83,$03,$03,$01,$00
	db $00,$00,$00,$CE,$81,$E9,$C2,$4C,$03,$01,$00
	db $00,$00,$00,$CD,$81,$29,$C3,$5C,$03,$01,$00
	db $00,$00,$00,$00,$00,$59,$83,$03,$03,$01,$00
	db $00,$00,$00,$00,$00,$C8,$02,$45,$03,$01,$00
	db $00,$00,$00,$00,$00,$C8,$02,$55,$03,$01,$00
	db $00,$00,$00,$CC,$81,$09,$C3,$CC,$03,$01,$00
	db $00,$00,$00,$CB,$81,$19,$C3,$7C,$03,$01,$00
	db $00,$00,$00,$00,$00,$F9,$82,$43,$03,$01,$00
	db $00,$00,$00,$00,$00,$E8,$02,$C5,$03,$01,$00
	db $00,$00,$00,$04,$82,$51,$C3,$B4,$03,$01,$00
	db $00,$00,$00,$00,$00,$19,$83,$43,$03,$01,$00
	db $00,$00,$00,$00,$00,$C8,$02,$E5,$03,$01,$68
	db $9C,$C9,$00,$00,$00,$E6,$C4,$CD,$02,$01,$53
	db $9C,$C9,$00,$00,$00,$7E,$82,$18,$01,$01,$00
	db $00,$00,$00,$00,$00,$E6,$C4,$0D,$02,$01,$00
	db $00,$00,$00,$00,$00,$E6,$84,$32,$02,$01,$00
	db $00,$00,$00,$00,$00,$0D,$C3,$DC,$02,$01,$00
	db $00,$00,$00,$00,$00,$39,$83,$A7,$02,$04,$D7
	db $AD,$C9,$00,$00,$00,$5D,$C3,$FC,$02,$04,$C7
	db $AD,$C9,$00,$00,$00,$A5,$C2,$C8,$02,$01,$FA
	db $9F,$C9,$00,$92,$80,$57,$C3,$96,$02,$06,$82
	db $AF,$C9,$00,$00,$00,$84,$01,$BB,$01,$01,$00
	db $00,$00,$00,$00,$00,$B5,$C2,$7C,$02,$04,$00
	db $00,$00,$00,$00,$00,$FD,$C2,$FC,$02,$01,$00
	db $00,$00,$00,$00,$00,$AD,$C2,$38,$02,$06,$76
	db $9C,$C9,$00,$00,$00,$AC,$C1,$17,$03,$01,$00
	db $00,$00,$00,$00,$00,$09,$82,$A3,$02,$04,$00
	db $00,$00,$00,$00,$00,$08,$03,$B2,$02,$07,$00
	db $00,$00,$00,$00,$00,$DB,$02,$C9,$02,$07,$00
	db $00,$00,$00,$00,$00,$DB,$02,$D1,$02,$07,$D7
	db $B0,$C9,$00,$5E,$01,$A5,$82,$AB,$02,$0D,$00
	db $00,$00,$00,$00,$00,$81,$C2,$C0,$02,$07,$00
	db $00,$00,$00,$00,$00,$C1,$C2,$C8,$02,$07,$00
	db $00,$00,$00,$00,$00,$27,$03,$ED,$02,$07,$00
	db $00,$00,$00,$00,$00,$8D,$C2,$98,$02,$07,$00
	db $00,$00,$00,$00,$00,$DB,$02,$A9,$02,$07,$00
	db $00,$00,$00,$00,$00,$DB,$02,$B1,$02,$07,$30
	db $A0,$C9,$00,$00,$00,$0C,$83,$24,$02,$07,$00
	db $00,$00,$00,$00,$00,$8D,$C2,$F8,$02,$07,$00
	db $00,$00,$00,$00,$00,$AD,$C2,$98,$02,$07,$00
	db $00,$00,$00,$00,$00,$68,$02,$ED,$02,$07,$E3
	db $B0,$C9,$00,$5E,$01,$2D,$83,$E3,$02,$0D,$00
	db $00,$00,$00,$00,$00,$6B,$02,$AE,$02,$07,$00
	db $00,$00,$00,$00,$00,$88,$02,$90,$02,$07,$00
	db $00,$00,$00,$00,$00,$2B,$C3,$9A,$02,$07,$00
	db $00,$00,$00,$00,$00,$4F,$C2,$AF,$01,$0C,$00
	db $00,$00,$00,$00,$00,$ED,$82,$83,$02,$0F,$00
	db $00,$00,$00,$00,$00,$AD,$C2,$F8,$02,$07,$00
	db $00,$00,$00,$00,$00,$CD,$C2,$98,$02,$07,$00
	db $00,$00,$00,$00,$00,$8D,$82,$83,$02,$07,$EF
	db $B0,$C9,$00,$5E,$01,$2D,$C3,$F8,$02,$0D,$07
	db $B1,$C9,$00,$00,$00,$78,$02,$85,$02,$0D,$A2
	db $AD,$C9,$00,$00,$00,$03,$02,$B0,$01,$01,$00
	db $00,$00,$00,$00,$00,$A8,$02,$8A,$02,$07,$00
	db $00,$00,$00,$00,$00,$41,$83,$26,$02,$07,$00
	db $00,$00,$00,$00,$00,$CD,$C2,$F8,$02,$07,$00
	db $00,$00,$00,$00,$00,$ED,$C2,$F8,$02,$07,$00
	db $00,$00,$00,$00,$00,$A8,$02,$90,$02,$07,$FB
	db $B0,$C9,$00,$5E,$01,$0D,$C3,$F8,$02,$0D,$00
	db $00,$00,$00,$00,$00,$6D,$82,$E3,$02,$07,$00
	db $00,$00,$00,$00,$00,$6D,$C2,$F8,$02,$07,$00
	db $00,$00,$00,$00,$00,$6B,$02,$C1,$02,$07,$00
	db $00,$00,$00,$00,$00,$6D,$82,$83,$02,$07,$00
	db $00,$00,$00,$00,$00,$6D,$C2,$98,$02,$07,$00
	db $00,$00,$00,$00,$00,$0D,$83,$E3,$02,$07,$00
	db $00,$00,$00,$00,$00,$C8,$02,$90,$02,$07,$00
	db $00,$00,$00,$00,$00,$F8,$02,$F1,$02,$07,$00
	db $00,$00,$00,$00,$00,$B1,$82,$23,$02,$0F,$7B
	db $AD,$C9,$00,$8F,$80,$ED,$82,$E3,$02,$07,$00
	db $00,$00,$00,$98,$82,$09,$C2,$BC,$02,$0F,$00
	db $00,$00,$00,$6A,$81,$EC,$02,$C2,$02,$07,$00
	db $00,$00,$00,$00,$00,$CD,$82,$83,$02,$07,$00
	db $00,$00,$00,$00,$00,$D9,$C2,$E8,$02,$07,$00
	db $00,$00,$00,$00,$00,$1D,$C3,$CC,$02,$01,$1E
	db $B1,$C9,$00,$00,$00,$4B,$C2,$42,$01,$01,$00
	db $00,$00,$00,$00,$00,$7D,$C2,$FC,$02,$07,$00
	db $00,$00,$00,$00,$00,$7D,$C2,$38,$02,$07,$00
	db $00,$00,$00,$00,$00,$2D,$83,$A3,$02,$0F,$00
	db $00,$00,$00,$00,$00,$3D,$C3,$D8,$02,$07,$00
	db $00,$00,$00,$00,$00,$5D,$C3,$D8,$02,$07,$00
	db $00,$00,$00,$00,$00,$C9,$C1,$73,$01,$01,$00
	db $00,$00,$00,$00,$00,$FD,$82,$E3,$02,$01,$00
	db $00,$00,$00,$00,$00,$DD,$C2,$DC,$02,$07,$07
	db $B1,$C9,$00,$00,$00,$D8,$02,$85,$02,$0D,$00
	db $00,$00,$00,$00,$00,$2C,$03,$C5,$02,$07,$00
	db $00,$00,$00,$00,$00,$9D,$82,$E3,$02,$07,$00
	db $00,$00,$00,$00,$00,$0D,$83,$A3,$02,$0F,$00
	db $00,$00,$00,$00,$00,$1D,$C3,$FC,$02,$07,$00
	db $00,$00,$00,$00,$00,$4D,$C3,$DC,$02,$07,$00
	db $00,$00,$00,$00,$00,$18,$03,$B1,$02,$07,$00
	db $00,$00,$00,$00,$00,$6D,$C2,$CC,$02,$07,$07
	db $B1,$C9,$00,$00,$00,$98,$02,$85,$02,$0D,$26
	db $AD,$C9,$00,$8E,$80,$B8,$02,$85,$02,$0D,$00
	db $00,$00,$00,$00,$00,$BD,$C2,$FC,$02,$07,$1A
	db $A0,$C9,$00,$00,$00,$18,$C2,$C2,$01,$0C,$00
	db $00,$00,$00,$00,$00,$2C,$03,$D1,$02,$07,$00
	db $00,$00,$00,$00,$00,$18,$03,$BD,$02,$07,$8B
	db $A0,$C9,$00,$54,$81,$5E,$03,$BE,$02,$00,$00
	db $00,$00,$00,$3A,$80,$5D,$C3,$BC,$02,$07,$00
	db $00,$00,$00,$00,$00,$5D,$83,$E2,$02,$01,$3D
	db $9D,$C9,$00,$00,$00,$DD,$C2,$6C,$02,$07,$00
	db $00,$00,$00,$00,$00,$6D,$C2,$3C,$02,$07,$3C
	db $9D,$C9,$00,$00,$00,$3E,$82,$79,$01,$0A,$00
	db $00,$00,$00,$76,$81,$4D,$C3,$BC,$02,$07,$8B
	db $9D,$C9,$00,$00,$00,$A8,$02,$59,$02,$07,$9D
	db $A0,$C9,$00,$00,$00,$E2,$C1,$42,$01,$0A,$6A
	db $9D,$C9,$00,$00,$00,$DD,$82,$33,$02,$07,$0B
	db $B1,$C9,$00,$00,$00,$44,$00,$83,$02,$01,$00
	db $00,$00,$00,$00,$00,$99,$82,$27,$02,$07,$00
	db $00,$00,$00,$00,$00,$AB,$82,$4D,$02,$07,$00
	db $00,$00,$00,$00,$00,$97,$C2,$7B,$02,$01,$EE
	db $AD,$C9,$00,$00,$00,$17,$02,$92,$01,$0A,$00
	db $00,$00,$00,$00,$00,$D9,$01,$B0,$01,$0A,$00
	db $00,$00,$00,$00,$00,$F1,$82,$AB,$02,$0F,$00
	db $00,$00,$00,$00,$00,$B2,$C0,$1D,$00,$01,$00
	db $00,$00,$00,$00,$00,$B6,$C0,$1D,$00,$01,$00
	db $00,$00,$00,$00,$00,$5A,$43,$AD,$02,$01,$00
	db $00,$00,$00,$00,$00,$BC,$C1,$D7,$02,$07,$00
	db $00,$00,$00,$00,$00,$2C,$C2,$17,$02,$07,$00
	db $00,$00,$00,$00,$00,$B6,$81,$62,$03,$01,$00
	db $00,$00,$00,$00,$00,$BA,$81,$62,$03,$01,$00
	db $00,$00,$00,$00,$00,$56,$80,$62,$02,$01,$00
	db $00,$00,$00,$00,$00,$5A,$80,$62,$02,$01,$00
	db $00,$00,$00,$00,$00,$54,$00,$99,$02,$07,$00
	db $00,$00,$00,$00,$00,$4C,$00,$BD,$02,$07,$00
	db $00,$00,$00,$00,$00,$56,$C0,$FD,$02,$01,$00
	db $00,$00,$00,$00,$00,$5A,$C0,$FD,$02,$01,$00
	db $00,$00,$00,$00,$00,$4C,$C2,$17,$02,$07,$00
	db $00,$00,$00,$00,$00,$96,$81,$82,$01,$01,$00
	db $00,$00,$00,$00,$00,$9A,$81,$82,$01,$01,$00
	db $00,$00,$00,$00,$00,$AC,$01,$9D,$03,$07,$00
	db $00,$00,$00,$00,$00,$B6,$C1,$FD,$03,$01,$00
	db $00,$00,$00,$00,$00,$BA,$C1,$FD,$03,$01,$37
	db $B0,$C9,$00,$00,$00,$00,$42,$ED,$01,$01,$00
	db $00,$00,$00,$00,$00,$6C,$C2,$1B,$02,$07,$00
	db $00,$00,$00,$00,$00,$94,$01,$A9,$01,$07,$AD
	db $68,$C8,$00,$00,$69,$C8,$00,$61,$69,$C8,$00
	db $CF,$AB,$C9,$00,$54,$81,$DB,$02,$B9,$02,$00
	db $25,$6A,$C8,$00,$B2,$6A,$C8,$00,$B3,$6A,$C8
	db $00,$A8,$6D,$C8,$00,$FB,$6D,$C8,$00,$96,$37
	db $C7,$00,$00,$00,$00,$00,$00,$00,$9D,$C4,$5C
	db $03,$04,$1D,$B2,$C9,$00,$00,$00,$78,$C4,$AB
	db $03,$04,$00,$00,$00,$00,$00,$00,$7D,$C4,$5C
	db $03,$04,$7D,$B1,$C9,$00,$51,$81,$7A,$C4,$D9
	db $03,$01,$3F,$B1,$C9,$00,$00,$00,$AD,$C4,$7C
	db $03,$04,$00,$00,$00,$00,$00,$00,$BD,$C4,$5C
	db $03,$04,$00,$00,$00,$00,$00,$00,$CD,$C4,$D4
	db $03,$04,$1D,$B2,$C9,$00,$00,$00,$AD,$C4,$5C
	db $03,$04,$1D,$B2,$C9,$00,$00,$00,$A9,$C4,$90
	db $03,$04,$1D,$B2,$C9,$00,$00,$00,$A9,$C4,$D0
	db $03,$04,$1D,$B2,$C9,$00,$00,$00,$CD,$C4,$54
	db $03,$04,$1D,$B2,$C9,$00,$00,$00,$CD,$C4,$94
	db $03,$04,$00,$00,$00,$00,$00,$00,$BC,$04,$C9
	db $03,$07,$00,$00,$00,$00,$00,$00,$BC,$04,$D1
	db $03,$07,$00,$00,$00,$00,$00,$00,$BD,$C4,$98
	db $03,$07,$00,$00,$00,$00,$00,$00,$57,$01,$2D
	db $03,$0A,$00,$00,$00,$00,$00,$00,$BD,$84,$C3
	db $03,$0F,$00,$00,$00,$00,$00,$00,$B8,$04,$52
	db $03,$07,$00,$00,$00,$00,$00,$00,$6D,$C4,$54
	db $03,$07,$00,$00,$00,$00,$00,$00,$6D,$C4,$D4
	db $03,$07,$00,$00,$00,$00,$00,$00,$BD,$84,$43
	db $03,$0F,$00,$00,$00,$00,$00,$00,$AD,$84,$A3
	db $03,$0F,$5F,$B1,$C9,$00,$00,$00,$AD,$84,$62
	db $03,$01,$00,$00,$00,$00,$00,$00,$9D,$C4,$9C
	db $03,$07,$00,$00,$00,$00,$00,$00,$70,$C4,$F3
	db $03,$0F,$00,$00,$00,$00,$00,$00,$78,$C4,$FB
	db $03,$0F,$00,$00,$00,$00,$00,$00,$9D,$C4,$DC
	db $03,$07,$00,$00,$00,$00,$00,$00,$9D,$84,$43
	db $03,$0F,$00,$00,$00,$00,$00,$00,$54,$01,$97
	db $02,$0A,$21,$B2,$C9,$00,$00,$00,$54,$01,$68
	db $02,$0A,$00,$00,$00,$00,$00,$00,$55,$01,$C2
	db $02,$0F,$00,$00,$00,$00,$00,$00,$49,$84,$8B
	db $03,$0F,$00,$00,$00,$00,$00,$00,$5C,$84,$84
	db $03,$0F,$00,$00,$00,$00,$00,$00,$5C,$C4,$BB
	db $03,$0F,$2A,$B1,$C9,$00,$00,$00,$55,$01,$37
	db $02,$0A,$00,$00,$00,$00,$00,$00,$48,$04,$98
	db $03,$07,$00,$00,$00,$00,$00,$00,$48,$04,$A8
	db $03,$07,$21,$B2,$C9,$00,$00,$00,$63,$01,$62
	db $03,$0A,$00,$00,$00,$00,$00,$00,$57,$C4,$79
	db $03,$01,$EE,$AD,$C9,$00,$00,$00,$52,$01,$EE
	db $02,$0A,$21,$B2,$C9,$00,$00,$00,$63,$01,$76
	db $03,$0A,$00,$00,$00,$00,$00,$00,$AD,$84,$E3
	db $03,$07,$00,$00,$00,$00,$00,$00,$55,$84,$47
	db $03,$0F,$2E,$B1,$C9,$00,$00,$00,$63,$01,$82
	db $03,$0A,$00,$00,$00,$00,$00,$00,$A8,$04,$AD
	db $03,$07,$21,$B2,$C9,$00,$00,$00,$63,$01,$96
	db $03,$0A,$21,$B2,$C9,$00,$00,$00,$63,$01,$A2
	db $03,$0A,$00,$00,$00,$00,$00,$00,$5B,$01,$6A
	db $03,$0A,$55,$71,$C8,$00,$76,$71,$C8,$00,$B2
	db $71,$C8,$00,$CD,$71,$C8,$00,$94,$71,$C8,$00
	db $E9,$71,$C8,$00,$3D,$6E,$C8,$00,$B4,$6C,$C8
	db $00,$01,$AB,$C9,$00,$54,$81,$5B,$01,$8B,$03
	db $00,$BD,$AB,$C9,$00,$54,$81,$5B,$01,$AB,$03
	db $00,$91,$BB,$C8,$00,$DD,$69,$C8,$00,$D2,$BB
	db $C8,$00,$00,$00,$00,$00,$00,$00,$11,$C4,$F8
	db $03,$01,$1D,$B2,$C9,$00,$00,$00,$C9,$C3,$70
	db $03,$01,$1D,$B2,$C9,$00,$00,$00,$F9,$C3,$B4
	db $03,$01,$1D,$B2,$C9,$00,$00,$00,$E9,$C3,$70
	db $03,$01,$1D,$B2,$C9,$00,$00,$00,$D9,$C3,$B0
	db $03,$01,$0B,$B1,$C9,$00,$8C,$82,$96,$C3,$1C
	db $02,$01,$82,$AF,$C9,$00,$00,$00,$B1,$82,$03
	db $01,$01,$21,$B2,$C9,$00,$00,$00,$D4,$01,$20
	db $02,$01,$21,$B2,$C9,$00,$00,$00,$E4,$01,$50
	db $02,$01,$21,$B2,$C9,$00,$00,$00,$F4,$01,$28
	db $02,$01,$21,$B2,$C9,$00,$00,$00,$EC,$01,$18
	db $02,$01,$00,$00,$00,$00,$00,$00,$11,$84,$C7
	db $03,$01,$00,$00,$00,$00,$00,$00,$11,$C4,$68
	db $03,$01,$1E,$B1,$C9,$00,$00,$00,$BA,$01,$39
	db $02,$01,$00,$00,$00,$00,$00,$00,$3A,$02,$4E
	db $02,$05,$00,$00,$00,$00,$00,$00,$36,$C4,$3C
	db $02,$01,$00,$00,$00,$00,$00,$00,$0A,$02,$1D
	db $02,$01,$00,$00,$00,$00,$00,$00,$37,$04,$21
	db $02,$05,$00,$00,$00,$00,$00,$00,$37,$04,$34
	db $02,$05,$00,$00,$00,$00,$00,$00,$97,$03,$F1
	db $01,$05,$00,$00,$00,$00,$00,$00,$B7,$02,$2E
	db $01,$05,$00,$00,$00,$00,$00,$00,$99,$83,$E7
	db $01,$01,$62,$B0,$C9,$00,$C3,$80,$06,$03,$C5
	db $01,$01,$00,$00,$00,$00,$00,$00,$7A,$04,$16
	db $02,$05,$00,$00,$00,$00,$00,$00,$2D,$C4,$E8
	db $03,$01,$1D,$B2,$C9,$00,$00,$00,$D9,$C3,$34
	db $03,$01,$00,$00,$00,$00,$00,$00,$B9,$C3,$34
	db $03,$01,$00,$00,$00,$00,$00,$00,$6B,$C3,$E6
	db $03,$01,$1D,$B2,$C9,$00,$00,$00,$F9,$C3,$34
	db $03,$01,$0B,$B1,$C9,$00,$00,$00,$39,$81,$C7
	db $02,$01,$D7,$AE,$C9,$00,$F4,$02,$A9,$C1,$3C
	db $03,$01,$02,$72,$C8,$00,$D9,$80,$C0,$2F,$C9
	db $00,$98,$80,$67,$30,$C9,$00,$98,$80,$CE,$30
	db $C9,$00,$98,$80,$29,$30,$C9,$00,$98,$80,$9E
	db $30,$C9,$00,$59,$AE,$C9,$00,$00,$00,$05,$02
	db $99,$00,$01,$00,$00,$00,$00,$00,$00,$00,$02
	db $CC,$00,$01,$21,$B2,$C9,$00,$00,$00,$F8,$01
	db $B8,$00,$01,$21,$B2,$C9,$00,$00,$00,$04,$02
	db $AC,$00,$01,$00,$00,$00,$00,$00,$00,$F8,$01
	db $A4,$00,$01,$00,$00,$00,$00,$00,$00,$63,$02
	db $DF,$00,$01,$00,$00,$00,$00,$00,$00,$BD,$80
	db $23,$00,$01,$00,$00,$00,$00,$00,$00,$39,$C1
	db $D0,$02,$01,$00,$00,$00,$00,$00,$00,$39,$82
	db $07,$02,$01,$00,$00,$00,$00,$00,$00,$A9,$C0
	db $44,$00,$01,$00,$00,$00,$00,$00,$00,$1D,$83
	db $67,$01,$01,$00,$00,$00,$00,$00,$00,$D1,$81
	db $63,$00,$01,$00,$00,$00,$00,$00,$00,$39,$C2
	db $14,$02,$01,$00,$00,$00,$00,$00,$00,$9D,$C1
	db $08,$02,$01,$00,$00,$00,$00,$00,$00,$B9,$84
	db $23,$02,$01,$00,$00,$00,$00,$5B,$81,$BE,$02
	db $06,$02,$05,$00,$00,$00,$00,$00,$00,$E9,$C2
	db $B4,$01,$01,$00,$00,$00,$00,$00,$00,$59,$C2
	db $0C,$02,$01,$00,$00,$00,$00,$00,$00,$CD,$81
	db $67,$00,$01,$00,$00,$00,$00,$00,$00,$89,$81
	db $E3,$01,$01,$00,$00,$00,$00,$00,$00,$CD,$C1
	db $78,$00,$01,$00,$00,$00,$00,$00,$00,$79,$82
	db $07,$02,$01,$00,$00,$00,$00,$00,$00,$CD,$C4
	db $4C,$02,$01,$00,$00,$00,$00,$00,$00,$29,$84
	db $C7,$01,$01,$00,$00,$00,$00,$00,$00,$79,$C2
	db $14,$02,$01,$00,$00,$00,$00,$B3,$81,$99,$82
	db $07,$02,$01,$00,$00,$00,$00,$00,$00,$5D,$C4
	db $18,$02,$01,$16,$AF,$C9,$00,$5C,$81,$BD,$81
	db $83,$02,$01,$00,$00,$00,$00,$00,$00,$B9,$C2
	db $14,$02,$01,$00,$00,$00,$00,$00,$00,$D9,$82
	db $03,$02,$01,$00,$00,$00,$00,$00,$00,$A9,$C1
	db $AC,$02,$01,$00,$00,$00,$00,$00,$00,$F9,$02
	db $0A,$02,$05,$00,$00,$00,$00,$00,$00,$BD,$81
	db $E3,$02,$01,$00,$00,$00,$00,$00,$00,$F9,$C2
	db $10,$02,$01,$73,$AE,$C9,$00,$00,$00,$AC,$02
	db $D7,$00,$01,$5B,$01,$2E,$31,$C9,$00,$81,$31
	db $C9,$00,$00,$00,$00,$00,$00,$00,$48,$40,$25
	db $00,$01,$00,$00,$00,$00,$00,$00,$4A,$00,$35
	db $00,$01,$00,$00,$00,$00,$00,$00,$4A,$00,$2D
	db $00,$01,$00,$00,$00,$00,$00,$00,$48,$40,$3D
	db $00,$01,$00,$00,$00,$00,$00,$00,$4A,$C3,$F8
	db $02,$01,$00,$00,$00,$00,$00,$00,$55,$80,$0B
	db $02,$01,$4A,$AF,$C9,$00,$54,$81,$70,$02,$A7
	db $00,$01,$00,$00,$00,$00,$00,$00,$02,$00,$27
	db $02,$01,$00,$00,$00,$00,$00,$00,$03,$00,$2D
	db $02,$01,$00,$00,$00,$00,$00,$00,$02,$00,$33
	db $02,$01,$00,$00,$00,$00,$00,$00,$03,$00,$39
	db $02,$01,$00,$00,$00,$00,$00,$00,$10,$43,$E5
	db $01,$01,$00,$00,$00,$00,$00,$00,$3B,$00,$3D
	db $02,$05,$00,$00,$00,$00,$00,$00,$53,$00,$34
	db $02,$05,$00,$00,$00,$00,$00,$00,$63,$00,$15
	db $00,$01,$00,$00,$00,$00,$00,$00,$1C,$44,$C5
	db $00,$01,$00,$00,$00,$00,$00,$00,$75,$00,$2C
	db $00,$05,$00,$00,$00,$00,$00,$00,$75,$00,$41
	db $00,$05,$00,$00,$00,$00,$00,$00,$17,$03,$F5
	db $01,$01,$00,$00,$00,$00,$00,$00,$24,$03,$0A
	db $02,$05,$00,$00,$00,$00,$00,$00,$28,$03,$FA
	db $01,$05,$AE,$AC,$C9,$00,$54,$81,$0A,$00,$51
	db $02,$00,$A6,$72,$C8,$00,$E6,$72,$C8,$00,$13
	db $73,$C8,$00,$4B,$73,$C8,$00,$7F,$73,$C8,$00
	db $AB,$73,$C8,$00,$DD,$73,$C8,$00,$11,$74,$C8
	db $00,$44,$74,$C8,$00,$74,$74,$C8,$00,$A2,$74
	db $C8,$00,$D4,$74,$C8,$00,$11,$75,$C8,$00,$46
	db $75,$C8,$00,$7D,$75,$C8,$00,$B0,$75,$C8,$00
	db $DB,$75,$C8,$00,$17,$76,$C8,$00,$32,$76,$C8
	db $00,$64,$76,$C8,$00,$8C,$76,$C8,$00,$B6,$76
	db $C8,$00,$BC,$7E,$C8,$00,$D6,$76,$C8,$00,$F9
	db $76,$C8,$00,$3B,$77,$C8,$00,$6E,$77,$C8,$00
	db $98,$77,$C8,$00,$C4,$77,$C8,$00,$F1,$77,$C8
	db $00,$11,$78,$C8,$00,$3F,$78,$C8,$00,$81,$78
	db $C8,$00,$B9,$78,$C8,$00,$E2,$78,$C8,$00,$1A
	db $79,$C8,$00,$41,$79,$C8,$00,$61,$79,$C8,$00
	db $95,$79,$C8,$00,$C5,$79,$C8,$00,$FE,$79,$C8
	db $00,$1D,$7A,$C8,$00,$50,$7A,$C8,$00,$6F,$7A
	db $C8,$00,$83,$9C,$C9,$00,$00,$00,$0E,$C0,$54
	db $00,$01,$8D,$B0,$C9,$00,$C4,$80,$57,$02,$92
	db $03,$05,$00,$00,$00,$00,$00,$00,$0B,$01,$C9
	db $01,$01,$00,$00,$00,$00,$00,$00,$07,$01,$E1
	db $01,$01,$00,$00,$00,$00,$00,$00,$39,$01,$8C
	db $01,$05,$00,$00,$00,$00,$00,$00,$43,$01,$8D
	db $01,$01,$00,$00,$00,$00,$00,$00,$37,$01,$A1
	db $01,$01,$00,$00,$00,$00,$00,$00,$5F,$01,$A6
	db $01,$05,$00,$00,$00,$00,$00,$00,$3F,$01,$E5
	db $01,$01,$00,$00,$00,$00,$00,$00,$5F,$01,$8D
	db $01,$01,$00,$00,$00,$00,$00,$00,$6F,$01,$CD
	db $01,$01,$00,$00,$00,$00,$00,$00,$51,$81,$87
	db $00,$01,$00,$00,$00,$00,$00,$00,$14,$40,$C7
	db $01,$01,$00,$00,$00,$00,$00,$00,$10,$40,$E1
	db $01,$01,$00,$00,$00,$00,$00,$00,$40,$40,$A3
	db $01,$01,$00,$00,$00,$00,$00,$00,$4C,$40,$8D
	db $01,$01,$00,$00,$00,$00,$00,$00,$68,$40,$8D
	db $01,$01,$00,$00,$00,$00,$00,$00,$74,$40,$CF
	db $01,$01,$00,$00,$00,$00,$00,$00,$44,$40,$E3
	db $01,$01,$CD,$9C,$C9,$00,$00,$00,$90,$00,$8F
	db $01,$21,$98,$9C,$C9,$00,$00,$00,$71,$03,$32
	db $02,$01,$00,$00,$00,$00,$99,$80,$42,$01,$93
	db $00,$01,$00,$00,$00,$00,$00,$00,$30,$40,$13
	db $00,$01,$BC,$9C,$C9,$00,$89,$82,$72,$C0,$F4
	db $01,$01,$00,$00,$00,$00,$00,$00,$BA,$C4,$10
	db $03,$01,$00,$00,$00,$00,$00,$00,$0E,$80,$37
	db $00,$01,$33,$7B,$C8,$00,$56,$7B,$C8,$00,$60
	db $7B,$C8,$00,$00,$00,$00,$00,$00,$00,$11,$C0
	db $F4,$02,$01,$0B,$B1,$C9,$00,$00,$00,$51,$83
	db $67,$01,$01,$B2,$B0,$C9,$00,$C5,$80,$D3,$04
	db $19,$03,$01,$00,$00,$00,$00,$00,$00,$3A,$81
	db $43,$03,$01,$00,$00,$00,$00,$00,$00,$AA,$82
	db $03,$02,$01,$00,$00,$00,$00,$00,$00,$AA,$C2
	db $0C,$02,$01,$00,$00,$00,$00,$00,$00,$3A,$C1
	db $64,$03,$01,$00,$00,$00,$00,$00,$00,$3A,$81
	db $53,$03,$01,$00,$00,$00,$00,$00,$00,$CA,$C2
	db $10,$02,$01,$00,$00,$00,$00,$00,$00,$AA,$82
	db $C3,$01,$01,$00,$00,$00,$00,$00,$00,$83,$01
	db $EA,$00,$01,$00,$00,$00,$00,$00,$00,$EA,$C2
	db $CC,$01,$01,$00,$00,$00,$00,$00,$00,$CA,$82
	db $C3,$01,$01,$00,$00,$00,$00,$00,$00,$86,$C2
	db $10,$02,$01,$00,$00,$00,$00,$00,$00,$8A,$82
	db $03,$02,$01,$00,$00,$00,$00,$00,$00,$CA,$C2
	db $D8,$01,$01,$00,$00,$00,$00,$00,$00,$4E,$C3
	db $70,$01,$01,$00,$00,$00,$00,$00,$00,$4E,$C3
	db $94,$01,$01,$00,$00,$00,$00,$00,$00,$52,$83
	db $AF,$01,$01,$00,$00,$00,$00,$00,$00,$42,$83
	db $9F,$01,$01,$00,$00,$00,$00,$00,$00,$42,$83
	db $BF,$01,$01,$00,$00,$00,$00,$00,$00,$46,$C3
	db $AC,$01,$01,$00,$00,$00,$00,$00,$00,$3E,$C3
	db $80,$01,$01,$00,$00,$00,$00,$00,$00,$3E,$83
	db $8F,$01,$01,$00,$00,$00,$00,$00,$00,$3A,$83
	db $A7,$01,$01,$00,$00,$00,$00,$00,$00,$32,$C3
	db $8C,$01,$01,$00,$00,$00,$00,$00,$00,$32,$C3
	db $A0,$01,$01,$00,$00,$00,$00,$00,$00,$2E,$83
	db $B3,$01,$01,$00,$00,$00,$00,$00,$00,$1B,$03
	db $A1,$01,$01,$00,$00,$00,$00,$00,$00,$49,$01
	db $F7,$00,$01,$3A,$AF,$C9,$00,$00,$00,$FE,$40
	db $11,$02,$01,$00,$00,$00,$00,$00,$00,$B8,$03
	db $6C,$00,$0E,$00,$00,$00,$00,$00,$00,$EC,$02
	db $54,$00,$0E,$00,$00,$00,$00,$00,$00,$1C,$03
	db $34,$00,$0E,$00,$00,$00,$00,$00,$00,$98,$03
	db $70,$00,$0E,$00,$00,$00,$00,$00,$00,$F4,$02
	db $18,$00,$01,$00,$00,$00,$00,$00,$00,$FA,$C3
	db $F5,$03,$04,$1D,$B2,$C9,$00,$00,$00,$EA,$C3
	db $B9,$03,$04,$1D,$B2,$C9,$00,$00,$00,$DA,$C3
	db $F9,$03,$04,$1D,$B2,$C9,$00,$00,$00,$CA,$C3
	db $B9,$03,$04,$21,$B2,$C9,$00,$00,$00,$4C,$82
	db $FD,$02,$0A,$21,$B2,$C9,$00,$00,$00,$48,$82
	db $ED,$02,$0A,$1E,$B1,$C9,$00,$00,$00,$50,$82
	db $81,$02,$0A,$21,$B2,$C9,$00,$00,$00,$0C,$02
	db $91,$02,$0A,$BE,$69,$C8,$00,$CB,$69,$C8,$00
	db $5B,$7C,$C7,$00,$84,$7C,$C7,$00,$B8,$7C,$C7
	db $00,$D0,$7C,$C7,$00,$00,$00,$00,$00,$00,$00
	db $69,$82,$27,$03,$04,$00,$00,$00,$00,$00,$00
	db $DD,$C2,$3C,$03,$04,$00,$00,$00,$00,$00,$00
	db $6D,$C2,$B8,$03,$04,$00,$00,$00,$00,$00,$00
	db $11,$C2,$1C,$03,$04,$00,$00,$00,$00,$00,$00
	db $DD,$C2,$F8,$03,$07,$00,$00,$00,$00,$00,$00
	db $E7,$01,$EA,$03,$0A,$00,$00,$00,$00,$00,$00
	db $6C,$02,$9D,$03,$07,$00,$00,$00,$00,$00,$00
	db $DE,$C1,$96,$03,$0A,$00,$00,$00,$00,$00,$00
	db $D9,$82,$27,$03,$07,$00,$00,$00,$00,$00,$00
	db $2D,$C3,$34,$03,$07,$1E,$B1,$C9,$00,$00,$00
	db $DC,$01,$DC,$03,$0A,$00,$00,$00,$00,$00,$00
	db $07,$02,$DA,$03,$0A,$35,$7B,$C9,$00,$95,$69
	db $C8,$00,$9E,$C5,$C7,$00,$01

;--------------------------------------------------------------------

;$CF2650

;--------------------------------------------------------------------

; Note: Something music related

org $CF58EF
DATA_CF58EF:
	dw $000000,DATA_CF5A39,DATA_CF5A3D,$CF5A6D,$CF5A89,$CF5A95,$CF5A9D,$CF5AB5
	dw $CF5ADD,$CF5AF1,$CF5AF9,$CF5B0D,$CF5B35,$CF5B51,$CF5B61,$CF5B71
	dw $CF5B81,$CF5B8D,$CF5B95,$CF5B9D,$CF5BA5,$CF5BB1,$CF5BB5,$CF5BB9
	dw $CF5BC5,$CF5BD1,$CF5BD5,$CF5BFD,$CF5C15,$CF5C21,$CF5C39,$CF5C49
	dw $CF5C5D,$CF5C71,$CF5C81,$CF5C91,$CF5CA5,$CF5CB9,$CF5CC9,$CF5CD9
	dw $CF5CE1,$CF5CE9,$CF5CF1,$CF5CF9,$CF5D01,$CF5D09,$CF5D11,$CF5D19
	dw $CF5D21,$CF5D35,$CF5D3D,$CF5D4D,$CF5D55,$CF5D5D,$CF5D65,$CF5D75
	dw $CF5D7D,$CF5D85,$CF5D8D,$CF5D99,$CF5D9D,$CF5DAD,$CF5DB5,$CF5DB9
	dw DATA_CF5DC1,$CF5DE9,$CF5DF5,$CF5DFD,$CF5E05,$CF5E15,$CF5E21,$CF5E2D
	dw $CF5E35,$CF5E3D,$CF5E45,$CF5E4D,$CF5E55,$CF5E5D,$CF5E65,$CF5E6D
	dw $CF5E75,$CF5E7D,$CF5E85,$CF5E8D,$CF5E95,$CF5E9D,$CF5EA5,$CF5EAD
	dw $CF5EB5,$CF5EBD,$CF5EC5,$CF5ECD,$CF5ED5,$CF5EDD,$CF5EED,$CF5EF9
	dw $CF5F01,$CF5F09,$CF5F11,$CF5F19,$CF5F21,$CF5F2D,$CF5F39,$CF5F45
	dw $CF5F51,$CF5F5D,$CF5F69,$CF5F75,$CF5F81,$CF5F89,$CF5F91,$CF5F99
	dw $CF5FA5,$CF5FB1,$CF5FBD,$CF5FCD,$CF5FD9,$CF5FE5,$CF5FF1,$CF5FFD
	dw $CF6009,$CF6015,$CF6021,$CF602D,$CF6035,$CF6041,$CF6055,$CF605D
	dw $CF6065,$CF6075,$CF6081,$CF6091,$CF60A1,$CF60A9,$CF60B9,$CF60C9
	dw $CF60D9,$CF60E5,$CF60ED,$CF60F5,$CF6105,$CF610D,$CF6119,$CF6121
	dw $CF6129,$CF6131,$CF613D,$CF6145,$CF614D,$CF6155,$CF615D,$CF6165
	dw $CF6171,$CF6179,$CF6181,$CF618D,$CF6195,$CF619D,$CF61A5,$CF61AD
	dw $CF61B5,$CF61BD,$CF61C1,$CF61C9,$CF61CD

DATA_CF5A39:
	db $00,$00,$04,$00

DATA_CF5A3D:					; Note: Something related to the peaceful night Onett music
	db $49,$80,$5D,$00,$74,$81,$BB,$00
	db $04,$80,$1F,$00,$03,$80,$1E,$00
	db $0C,$82,$1E,$00,$78,$82,$29,$00
	db $6B,$80,$04,$00,$68,$80,$2E,$00
	db $12,$80,$72,$00,$77,$81,$1D,$00
	db $01,$82,$97,$00,$00,$00,$79,$00

org $CF5DC1
DATA_CF5DC1:
	db $14,$82,$93,$00,$15,$82,$9C,$00

;--------------------------------------------------------------------

; Note: Map Sprite pointers.

org $CF61E7
DATA_CF61E7:
	dw DATA_CF6BE7,DATA_CF6BED,DATA_CF6BFF,$000000,$000000,$000000,DATA_CF6C09,DATA_CF6C1B
	dw DATA_CF6C31,$000000,$000000,$000000,$000000,DATA_CF6C57,$000000,$000000
	dw DATA_CF6C5D,DATA_CF6C6F,$000000,$000000,DATA_CF6C75,$000000,DATA_CF6C7F,DATA_CF6C85
	dw $000000,DATA_CF6C8F,$000000,DATA_CF6C95,$000000,DATA_CF6CA7,DATA_CF6CC1,DATA_CF6CD7
	dw DATA_CF6CDD,DATA_CF6CEF,DATA_CF6CF9,$000000,$000000,DATA_CF6D0F,$000000,DATA_CF6D19
	dw DATA_CF6D1F,DATA_CF6D25,DATA_CF6D2F,$000000,DATA_CF6D3D,DATA_CF6D43,$000000,$000000
	dw DATA_CF6D49,DATA_CF6D4F,DATA_CF6D59,DATA_CF6D67,$000000,DATA_CF6D71,$000000,DATA_CF6D77
	dw $000000,$000000,$000000,DATA_CF6D89,$000000,DATA_CF6D9F,DATA_CF6DD1,DATA_CF6DEF
	dw DATA_CF6DF9,$000000,$000000,$000000,$000000,DATA_CF6DFF,$000000,$000000
	dw DATA_CF6E11,DATA_CF6E1F,DATA_CF6E25,$000000,$000000,$000000,$000000,DATA_CF6E3B
	dw DATA_CF6E41,$000000,DATA_CF6E5B,$000000,$000000,$000000,$000000,$000000
	dw $000000,$000000,$000000,DATA_CF6E61,DATA_CF6E73,DATA_CF6E81,DATA_CF6E97,$000000
	dw DATA_CF6EA9,DATA_CF6EAF,$000000,$000000,$000000,$000000,DATA_CF6EB5,DATA_CF6EBB
	dw DATA_CF6EC1,$000000,$000000,$000000,$000000,$000000,DATA_CF6EC7,$000000
	dw $000000,$000000,$000000,DATA_CF6ECD,$000000,$000000,$000000,$000000
	dw $000000,DATA_CF6ED3,$000000,DATA_CF6ED9,DATA_CF6EF3,DATA_CF6F0D,DATA_CF6F13,DATA_CF6F1D
	dw DATA_CF6F37,DATA_CF6F3D,DATA_CF6F43,$000000,$000000,DATA_CF6F49,DATA_CF6F4F,DATA_CF6F55
	dw DATA_CF6F63,$000000,$000000,$000000,$000000,$000000,DATA_CF6F6D,DATA_CF6F73
	dw $000000,$000000,$000000,DATA_CF6F79,DATA_CF6F7F,$000000,DATA_CF6F85,$000000
	dw $000000,$000000,$000000,DATA_CF6F8B,DATA_CF6FA1,DATA_CF6FAF,DATA_CF6FB9,DATA_CF6FCB
	dw DATA_CF6FE1,$000000,DATA_CF6FE7,$000000,DATA_CF6FED,DATA_CF6FF3,DATA_CF6FF9,DATA_CF7003
	dw DATA_CF7011,DATA_CF701B,$000000,$000000,$000000,$000000,$000000,$000000
	dw $000000,$000000,DATA_CF7029,$000000,$000000,$000000,DATA_CF702F,$000000
	dw $000000,$000000,$000000,DATA_CF7041,DATA_CF704B,DATA_CF7061,DATA_CF7077,DATA_CF7099
	dw $000000,DATA_CF70B3,DATA_CF70B9,$000000,DATA_CF70BF,DATA_CF70C5,DATA_CF70D3,DATA_CF70E5
	dw $000000,$000000,$000000,$000000,$000000,$000000,$000000,DATA_CF70EB
	dw $000000,$000000,$000000,$000000,$000000,$000000,$000000,$000000
	dw $000000,DATA_CF70F1,$000000,DATA_CF70F7,DATA_CF7111,DATA_CF712B,DATA_CF7135,DATA_CF713B
	dw $000000,DATA_CF7141,$000000,$000000,$000000,$000000,DATA_CF7147,DATA_CF7165
	dw $000000,$000000,$000000,$000000,DATA_CF716F,$000000,$000000,$000000
	dw $000000,$000000,DATA_CF7175,DATA_CF717B,$000000,$000000,DATA_CF7189,$000000
	dw $000000,$000000,$000000,DATA_CF718F,DATA_CF7195,DATA_CF71AB,DATA_CF71B5,DATA_CF71DB
	dw $000000,DATA_CF71E9,DATA_CF71EF,$000000,DATA_CF71F5,$000000,$000000,$000000
	dw $000000,$000000,$000000,$000000,DATA_CF71FB,DATA_CF7201,$000000,$000000
	dw $000000,DATA_CF7207,DATA_CF720D,$000000,DATA_CF7213,$000000,$000000,DATA_CF7219
	dw DATA_CF721F,$000000,$000000,DATA_CF7225,$000000,DATA_CF722B,DATA_CF7245,DATA_CF7267
	dw $000000,DATA_CF7271,DATA_CF727B,$000000,$000000,$000000,$000000,$000000
	dw $000000,DATA_CF7281,$000000,DATA_CF728F,DATA_CF7295,DATA_CF729B,DATA_CF72A1,DATA_CF72A7
	dw DATA_CF72AD,$000000,$000000,$000000,$000000,DATA_CF72B3,DATA_CF72B9,$000000
	dw $000000,$000000,$000000,$000000,DATA_CF72BF,DATA_CF72C5,DATA_CF72E3,DATA_CF7305
	dw $000000,$000000,$000000,$000000,DATA_CF731F,$000000,DATA_CF7325,$000000
	dw DATA_CF732B,DATA_CF7331,$000000,$000000,$000000,$000000,$000000,DATA_CF736F
	dw $000000,DATA_CF7375,DATA_CF737F,DATA_CF7385,DATA_CF738B,DATA_CF739D,$000000,DATA_CF73B3
	dw DATA_CF73B9,$000000,$000000,DATA_CF73C3,$000000,$000000,$000000,$000000
	dw $000000,$000000,$000000,$000000,$000000,$000000,$000000,$000000
	dw DATA_CF73C9,DATA_CF73CF,DATA_CF73D9,DATA_CF73DF,DATA_CF73E5,DATA_CF73EB,DATA_CF73F5,$000000
	dw $000000,DATA_CF73FB,$000000,DATA_CF7401,DATA_CF7407,DATA_CF7411,DATA_CF7417,DATA_CF7421
	dw DATA_CF742F,$000000,DATA_CF7435,DATA_CF743F,DATA_CF7445,DATA_CF7453,DATA_CF7459,DATA_CF746B
	dw $000000,$000000,$000000,$000000,$000000,$000000,$000000,DATA_CF7481
	dw DATA_CF7487,$000000,$000000,$000000,$000000,DATA_CF7495,$000000,$000000
	dw DATA_CF749B,$000000,DATA_CF74A5,$000000,DATA_CF74AB,$000000,$000000,$000000
	dw $000000,$000000,DATA_CF74B5,$000000,$000000,$000000,$000000,DATA_CF74BB
	dw $000000,DATA_CF74CD,DATA_CF74DB,$000000,$000000,DATA_CF7505,DATA_CF750B,DATA_CF7519
	dw $000000,$000000,DATA_CF751F,$000000,$000000,DATA_CF7525,$000000,$000000
	dw $000000,DATA_CF752F,DATA_CF7541,$000000,$000000,DATA_CF754F,DATA_CF7559,DATA_CF755F
	dw DATA_CF7565,DATA_CF7573,DATA_CF7579,$000000,DATA_CF7587,$000000,$000000,$000000
	dw $000000,DATA_CF758D,$000000,DATA_CF759F,DATA_CF75B1,DATA_CF75C3,DATA_CF75CD,$000000
	dw $000000,$000000,$000000,DATA_CF75DF,$000000,DATA_CF75E5,$000000,DATA_CF75F7
	dw $000000,DATA_CF75FD,$000000,$000000,$000000,DATA_CF7607,$000000,DATA_CF760D
	dw $000000,$000000,DATA_CF7613,$000000,DATA_CF7619,$000000,DATA_CF7623,DATA_CF7629
	dw $000000,DATA_CF762F,$000000,$000000,$000000,DATA_CF763D,DATA_CF7643,DATA_CF764D
	dw $000000,DATA_CF7657,DATA_CF765D,DATA_CF7683,DATA_CF7691,DATA_CF769B,DATA_CF76A5,$000000
	dw DATA_CF76AF,DATA_CF76B9,$000000,$000000,DATA_CF76C3,DATA_CF76C9,$000000,DATA_CF76CF
	dw $000000,DATA_CF76D9,$000000,$000000,DATA_CF76DF,DATA_CF76F1,DATA_CF76FF,DATA_CF7705
	dw $000000,DATA_CF7713,$000000,$000000,$000000,DATA_CF7719,DATA_CF772B,$000000
	dw $000000,$000000,$000000,DATA_CF7759,DATA_CF7767,DATA_CF776D,DATA_CF777F,DATA_CF778D
	dw DATA_CF7793,DATA_CF779D,$000000,DATA_CF77A3,DATA_CF77AD,DATA_CF77C7,$000000,$000000
	dw DATA_CF77D1,DATA_CF77DF,DATA_CF77E5,$000000,DATA_CF77EB,DATA_CF77F1,$000000,DATA_CF77FB
	dw $000000,DATA_CF7805,$000000,$000000,$000000,$000000,$000000,$000000
	dw $000000,$000000,DATA_CF780F,$000000,DATA_CF7815,$000000,DATA_CF782B,$000000
	dw DATA_CF7831,$000000,DATA_CF783F,DATA_CF7845,DATA_CF7857,DATA_CF785D,DATA_CF786B,DATA_CF7871
	dw DATA_CF787B,$000000,DATA_CF788D,$000000,$000000,DATA_CF7893,DATA_CF78A1,DATA_CF78AB
	dw $000000,$000000,DATA_CF78B1,DATA_CF78B7,$000000,DATA_CF78C1,DATA_CF78C7,DATA_CF78CD
	dw $000000,$000000,DATA_CF78D3,DATA_CF78DD,$000000,DATA_CF78E3,$000000,$000000
	dw DATA_CF78E9,DATA_CF78EF,$000000,DATA_CF78F5,DATA_CF78FB,$000000,DATA_CF7911,DATA_CF7917
	dw $000000,$000000,$000000,$000000,$000000,DATA_CF7925,DATA_CF7937,DATA_CF7945
	dw $000000,$000000,$000000,$000000,$000000,DATA_CF794B,DATA_CF7951,DATA_CF7957
	dw $000000,DATA_CF795D,DATA_CF7967,$000000,$000000,$000000,$000000,DATA_CF796D
	dw DATA_CF7973,DATA_CF7985,DATA_CF7993,$000000,DATA_CF799D,$000000,$000000,DATA_CF79A3
	dw DATA_CF79AD,DATA_CF79B3,$000000,DATA_CF79C9,DATA_CF79CF,DATA_CF79DD,$000000,$000000
	dw $000000,$000000,DATA_CF79E3,DATA_CF79E9,$000000,$000000,DATA_CF79FB,$000000
	dw $000000,$000000,$000000,$000000,DATA_CF7A05,$000000,$000000,DATA_CF7A17
	dw DATA_CF7A21,DATA_CF7A2B,DATA_CF7A35,$000000,DATA_CF7A47,DATA_CF7A4D,$000000,DATA_CF7A53
	dw DATA_CF7A5D,DATA_CF7A67,$000000,$000000,DATA_CF7A79,$000000,DATA_CF7A83,DATA_CF7A89
	dw $000000,$000000,$000000,$000000,DATA_CF7A93,$000000,DATA_CF7A99,$000000
	dw DATA_CF7A9F,$000000,DATA_CF7AA5,$000000,DATA_CF7AAB,$000000,DATA_CF7AB1,DATA_CF7AB7
	dw DATA_CF7AC1,DATA_CF7ACB,DATA_CF7AD5,DATA_CF7ADF,DATA_CF7AED,DATA_CF7AF7,DATA_CF7B15,DATA_CF7B1B
	dw DATA_CF7B25,$000000,$000000,$000000,DATA_CF7B37,DATA_CF7B41,$000000,$000000
	dw $000000,$000000,$000000,$000000,$000000,DATA_CF7B47,DATA_CF7B4D,$000000
	dw DATA_CF7B53,$000000,$000000,$000000,DATA_CF7B59,$000000,DATA_CF7B7B,DATA_CF7B81
	dw DATA_CF7B93,DATA_CF7BA1,$000000,$000000,DATA_CF7BAB,DATA_CF7BB1,DATA_CF7BB7,DATA_CF7BBD
	dw DATA_CF7BC7,DATA_CF7BDD,DATA_CF7BF7,$000000,DATA_CF7C15,DATA_CF7C1B,$000000,DATA_CF7C21
	dw DATA_CF7C2F,DATA_CF7C41,$000000,$000000,DATA_CF7C47,$000000,$000000,$000000
	dw $000000,$000000,$000000,$000000,$000000,DATA_CF7C4D,$000000,DATA_CF7C53
	dw DATA_CF7C5D,$000000,DATA_CF7C6F,$000000,DATA_CF7C75,DATA_CF7C7B,DATA_CF7C95,DATA_CF7C9B
	dw DATA_CF7CC1,DATA_CF7CCF,DATA_CF7CD5,$000000,DATA_CF7CDF,$000000,DATA_CF7CF5,$000000
	dw $000000,$000000,$000000,$000000,$000000,$000000,DATA_CF7D3F,DATA_CF7D45
	dw $000000,$000000,$000000,$000000,DATA_CF7D4F,DATA_CF7D59,DATA_CF7D6B,DATA_CF7D71
	dw DATA_CF7D77,DATA_CF7D81,DATA_CF7D93,DATA_CF7D9D,$000000,DATA_CF7DA7,DATA_CF7DB1,DATA_CF7DBB
	dw DATA_CF7DC5,$000000,DATA_CF7DDF,$000000,$000000,$000000,DATA_CF7DF1,$000000
	dw $000000,$000000,$000000,$000000,DATA_CF7DF7,DATA_CF7DFD,DATA_CF7E0B,DATA_CF7E19
	dw DATA_CF7E23,DATA_CF7E41,$000000,$000000,$000000,DATA_CF7E4F,$000000,DATA_CF7E55
	dw DATA_CF7E67,DATA_CF7E75,DATA_CF7E7B,DATA_CF7E85,$000000,DATA_CF7E8B,$000000,DATA_CF7EAD
	dw DATA_CF7EB7,DATA_CF7EC1,DATA_CF7ECF,$000000,DATA_CF7ED5,DATA_CF7EDB,$000000,$000000
	dw $000000,$000000,$000000,$000000,$000000,DATA_CF7EE1,DATA_CF7EEB,DATA_CF7F01
	dw DATA_CF7F07,DATA_CF7F0D,$000000,$000000,DATA_CF7F13,$000000,DATA_CF7F19,$000000
	dw $000000,$000000,DATA_CF7F1F,DATA_CF7F29,DATA_CF7F3B,DATA_CF7F41,$000000,DATA_CF7F5B
	dw DATA_CF7F75,$000000,$000000,$000000,DATA_CF7F7F,DATA_CF7F85,$000000,DATA_CF7F97
	dw $000000,$000000,DATA_CF7F9D,$000000,DATA_CF7FA3,DATA_CF7FA9,DATA_CF7FC3,DATA_CF7FD1
	dw DATA_CF7FDB,DATA_CF7FF5,DATA_CF7FFB,$000000,$000000,$000000,DATA_CF800D,DATA_CF8013
	dw $000000,$000000,$000000,DATA_CF8019,$000000,$000000,DATA_CF801F,DATA_CF8029
	dw DATA_CF802F,$000000,$000000,DATA_CF8035,$000000,DATA_CF804F,DATA_CF805D,DATA_CF806B
	dw $000000,DATA_CF8071,DATA_CF807F,$000000,$000000,$000000,$000000,DATA_CF8091
	dw DATA_CF80A7,DATA_CF80AD,$000000,$000000,$000000,$000000,$000000,$000000
	dw $000000,$000000,$000000,$000000,$000000,DATA_CF80B7,DATA_CF80C1,DATA_CF80CF
	dw DATA_CF80D5,DATA_CF80DB,DATA_CF80E5,$000000,$000000,DATA_CF80F3,DATA_CF8111,DATA_CF811F
	dw DATA_CF8125,DATA_CF812B,DATA_CF8165,$000000,$000000,$000000,$000000,$000000
	dw DATA_CF816F,$000000,$000000,$000000,$000000,$000000,DATA_CF8175,$000000
	dw DATA_CF817B,$000000,DATA_CF8185,DATA_CF818B,$000000,DATA_CF8191,$000000,DATA_CF819B
	dw $000000,DATA_CF81A1,DATA_CF81A7,DATA_CF81AD,DATA_CF81CB,DATA_CF81D1,DATA_CF81E7,DATA_CF81ED
	dw DATA_CF8207,DATA_CF820D,$000000,$000000,$000000,$000000,$000000,$000000
	dw $000000,$000000,$000000,$000000,$000000,$000000,DATA_CF8213,DATA_CF8225
	dw DATA_CF823F,$000000,$000000,DATA_CF8249,DATA_CF824F,DATA_CF825D,$000000,DATA_CF8267
	dw $000000,DATA_CF826D,DATA_CF8277,DATA_CF8281,DATA_CF828F,DATA_CF8295,DATA_CF829F,DATA_CF82C1
	dw $000000,$000000,$000000,$000000,$000000,$000000,$000000,$000000
	dw $000000,$000000,$000000,$000000,$000000,$000000,DATA_CF82D3,DATA_CF82E5
	dw DATA_CF82EB,DATA_CF82F5,$000000,$000000,$000000,$000000,$000000,DATA_CF82FB
	dw $000000,DATA_CF8301,DATA_CF830F,DATA_CF8321,DATA_CF8333,DATA_CF8339,DATA_CF834F,DATA_CF8369
	dw $000000,$000000,$000000,DATA_CF837F,$000000,$000000,DATA_CF8385,$000000
	dw DATA_CF838F,$000000,$000000,$000000,DATA_CF8395,$000000,DATA_CF83A7,$000000
	dw DATA_CF83AD,$000000,$000000,DATA_CF83B3,DATA_CF83C5,$000000,DATA_CF83D7,$000000
	dw $000000,$000000,DATA_CF83DD,DATA_CF83FB,DATA_CF8401,$000000,$000000,DATA_CF840B
	dw $000000,$000000,$000000,$000000,DATA_CF8411,$000000,DATA_CF8417,$000000
	dw $000000,$000000,$000000,$000000,$000000,$000000,DATA_CF8421,$000000
	dw DATA_CF8427,$000000,$000000,DATA_CF842D,$000000,DATA_CF8437,DATA_CF843D,$000000
	dw DATA_CF8447,$000000,DATA_CF844D,DATA_CF8473,DATA_CF8491,DATA_CF84A3,DATA_CF84AD,DATA_CF84B7
	dw $000000,$000000,$000000,$000000,$000000,$000000,DATA_CF84BD,DATA_CF84C3
	dw DATA_CF84C9,$000000,$000000,DATA_CF84CF,DATA_CF84D5,$000000,DATA_CF84DB,$000000
	dw DATA_CF84E1,$000000,$000000,$000000,DATA_CF84E7,DATA_CF84ED,DATA_CF84FF,DATA_CF8505
	dw DATA_CF8513,$000000,DATA_CF8519,DATA_CF852F,DATA_CF853D,DATA_CF8543,DATA_CF8551,DATA_CF855F
	dw $000000,DATA_CF8569,DATA_CF856F,$000000,$000000,DATA_CF8575,$000000,$000000
	dw $000000,$000000,$000000,DATA_CF857B,$000000,$000000,$000000,$000000
	dw DATA_CF8581,$000000,$000000,$000000,DATA_CF8587,DATA_CF8599,DATA_CF85CB,DATA_CF85D9
	dw DATA_CF85E3,$000000,DATA_CF85ED,DATA_CF8603,DATA_CF8615,DATA_CF8623,DATA_CF8629,$000000
	dw $000000,$000000,DATA_CF8647,$000000,$000000,$000000,$000000,DATA_CF864D
	dw DATA_CF8657,DATA_CF865D,$000000,$000000,DATA_CF8667,$000000,$000000,DATA_CF866D
	dw $000000,$000000,$000000,DATA_CF8673,DATA_CF8679,DATA_CF868B,DATA_CF8691,DATA_CF869B
	dw DATA_CF86B1,$000000,DATA_CF86B7,DATA_CF86DD,DATA_CF86E3,DATA_CF86ED,DATA_CF870B,DATA_CF8715
	dw $000000,DATA_CF871F,$000000,DATA_CF8725,$000000,DATA_CF872B,DATA_CF8731,$000000
	dw $000000,$000000,$000000,DATA_CF8737,DATA_CF873D,DATA_CF8743,DATA_CF874D,$000000
	dw $000000,DATA_CF8777,$000000,DATA_CF8781,DATA_CF878B,DATA_CF8799,$000000,$000000
	dw $000000,$000000,DATA_CF87B3,DATA_CF87C1,DATA_CF87CF,DATA_CF87DD,DATA_CF87E7,DATA_CF87ED
	dw $000000,$000000,$000000,$000000,$000000,DATA_CF880B,DATA_CF8811,$000000
	dw $000000,$000000,DATA_CF8817,$000000,DATA_CF881D,$000000,$000000,$000000
	dw $000000,$000000,$000000,$000000,$000000,DATA_CF882F,DATA_CF8835,DATA_CF883B
	dw DATA_CF8841,$000000,DATA_CF8853,DATA_CF8861,DATA_CF8873,DATA_CF8881,DATA_CF8887,DATA_CF8895
	dw $000000,$000000,$000000,$000000,DATA_CF889F,DATA_CF88A5,DATA_CF88AB,DATA_CF88B1
	dw $000000,$000000,$000000,$000000,$000000,$000000,$000000,$000000
	dw $000000,$000000,DATA_CF88D3,DATA_CF88D9,DATA_CF88EF,$000000,$000000,$000000
	dw DATA_CF88F5,DATA_CF88FB,DATA_CF8901,DATA_CF891F,$000000,DATA_CF8925,$000000,DATA_CF892F

DATA_CF6BE7:
DATA_CF6BED:
DATA_CF6BFF:
DATA_CF6C09:
DATA_CF6C1B:
DATA_CF6C31:
DATA_CF6C57:
DATA_CF6C5D:
DATA_CF6C6F:
DATA_CF6C75:
DATA_CF6C7F:
DATA_CF6C85:
DATA_CF6C8F:
DATA_CF6C95:
DATA_CF6CA7:
DATA_CF6CC1:
DATA_CF6CD7:
DATA_CF6CDD:
DATA_CF6CEF:
DATA_CF6CF9:
DATA_CF6D0F:
DATA_CF6D19:
DATA_CF6D1F:

org $CF6D25
DATA_CF6D25:
	db $02,$00,$B6,$00,$70,$30,$95,$00
	db $A0,$A8

DATA_CF6D2F:
	db $03,$00,$94,$00,$58,$60,$B7,$00
	db $70,$68,$98,$00,$F0,$98

DATA_CF6D3D:
DATA_CF6D43:
DATA_CF6D49:
DATA_CF6D4F:
DATA_CF6D59:
DATA_CF6D67:
DATA_CF6D71:
DATA_CF6D77:
DATA_CF6D89:
DATA_CF6D9F:
DATA_CF6DD1:
DATA_CF6DEF:
DATA_CF6DF9:
DATA_CF6DFF:
DATA_CF6E11:

org $CF6E1F
DATA_CF6E1F:
	db $01,$00,$99,$00,$90,$C0

DATA_CF6E25:
	db $05,$00,$97,$00,$10,$F0,$96,$00
	db $20,$C0,$BE,$00,$28,$F0,$BD,$00
	db $30,$B8,$C7,$00,$38,$D8

DATA_CF6E3B:
DATA_CF6E41:
DATA_CF6E5B:
DATA_CF6E61:
DATA_CF6E73:
DATA_CF6E81:
DATA_CF6E97:
DATA_CF6EA9:
DATA_CF6EAF:
DATA_CF6EB5:
DATA_CF6EBB:

org $CF6EC1
DATA_CF6EC1:
	db $01,$00,$81,$00,$C0,$68

DATA_CF6EC7:
	db $01,$00,$19,$06,$B8,$00

DATA_CF6ECD:
DATA_CF6ED3:
DATA_CF6ED9:
DATA_CF6EF3:
DATA_CF6F0D:
DATA_CF6F13:

org $CF6F1D
DATA_CF6F1D:
	db $06,$00,$6D,$00,$40,$A0,$6C,$00
	db $48,$50,$06,$00,$B8,$78,$04,$00
	db $E0,$98,$05,$00,$F0,$48,$07,$00
	db $F0,$A8

DATA_CF6F37:
DATA_CF6F3D:
DATA_CF6F43:
DATA_CF6F49:
DATA_CF6F4F:

org $CF6F55
DATA_CF6F55:
	db $03,$00,$80,$05,$68,$20,$AF,$00
	db $88,$D0,$83,$00,$90,$50

DATA_CF6F63:
	db $02,$00,$86,$00,$68,$C0,$AD,$00
	db $A0,$50

DATA_CF6F6D:
DATA_CF6F73:
DATA_CF6F79:
DATA_CF6F7F:
DATA_CF6F85:
DATA_CF6F8B:
DATA_CF6FA1:
DATA_CF6FAF:
DATA_CF6FB9:

org $CF6FCB
DATA_CF6FCB:
	db $05,$00,$1C,$00,$30,$90,$1B,$00
	db $38,$D8,$1A,$00,$40,$C8,$1D,$00
	db $50,$F0,$27,$00,$C8,$70

DATA_CF6FE1:
DATA_CF6FE7:
DATA_CF6FED:
DATA_CF6FF3:

org $CF6FF9
DATA_CF6FF9:
	db $02,$00,$87,$00,$B0,$50,$A9,$00
	db $E0,$10

DATA_CF7003:
	db $03,$00,$8A,$00,$60,$1C,$BF,$00
	db $A0,$D8,$AA,$00,$E0,$B0

DATA_CF7011:
	db $02,$00,$82,$05,$80,$A0,$BA,$00
	db $D8,$18

DATA_CF701B:
	db $03,$00,$B8,$00,$A0,$F8,$AE,$00
	db $B0,$40,$88,$00,$B0,$A0

DATA_CF7029:
DATA_CF702F:
DATA_CF7041:
DATA_CF704B:
DATA_CF7061:
DATA_CF7077:
DATA_CF7099:
DATA_CF70B3:
DATA_CF70B9:
DATA_CF70BF:
DATA_CF70C5:

org $CF70D3
DATA_CF70D3:
	db $04,$00,$CA,$00,$48,$78,$92,$00
	db $50,$50,$A3,$00,$80,$90,$AC,$00
	db $D0,$C0

DATA_CF70E5:
	db $01,$00,$B0,$00,$E8,$18

DATA_CF70EB:
DATA_CF70F1:
DATA_CF70F7:
DATA_CF7111:
DATA_CF712B:
DATA_CF7135:
DATA_CF713B:
DATA_CF7141:
DATA_CF7147:

org $CF7165
DATA_CF7165:
	db $02,$00,$A6,$00,$40,$78,$A7,$00
	db $A0,$18

DATA_CF716F:
DATA_CF7175:
DATA_CF717B:
DATA_CF7189:
DATA_CF718F:
DATA_CF7195:
DATA_CF71AB:
DATA_CF71B5:
DATA_CF71DB:
DATA_CF71E9:
DATA_CF71EF:
DATA_CF71F5:
DATA_CF71FB:
DATA_CF7201:
DATA_CF7207:
DATA_CF720D:
DATA_CF7213:
DATA_CF7219:
DATA_CF721F:
DATA_CF7225:
DATA_CF722B:
DATA_CF7245:
DATA_CF7267:
DATA_CF7271:
DATA_CF727B:
DATA_CF7281:
DATA_CF728F:
DATA_CF7295:
DATA_CF729B:
DATA_CF72A1:
DATA_CF72A7:
DATA_CF72AD:
DATA_CF72B3:
DATA_CF72B9:
DATA_CF72BF:
DATA_CF72C5:
DATA_CF72E3:
DATA_CF7305:
DATA_CF731F:
DATA_CF7325:
DATA_CF732B:
DATA_CF7331:
DATA_CF736F:
DATA_CF7375:
DATA_CF737F:
DATA_CF7385:
DATA_CF738B:
DATA_CF739D:
DATA_CF73B3:
DATA_CF73B9:
DATA_CF73C3:
DATA_CF73C9:
DATA_CF73CF:
DATA_CF73D9:
DATA_CF73DF:
DATA_CF73E5:
DATA_CF73EB:
DATA_CF73F5:
DATA_CF73FB:
DATA_CF7401:
DATA_CF7407:
DATA_CF7411:
DATA_CF7417:
DATA_CF7421:
DATA_CF742F:
DATA_CF7435:
DATA_CF743F:
DATA_CF7445:
DATA_CF7453:
DATA_CF7459:
DATA_CF746B:
DATA_CF7481:
DATA_CF7487:
DATA_CF7495:
DATA_CF749B:
DATA_CF74A5:
DATA_CF74AB:
DATA_CF74B5:
DATA_CF74BB:
DATA_CF74CD:
DATA_CF74DB:
DATA_CF7505:
DATA_CF750B:
DATA_CF7519:
DATA_CF751F:
DATA_CF7525:
DATA_CF752F:
DATA_CF7541:
DATA_CF754F:
DATA_CF7559:
DATA_CF755F:
DATA_CF7565:
DATA_CF7573:
DATA_CF7579:
DATA_CF7587:
DATA_CF758D:
DATA_CF759F:
DATA_CF75B1:
DATA_CF75C3:
DATA_CF75CD:
DATA_CF75DF:
DATA_CF75E5:
DATA_CF75F7:
DATA_CF75FD:
DATA_CF7607:
DATA_CF760D:
DATA_CF7613:
DATA_CF7619:
DATA_CF7623:
DATA_CF7629:
DATA_CF762F:
DATA_CF763D:
DATA_CF7643:
DATA_CF764D:
DATA_CF7657:
DATA_CF765D:
DATA_CF7683:
DATA_CF7691:
DATA_CF769B:
DATA_CF76A5:
DATA_CF76AF:
DATA_CF76B9:
DATA_CF76C3:
DATA_CF76C9:
DATA_CF76CF:
DATA_CF76D9:
DATA_CF76DF:
DATA_CF76F1:
DATA_CF76FF:
DATA_CF7705:
DATA_CF7713:
DATA_CF7719:
DATA_CF772B:
DATA_CF7759:
DATA_CF7767:
DATA_CF776D:
DATA_CF777F:
DATA_CF778D:
DATA_CF7793:
DATA_CF779D:
DATA_CF77A3:
DATA_CF77AD:
DATA_CF77C7:
DATA_CF77D1:
DATA_CF77DF:
DATA_CF77E5:
DATA_CF77EB:
DATA_CF77F1:
DATA_CF77FB:
DATA_CF7805:
DATA_CF780F:
DATA_CF7815:
DATA_CF782B:
DATA_CF7831:
DATA_CF783F:
DATA_CF7845:
DATA_CF7857:
DATA_CF785D:
DATA_CF786B:
DATA_CF7871:
DATA_CF787B:
DATA_CF788D:
DATA_CF7893:
DATA_CF78A1:
DATA_CF78AB:
DATA_CF78B1:
DATA_CF78B7:
DATA_CF78C1:
DATA_CF78C7:
DATA_CF78CD:
DATA_CF78D3:
DATA_CF78DD:
DATA_CF78E3:
DATA_CF78E9:
DATA_CF78EF:
DATA_CF78F5:
DATA_CF78FB:
DATA_CF7911:
DATA_CF7917:
DATA_CF7925:
DATA_CF7937:
DATA_CF7945:
DATA_CF794B:
DATA_CF7951:
DATA_CF7957:
DATA_CF795D:
DATA_CF7967:
DATA_CF796D:
DATA_CF7973:
DATA_CF7985:
DATA_CF7993:
DATA_CF799D:
DATA_CF79A3:
DATA_CF79AD:
DATA_CF79B3:
DATA_CF79C9:
DATA_CF79CF:
DATA_CF79DD:
DATA_CF79E3:
DATA_CF79E9:
DATA_CF79FB:
DATA_CF7A05:
DATA_CF7A17:
DATA_CF7A21:
DATA_CF7A2B:
DATA_CF7A35:
DATA_CF7A47:
DATA_CF7A4D:
DATA_CF7A53:
DATA_CF7A5D:
DATA_CF7A67:
DATA_CF7A79:
DATA_CF7A83:
DATA_CF7A89:
DATA_CF7A93:
DATA_CF7A99:
DATA_CF7A9F:
DATA_CF7AA5:
DATA_CF7AAB:
DATA_CF7AB1:
DATA_CF7AB7:
DATA_CF7AC1:
DATA_CF7ACB:
DATA_CF7AD5:
DATA_CF7ADF:
DATA_CF7AED:
DATA_CF7AF7:
DATA_CF7B15:
DATA_CF7B1B:
DATA_CF7B25:
DATA_CF7B37:
DATA_CF7B41:
DATA_CF7B47:
DATA_CF7B4D:
DATA_CF7B53:
DATA_CF7B59:
DATA_CF7B7B:
DATA_CF7B81:
DATA_CF7B93:
DATA_CF7BA1:
DATA_CF7BAB:
DATA_CF7BB1:
DATA_CF7BB7:
DATA_CF7BBD:
DATA_CF7BC7:
DATA_CF7BDD:
DATA_CF7BF7:
DATA_CF7C15:
DATA_CF7C1B:
DATA_CF7C21:
DATA_CF7C2F:
DATA_CF7C41:
DATA_CF7C47:
DATA_CF7C4D:
DATA_CF7C53:
DATA_CF7C5D:
DATA_CF7C6F:
DATA_CF7C75:
DATA_CF7C7B:
DATA_CF7C95:
DATA_CF7C9B:
DATA_CF7CC1:
DATA_CF7CCF:
DATA_CF7CD5:
DATA_CF7CDF:
DATA_CF7CF5:
DATA_CF7D3F:
DATA_CF7D45:
DATA_CF7D4F:
DATA_CF7D59:
DATA_CF7D6B:
DATA_CF7D71:
DATA_CF7D77:
DATA_CF7D81:
DATA_CF7D93:
DATA_CF7D9D:
DATA_CF7DA7:
DATA_CF7DB1:
DATA_CF7DBB:
DATA_CF7DC5:
DATA_CF7DDF:
DATA_CF7DF1:
DATA_CF7DF7:
DATA_CF7DFD:
DATA_CF7E0B:
DATA_CF7E19:
DATA_CF7E23:
DATA_CF7E41:
DATA_CF7E4F:
DATA_CF7E55:
DATA_CF7E67:
DATA_CF7E75:
DATA_CF7E7B:
DATA_CF7E85:
DATA_CF7E8B:
DATA_CF7EAD:
DATA_CF7EB7:
DATA_CF7EC1:
DATA_CF7ECF:
DATA_CF7ED5:
DATA_CF7EDB:
DATA_CF7EE1:
DATA_CF7EEB:
DATA_CF7F01:
DATA_CF7F07:
DATA_CF7F0D:
DATA_CF7F13:
DATA_CF7F19:
DATA_CF7F1F:
DATA_CF7F29:
DATA_CF7F3B:
DATA_CF7F41:
DATA_CF7F5B:
DATA_CF7F75:
DATA_CF7F7F:
DATA_CF7F85:
DATA_CF7F97:
DATA_CF7F9D:
DATA_CF7FA3:
DATA_CF7FA9:
DATA_CF7FC3:
DATA_CF7FD1:
DATA_CF7FDB:
DATA_CF7FF5:
DATA_CF7FFB:
DATA_CF800D:
DATA_CF8013:
DATA_CF8019:
DATA_CF801F:
DATA_CF8029:
DATA_CF802F:
DATA_CF8035:
DATA_CF804F:
DATA_CF805D:
DATA_CF806B:
DATA_CF8071:
DATA_CF807F:
DATA_CF8091:
DATA_CF80A7:
DATA_CF80AD:
DATA_CF80B7:
DATA_CF80C1:
DATA_CF80CF:
DATA_CF80D5:
DATA_CF80DB:
DATA_CF80E5:
DATA_CF80F3:
DATA_CF8111:
DATA_CF811F:
DATA_CF8125:
DATA_CF812B:
DATA_CF8165:
DATA_CF816F:
DATA_CF8175:
DATA_CF817B:
DATA_CF8185:
DATA_CF818B:
DATA_CF8191:
DATA_CF819B:
DATA_CF81A1:
DATA_CF81A7:
DATA_CF81AD:
DATA_CF81CB:
DATA_CF81D1:
DATA_CF81E7:
DATA_CF81ED:
DATA_CF8207:
DATA_CF820D:
DATA_CF8213:
DATA_CF8225:
DATA_CF823F:
DATA_CF8249:
DATA_CF824F:
DATA_CF825D:
DATA_CF8267:
DATA_CF826D:
DATA_CF8277:
DATA_CF8281:
DATA_CF828F:
DATA_CF8295:
DATA_CF829F:
DATA_CF82C1:
DATA_CF82D3:
DATA_CF82E5:
DATA_CF82EB:
DATA_CF82F5:
DATA_CF82FB:
DATA_CF8301:
DATA_CF830F:
DATA_CF8321:
DATA_CF8333:
DATA_CF8339:
DATA_CF834F:
DATA_CF8369:
DATA_CF837F:
DATA_CF8385:
DATA_CF838F:
DATA_CF8395:
DATA_CF83A7:
DATA_CF83AD:
DATA_CF83B3:
DATA_CF83C5:
DATA_CF83D7:
DATA_CF83DD:
DATA_CF83FB:
DATA_CF8401:
DATA_CF840B:
DATA_CF8411:
DATA_CF8417:
DATA_CF8421:
DATA_CF8427:
DATA_CF842D:
DATA_CF8437:
DATA_CF843D:
DATA_CF8447:
DATA_CF844D:
DATA_CF8473:
DATA_CF8491:
DATA_CF84A3:
DATA_CF84AD:
DATA_CF84B7:
DATA_CF84BD:
DATA_CF84C3:
DATA_CF84C9:
DATA_CF84CF:
DATA_CF84D5:
DATA_CF84DB:
DATA_CF84E1:
DATA_CF84E7:
DATA_CF84ED:
DATA_CF84FF:
DATA_CF8505:
DATA_CF8513:
DATA_CF8519:
DATA_CF852F:
DATA_CF853D:
DATA_CF8543:
DATA_CF8551:
DATA_CF855F:
DATA_CF8569:
DATA_CF856F:
DATA_CF8575:
DATA_CF857B:
DATA_CF8581:
DATA_CF8587:
DATA_CF8599:
DATA_CF85CB:
DATA_CF85D9:
DATA_CF85E3:
DATA_CF85ED:
DATA_CF8603:
DATA_CF8615:
DATA_CF8623:
DATA_CF8629:
DATA_CF8647:
DATA_CF864D:
DATA_CF8657:
DATA_CF865D:
DATA_CF8667:
DATA_CF866D:
DATA_CF8673:
DATA_CF8679:
DATA_CF868B:
DATA_CF8691:
DATA_CF869B:
DATA_CF86B1:
DATA_CF86B7:
DATA_CF86DD:
DATA_CF86E3:
DATA_CF86ED:
DATA_CF870B:
DATA_CF8715:
DATA_CF871F:
DATA_CF8725:
DATA_CF872B:
DATA_CF8731:
DATA_CF8737:
DATA_CF873D:
DATA_CF8743:
DATA_CF874D:
DATA_CF8777:
DATA_CF8781:
DATA_CF878B:
DATA_CF8799:
DATA_CF87B3:
DATA_CF87C1:
DATA_CF87CF:
DATA_CF87DD:
DATA_CF87E7:
DATA_CF87ED:
DATA_CF880B:
DATA_CF8811:
DATA_CF8817:
DATA_CF881D:
DATA_CF882F:
DATA_CF8835:
DATA_CF883B:
DATA_CF8841:
DATA_CF8853:
DATA_CF8861:
DATA_CF8873:
DATA_CF8881:
DATA_CF8887:
DATA_CF8895:
DATA_CF889F:
DATA_CF88A5:
DATA_CF88AB:
DATA_CF88B1:
DATA_CF88D3:
DATA_CF88D9:
DATA_CF88EF:
DATA_CF88F5:
DATA_CF88FB:
DATA_CF8901:
DATA_CF891F:
DATA_CF8925:
DATA_CF892F:

;--------------------------------------------------------------------

org $CF8985
DATA_CF8985:
	db $01,$01,$00,$04,$0A,$00,$00,$00
	db $01,$00,$00,$00,$00

DATA_CF8992:				; Note: Something sprite related
	db $00,$00,$00,$00,$01
	db $1C,$01,$04,$5D,$02
	db $28,$00,$01,$07,$4C
	db $C7,$00,$00,$00,$00
	db $00,$01,$1C,$01,$02
	db $56,$02,$6D,$01,$01
	db $8A,$4C,$C7,$00,$00
	db $00,$00,$00,$01,$1C
	db $01,$00,$0C,$00,$00
	db $00,$00,$F7,$4C,$C7
	db $00,$00,$00,$00,$00
	db $01,$1C,$01,$02,$0C
	db $00,$00,$00,$00,$5E
	db $4D,$C7,$00,$00,$00
	db $00,$00,$01,$1C,$01
	db $00,$5E,$02,$00,$00
	db $00,$9F,$4D,$C7,$00
	db $00,$00,$00,$00,$01
	db $75,$00,$00,$5E,$02
	db $00,$00,$00,$14,$4E
	db $C7,$00,$00,$00,$00
	db $00,$01,$1C,$01,$00
	db $56,$02,$B9,$02,$01
	db $66,$A6,$C6,$00,$00
	db $00,$00,$00,$01,$34
	db $00,$04,$5E,$02,$00
	db $00,$00,$89,$4E,$C7
	db $00,$00,$00,$00,$00
	db $01,$40,$00,$04,$5E
	db $02,$00,$00,$00,$83
	db $4E,$C7,$00,$00,$00
	db $00,$00,$01,$72,$00
	db $00,$5E,$02,$00,$00
	db $00,$8F,$4E,$C7,$00
	db $00,$00,$00,$00,$01
	db $82,$00,$02,$5E,$02
	db $00,$00,$00,$28,$99
	db $C6,$00,$00,$00,$00
	db $00,$03,$03,$01,$04
	db $08,$00,$00,$00,$00
	db $A6,$80,$C6,$00,$C2
	db $80,$C6,$00,$01,$D8
	db $00,$04,$08,$00,$00
	db $00,$00,$3D,$80,$C6
	db $00,$00,$00,$00,$00
	db $01,$91,$00,$04,$25
	db $00,$D5,$01,$02,$56
	db $4F,$C7,$00,$00,$00
	db $00,$00,$01,$91,$00
	db $02,$0C,$00,$D5,$01
	db $01,$3E,$6D,$C6,$00
	db $00,$00,$00,$00,$01
	db $67,$01,$04,$73,$02
	db $13,$00,$01,$17,$57
	db $C7,$00,$00,$00,$00
	db $00,$01,$2C,$00,$06
	db $0A,$00,$2D,$01,$02
	db $33,$5C,$C7,$00,$00
	db $00,$00,$00,$01,$28
	db $00,$02,$12,$00,$30
	db $01,$02,$17,$57,$C7
	db $00,$00,$00,$00,$00
	db $01,$2C,$00,$04,$2D
	db $00,$36,$01,$02,$33
	db $5C,$C7,$00,$00,$00
	db $00,$00,$01,$92,$00
	db $02,$0C,$00,$13,$02
	db $02,$12,$61,$C7,$00
	db $00,$00,$00,$00,$01
	db $D7,$00,$04,$28,$00
	db $00,$00,$00,$09,$59
	db $C7,$00,$00,$00,$00
	db $00,$03,$5E,$01,$06
	db $26,$00,$27,$01,$02
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$03,$75
	db $01,$04,$08,$00,$A6
	db $01,$01,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$75,$01,$04,$08
	db $00,$A6,$01,$01,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$01,$92,$00
	db $06,$0C,$00,$D9,$01
	db $02,$97,$6B,$C6,$00
	db $00,$00,$00,$00,$03
	db $7A,$01,$04,$70,$02
	db $DD,$01,$02,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$80,$01,$04
	db $74,$02,$DD,$01,$02
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$03,$75
	db $01,$04,$08,$00,$A6
	db $01,$01,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$77,$01,$06,$08
	db $00,$A6,$01,$01,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$01,$92,$00
	db $04,$0C,$00,$12,$02
	db $01,$A4,$6A,$C6,$00
	db $00,$00,$00,$00,$03
	db $75,$01,$04,$08,$00
	db $A6,$01,$01,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$77,$01,$02
	db $08,$00,$A6,$01,$01
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$01,$8E
	db $00,$04,$5E,$02,$00
	db $00,$00,$A3,$63,$C7
	db $00,$00,$00,$00,$00
	db $01,$3A,$00,$04,$0C
	db $00,$00,$00,$00,$E9
	db $63,$C7,$00,$00,$00
	db $00,$00,$01,$7F,$00
	db $06,$0C,$00,$00,$00
	db $00,$0B,$64,$C7,$00
	db $00,$00,$00,$00,$01
	db $99,$00,$04,$5E,$02
	db $49,$00,$02,$3B,$65
	db $C6,$00,$00,$00,$00
	db $00,$01,$42,$00,$06
	db $5E,$02,$00,$00,$00
	db $1E,$97,$C6,$00,$00
	db $00,$00,$00,$01,$99
	db $00,$02,$08,$00,$74
	db $01,$02,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $01,$88,$00,$04,$5D
	db $02,$F0,$02,$01,$44
	db $01,$C7,$00,$00,$00
	db $00,$00,$01,$89,$00
	db $04,$0C,$00,$00,$00
	db $00,$43,$64,$C7,$00
	db $00,$00,$00,$00,$01
	db $3A,$00,$00,$5E,$02
	db $00,$00,$00,$49,$64
	db $C7,$00,$00,$00,$00
	db $00,$01,$44,$00,$06
	db $5E,$02,$00,$00,$00
	db $1B,$66,$C7,$00,$00
	db $00,$00,$00,$01,$43
	db $00,$02,$0C,$00,$00
	db $00,$00,$51,$96,$C6
	db $00,$00,$00,$00,$00
	db $01,$93,$00,$04,$5D
	db $02,$25,$00,$02,$3E
	db $EF,$C5,$00,$00,$00
	db $00,$00,$01,$94,$00
	db $00,$0D,$00,$E6,$02
	db $02,$63,$66,$C7,$00
	db $00,$00,$00,$00,$01
	db $5B,$01,$04,$0A,$00
	db $2F,$01,$02,$FB,$F1
	db $C5,$00,$00,$00,$00
	db $00,$01,$2D,$00,$04
	db $0C,$00,$D5,$01,$01
	db $F9,$73,$C6,$00,$00
	db $00,$00,$00,$01,$3B
	db $00,$04,$5E,$02,$49
	db $00,$02,$8A,$67,$C7
	db $00,$00,$00,$00,$00
	db $03,$76,$01,$04,$08
	db $00,$A6,$01,$01,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$76,$01
	db $04,$08,$00,$A6,$01
	db $01,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $76,$01,$04,$08,$00
	db $A6,$01,$01,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$01,$2C,$00,$06
	db $0C,$00,$23,$00,$02
	db $04,$68,$C7,$00,$00
	db $00,$00,$00,$01,$2D
	db $00,$00,$5E,$02,$22
	db $00,$02,$3A,$68,$C7
	db $00,$00,$00,$00,$00
	db $03,$76,$01,$04,$08
	db $00,$A6,$01,$01,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$76,$01
	db $04,$08,$00,$A6,$01
	db $01,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $76,$01,$04,$08,$00
	db $A6,$01,$01,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$77,$01,$06
	db $08,$00,$A6,$01,$01
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$01,$38
	db $00,$04,$5D,$02,$00
	db $00,$00,$39,$03,$C9
	db $00,$00,$00,$00,$00
	db $01,$49,$00,$04,$5E
	db $02,$00,$00,$00,$9E
	db $68,$C7,$00,$00,$00
	db $00,$00,$01,$D7,$00
	db $04,$08,$00,$00,$00
	db $00,$17,$80,$C6,$00
	db $00,$00,$00,$00,$03
	db $03,$01,$04,$08,$00
	db $00,$00,$00,$A6,$80
	db $C6,$00,$C2,$80,$C6
	db $00,$01,$42,$00,$04
	db $0A,$00,$6A,$00,$01
	db $F4,$68,$C7,$00,$00
	db $00,$00,$00,$01,$3D
	db $00,$06,$0C,$00,$6A
	db $00,$01,$24,$69,$C7
	db $00,$00,$00,$00,$00
	db $01,$49,$00,$06,$0A
	db $00,$7F,$01,$02,$F9
	db $42,$C8,$00,$00,$00
	db $00,$00,$01,$42,$00
	db $02,$0C,$00,$6A,$00
	db $02,$5F,$69,$C7,$00
	db $00,$00,$00,$00,$01
	db $3D,$00,$06,$0C,$00
	db $6A,$00,$02,$80,$69
	db $C7,$00,$00,$00,$00
	db $00,$01,$4B,$00,$04
	db $5D,$02,$C2,$01,$01
	db $9E,$69,$C7,$00,$00
	db $00,$00,$00,$01,$8D
	db $00,$04,$5E,$02,$00
	db $00,$00,$87,$6B,$C7
	db $00,$00,$00,$00,$00
	db $01,$4A,$00,$04,$5E
	db $02,$00,$00,$00,$29
	db $6C,$C7,$00,$00,$00
	db $00,$00,$01,$4A,$00
	db $06,$5D,$02,$27,$00
	db $02,$A1,$6C,$C7,$00
	db $00,$00,$00,$00,$01
	db $4B,$00,$02,$5D,$02
	db $C1,$01,$02,$9E,$69
	db $C7,$00,$00,$00,$00
	db $00,$01,$3F,$00,$02
	db $0C,$00,$00,$00,$00
	db $92,$6E,$C7,$00,$00
	db $00,$00,$00,$01,$4A
	db $00,$04,$08,$00,$21
	db $01,$01,$14,$F9,$C5
	db $00,$00,$00,$00,$00
	db $01,$4A,$00,$06,$08
	db $00,$22,$01,$01,$84
	db $F9,$C5,$00,$00,$00
	db $00,$00,$01,$4A,$00
	db $04,$08,$00,$23,$01
	db $01,$DD,$F9,$C5,$00
	db $00,$00,$00,$00,$01
	db $4A,$00,$02,$08,$00
	db $24,$01,$01,$72,$FA
	db $C5,$00,$00,$00,$00
	db $00,$01,$4A,$00,$02
	db $08,$00,$25,$01,$01
	db $C5,$6E,$C7,$00,$00
	db $00,$00,$00,$01,$3B
	db $00,$04,$0C,$00,$00
	db $00,$00,$09,$27,$C7
	db $00,$00,$00,$00,$00
	db $01,$3D,$00,$04,$5E
	db $02,$00,$00,$00,$65
	db $27,$C7,$00,$00,$00
	db $00,$00,$01,$3E,$00
	db $04,$5E,$02,$00,$00
	db $00,$A8,$27,$C7,$00
	db $00,$00,$00,$00,$01
	db $34,$00,$00,$5E,$02
	db $00,$00,$00,$CF,$27
	db $C7,$00,$00,$00,$00
	db $00,$01,$39,$00,$02
	db $0C,$00,$00,$00,$00
	db $22,$28,$C7,$00,$00
	db $00,$00,$00,$01,$3D
	db $00,$04,$5E,$02,$00
	db $00,$00,$10,$29,$C7
	db $00,$00,$00,$00,$00
	db $01,$37,$00,$04,$5E
	db $02,$00,$00,$00,$8C
	db $29,$C7,$00,$00,$00
	db $00,$00,$01,$41,$00
	db $04,$5D,$02,$00,$00
	db $00,$FF,$29,$C7,$00
	db $00,$00,$00,$00,$01
	db $9A,$00,$04,$5D,$02
	db $00,$00,$00,$F8,$2A
	db $C7,$00,$00,$00,$00
	db $00,$01,$38,$00,$04
	db $0C,$00,$00,$00,$00
	db $7B,$2F,$C7,$00,$00
	db $00,$00,$00,$01,$4A
	db $00,$06,$08,$00,$00
	db $00,$00,$28,$F8,$C5
	db $00,$00,$00,$00,$00
	db $01,$46,$00,$02,$0C
	db $00,$00,$00,$00,$F8
	db $2F,$C7,$00,$00,$00
	db $00,$00,$01,$7F,$00
	db $04,$0C,$00,$00,$00
	db $00,$24,$30,$C7,$00
	db $00,$00,$00,$00,$01
	db $3B,$00,$04,$5D,$02
	db $00,$00,$00,$F6,$30
	db $C7,$00,$00,$00,$00
	db $00,$01,$7D,$00,$02
	db $0C,$00,$00,$00,$00
	db $6F,$31,$C7,$00,$00
	db $00,$00,$00,$01,$79
	db $00,$04,$0C,$00,$00
	db $00,$00,$F0,$31,$C7
	db $00,$00,$00,$00,$00
	db $01,$C3,$01,$04,$08
	db $00,$00,$00,$00,$D4
	db $76,$C6,$00,$00,$00
	db $00,$00,$01,$B4,$01
	db $02,$0C,$00,$00,$02
	db $01,$20,$78,$C6,$00
	db $00,$00,$00,$00,$01
	db $B4,$01,$06,$0C,$00
	db $00,$00,$00,$36,$78
	db $C6,$00,$00,$00,$00
	db $00,$01,$73,$00,$04
	db $5E,$02,$00,$00,$00
	db $F2,$A4,$C6,$00,$00
	db $00,$00,$00,$01,$44
	db $00,$04,$08,$00,$00
	db $00,$00,$36,$32,$C7
	db $00,$3F,$34,$C7,$00
	db $01,$36,$00,$04,$0C
	db $00,$00,$00,$00,$DE
	db $34,$C7,$00,$00,$00
	db $00,$00,$01,$77,$00
	db $02,$5D,$02,$00,$00
	db $00,$50,$35,$C7,$00
	db $00,$00,$00,$00,$01
	db $3F,$00,$00,$FA,$00
	db $67,$00,$01,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$01,$78,$00,$04
	db $5D,$02,$00,$00,$00
	db $8E,$9D,$C6,$00,$00
	db $00,$00,$00,$01,$72
	db $00,$06,$0C,$00,$00
	db $00,$00,$0E,$37,$C7
	db $00,$00,$00,$00,$00
	db $01,$70,$00,$04,$5D
	db $02,$00,$00,$00,$B5
	db $9C,$C6,$00,$00,$00
	db $00,$00,$01,$79,$00
	db $00,$5D,$02,$00,$00
	db $00,$98,$36,$C7,$00
	db $C0,$36,$C7,$00,$01
	db $71,$00,$04,$5D,$02
	db $00,$00,$00,$96,$37
	db $C7,$00,$B0,$37,$C7
	db $00,$01,$43,$00,$04
	db $0C,$00,$00,$00,$00
	db $03,$9C,$C6,$00,$00
	db $00,$00,$00,$01,$46
	db $00,$04,$5D,$02,$00
	db $00,$00,$FC,$37,$C7
	db $00,$00,$00,$00,$00
	db $01,$40,$00,$00,$5E
	db $02,$00,$00,$00,$74
	db $9E,$C6,$00,$00,$00
	db $00,$00,$01,$8C,$00
	db $04,$5D,$02,$00,$00
	db $00,$82,$38,$C7,$00
	db $00,$00,$00,$00,$01
	db $BD,$00,$04,$5D,$02
	db $00,$00,$00,$A3,$16
	db $C9,$00,$00,$00,$00
	db $00,$01,$6C,$00,$04
	db $5E,$02,$00,$00,$00
	db $86,$A2,$C6,$00,$00
	db $00,$00,$00,$01,$8B
	db $00,$04,$5D,$02,$00
	db $00,$00,$88,$38,$C7
	db $00,$00,$00,$00,$00
	db $01,$8C,$00,$04,$0C
	db $00,$00,$00,$00,$8E
	db $38,$C7,$00,$00,$00
	db $00,$00,$01,$71,$00
	db $04,$0C,$00,$00,$00
	db $00,$1C,$7A,$C6,$00
	db $00,$00,$00,$00,$01
	db $80,$00,$06,$0C,$00
	db $00,$00,$00,$A0,$7A
	db $C6,$00,$00,$00,$00
	db $00,$01,$41,$00,$04
	db $5E,$02,$00,$00,$00
	db $DD,$7A,$C6,$00,$00
	db $00,$00,$00,$01,$35
	db $00,$06,$0C,$00,$00
	db $00,$00,$B6,$38,$C7
	db $00,$00,$00,$00,$00
	db $01,$98,$00,$02,$08
	db $00,$1F,$00,$02,$40
	db $39,$C7,$00,$00,$00
	db $00,$00,$01,$7D,$00
	db $00,$0C,$00,$00,$00
	db $00,$28,$3C,$C7,$00
	db $00,$00,$00,$00,$01
	db $7E,$00,$06,$0C,$00
	db $00,$00,$00,$B0,$3D
	db $C7,$00,$00,$00,$00
	db $00,$01,$7C,$00,$06
	db $08,$00,$00,$00,$00
	db $0F,$3F,$C7,$00,$00
	db $00,$00,$00,$01,$7D
	db $01,$04,$5F,$03,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $01,$7E,$01,$06,$37
	db $00,$D2,$01,$02,$A0
	db $E8,$C5,$00,$00,$00
	db $00,$00,$01,$98,$00
	db $04,$08,$00,$68,$00
	db $01,$80,$41,$C7,$00
	db $00,$00,$00,$00,$01
	db $4A,$00,$04,$0A,$00
	db $24,$00,$02,$B0,$43
	db $C7,$00,$00,$00,$00
	db $00,$01,$73,$00,$06
	db $5F,$02,$00,$00,$00
	db $75,$44,$C7,$00,$00
	db $00,$00,$00,$01,$4C
	db $00,$04,$60,$02,$4E
	db $00,$01,$90,$46,$C7
	db $00,$46,$46,$C7,$00
	db $01,$7A,$00,$02,$5F
	db $02,$77,$01,$02,$ED
	db $47,$C7,$00,$00,$00
	db $00,$00,$01,$BC,$00
	db $04,$5E,$02,$78,$02
	db $01,$A9,$9F,$C6,$00
	db $00,$00,$00,$00,$01
	db $72,$00,$06,$5F,$02
	db $77,$01,$02,$C7,$49
	db $C7,$00,$00,$00,$00
	db $00,$01,$4E,$00,$02
	db $5F,$02,$77,$01,$02
	db $3D,$4A,$C7,$00,$00
	db $00,$00,$00,$01,$73
	db $00,$02,$60,$02,$77
	db $01,$02,$C9,$59,$C6
	db $00,$00,$00,$00,$00
	db $01,$3E,$00,$06,$61
	db $02,$77,$01,$02,$18
	db $5A,$C6,$00,$00,$00
	db $00,$00,$01,$70,$00
	db $02,$61,$02,$77,$01
	db $02,$4C,$5A,$C6,$00
	db $00,$00,$00,$00,$01
	db $3A,$00,$06,$61,$02
	db $77,$01,$02,$E9,$5A
	db $C6,$00,$00,$00,$00
	db $00,$01,$35,$00,$04
	db $5F,$02,$77,$01,$02
	db $01,$5C,$C6,$00,$00
	db $00,$00,$00,$01,$82
	db $00,$04,$60,$02,$77
	db $01,$02,$89,$5C,$C6
	db $00,$00,$00,$00,$00
	db $01,$37,$00,$04,$62
	db $02,$63,$00,$01,$EC
	db $5C,$C6,$00,$00,$00
	db $00,$00,$01,$37,$00
	db $02,$5F,$02,$63,$00
	db $02,$08,$5E,$C6,$00
	db $00,$00,$00,$00,$01
	db $4D,$00,$06,$5E,$02
	db $78,$02,$01,$46,$5E
	db $C6,$00,$00,$00,$00
	db $00,$01,$1C,$01,$04
	db $5E,$02,$6B,$01,$01
	db $A3,$5E,$C6,$00,$00
	db $00,$00,$00,$01,$1C
	db $01,$00,$61,$02,$6C
	db $01,$01,$FC,$5E,$C6
	db $00,$00,$00,$00,$00
	db $01,$4A,$00,$00,$5E
	db $02,$D2,$00,$01,$02
	db $60,$C6,$00,$00,$00
	db $00,$00,$01,$4A,$00
	db $04,$5E,$02,$D2,$00
	db $01,$5C,$5F,$C6,$00
	db $00,$00,$00,$00,$01
	db $99,$00,$04,$0D,$00
	db $84,$00,$01,$A6,$60
	db $C6,$00,$00,$00,$00
	db $00,$03,$7D,$01,$04
	db $07,$00,$6C,$00,$01
	db $C9,$A2,$EF,$00,$D6
	db $A2,$EF,$00,$01,$91
	db $00,$04,$08,$00,$DA
	db $01,$02,$40,$6E,$C6
	db $00,$00,$00,$00,$00
	db $01,$75,$00,$06,$5E
	db $02,$D5,$01,$01,$26
	db $70,$C6,$00,$00,$00
	db $00,$00,$01,$4A,$00
	db $02,$08,$00,$D5,$01
	db $01,$90,$6F,$C6,$00
	db $00,$00,$00,$00,$01
	db $4A,$00,$00,$5D,$02
	db $D5,$01,$01,$E2,$6F
	db $C6,$00,$00,$00,$00
	db $00,$01,$37,$00,$04
	db $0D,$00,$D5,$01,$01
	db $4A,$6F,$C6,$00,$00
	db $00,$00,$00,$01,$4A
	db $00,$04,$0C,$00,$D5
	db $01,$01,$20,$6F,$C6
	db $00,$00,$00,$00,$00
	db $01,$4A,$00,$04,$5E
	db $02,$D5,$01,$01,$89
	db $70,$C6,$00,$00,$00
	db $00,$00,$01,$4A,$00
	db $04,$5E,$02,$D5,$01
	db $01,$E6,$70,$C6,$00
	db $00,$00,$00,$00,$01
	db $4A,$00,$04,$5E,$02
	db $D5,$01,$01,$94,$71
	db $C6,$00,$00,$00,$00
	db $00,$01,$4A,$00,$04
	db $5E,$02,$D5,$01,$01
	db $AD,$71,$C6,$00,$00
	db $00,$00,$00,$01,$4A
	db $00,$00,$5E,$02,$D5
	db $01,$01,$29,$72,$C6
	db $00,$00,$00,$00,$00
	db $01,$4A,$00,$06,$5D
	db $02,$D5,$01,$01,$37
	db $72,$C6,$00,$00,$00
	db $00,$00,$01,$4A,$00
	db $00,$5E,$02,$D5,$01
	db $01,$EB,$72,$C6,$00
	db $00,$00,$00,$00,$01
	db $2C,$00,$00,$75,$02
	db $D5,$01,$01,$49,$73
	db $C6,$00,$00,$00,$00
	db $00,$01,$4C,$00,$02
	db $60,$02,$4E,$00,$01
	db $B9,$45,$C7,$00,$46
	db $46,$C7,$00,$01,$75
	db $00,$02,$0C,$00,$40
	db $00,$01,$A9,$4B,$C7
	db $00,$00,$00,$00,$00
	db $01,$4B,$00,$06,$08
	db $00,$D5,$01,$01,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$01,$40,$00
	db $00,$0A,$00,$D5,$01
	db $01,$00,$00,$00,$00
	db $00,$00,$00,$00,$01
	db $80,$00,$00,$5E,$02
	db $69,$00,$01,$B9,$7B
	db $C6,$00,$00,$00,$00
	db $00,$01,$37,$00,$06
	db $5E,$02,$69,$00,$01
	db $0C,$7C,$C6,$00,$00
	db $00,$00,$00,$03,$CC
	db $00,$04,$08,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$CC,$00,$04,$08
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$CC,$00
	db $04,$08,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $CC,$00,$04,$08,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$CC,$00,$04
	db $08,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$03,$CC
	db $00,$04,$08,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$CC,$00,$04,$08
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$D0,$00
	db $06,$49,$02,$A6,$01
	db $02,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $CF,$00,$06,$4A,$02
	db $A6,$01,$02,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$C7,$00,$04
	db $08,$00,$69,$00,$01
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$03,$C7
	db $00,$04,$08,$00,$69
	db $00,$01,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$C7,$00,$04,$08
	db $00,$69,$00,$01,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$C7,$00
	db $04,$08,$00,$69,$00
	db $01,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $E3,$00,$04,$08,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$E3,$00,$04
	db $08,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$03,$E3
	db $00,$04,$5E,$03,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$E3,$00,$04,$08
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$E4,$00
	db $04,$07,$00,$00,$00
	db $00,$AD,$7B,$C6,$00
	db $00,$00,$00,$00,$03
	db $CE,$00,$02,$48,$02
	db $A6,$01,$02,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$C7,$00,$04
	db $08,$00,$DC,$01,$02
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$03,$C7
	db $00,$04,$08,$00,$DC
	db $01,$02,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$C7,$00,$04,$08
	db $00,$D5,$01,$01,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$C7,$00
	db $04,$08,$00,$D5,$01
	db $01,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $BA,$01,$04,$08,$00
	db $00,$00,$00,$55,$A7
	db $C6,$00,$00,$00,$00
	db $00,$03,$D5,$00,$04
	db $08,$00,$00,$00,$00
	db $67,$7B,$C6,$00,$00
	db $00,$00,$00,$03,$CB
	db $00,$04,$10,$03,$A6
	db $01,$02,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$CB,$00,$04,$10
	db $03,$A6,$01,$02,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$CB,$00
	db $04,$10,$03,$A6,$01
	db $02,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $CB,$00,$04,$10,$03
	db $A6,$01,$02,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$CB,$00,$04
	db $10,$03,$A6,$01,$02
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$03,$C5
	db $00,$04,$0A,$00,$00
	db $00,$00,$79,$62,$C8
	db $00,$00,$00,$00,$00
	db $03,$79,$01,$02,$0A
	db $00,$D5,$01,$01,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$79,$01
	db $06,$0A,$00,$D5,$01
	db $01,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $79,$01,$02,$0A,$00
	db $D5,$01,$01,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$91,$01,$04
	db $08,$00,$40,$00,$01
	db $91,$7B,$C6,$00,$00
	db $00,$00,$00,$01,$98
	db $00,$02,$39,$00,$20
	db $00,$02,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $01,$98,$00,$02,$3A
	db $00,$21,$00,$02,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$01,$98,$00
	db $02,$3B,$00,$32,$01
	db $02,$00,$00,$00,$00
	db $00,$00,$00,$00,$01
	db $98,$00,$02,$3C,$00
	db $33,$01,$02,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$01,$98,$00,$00
	db $5D,$02,$34,$01,$02
	db $62,$67,$C6,$00,$00
	db $00,$00,$00,$03,$25
	db $01,$04,$0A,$00,$D2
	db $00,$01,$83,$6A,$C6
	db $00,$00,$00,$00,$00
	db $01,$4D,$01,$04,$B5
	db $02,$BE,$00,$01,$70
	db $66,$C6,$00,$00,$00
	db $00,$00,$01,$8F,$01
	db $02,$BB,$02,$74,$01
	db $01,$00,$00,$00,$00
	db $00,$00,$00,$00,$01
	db $96,$01,$04,$B6,$02
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$01,$55,$00,$04
	db $5D,$02,$00,$00,$00
	db $00,$00,$C8,$00,$00
	db $00,$00,$00,$01,$9C
	db $00,$06,$0C,$00,$00
	db $00,$00,$D1,$04,$C8
	db $00,$00,$00,$00,$00
	db $01,$7F,$00,$04,$0C
	db $00,$00,$00,$00,$BA
	db $09,$C8,$00,$00,$00
	db $00,$00,$01,$7C,$00
	db $02,$0C,$00,$00,$00
	db $00,$7E,$0A,$C8,$00
	db $00,$00,$00,$00,$01
	db $80,$00,$04,$5E,$02
	db $00,$00,$00,$7F,$0B
	db $C8,$00,$00,$00,$00
	db $00,$01,$9B,$00,$02
	db $DD,$00,$76,$00,$01
	db $31,$0C,$C8,$00,$00
	db $00,$00,$00,$01,$83
	db $00,$02,$0D,$00,$49
	db $00,$02,$AE,$68,$C9
	db $00,$00,$00,$00,$00
	db $01,$02,$00,$02,$0C
	db $00,$7E,$02,$02,$B2
	db $50,$C9,$00,$00,$00
	db $00,$00,$01,$AF,$00
	db $04,$08,$00,$2A,$00
	db $01,$22,$11,$C8,$00
	db $00,$00,$00,$00,$01
	db $B0,$00,$02,$0E,$00
	db $53,$01,$01,$76,$16
	db $C8,$00,$00,$00,$00
	db $00,$01,$19,$01,$04
	db $0E,$00,$53,$01,$01
	db $34,$19,$C8,$00,$00
	db $00,$00,$00,$03,$C6
	db $00,$04,$08,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$9E,$01,$04,$08
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$E1,$00
	db $04,$08,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$01
	db $74,$00,$04,$5D,$02
	db $29,$00,$01,$88,$1A
	db $C8,$00,$0C,$1B,$C8
	db $00,$01,$46,$00,$02
	db $10,$00,$00,$00,$00
	db $E2,$1B,$C8,$00,$00
	db $00,$00,$00,$01,$74
	db $00,$04,$5D,$02,$29
	db $00,$02,$B8,$1B,$C8
	db $00,$00,$00,$00,$00
	db $01,$78,$00,$02,$08
	db $00,$35,$01,$02,$D6
	db $1C,$C8,$00,$00,$00
	db $00,$00,$01,$4A,$00
	db $02,$5D,$02,$00,$00
	db $00,$63,$4A,$C9,$00
	db $00,$00,$00,$00,$01
	db $78,$00,$06,$6C,$00
	db $2B,$00,$02,$D6,$1C
	db $C8,$00,$00,$00,$00
	db $00,$01,$76,$00,$00
	db $5E,$02,$EF,$02,$01
	db $F1,$1D,$C8,$00,$00
	db $00,$00,$00,$01,$7E
	db $00,$02,$5E,$02,$EF
	db $02,$01,$0F,$1E,$C8
	db $00,$00,$00,$00,$00
	db $01,$75,$00,$00,$5D
	db $02,$EF,$02,$01,$EE
	db $1E,$C8,$00,$00,$00
	db $00,$00,$01,$44,$00
	db $00,$5E,$02,$EF,$02
	db $01,$2A,$1F,$C8,$00
	db $00,$00,$00,$00,$01
	db $4F,$00,$02,$5E,$02
	db $EF,$02,$01,$BE,$93
	db $C7,$00,$00,$00,$00
	db $00,$01,$3A,$00,$00
	db $5E,$02,$EF,$02,$01
	db $F3,$93,$C7,$00,$00
	db $00,$00,$00,$01,$39
	db $00,$00,$5E,$02,$EF
	db $02,$01,$4E,$94,$C7
	db $00,$00,$00,$00,$00
	db $01,$38,$00,$06,$5E
	db $02,$EF,$02,$01,$E8
	db $50,$C9,$00,$00,$00
	db $00,$00,$01,$3C,$00
	db $04,$5E,$02,$EF,$02
	db $01,$4F,$51,$C9,$00
	db $00,$00,$00,$00,$01
	db $3E,$00,$02,$5D,$02
	db $EF,$02,$01,$B7,$51
	db $C9,$00,$00,$00,$00
	db $00,$01,$4E,$00,$06
	db $5E,$02,$EF,$02,$01
	db $2B,$52,$C9,$00,$00
	db $00,$00,$00,$01,$69
	db $01,$06,$5E,$02,$EF
	db $02,$01,$7C,$52,$C9
	db $00,$00,$00,$00,$00
	db $01,$41,$00,$04,$5E
	db $02,$EF,$02,$01,$B2
	db $52,$C9,$00,$00,$00
	db $00,$00,$01,$42,$00
	db $06,$5D,$02,$EF,$02
	db $01,$06,$53,$C9,$00
	db $00,$00,$00,$00,$01
	db $3B,$00,$02,$5D,$02
	db $EF,$02,$01,$24,$53
	db $C9,$00,$00,$00,$00
	db $00,$01,$78,$00,$00
	db $0A,$00,$2B,$00,$01
	db $BF,$53,$C9,$00,$00
	db $00,$00,$00,$01,$95
	db $00,$04,$5E,$02,$77
	db $00,$01,$F7,$53,$C9
	db $00,$E1,$54,$C9,$00
	db $01,$96,$00,$06,$5E
	db $02,$77,$00,$01,$32
	db $55,$C9,$00,$D6,$56
	db $C9,$00,$01,$B9,$00
	db $02,$0C,$00,$77,$00
	db $01,$1E,$57,$C9,$00
	db $86,$57,$C9,$00,$01
	db $BA,$00,$04,$5E,$02
	db $77,$00,$01,$4D,$59
	db $C9,$00,$A5,$59,$C9
	db $00,$01,$BB,$00,$02
	db $5E,$02,$77,$00,$01
	db $CB,$57,$C9,$00,$D7
	db $58,$C9,$00,$01,$9E
	db $00,$04,$5D,$02,$00
	db $00,$00,$DB,$59,$C9
	db $00,$8D,$5A,$C9,$00
	db $01,$9D,$00,$06,$0C
	db $00,$70,$02,$02,$0E
	db $5C,$C9,$00,$00,$00
	db $00,$00,$01,$8A,$00
	db $04,$5E,$02,$00,$00
	db $00,$24,$61,$C9,$00
	db $00,$00,$00,$00,$01
	db $38,$00,$04,$5D,$02
	db $00,$00,$00,$93,$03
	db $C9,$00,$00,$00,$00
	db $00,$01,$49,$00,$04
	db $5E,$02,$00,$00,$00
	db $C8,$62,$C9,$00,$00
	db $00,$00,$00,$01,$D7
	db $00,$04,$08,$00,$00
	db $00,$00,$17,$80,$C6
	db $00,$00,$00,$00,$00
	db $03,$03,$01,$04,$08
	db $00,$00,$00,$00,$A6
	db $80,$C6,$00,$C2,$80
	db $C6,$00,$01,$49,$00
	db $02,$5D,$02,$7F,$01
	db $02,$ED,$49,$C8,$00
	db $00,$00,$00,$00,$01
	db $3E,$00,$04,$5D,$02
	db $00,$00,$00,$21,$91
	db $C6,$00,$00,$00,$00
	db $00,$01,$72,$00,$04
	db $5E,$02,$00,$00,$00
	db $04,$63,$C9,$00,$00
	db $00,$00,$00,$03,$E2
	db $00,$04,$5D,$02,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $01,$8C,$00,$04,$5D
	db $02,$00,$00,$00,$EA
	db $63,$C9,$00,$00,$00
	db $00,$00,$01,$BD,$00
	db $04,$0C,$00,$00,$00
	db $00,$AF,$16,$C9,$00
	db $00,$00,$00,$00,$01
	db $8B,$00,$04,$5D,$02
	db $00,$00,$00,$F0,$63
	db $C9,$00,$00,$00,$00
	db $00,$01,$8C,$00,$04
	db $5E,$02,$00,$00,$00
	db $F6,$63,$C9,$00,$00
	db $00,$00,$00,$01,$38
	db $00,$04,$0C,$00,$00
	db $00,$00,$7A,$4D,$C9
	db $00,$44,$4E,$C9,$00
	db $01,$40,$00,$00,$5D
	db $02,$00,$00,$00,$D9
	db $4E,$C9,$00,$00,$00
	db $00,$00,$01,$76,$00
	db $04,$0C,$00,$00,$00
	db $00,$42,$4F,$C9,$00
	db $00,$00,$00,$00,$01
	db $75,$00,$00,$0C,$00
	db $00,$00,$00,$9A,$64
	db $C9,$00,$00,$00,$00
	db $00,$01,$34,$00,$04
	db $5D,$02,$00,$00,$00
	db $0F,$65,$C9,$00,$00
	db $00,$00,$00,$01,$38
	db $00,$04,$5E,$02,$00
	db $00,$00,$52,$65,$C9
	db $00,$00,$00,$00,$00
	db $01,$6F,$00,$06,$5D
	db $02,$00,$00,$00,$A4
	db $65,$C9,$00,$00,$00
	db $00,$00,$03,$03,$01
	db $02,$08,$00,$00,$00
	db $00,$A6,$80,$C6,$00
	db $C2,$80,$C6,$00,$01
	db $D8,$00,$04,$08,$00
	db $00,$00,$00,$3D,$80
	db $C6,$00,$00,$00,$00
	db $00,$01,$B2,$00,$04
	db $0C,$00,$00,$00,$00
	db $75,$66,$C9,$00,$00
	db $00,$00,$00,$01,$88
	db $00,$04,$5D,$02,$F0
	db $02,$01,$4F,$01,$C7
	db $00,$00,$00,$00,$00
	db $01,$7B,$00,$06,$0C
	db $00,$44,$00,$01,$5A
	db $67,$C9,$00,$00,$00
	db $00,$00,$01,$7B,$00
	db $06,$0C,$00,$44,$00
	db $02,$5A,$67,$C9,$00
	db $00,$00,$00,$00,$01
	db $3D,$00,$04,$0C,$00
	db $44,$00,$02,$E7,$67
	db $C9,$00,$00,$00,$00
	db $00,$01,$41,$00,$04
	db $0C,$00,$44,$00,$02
	db $FB,$67,$C9,$00,$00
	db $00,$00,$00,$01,$7F
	db $00,$02,$0C,$00,$00
	db $00,$00,$4F,$68,$C9
	db $00,$00,$00,$00,$00
	db $01,$83,$00,$02,$0C
	db $00,$00,$00,$00,$AE
	db $68,$C9,$00,$00,$00
	db $00,$00,$01,$40,$00
	db $02,$0C,$00,$00,$00
	db $00,$E0,$A5,$C6,$00
	db $00,$00,$00,$00,$03
	db $03,$01,$04,$08,$00
	db $00,$00,$00,$A6,$80
	db $C6,$00,$C2,$80,$C6
	db $00,$01,$D8,$00,$04
	db $08,$00,$00,$00,$00
	db $3D,$80,$C6,$00,$00
	db $00,$00,$00,$01,$8D
	db $00,$04,$5D,$02,$00
	db $00,$00,$B6,$68,$C9
	db $00,$00,$00,$00,$00
	db $01,$41,$00,$04,$5D
	db $02,$00,$00,$00,$BC
	db $68,$C9,$00,$00,$00
	db $00,$00,$01,$46,$00
	db $02,$0D,$00,$00,$00
	db $00,$E5,$69,$C9,$00
	db $00,$00,$00,$00,$01
	db $8E,$00,$04,$5E,$02
	db $00,$00,$00,$72,$6A
	db $C9,$00,$00,$00,$00
	db $00,$01,$89,$00,$04
	db $0C,$00,$00,$00,$00
	db $78,$6A,$C9,$00,$00
	db $00,$00,$00,$01,$35
	db $00,$02,$0C,$00,$00
	db $00,$00,$7E,$6A,$C9
	db $00,$00,$00,$00,$00
	db $01,$74,$00,$06,$0D
	db $00,$00,$00,$00,$37
	db $6B,$C9,$00,$00,$00
	db $00,$00,$01,$8D,$00
	db $04,$5E,$02,$00,$00
	db $00,$B5,$6B,$C9,$00
	db $00,$00,$00,$00,$01
	db $40,$00,$04,$0C,$00
	db $00,$00,$00,$AF,$6B
	db $C9,$00,$00,$00,$00
	db $00,$01,$79,$00,$04
	db $0D,$00,$47,$00,$01
	db $BB,$6B,$C9,$00,$00
	db $00,$00,$00,$01,$70
	db $00,$04,$5E,$02,$00
	db $00,$00,$F2,$6B,$C9
	db $00,$00,$00,$00,$00
	db $01,$78,$00,$06,$5E
	db $02,$00,$00,$00,$D8
	db $95,$C6,$00,$00,$00
	db $00,$00,$01,$73,$00
	db $02,$5D,$02,$00,$00
	db $00,$CA,$98,$C6,$00
	db $00,$00,$00,$00,$01
	db $76,$00,$02,$0A,$00
	db $00,$00,$00,$51,$A5
	db $C6,$00,$00,$00,$00
	db $00,$03,$03,$01,$02
	db $08,$00,$00,$00,$00
	db $A6,$80,$C6,$00,$C2
	db $80,$C6,$00,$01,$44
	db $00,$04,$0C,$00,$00
	db $00,$00,$53,$38,$C9
	db $00,$00,$00,$00,$00
	db $01,$37,$00,$04,$5E
	db $02,$00,$00,$00,$00
	db $3A,$C9,$00,$00,$00
	db $00,$00,$01,$7E,$00
	db $06,$11,$00,$00,$00
	db $00,$2E,$3A,$C9,$00
	db $00,$00,$00,$00,$01
	db $4F,$00,$06,$10,$00
	db $00,$00,$00,$ED,$3A
	db $C9,$00,$00,$00,$00
	db $00,$01,$35,$00,$06
	db $10,$00,$00,$00,$00
	db $60,$3B,$C9,$00,$00
	db $00,$00,$00,$01,$3B
	db $00,$06,$0C,$00,$00
	db $00,$00,$A7,$3C,$C9
	db $00,$00,$00,$00,$00
	db $01,$78,$00,$04,$0D
	db $00,$00,$00,$00,$31
	db $3D,$C9,$00,$00,$00
	db $00,$00,$01,$82,$00
	db $04,$0D,$00,$00,$00
	db $00,$A9,$3D,$C9,$00
	db $00,$00,$00,$00,$01
	db $4E,$00,$04,$5E,$02
	db $00,$00,$00,$16,$3E
	db $C9,$00,$00,$00,$00
	db $00,$01,$73,$00,$04
	db $5E,$02,$00,$00,$00
	db $1C,$3E,$C9,$00,$00
	db $00,$00,$00,$01,$77
	db $00,$04,$5E,$02,$00
	db $00,$00,$A0,$3F,$C9
	db $00,$00,$00,$00,$00
	db $01,$47,$00,$04,$5E
	db $02,$00,$00,$00,$E3
	db $40,$C9,$00,$00,$00
	db $00,$00,$01,$76,$00
	db $06,$0D,$00,$00,$00
	db $00,$C7,$42,$C9,$00
	db $00,$00,$00,$00,$01
	db $89,$00,$04,$5E,$02
	db $00,$00,$00,$79,$44
	db $C9,$00,$00,$00,$00
	db $00,$01,$60,$00,$04
	db $5D,$02,$00,$00,$00
	db $7F,$44,$C9,$00,$00
	db $00,$00,$00,$01,$35
	db $00,$04,$5E,$02,$00
	db $00,$00,$03,$45,$C9
	db $00,$00,$00,$00,$00
	db $01,$AF,$00,$04,$08
	db $00,$2A,$00,$02,$09
	db $45,$C9,$00,$00,$00
	db $00,$00,$01,$95,$00
	db $04,$5E,$02,$35,$01
	db $02,$BC,$4A,$C9,$00
	db $00,$00,$00,$00,$01
	db $9B,$00,$04,$0A,$00
	db $76,$00,$02,$31,$0C
	db $C8,$00,$00,$00,$00
	db $00,$01,$72,$00,$02
	db $5E,$02,$25,$02,$01
	db $30,$47,$C9,$00,$00
	db $00,$00,$00,$01,$76
	db $00,$02,$08,$00,$63
	db $02,$02,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $01,$4F,$00,$06,$0D
	db $00,$00,$00,$00,$A9
	db $45,$C9,$00,$00,$00
	db $00,$00,$01,$75,$00
	db $04,$0A,$00,$00,$00
	db $00,$1F,$46,$C9,$00
	db $00,$00,$00,$00,$01
	db $40,$00,$00,$5E,$02
	db $25,$02,$01,$B1,$46
	db $C9,$00,$00,$00,$00
	db $00,$01,$44,$00,$02
	db $5D,$02,$25,$02,$01
	db $E6,$46,$C9,$00,$00
	db $00,$00,$00,$01,$95
	db $00,$02,$5D,$02,$25
	db $02,$01,$7D,$47,$C9
	db $00,$00,$00,$00,$00
	db $01,$96,$00,$04,$5D
	db $02,$25,$02,$01,$83
	db $48,$C9,$00,$00,$00
	db $00,$00,$01,$76,$00
	db $02,$5D,$02,$D3,$00
	db $01,$19,$50,$C9,$00
	db $00,$00,$00,$00,$01
	db $71,$00,$02,$10,$00
	db $00,$00,$00,$57,$4B
	db $C9,$00,$00,$00,$00
	db $00,$01,$78,$00,$06
	db $5E,$02,$74,$01,$01
	db $C9,$4B,$C9,$00,$00
	db $00,$00,$00,$01,$7A
	db $00,$02,$5E,$02,$74
	db $01,$01,$6D,$4C,$C9
	db $00,$00,$00,$00,$00
	db $01,$9D,$00,$02,$87
	db $02,$64,$02,$01,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$01,$19,$01
	db $04,$0C,$00,$2A,$00
	db $02,$91,$1C,$C8,$00
	db $00,$00,$00,$00,$01
	db $B0,$00,$04,$5E,$02
	db $2A,$00,$02,$56,$1F
	db $C8,$00,$00,$00,$00
	db $00,$01,$6B,$01,$04
	db $08,$00,$49,$00,$01
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$01,$69
	db $01,$04,$5E,$02,$00
	db $00,$00,$2D,$50,$C6
	db $00,$00,$00,$00,$00
	db $01,$3F,$00,$04,$5E
	db $02,$00,$00,$00,$25
	db $64,$C9,$00,$00,$00
	db $00,$00,$01,$46,$00
	db $06,$5E,$02,$49,$00
	db $02,$56,$1C,$C8,$00
	db $00,$00,$00,$00,$01
	db $7B,$00,$04,$10,$00
	db $74,$01,$01,$39,$09
	db $C8,$00,$00,$00,$00
	db $00,$01,$44,$00,$00
	db $5E,$02,$00,$00,$00
	db $58,$A4,$C6,$00,$00
	db $00,$00,$00,$01,$BC
	db $00,$04,$5E,$02,$00
	db $00,$00,$D8,$48,$C7
	db $00,$00,$00,$00,$00
	db $01,$31,$01,$06,$57
	db $00,$47,$00,$01,$60
	db $45,$C9,$00,$00,$00
	db $00,$00,$01,$31,$01
	db $06,$58,$00,$47,$00
	db $01,$60,$45,$C9,$00
	db $00,$00,$00,$00,$01
	db $31,$01,$06,$59,$00
	db $47,$00,$01,$60,$45
	db $C9,$00,$00,$00,$00
	db $00,$01,$31,$01,$06
	db $5A,$00,$47,$00,$01
	db $60,$45,$C9,$00,$00
	db $00,$00,$00,$01,$31
	db $01,$06,$55,$00,$47
	db $00,$01,$60,$45,$C9
	db $00,$00,$00,$00,$00
	db $01,$31,$01,$06,$56
	db $00,$47,$00,$01,$60
	db $45,$C9,$00,$00,$00
	db $00,$00,$03,$C6,$00
	db $04,$08,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $C6,$00,$04,$08,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$CA,$00,$04
	db $08,$00,$00,$00,$00
	db $72,$FD,$C5,$00,$00
	db $00,$00,$00,$03,$E3
	db $00,$04,$08,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$E3,$00,$04,$08
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$E3,$00
	db $04,$08,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $E7,$00,$04,$08,$00
	db $00,$00,$00,$94,$45
	db $C9,$00,$00,$00,$00
	db $00,$01,$FF,$00,$02
	db $4C,$02,$00,$00,$00
	db $93,$53,$C9,$00,$00
	db $00,$00,$00,$03,$D0
	db $00,$02,$4D,$02,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$D3,$00,$04,$60
	db $03,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$CE,$00
	db $02,$4E,$02,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $93,$01,$04,$08,$00
	db $00,$00,$00,$C4,$66
	db $C8,$00,$00,$00,$00
	db $00,$03,$CC,$00,$04
	db $08,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$03,$CC
	db $00,$04,$08,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$CC,$00,$04,$08
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$94,$01
	db $04,$08,$00,$00,$00
	db $00,$AB,$66,$C8,$00
	db $00,$00,$00,$00,$03
	db $CC,$00,$04,$63,$03
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$BA,$01,$04
	db $08,$00,$00,$00,$00
	db $7B,$A7,$C6,$00,$00
	db $00,$00,$00,$03,$CC
	db $00,$04,$08,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$B1,$01,$04,$08
	db $00,$00,$00,$00,$65
	db $53,$C9,$00,$00,$00
	db $00,$00,$03,$CC,$00
	db $04,$08,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $E0,$00,$04,$08,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$E0,$00,$04
	db $08,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$03,$F3
	db $00,$06,$08,$00,$35
	db $01,$02,$69,$47,$C9
	db $00,$00,$00,$00,$00
	db $03,$F3,$00,$04,$08
	db $00,$77,$00,$01,$69
	db $47,$C9,$00,$00,$00
	db $00,$00,$03,$25,$01
	db $04,$0A,$00,$00,$00
	db $00,$00,$80,$C9,$00
	db $00,$00,$00,$00,$01
	db $9F,$00,$04,$5D,$02
	db $00,$00,$00,$24,$80
	db $C9,$00,$00,$00,$00
	db $00,$01,$37,$00,$04
	db $5D,$02,$00,$00,$00
	db $F2,$82,$C9,$00,$00
	db $00,$00,$00,$01,$65
	db $00,$04,$0A,$00,$44
	db $00,$01,$74,$83,$C9
	db $00,$00,$00,$00,$00
	db $01,$65,$00,$04,$0A
	db $00,$44,$00,$01,$24
	db $84,$C9,$00,$00,$00
	db $00,$00,$01,$65,$00
	db $04,$0A,$00,$44,$00
	db $01,$7F,$84,$C9,$00
	db $00,$00,$00,$00,$01
	db $65,$00,$04,$0A,$00
	db $44,$00,$01,$17,$85
	db $C9,$00,$00,$00,$00
	db $00,$01,$65,$00,$04
	db $0A,$00,$44,$00,$01
	db $98,$85,$C9,$00,$00
	db $00,$00,$00,$01,$65
	db $00,$04,$0A,$00,$44
	db $00,$01,$02,$86,$C9
	db $00,$00,$00,$00,$00
	db $01,$65,$00,$04,$0A
	db $00,$44,$00,$01,$4B
	db $86,$C9,$00,$00,$00
	db $00,$00,$01,$65,$00
	db $04,$0A,$00,$5F,$01
	db $01,$CC,$86,$C9,$00
	db $00,$00,$00,$00,$01
	db $65,$00,$04,$0A,$00
	db $60,$01,$01,$3B,$87
	db $C9,$00,$00,$00,$00
	db $00,$01,$65,$00,$04
	db $0A,$00,$61,$01,$01
	db $85,$87,$C9,$00,$00
	db $00,$00,$00,$01,$65
	db $00,$04,$0A,$00,$62
	db $01,$01,$CF,$87,$C9
	db $00,$00,$00,$00,$00
	db $01,$65,$00,$04,$19
	db $01,$63,$01,$01,$1E
	db $88,$C9,$00,$00,$00
	db $00,$00,$01,$65,$00
	db $04,$1B,$01,$64,$01
	db $01,$6F,$88,$C9,$00
	db $00,$00,$00,$00,$01
	db $65,$00,$04,$1A,$01
	db $44,$00,$01,$CB,$88
	db $C9,$00,$00,$00,$00
	db $00,$01,$65,$00,$04
	db $18,$01,$44,$00,$01
	db $F1,$88,$C9,$00,$00
	db $00,$00,$00,$01,$65
	db $00,$04,$17,$01,$44
	db $00,$01,$13,$89,$C9
	db $00,$00,$00,$00,$00
	db $01,$65,$00,$04,$0C
	db $00,$44,$00,$02,$03
	db $97,$C9,$00,$00,$00
	db $00,$00,$01,$65,$00
	db $02,$0C,$00,$44,$00
	db $02,$20,$97,$C9,$00
	db $00,$00,$00,$00,$01
	db $65,$00,$04,$0C,$00
	db $44,$00,$02,$57,$97
	db $C9,$00,$00,$00,$00
	db $00,$01,$76,$00,$02
	db $5E,$02,$00,$00,$00
	db $37,$8F,$C9,$00,$00
	db $00,$00,$00,$01,$4E
	db $00,$04,$5D,$02,$00
	db $00,$00,$B3,$90,$C9
	db $00,$00,$00,$00,$00
	db $01,$3D,$00,$00,$5E
	db $02,$44,$00,$01,$76
	db $97,$C9,$00,$00,$00
	db $00,$00,$01,$41,$00
	db $00,$5E,$02,$44,$00
	db $01,$AE,$97,$C9,$00
	db $00,$00,$00,$00,$01
	db $65,$00,$04,$5D,$02
	db $44,$00,$01,$EE,$97
	db $C9,$00,$00,$00,$00
	db $00,$01,$AB,$00,$04
	db $0C,$00,$00,$00,$00
	db $24,$8B,$C9,$00,$00
	db $00,$00,$00,$01,$40
	db $00,$04,$5E,$02,$00
	db $00,$00,$68,$8B,$C9
	db $00,$00,$00,$00,$00
	db $01,$34,$00,$04,$5E
	db $02,$00,$00,$00,$1B
	db $50,$C6,$00,$00,$00
	db $00,$00,$01,$B2,$00
	db $00,$5E,$02,$00,$00
	db $00,$BA,$97,$C6,$00
	db $00,$00,$00,$00,$03
	db $03,$01,$04,$08,$00
	db $00,$00,$00,$A6,$80
	db $C6,$00,$C2,$80,$C6
	db $00,$01,$D8,$00,$04
	db $08,$00,$00,$00,$00
	db $3D,$80,$C6,$00,$00
	db $00,$00,$00,$01,$3B
	db $00,$06,$0C,$00,$00
	db $00,$00,$F5,$94,$C9
	db $00,$00,$00,$00,$00
	db $01,$8B,$00,$04,$08
	db $00,$00,$00,$00,$10
	db $00,$C9,$00,$00,$00
	db $00,$00,$01,$8C,$00
	db $02,$0C,$00,$00,$00
	db $00,$9D,$00,$C9,$00
	db $00,$00,$00,$00,$01
	db $2C,$00,$04,$08,$00
	db $2C,$00,$02,$D3,$8C
	db $C9,$00,$00,$00,$00
	db $00,$01,$45,$00,$00
	db $5D,$02,$43,$00,$01
	db $78,$8D,$C9,$00,$00
	db $00,$00,$00,$01,$74
	db $00,$04,$0C,$00,$00
	db $00,$00,$DE,$8E,$C9
	db $00,$00,$00,$00,$00
	db $01,$69,$01,$02,$0C
	db $00,$00,$00,$00,$18
	db $90,$C9,$00,$00,$00
	db $00,$00,$01,$38,$00
	db $06,$0C,$00,$00,$00
	db $00,$20,$91,$C9,$00
	db $00,$00,$00,$00,$01
	db $46,$00,$04,$0C,$00
	db $00,$00,$00,$C7,$91
	db $C9,$00,$00,$00,$00
	db $00,$01,$4D,$00,$04
	db $0C,$00,$00,$00,$00
	db $82,$92,$C9,$00,$00
	db $00,$00,$00,$01,$41
	db $00,$04,$0C,$00,$00
	db $00,$00,$FA,$92,$C9
	db $00,$00,$00,$00,$00
	db $01,$86,$00,$04,$0C
	db $00,$00,$00,$00,$A5
	db $93,$C9,$00,$07,$90
	db $C6,$00,$01,$7A,$00
	db $00,$86,$00,$00,$00
	db $00,$4E,$89,$C9,$00
	db $00,$00,$00,$00,$01
	db $73,$00,$02,$5D,$02
	db $00,$00,$00,$82,$95
	db $C9,$00,$00,$00,$00
	db $00,$01,$44,$00,$04
	db $0C,$00,$00,$00,$00
	db $AA,$96,$C9,$00,$00
	db $00,$00,$00,$01,$40
	db $00,$06,$0C,$00,$00
	db $00,$00,$6E,$8B,$C9
	db $00,$00,$00,$00,$00
	db $01,$77,$00,$04,$0C
	db $00,$00,$00,$00,$EF
	db $8B,$C9,$00,$00,$00
	db $00,$00,$01,$BD,$00
	db $02,$0C,$00,$00,$00
	db $00,$AF,$16,$C9,$00
	db $00,$00,$00,$00,$01
	db $9F,$00,$04,$0C,$00
	db $47,$00,$02,$5A,$98
	db $C9,$00,$00,$00,$00
	db $00,$01,$BC,$00,$04
	db $5E,$02,$00,$00,$00
	db $BC,$A1,$C6,$00,$00
	db $00,$00,$00,$03,$E3
	db $00,$04,$08,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $03,$E3,$00,$04,$08
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$E3,$00
	db $04,$08,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$03
	db $D3,$00,$04,$08,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$03,$D5,$00,$04
	db $08,$00,$00,$00,$00
	db $CB,$94,$C9,$00,$00
	db $00,$00,$00,$03,$D5
	db $00,$04,$08,$00,$00
	db $00,$00,$8D,$8E,$C9
	db $00,$00,$00,$00,$00
	db $03,$E0,$00,$04,$08
	db $00,$44,$00,$01,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$03,$D5,$00
	db $04,$08,$00,$00,$00
	db $00,$C1,$98,$C9,$00
	db $00,$00,$00,$00,$01
	db $F9,$00,$04,$08,$00
	db $0D,$00,$01,$2E,$95
	db $EF,$00,$C1,$95,$C7
	db $00,$01,$02,$00,$04
	db $F0,$00,$0D,$00,$01
	db $2E,$95,$EF,$00,$00
	db $00,$00,$00,$03,$33
	db $00,$02,$08,$00,$0D
	db $00,$01,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $01,$2C,$00,$00,$11
	db $01,$2D,$00,$02,$B1
	db $94,$C7,$00,$00,$00
	db $00,$00,$01,$65,$00
	db $00,$0A,$00,$2D,$00
	db $02,$00,$00,$00,$00
	db $00,$00,$00,$00,$01
	db $65,$00,$00,$0A,$00
	db $2D,$00,$02,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$01,$1A,$01,$00
	db $0A,$00,$2D,$00,$02
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$01,$37
	db $00,$06,$5E,$02,$44
	db $00,$01,$22,$98,$EF
	db $00,$00,$00,$00,$00
	db $01,$79,$00,$04,$0C
	db $00,$00,$00,$00,$1C
	db $98,$EF,$00,$00,$00
	db $00,$00,$01,$40,$00
	db $02,$5E,$02,$44,$00
	db $02,$FB,$94,$C9,$00
	db $00,$00,$00,$00,$01
	db $7D,$01,$04,$61,$03
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$01,$7D,$01,$04
	db $62,$03,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$01,$BC
	db $00,$04,$5E,$02,$00
	db $00,$00,$57,$98,$EF
	db $00,$00,$00,$00,$00
	db $03,$E7,$00,$04,$08
	db $00,$00,$00,$00,$85
	db $97,$EF,$00,$00,$00
	db $00,$00,$03,$09,$01
	db $04,$6B,$00,$1C,$01
	db $01,$88,$90,$C7,$00
	db $C4,$90,$C7,$00,$01
	db $4D,$01,$04,$B5,$02
	db $BF,$00,$01,$A2,$97
	db $EF,$00,$00,$00,$00
	db $00,$01,$10,$00,$04
	db $08,$00,$5D,$01,$02
	db $00,$00,$00,$00,$00
	db $00,$00,$00,$01,$02
	db $00,$04,$08,$00,$5D
	db $01,$02,$00,$00,$00
	db $00,$00,$00,$00,$00
	db $01,$03,$00,$04,$08
	db $00,$5D,$01,$02,$00
	db $00,$00,$00,$00,$00
	db $00,$00,$01,$04,$00
	db $06,$08,$00,$5D,$01
	db $02,$00,$00,$00,$00
	db $00,$00,$00,$00,$01
	db $42,$00,$04,$5E,$02
	db $7D,$00,$01,$ED,$D9
	db $C8,$00,$00,$00,$00
	db $00,$01,$40,$00,$02
	db $5D,$02,$05,$03,$01
	db $32,$DB,$C8,$00,$00
	db $00,$00,$00,$01,$41
	db $00,$00,$5D,$02,$7D
	db $00,$01,$4F,$DC,$C8
	db $00,$00,$00,$00,$00
	db $01,$3B,$00,$06,$5E
	db $02,$05,$03,$01,$35
	db $DD,$C8,$00,$00,$00
	db $00,$00,$01,$34,$01
	db $04,$0A,$00,$47,$00
	db $02,$9D,$F6,$C8,$00
	db $00,$00,$00,$00,$01
	db $34,$01,$04,$0A,$00
	db $47,$00,$02,$B5,$F6
	db $C8,$00,$00,$00,$00
	db $00,$01,$34,$01,$02
	db $0A,$00,$47,$00,$02
	db $CA,$F6,$C8,$00,$00
	db $00,$00,$00,$01,$B6
	db $01,$04,$08,$00,$7D
	db $00,$02,$F9,$BE,$C6
	db $00,$00,$00,$00,$00
	db $01,$B6,$01,$04,$0A
	db $00,$7D,$00,$02,$6A
	db $F6,$C8,$00,$00,$00
	db $00,$00,$01,$4E,$01
	db $04,$0A,$00,$7D,$00
	db $02,$9D,$F6,$C8,$00
	db $00,$00,$00,$00,$01
	db $4E,$01,$04,$0A,$00
	db $7D,$00,$02,$B5,$F6
	db $C8,$00,$00,$00,$00
	db $00,$01,$B6,$01,$04
	db $08,$00,$7D,$00,$02
	db $F9,$BE,$C6,$00,$00
	db $00,$00,$00,$01,$4E
	db $01,$04,$08,$00,$7D
	db $00,$02,$F9,$BE,$C6
	db $00,$00,$00,$00,$00
	db $01,$4E,$01,$04,$0A
	db $00,$7D,$00,$02,$CA
	db $F6,$C8,$00,$00,$00
	db $00,$00,$01,$B6,$01
	db $04,$0A,$00,$7D,$00
	db $02,$E2,$F6,$C8,$00
	db $00,$00,$00,$00,$01
	db $4E,$01,$04,$0A,$00





