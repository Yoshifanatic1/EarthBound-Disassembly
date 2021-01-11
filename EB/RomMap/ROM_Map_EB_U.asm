
macro EB_GameSpecificAssemblySettings()
	!ROM_EB_U = $0001							;\ These defines assign each ROM version with a different bit so version difference checks will work. Do not touch them!
	!ROM_EB_J = $0002							;/

!Define_EB_Global_DisableCopyDetection = !FALSE

	%SetROMToAssembleForHack(EB_U, !ROMID)
endmacro

macro EB_LoadGameSpecificMainSNESFiles()
	incsrc ../Misc_Defines_EB.asm
	incsrc ../RAM_Map_EB.asm
	incsrc ../Routine_Macros_EB.asm
	incsrc ../SNES_Macros_EB.asm
endmacro

macro EB_LoadGameSpecificMainSPC700Files()
	incsrc ../SPC700/ARAM_Map_EB.asm
	incsrc ../Misc_Defines_EB.asm
	incsrc ../SPC700/SPC700_Macros_EB.asm
endmacro

macro EB_LoadGameSpecificMainExtraHardwareFiles()
endmacro

macro EB_LoadGameSpecificMSU1Files()
endmacro

macro EB_GlobalAssemblySettings()
	!Define_Global_ApplyAsarPatches = !FALSE
	!Define_Global_InsertRATSTags = !TRUE
	!Define_Global_IgnoreCodeAlignments = !FALSE
	!Define_Global_IgnoreOriginalFreespace = !FALSE
	!Define_Global_CompatibleControllers = !Controller_StandardJoypad
	!Define_Global_DisableROMMirroring = !FALSE
	!Define_Global_CartridgeHeaderVersion = $02
	!Define_Global_FixIncorrectChecksumHack = !FALSE
	!Define_Global_ROMFrameworkVer = 1
	!Define_Global_ROMFrameworkSubVer = 0
	!Define_Global_ROMFrameworkSubSubVer = 0
	!Define_Global_AsarChecksum = $0000
	!Define_Global_LicenseeName = "Nintendo"
	!Define_Global_DeveloperName = "Ape/HAL Laboratory"
	!Define_Global_ReleaseDate = "June 5, 1995"
	!Define_Global_BaseROMMD5Hash = "a864b2e5c141d2dec1c4cbed75a42a85"

	!Define_Global_MakerCode = "01"
	!Define_Global_GameCode = "MB  "
	!Define_Global_ReservedSpace = $00,$00,$00,$00,$00,$00
	!Define_Global_ExpansionFlashSize = !ExpansionMemorySize_0KB
	!Define_Global_ExpansionRAMSize = !ExpansionMemorySize_0KB
	!Define_Global_IsSpecialVersion = $00
	!Define_Global_InternalName = "EARTH BOUND          "
	!Define_Global_ROMLayout = !ROMLayout_HiROM_FastROM
	!Define_Global_ROMType = !ROMType_ROM_RAM_SRAM
	!Define_Global_CustomChip = !Chip_None
	!Define_Global_ROMSize = !ROMSize_3MB
	!Define_Global_SRAMSize = !SRAMSize_8KB
	!Define_Global_Region = !Region_NorthAmerica
	!Define_Global_LicenseeID = $33
	!Define_Global_VersionNumber = $00
	!Define_Global_ChecksumCompliment = !Define_Global_Checksum^$FFFF
	!Define_Global_Checksum = $4048
	!UnusedNativeModeVector1 = $0000
	!UnusedNativeModeVector2 = $0000
	!NativeModeCOPVector = $F8C2
	!NativeModeBRKVector = $F8C2
	!NativeModeAbortVector = $F8C2
	!NativeModeNMIVector = EB_VBlankRoutine_Main
	!NativeModeResetVector = $0000
	!NativeModeIRQVector = EB_IRQRoutine_Main
	!UnusedEmulationModeVector1 = $0000
	!UnusedEmulationModeVector2 = $0000
	!EmulationModeCOPVector = $F8C2
	!EmulationModeBRKVector = $0000
	!EmulationModeAbortVector = $F8C2
	!EmulationModeNMIVector = $F8C2
	!EmulationModeResetVector = EB_InitAndMainLoop_Main
	!EmulationModeIRQVector = $F8C2
	%LoadExtraRAMFile("SRAM_Map_EB.asm")
endmacro

macro EB_LoadROMMap()
	%EBBankC0Macros(!BANK_C0, !BANK_C0)
	%EBBankC1Macros(!BANK_C1, !BANK_C1)
	%EBBankC2Macros(!BANK_C2, !BANK_C2)
	%EBBankC3Macros(!BANK_C3, !BANK_C3)
	%EBBankC4Macros(!BANK_C4, !BANK_C4)
	%EBBankC5Macros(!BANK_C5, !BANK_C5)
	%EBBankC6Macros(!BANK_C6, !BANK_C6)
	%EBBankC7Macros(!BANK_C7, !BANK_C7)
	%EBBankC8Macros(!BANK_C8, !BANK_C8)
	%EBBankC9Macros(!BANK_C9, !BANK_C9)
	%EBBankCAMacros(!BANK_CA, !BANK_CA)
	%EBBankCBMacros(!BANK_CB, !BANK_CB)
	%EBBankCCMacros(!BANK_CC, !BANK_CC)
	%EBBankCDMacros(!BANK_CD, !BANK_CD)
	%EBBankCEMacros(!BANK_CE, !BANK_CE)
	%EBBankCFMacros(!BANK_CF, !BANK_CF)
	%EBBankD0Macros(!BANK_D0, !BANK_D0)
	%EBBankD1Macros(!BANK_D1, !BANK_D1)
	%EBBankD2Macros(!BANK_D2, !BANK_D2)
	%EBBankD3Macros(!BANK_D3, !BANK_D3)
	%EBBankD4Macros(!BANK_D4, !BANK_D4)
	%EBBankD5Macros(!BANK_D5, !BANK_D5)
	%EBBankD6Macros(!BANK_D6, !BANK_D6)
	%EBBankD7Macros(!BANK_D7, !BANK_D7)
	%EBBankD8Macros(!BANK_D8, !BANK_D8)
	%EBBankD9Macros(!BANK_D9, !BANK_D9)
	%EBBankDAMacros(!BANK_DA, !BANK_DA)
	%EBBankDBMacros(!BANK_DB, !BANK_DB)
	%EBBankDCMacros(!BANK_DC, !BANK_DC)
	%EBBankDDMacros(!BANK_DD, !BANK_DD)
	%EBBankDEMacros(!BANK_DE, !BANK_DE)
	%EBBankDFMacros(!BANK_DF, !BANK_DF)
	%EBBankE0Macros(!BANK_E0, !BANK_E0)
	%EBBankE1Macros(!BANK_E1, !BANK_E1)
	%EBBankE2Macros(!BANK_E2, !BANK_E2)
	%EBBankE3Macros(!BANK_E3, !BANK_E3)
	%EBBankE4Macros(!BANK_E4, !BANK_E4)
	%EBBankE5Macros(!BANK_E5, !BANK_E5)
	%EBBankE6Macros(!BANK_E6, !BANK_E6)
	%EBBankE7Macros(!BANK_E7, !BANK_E7)
	%EBBankE8Macros(!BANK_E8, !BANK_E8)
	%EBBankE9Macros(!BANK_E9, !BANK_E9)
	%EBBankEAMacros(!BANK_EA, !BANK_EA)
	%EBBankEBMacros(!BANK_EB, !BANK_EB)
	%EBBankECMacros(!BANK_EC, !BANK_EC)
	%EBBankEDMacros(!BANK_ED, !BANK_ED)
	%EBBankEEMacros(!BANK_EE, !BANK_EE)
	%EBBankEFMacros(!BANK_EF, !BANK_EF)
endmacro
