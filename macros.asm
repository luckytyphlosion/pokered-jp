dr: MACRO
	INCBIN "baserom.gbc", (\1), (\2) - (\1)
ENDM

INCLUDE "macros/asm_macros.asm"
INCLUDE "macros/data_macros.asm"
INCLUDE "macros/text_macros.asm"
INCLUDE "macros/audio_macros.asm"
INCLUDE "macros/event_macros.asm"
