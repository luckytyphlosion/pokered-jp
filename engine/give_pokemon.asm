_GivePokemon:
; returns success in carry
; and whether the mon was added to the party in [wAddedToParty]
	call EnableAutoTextBoxDrawing
	xor a
	ld [wAddedToParty], a
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr c, .addToParty
	ld a, [wNumInBox]
	cp MONS_PER_BOX
	jr nc, .boxFull
; add to box
	xor a
	ld [wEnemyBattleStatus3], a
	ld a, [wcf91]
	ld [wEnemyMonSpecies2], a
	callab LoadEnemyMonData
	call SetPokedexOwnedFlag
	callab SendNewMonToBox
	ld a, [wCurrentBoxNum]
	and $7f
	add "1"
	ld hl, wcf4b
	ld [hli], a
	ld [hl], "@"
	ld hl, SetToBoxText
	call PrintText
	scf
	ret
.boxFull
	ld hl, BoxIsFullText
	call PrintText
	and a
	ret
.addToParty
	call SetPokedexOwnedFlag
	call AddPartyMon
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld [wAddedToParty], a
	scf
	ret

SetPokedexOwnedFlag:
	ld a, [wcf91]
	push af
	ld [wd11e], a
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld c, a
	ld hl, wPokedexOwned
	ld b, FLAG_SET
	predef FlagActionPredef
	pop af
	ld [wd11e], a
	call GetMonName
	ld hl, GotMonText
	jp PrintText

GotMonText:
	text "<PLAYER>は"
	line "@"
	TX_RAM wcd6d
	text "を　てにいれた！@"
	TX_SFX_ITEM_1
	db "@"

SetToBoxText:
	text "<PKMN>を　もちきれないので"
	line "<PC>の　ボックス@"
	TX_RAM wcf4b
	text "　に"
	cont "@"
	TX_RAM wBoxMonNicks
	text "を　てんそうした！"
	done

BoxIsFullText:
	text "<PKMN>を　もちきれません！"
	para "ボックスも　いっぱいで"
	line "てんそうできません！"
	para "<PKMN>センターなどで"
	line "ボックスを　かえてきて　ください"
	done
