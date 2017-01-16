ConversionEffect_:
	ld hl, wEnemyMonType1
	ld de, wBattleMonType1
	ld a, [H_WHOSETURN]
	and a
	ld a, [wEnemyBattleStatus1]
	jr z, .conversionEffect
	push hl
	ld h, d
	ld l, e
	pop de
	ld a, [wPlayerBattleStatus1]
.conversionEffect
	bit Invulnerable, a ; is mon immune to typical attacks (dig/fly)
	jr nz, PrintButItFailedText
; copy target's types to user
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	callab PlayCurrentMoveAnimation
	ld hl, ConvertedTypeText
	jp PrintText

ConvertedTypeText:
	text "<TARGET>の　ぞくせいを"
	line "じぶんに　はリつけた！"
	prompt

PrintButItFailedText:
	jpab PrintButItFailedText_
