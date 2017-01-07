InitPlayerData:
InitPlayerData2:

	call Random
	ld a, [hRandomSub]
	ld [wPlayerID], a

	call Random
	ld a, [hRandomAdd]
	ld [wPlayerID + 1], a

	ld a, $ff
	ld [wUnusedD71B], a

	ld hl, wPartyCount
	call InitializeEmptyList
	ld hl, wNumInBox
	call InitializeEmptyList
	ld hl, wNumBagItems
	call InitializeEmptyList
	ld hl, wNumBoxItems
	call InitializeEmptyList

START_MONEY EQU $3000

	xor a
	ld [wMonDataLocation], a
	ld [wObtainedBadges], a
	ld [wObtainedBadges + 1], a
	ld [wPlayerCoins], a
	ld [wPlayerCoins + 1], a
	ld [wPlayerMoney], a
	ld [wPlayerMoney + 2], a
	ld a, START_MONEY / $100
	ld [wPlayerMoney + 1], a

	ld hl, wGameProgressFlags
	ld bc, wGameProgressFlagsEnd - wGameProgressFlags
	xor a
	call FillMemory ; clear all game progress flags

	jp InitializeMissableObjectsFlags

InitializeEmptyList:
	xor a ; count
	ld [hli], a
	dec a ; terminator
	ld [hl], a
	ret
