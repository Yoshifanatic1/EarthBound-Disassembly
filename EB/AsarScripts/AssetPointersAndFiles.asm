; Note: This file is used by the ExtractAssets.bat batch script to define where each file is, how large they are, and their filenames.

hirom
;!ROMVer = $0000						; Note: This is set within the batch script
!ROM_EB_U = $0001
!ROM_EB_J = $0002

org $C00000
MainPointerTableStart:
	dl MainPointerTableStart,MainPointerTableEnd-MainPointerTableStart
	dl UncompressedGFXPointersStart,(UncompressedGFXPointersEnd-UncompressedGFXPointersStart)/$0C
	dl CompressedGFXPointersStart,(CompressedGFXPointersEnd-CompressedGFXPointersStart)/$0C
	dl SPCDataPointersStart,(SPCDataPointersEnd-SPCDataPointersStart)/$0C
MainPointerTableEnd:

;--------------------------------------------------------------------

UncompressedGFXPointersStart:
	dl $EFEB70,$EFEFB7,DebugMenuFontGFX,DebugMenuFontGFXEnd
	dl $D10000,$D20000,GFX_D10000,GFX_D10000End
	dl $D20000,$D30000,GFX_D20000,GFX_D20000End
	dl $D30000,$D40000,GFX_D30000,GFX_D30000End
	dl $D40000,$D50000,GFX_D40000,GFX_D40000End
	dl $D50000,$D54600,GFX_D50000,GFX_D50000End
	dl $E122FA,$E12EFA,IntroCutsceneFontGFX,IntroCutsceneFontGFXEnd
	dl $EFEFB7,$EFF0D7,KirbyGFX,KirbyGFXEnd
	dl $E10CDA,$E118DA,MainFontGFX,MainFontGFXEnd
UncompressedGFXPointersEnd:

;--------------------------------------------------------------------

CompressedGFXPointersStart:
	dl $DFE204,$DFE21D,AnimatedTiles0A_HouseInterior,AnimatedTiles0A_HouseInteriorEnd
	dl $DFC93B,$DFCB7F,AnimatedTiles01_Onett,AnimatedTiles01_OnettEnd
	dl $E14F2A,$E15130,ApeSoftwareLogoGFX,ApeSoftwareLogoGFXEnd
	dl $CBA5D4,$CBA6BD,BGGFX01_Hexagons,BGGFX01_HexagonsEnd
	dl $CBB16C,$CBB22A,BGGFX02_Unknown,BGGFX02_UnknownEnd
	dl $CBD73D,$CBD74A,CheckerboardBGGFX,CheckerboardBGGFXsEnd
	dl $D8F20D,$D8F3BE,CopyrightProtectionScreenGFX,CopyrightProtectionScreenGFXEnd
	dl $E00000,$E00754,FileSelectAndBattlePartyWindowsGFX,FileSelectAndBattlePartyWindowsGFXEnd
	dl $E00754,$E007A0,FlavoredTextWindowGFX,FlavoredTextWindowGFXEnd
	dl $CA2042,$CA382D,GiygasGFX,GiygasGFXEnd
	dl $E151E8,$E153B8,HalLogoGFX,HalLogoGFXEnd
	dl $D8F5C4,$D8F6B7,IncorrectRegionScreenGFX,IncorrectRegionScreenGFXEnd
	dl $E1549E,$E1558F,NintendoLogoGFX,NintendoLogoGFXEnd
	dl $DEA101,$DECE3A,Tileset0A_HouseInteriorGFX,Tileset0A_HouseInteriorGFXEnd
	dl $DD3294,$DD5F17,Tileset01_Onett,Tileset01_OnettEnd
	dl $E1B211,$E1C6E5,TitleLogoGFX1,TitleLogoGFX1End
	dl $E1C6E5,$E1CDE1,TitleLogoGFX2,TitleLogoGFX2End
	dl $E15B33,$E1A9B7,WarOnGiygasScreenGFX,WarOnGiygasScreenGFXEnd
CompressedGFXPointersEnd:

;--------------------------------------------------------------------

SPCDataPointersStart:
	dl $DFEC46,$DFFFEE,FileSelectMusic,FileSelectMusicEnd
	dl $E30000,$E35F64,FileSelectSampleBank,FileSelectSampleBankEnd
	dl $E9F8C8,$E9FF64,MeteorImpactMusic,MeteorImpactMusicEnd
	dl $EB520C,$EB78D6,PeacefulNightOnettAmbienceSamples,PeacefulNightOnettAmbienceSamplesEnd
	dl $ED1406,$ED1DFF,PeacefulNightOnettMusic,PeacefulNightOnettMusicEnd
	dl $E9AC26,$E9E084,PoliceCarSirenSample,PoliceCarSirenSampleEnd
	dl $E60000,$E645D6,SPCEngine,SPCEngineEnd
	dl $E9E084,$E9F8C8,UnknownTitleScreenSPCData_E9E084,UnknownTitleScreenSPCData_E9E084End
	dl $E87EA6,$E8BC88,UnknownTitleScreenSPCData_E87EA6,UnknownTitleScreenSPCData_E87EA6End
	dl $EE0A8B,$EE0FB2,UnknownTitleScreenSPCData_EE0A8B,UnknownTitleScreenSPCData_EE0A8BEnd
	dl $E277F0,$E2ED2C,WarOnGiygasAmbientNoise,WarOnGiygasAmbientNoiseEnd
SPCDataPointersEnd:

;--------------------------------------------------------------------

DebugMenuFontGFX:
	db "DebugMenuFontGFX.bin"
DebugMenuFontGFXEnd:
GFX_D10000:
	db "GFX_D10000.bin"
GFX_D10000End:
GFX_D20000:
	db "GFX_D20000.bin"
GFX_D20000End:
GFX_D30000:
	db "GFX_D30000.bin"
GFX_D30000End:
GFX_D40000:
	db "GFX_D40000.bin"
GFX_D40000End:
GFX_D50000:
	db "GFX_D50000.bin"
GFX_D50000End:
IntroCutsceneFontGFX:
	db "IntroCutsceneFontGFX.bin"
IntroCutsceneFontGFXEnd:
KirbyGFX:
	db "KirbyGFX.bin"
KirbyGFXEnd:
MainFontGFX:
	db "MainFontGFX.bin"
MainFontGFXEnd:

;--------------------------------------------------------------------

AnimatedTiles0A_HouseInterior:
	db "AnimatedTiles0A_HouseInterior.bin"
AnimatedTiles0A_HouseInteriorEnd:
AnimatedTiles01_Onett:
	db "AnimatedTiles01_Onett.bin"
AnimatedTiles01_OnettEnd:
ApeSoftwareLogoGFX:
	db "ApeSoftwareLogoGFX.bin"
ApeSoftwareLogoGFXEnd:
BGGFX01_Hexagons:
	db "BGGFX01_Hexagons.bin"
BGGFX01_HexagonsEnd:
BGGFX02_Unknown:
	db "BGGFX02_Unknown.bin"
BGGFX02_UnknownEnd:
CheckerboardBGGFX:
	db "CheckerboardBGGFX.bin"
CheckerboardBGGFXsEnd:
CopyrightProtectionScreenGFX:
	db "CopyrightProtectionScreenGFX.bin"
CopyrightProtectionScreenGFXEnd:
FileSelectAndBattlePartyWindowsGFX:
	db "FileSelectAndBattlePartyWindowsGFX.bin"
FileSelectAndBattlePartyWindowsGFXEnd:
FlavoredTextWindowGFX:
	db "FlavoredTextWindowGFX.bin"
FlavoredTextWindowGFXEnd:
GiygasGFX:
	db "GiygasGFX.bin"
GiygasGFXEnd:
HalLogoGFX:
	db "HalLogoGFX.bin"
HalLogoGFXEnd:
IncorrectRegionScreenGFX:
	db "IncorrectRegionScreenGFX.bin"
IncorrectRegionScreenGFXEnd:
NintendoLogoGFX:
	db "NintendoLogoGFX.bin"
NintendoLogoGFXEnd:
Tileset0A_HouseInteriorGFX:
	db "Tileset0A_HouseInteriorGFX.bin"
Tileset0A_HouseInteriorGFXEnd:
Tileset01_Onett:
	db "Tileset01_Onett.bin"
Tileset01_OnettEnd:
TitleLogoGFX1:
	db "TitleLogoGFX1.bin"
TitleLogoGFX1End:
TitleLogoGFX2:
	db "TitleLogoGFX2.bin"
TitleLogoGFX2End:
WarOnGiygasScreenGFX:
	db "WarOnGiygasScreenGFX.bin"
WarOnGiygasScreenGFXEnd:

;--------------------------------------------------------------------

FileSelectMusic:
	db "FileSelectMusic.bin"
FileSelectMusicEnd:
FileSelectSampleBank:
	db "FileSelectSampleBank.bin"
FileSelectSampleBankEnd:
MeteorImpactMusic:
	db "MeteorImpactMusic.bin"
MeteorImpactMusicEnd:
PeacefulNightOnettAmbienceSamples:
	db "PeacefulNightOnettAmbienceSamples.bin"
PeacefulNightOnettAmbienceSamplesEnd:
PeacefulNightOnettMusic:
	db "PeacefulNightOnettMusic.bin"
PeacefulNightOnettMusicEnd:
PoliceCarSirenSample:
	db "PoliceCarSirenSample.bin"
PoliceCarSirenSampleEnd:
SPCEngine:
	db "SPCEngine.bin"
SPCEngineEnd:
UnknownTitleScreenSPCData_E9E084:
	db "UnknownTitleScreenSPCData_E9E084.bin"
UnknownTitleScreenSPCData_E9E084End:
UnknownTitleScreenSPCData_E87EA6:
	db "UnknownTitleScreenSPCData_E87EA6.bin"
UnknownTitleScreenSPCData_E87EA6End:
UnknownTitleScreenSPCData_EE0A8B:
	db "UnknownTitleScreenSPCData_EE0A8B.bin"
UnknownTitleScreenSPCData_EE0A8BEnd:
WarOnGiygasAmbientNoise:
	db "WarOnGiygasAmbientNoise.bin"
WarOnGiygasAmbientNoiseEnd:

;--------------------------------------------------------------------
