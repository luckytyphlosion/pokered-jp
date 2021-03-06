; [wPartyMenuTypeOrMessageID] = menu type / message ID
; if less than $F0, it is a menu type
; menu types:
; 00: normal pokemon menu (e.g. Start menu)
; 01: use healing item on pokemon menu
; 02: in-battle switch pokemon menu
; 03: learn TM/HM menu
; 04: swap pokemon positions menu
; 05: use evolution stone on pokemon menu
; otherwise, it is a message ID
; f0: poison healed
; f1: burn healed
; f2: freeze healed
; f3: sleep healed
; f4: paralysis healed
; f5: HP healed
; f6: health returned
; f7: revitalized
; f8: leveled up
DrawPartyMenu_:
	xor a
	ld [H_AUTOBGTRANSFERENABLED],a
	call ClearScreen
	call UpdateSprites
	callba LoadMonPartySpriteGfxWithLCDDisabled ; load pokemon icon graphics

RedrawPartyMenu_:
	ld a,[wPartyMenuTypeOrMessageID]
	cp a,SWAP_MONS_PARTY_MENU
	jp z,.printMessage
	call ErasePartyMenuCursors
	callba InitPartyMenuBlkPacket
	coord hl, 3, 1
	ld de,wPartySpecies
	xor a
	ld c,a
	ld [hPartyMonIndex],a
	ld [wWhichPartyMenuHPBar],a
.loop
	ld a,[de]
	cp a,$FF ; reached the terminator?
	jp z,.afterDrawingMonEntries
	push bc
	push de
	push hl
	ld a,c
	push hl
	ld hl,wPartyMonNicks
	call GetPartyMonName
	pop hl
	call PlaceString ; print the pokemon's name
	callba WriteMonPartySpriteOAMByPartyIndex ; place the appropriate pokemon icon
	ld a,[hPartyMonIndex]
	ld [wWhichPokemon],a
	inc a
	ld [hPartyMonIndex],a
	call LoadMonData
	pop hl
	push hl
	ld a,[wMenuItemToSwap]
	and a ; is the player swapping pokemon positions?
	jr z,.skipUnfilledRightArrow
; if the player is swapping pokemon positions
	dec a
	ld b,a
	ld a,[wWhichPokemon]
	cp b ; is the player swapping the current pokemon in the list?
	jr nz,.skipUnfilledRightArrow
; the player is swapping the current pokemon in the list
	dec hl
	dec hl
	dec hl
	ld a,"▷" ; unfilled right arrow menu cursor
	ld [hli],a ; place the cursor
	inc hl
	inc hl
.skipUnfilledRightArrow
	ld a,[wPartyMenuTypeOrMessageID] ; menu type
	cp a,TMHM_PARTY_MENU
	jr z,.teachMoveMenu
	cp a,EVO_STONE_PARTY_MENU
	jr z,.evolutionStoneMenu
	push hl
	ld bc,-15 ; 15 columns to the left
	add hl,bc
	ld de,wLoadedMonStatus
	call PrintStatusCondition
	pop hl
	push hl
	ld bc,-12 ; 12 columns to the left
	add hl,bc
	predef DrawHP2 ; draw HP bar and prints current / max HP
	call SetPartyMenuHPBarColor ; color the HP bar (on SGB)
	pop hl
	jr .printLevel
.teachMoveMenu
	push hl
	predef CanLearnTM ; check if the pokemon can learn the move
	pop hl
	ld de,.ableToLearnMoveText
	ld a,c
	and a
	jr nz,.placeMoveLearnabilityString
	ld de,.notAbleToLearnMoveText
.placeMoveLearnabilityString
	push hl
	ld bc,9 ; move 9 columns to the right
	add hl,bc
	call PlaceString
	pop hl
.printLevel
	ld bc,5 ; move 5 columns to the right
	add hl,bc
	call PrintLevel
	pop hl
	pop de
	inc de
	ld bc,2 * 20
	add hl,bc
	pop bc
	inc c
	jp .loop
.ableToLearnMoveText
	db "おぼえられる@"
.notAbleToLearnMoveText
	db "おぼえられない@"
.evolutionStoneMenu
	push hl
	ld hl,EvosMovesPointerTable
	ld b,0
	ld a,[wLoadedMonSpecies]
	dec a
	add a
	rl b
	ld c,a
	add hl,bc
	ld de,wcd6d
	ld a,BANK(EvosMovesPointerTable)
	ld bc,2
	call FarCopyData
	ld hl,wcd6d
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld de,wcd6d
	ld a,BANK(EvosMovesPointerTable)
	ld bc,Mon133_EvosEnd - Mon133_EvosMoves
	call FarCopyData
	ld hl,wcd6d
	ld de,.notAbleToEvolveText
; loop through the pokemon's evolution entries
.checkEvolutionsLoop
	ld a,[hli]
	and a ; reached terminator?
	jr z,.placeEvolutionStoneString ; if so, place the "NOT ABLE" string
	inc hl
	inc hl
	cp a,EV_ITEM
	jr nz,.checkEvolutionsLoop
; if it's a stone evolution entry
	dec hl
	dec hl
	ld b,[hl]
	ld a,[wEvoStoneItemID] ; the stone the player used
	inc hl
	inc hl
	inc hl
	cp b ; does the player's stone match this evolution entry's stone?
	jr nz,.checkEvolutionsLoop
; if it does match
	ld de,.ableToEvolveText
.placeEvolutionStoneString
	pop hl
	push hl
	ld bc,9 ; move 9 columns to the right
	add hl,bc
	call PlaceString
	pop hl
	jr .printLevel
.ableToEvolveText
	db "つかえる@"
.notAbleToEvolveText
	db "つかえない@"
.afterDrawingMonEntries
	ld b, SET_PAL_PARTY_MENU
	call RunPaletteCommand
.printMessage
	ld hl,wd730
	ld a,[hl]
	push af
	push hl
	set 6,[hl] ; turn off letter printing delay
	ld a,[wPartyMenuTypeOrMessageID] ; message ID
	cp a,$F0
	jr nc,.printItemUseMessage
	add a
	ld hl,PartyMenuMessagePointers
	ld b,0
	ld c,a
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	call PrintText
.done
	pop hl
	pop af
	ld [hl],a
	ld a,1
	ld [H_AUTOBGTRANSFERENABLED],a
	call Delay3
	jp GBPalNormal
.printItemUseMessage
	and a,$0F
	ld hl,PartyMenuItemUseMessagePointers
	add a
	ld c,a
	ld b,0
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	push hl
	ld a,[wUsedItemOnWhichPokemon]
	ld hl,wPartyMonNicks
	call GetPartyMonName
	pop hl
	call PrintText
	jr .done

PartyMenuItemUseMessagePointers:
	dw AntidoteText
	dw BurnHealText
	dw IceHealText
	dw AwakeningText
	dw ParlyzHealText
	dw PotionText
	dw FullHealText
	dw ReviveText
	dw RareCandyText

PartyMenuMessagePointers:
	dw PartyMenuNormalText
	dw PartyMenuItemUseText
	dw PartyMenuBattleText
	dw PartyMenuUseTMText
	dw PartyMenuSwapMonText
	dw PartyMenuItemUseText

PartyMenuNormalText:
	text "<PKMN>を　えらんで　ください"
	done

PartyMenuItemUseText:
	text "どの<PKMN>に　つかいますか？"
	done

PartyMenuBattleText:
	text "どの<PKMN>を　だしますか？"
	done

PartyMenuUseTMText:
	text "どの<PKMN>に　おしえますか？"
	done

PartyMenuSwapMonText:
	text "どこに　いどうしますか？"
	done

PotionText:
	TX_RAM wcd6d
	text "の　たいリょくが"
	line "@"
	TX_NUM wHPBarHPDifference, 2, 3
	text "　かいふくした"
	done

AntidoteText:
	TX_RAM wcd6d
	text "の　どくは"
	line "きれい　さっぱリ　なくなった！"
	done

ParlyzHealText:
	TX_RAM wcd6d
	text "の　からだの"
	line "しびれが　とれた"
	done

BurnHealText:
	TX_RAM wcd6d
	text "の"
	line "やけどが　なおった"
	done

IceHealText:
	TX_RAM wcd6d
	text "の　からだの"
	line "こおリが　とけた"
	done

AwakeningText:
	TX_RAM wcd6d
	text "は"
	line "めを　さました"
	done

FullHealText:
	TX_RAM wcd6d
	text "は"
	line "けんこうになった！"
	done

ReviveText:
	TX_RAM wcd6d
	text "は"
	line "げんきを　とリもどした！"
	done

RareCandyText:
	TX_RAM wcd6d
	text "の　レべルが@"
	TX_NUM wCurEnemyLVL, 1, 3
	text "になった@"
	TX_SFX_ITEM_1 ; probably supposed to play SFX_LEVEL_UP but the wrong music bank is loaded
	TX_BLINK
	db "@"

SetPartyMenuHPBarColor:
	ld hl, wPartyMenuHPBarColors
	ld a, [wWhichPartyMenuHPBar]
	ld c, a
	ld b, 0
	add hl, bc
	call GetHealthBarColor
	ld b, UPDATE_PARTY_MENU_BLK_PACKET
	call RunPaletteCommand
	ld hl, wWhichPartyMenuHPBar
	inc [hl]
	ret
