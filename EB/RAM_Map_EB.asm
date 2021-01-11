!RAM_EB_DMAToVRAMUpdateTable = $000400
!RAM_EB_Global_DMATableVRAMAddressLo = $000406
!RAM_EB_Global_DMATableVRAMAddressHi = !RAM_EB_Global_DMATableVRAMAddressLo+$01
!RAM_EB_Global_OAMBuffer1 = $000500
!RAM_EB_Global_UpperOAMBuffer1 = !RAM_EB_Global_OAMBuffer1+$0200

!RAM_EB_Global_OAMBuffer2 = $000800
!RAM_EB_Global_UpperOAMBuffer2 = !RAM_EB_Global_OAMBuffer2+$0200

; $000B8E = Name entry sprite X pos low
; $000B8F = Name entry sprite X pos high

; $000BCA = Name entry sprite Y pos low
; $000BCB = Name entry sprite Y pos high

; $7E2AF6 = Name Entry screen character facing direction.

!RAM_EB_Global_TextBoxTilemap = $7E5E7E		; Todo: I'm not 100% sure if this really is the tilemap

!RAM_EB_Player_SubXPos = $7E9876
!RAM_EB_Player_XPosLo = $7E9877
!RAM_EB_Player_XPosHi = $7E9878

!RAM_EB_Player_SubYPos = $7E987A
!RAM_EB_Player_YPosLo = $7E987B
!RAM_EB_Player_YPosHi = $7E987C

!RAM_EB_Player_FacingDirection = $7E987F
; $7E9CA0 = Contains buffered file select strings

!RAM_EB_Global_CopyDetectionDefeatedFlagLo = $7EB539
!RAM_EB_Global_CopyDetectionDefeatedFlagHi = !RAM_EB_Global_CopyDetectionDefeatedFlag+$01

struct EB_OAMBuffer1 !RAM_EB_Global_OAMBuffer1
	.XDisp: skip $01
	.YDisp: skip $01
	.Tile: skip $01
	.Prop: skip $01
endstruct align $04

struct EB_UpperOAMBuffer1 !RAM_EB_Global_UpperOAMBuffer1
	.Slot: skip $01
endstruct align $01

struct EB_OAMBuffer2 !RAM_EB_Global_OAMBuffer2
	.XDisp: skip $01
	.YDisp: skip $01
	.Tile: skip $01
	.Prop: skip $01
endstruct align $04

struct EB_UpperOAMBuffer2 !RAM_EB_Global_UpperOAMBuffer2
	.Slot: skip $01
endstruct align $01

struct EB_DMAToVRAMUpdateTable !RAM_EB_DMAToVRAMUpdateTable
	.ParameterIndex: skip $01
	.SizeLo: skip $01
	.SizeHi: skip $01
	.SourceLo: skip $01
	.SourceHi: skip $01
	.SourceBank: skip $01
	.VRAMAddressLo: skip $01
	.VRAMAddressHi: skip $01
endstruct align $08