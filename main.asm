INCLUDE "constants.asm"

NPC_SPRITES_1 EQU $4
NPC_SPRITES_2 EQU $5

GFX EQU $4

PICS_1 EQU $9
PICS_2 EQU $A
PICS_3 EQU $B
PICS_4 EQU $C
PICS_5 EQU $D


INCLUDE "home.asm"

SECTION "bank1",ROMX,BANK[$1]
	dr $4000, $421C

ItemPrices:: ; 01:421C
	dr $421C, $433F

ItemNames:: ; 01:433F
	dr $433F, $45F5

UnusedNames:: ; 01:45F5
	dr $45F5, $4672

PrepareOAMData:: ; 4672
	dr $4672, $4750

WriteDMACodeToHRAM:: ; 4750
	dr $4750, $476E

SetDefaultNamesBeforeTitlescreen:: ; 476E
	dr $476E, $49ED

PrintWaitingText:: ; 49ED
	dr $49ED, $4A1C

_UpdateSprites:: ; 4A1C
	dr $4A1C, $4BC7

PickUpItem:: ; 01:4BC7
	dr $4BC7, $5889
CableClub_Run:: ; 01:5889
	dr $5889, $58DA
EmptyFunc3:: ; 01:58DA
	dr $58DA, $58DB
Diploma_TextBoxBorder:: ; 01:58DB
	dr $58DB, $6233
DisplayPicCenteredOrUpperRight:: ; 01:6233
	dr $6233, $6479
AskName:: ; 01:6479
	dr $6479, $6ABC
SubtractAmountPaidFromMoney_:: ; 01:6ABC
	dr $6ABC, $6ADF
HandleItemListSwapping:: ; 01:6ADF
	dr $6ADF, $6BBB
DisplayPokemartDialogue_:: ; 01:6BBB
	dr $6BBB, $6EAB
LearnMove:: ; 01:6EAB
	dr $6EAB, $7121
DisplayPokemonCenterDialogue_:: ; 01:7121
	dr $7121, $724B
DisplayTextIDInit:: ; 01:724B
	dr $724B, $72C0
DrawStartMenu:: ; 01:72C0
	dr $72C0, $736B
CableClubNPC:: ; 01:736B
	dr $736B, $8000

SECTION "bank2",ROMX,BANK[$2]
INCLUDE "audio/engine_1.asm"


; an alternate start for MeetRival which has a different first measure
Music_RivalAlternateStart::
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld hl, wChannelCommandPointers
	ld de, Music_MeetRival_branch_b1a2
	call Audio1_OverwriteChannelPointer
	ld de, Music_MeetRival_branch_b21d
	call Audio1_OverwriteChannelPointer
	ld de, Music_MeetRival_branch_b2b5

Audio1_OverwriteChannelPointer:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret

; an alternate tempo for MeetRival which is slightly slower
Music_RivalAlternateTempo::
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld hl, wChannelCommandPointers
	ld de, Music_MeetRival_branch_b119
	jp Audio1_OverwriteChannelPointer

; applies both the alternate start and alternate tempo
Music_RivalAlternateStartAndTempo::
	call Music_RivalAlternateStart
	ld hl, wChannelCommandPointers
	ld de, Music_MeetRival_branch_b19b
	jp Audio1_OverwriteChannelPointer

; an alternate tempo for Cities1 which is used for the Hall of Fame room
Music_Cities1AlternateTempo::
	ld a, 10
	ld [wAudioFadeOutCounterReloadValue], a
	ld [wAudioFadeOutCounter], a
	ld a, $ff ; stop playing music after the fade-out is finished
	ld [wAudioFadeOutControl], a
	ld c, 100
	call DelayFrames ; wait for the fade-out to finish
	ld c, BANK(Music_Cities1)
	ld a, MUSIC_CITIES1
	call PlayMusic
	ld hl, wChannelCommandPointers
	ld de, Music_Cities1_branch_aa6f
	jp Audio1_OverwriteChannelPointer

INCLUDE "audio/music/pkmnhealed.asm"
INCLUDE "audio/music/routes1.asm"
INCLUDE "audio/music/routes2.asm"
INCLUDE "audio/music/routes3.asm"
INCLUDE "audio/music/routes4.asm"
INCLUDE "audio/music/indigoplateau.asm"
INCLUDE "audio/music/pallettown.asm"
INCLUDE "audio/music/unusedsong.asm"
INCLUDE "audio/music/cities1.asm"
INCLUDE "audio/sfx/get_item1_1.asm"
INCLUDE "audio/music/museumguy.asm"
INCLUDE "audio/music/meetprofoak.asm"
INCLUDE "audio/music/meetrival.asm"
INCLUDE "audio/sfx/pokedex_rating_1.asm"
INCLUDE "audio/sfx/get_item2_1.asm"
INCLUDE "audio/sfx/get_key_item_1.asm"
INCLUDE "audio/music/ssanne.asm"
INCLUDE "audio/music/cities2.asm"
INCLUDE "audio/music/celadon.asm"
INCLUDE "audio/music/cinnabar.asm"
INCLUDE "audio/music/vermilion.asm"
INCLUDE "audio/music/lavender.asm"
INCLUDE "audio/music/safarizone.asm"
INCLUDE "audio/music/gym.asm"
INCLUDE "audio/music/pokecenter.asm"

PlayBattleMusic::
	xor a
	ld [wAudioFadeOutControl], a
	ld [wLowHealthAlarm], a
	dec a
	ld [wNewSoundID], a
	call PlaySound ; stop music
	call DelayFrame
	ld c, BANK(Music_GymLeaderBattle)
	ld a, [wGymLeaderNo]
	and a
	jr z, .notGymLeaderBattle
	ld a, MUSIC_GYM_LEADER_BATTLE
	jr .playSong
.notGymLeaderBattle
	ld a, [wCurOpponent]
	cp 200
	jr c, .wildBattle
	cp OPP_SONY3
	jr z, .finalBattle
	cp OPP_LANCE
	jr nz, .normalTrainerBattle
	ld a, MUSIC_GYM_LEADER_BATTLE ; lance also plays gym leader theme
	jr .playSong
.normalTrainerBattle
	ld a, MUSIC_TRAINER_BATTLE
	jr .playSong
.finalBattle
	ld a, MUSIC_FINAL_BATTLE
	jr .playSong
.wildBattle
	ld a, MUSIC_WILD_BATTLE
.playSong
	jp PlayMusic

INCLUDE "audio/headers/sfxheaders1.asm"
INCLUDE "audio/headers/musicheaders1.asm"

INCLUDE "audio/sfx/snare1_1.asm"
INCLUDE "audio/sfx/snare2_1.asm"
INCLUDE "audio/sfx/snare3_1.asm"
INCLUDE "audio/sfx/snare4_1.asm"
INCLUDE "audio/sfx/snare5_1.asm"
INCLUDE "audio/sfx/triangle1_1.asm"
INCLUDE "audio/sfx/triangle2_1.asm"
INCLUDE "audio/sfx/snare6_1.asm"
INCLUDE "audio/sfx/snare7_1.asm"
INCLUDE "audio/sfx/snare8_1.asm"
INCLUDE "audio/sfx/snare9_1.asm"
INCLUDE "audio/sfx/cymbal1_1.asm"
INCLUDE "audio/sfx/cymbal2_1.asm"
INCLUDE "audio/sfx/cymbal3_1.asm"
INCLUDE "audio/sfx/muted_snare1_1.asm"
INCLUDE "audio/sfx/triangle3_1.asm"
INCLUDE "audio/sfx/muted_snare2_1.asm"
INCLUDE "audio/sfx/muted_snare3_1.asm"
INCLUDE "audio/sfx/muted_snare4_1.asm"

Audio1_WavePointers: INCLUDE "audio/wave_instruments.asm"

INCLUDE "audio/sfx/start_menu_1.asm"
INCLUDE "audio/sfx/pokeflute.asm"
INCLUDE "audio/sfx/cut_1.asm"
INCLUDE "audio/sfx/go_inside_1.asm"
INCLUDE "audio/sfx/swap_1.asm"
INCLUDE "audio/sfx/tink_1.asm"
INCLUDE "audio/sfx/59_1.asm"
INCLUDE "audio/sfx/purchase_1.asm"
INCLUDE "audio/sfx/collision_1.asm"
INCLUDE "audio/sfx/go_outside_1.asm"
INCLUDE "audio/sfx/press_ab_1.asm"
INCLUDE "audio/sfx/save_1.asm"
INCLUDE "audio/sfx/heal_hp_1.asm"
INCLUDE "audio/sfx/poisoned_1.asm"
INCLUDE "audio/sfx/heal_ailment_1.asm"
INCLUDE "audio/sfx/trade_machine_1.asm"
INCLUDE "audio/sfx/turn_on_pc_1.asm"
INCLUDE "audio/sfx/turn_off_pc_1.asm"
INCLUDE "audio/sfx/enter_pc_1.asm"
INCLUDE "audio/sfx/shrink_1.asm"
INCLUDE "audio/sfx/switch_1.asm"
INCLUDE "audio/sfx/healing_machine_1.asm"
INCLUDE "audio/sfx/teleport_exit1_1.asm"
INCLUDE "audio/sfx/teleport_enter1_1.asm"
INCLUDE "audio/sfx/teleport_exit2_1.asm"
INCLUDE "audio/sfx/ledge_1.asm"
INCLUDE "audio/sfx/teleport_enter2_1.asm"
INCLUDE "audio/sfx/fly_1.asm"
INCLUDE "audio/sfx/denied_1.asm"
INCLUDE "audio/sfx/arrow_tiles_1.asm"
INCLUDE "audio/sfx/push_boulder_1.asm"
INCLUDE "audio/sfx/ss_anne_horn_1.asm"
INCLUDE "audio/sfx/withdraw_deposit_1.asm"
INCLUDE "audio/sfx/safari_zone_pa.asm"
INCLUDE "audio/sfx/unused_1.asm"
INCLUDE "audio/sfx/cry09_1.asm"
INCLUDE "audio/sfx/cry23_1.asm"
INCLUDE "audio/sfx/cry24_1.asm"
INCLUDE "audio/sfx/cry11_1.asm"
INCLUDE "audio/sfx/cry25_1.asm"
INCLUDE "audio/sfx/cry03_1.asm"
INCLUDE "audio/sfx/cry0f_1.asm"
INCLUDE "audio/sfx/cry10_1.asm"
INCLUDE "audio/sfx/cry00_1.asm"
INCLUDE "audio/sfx/cry0e_1.asm"
INCLUDE "audio/sfx/cry06_1.asm"
INCLUDE "audio/sfx/cry07_1.asm"
INCLUDE "audio/sfx/cry05_1.asm"
INCLUDE "audio/sfx/cry0b_1.asm"
INCLUDE "audio/sfx/cry0c_1.asm"
INCLUDE "audio/sfx/cry02_1.asm"
INCLUDE "audio/sfx/cry0d_1.asm"
INCLUDE "audio/sfx/cry01_1.asm"
INCLUDE "audio/sfx/cry0a_1.asm"
INCLUDE "audio/sfx/cry08_1.asm"
INCLUDE "audio/sfx/cry04_1.asm"
INCLUDE "audio/sfx/cry19_1.asm"
INCLUDE "audio/sfx/cry16_1.asm"
INCLUDE "audio/sfx/cry1b_1.asm"
INCLUDE "audio/sfx/cry12_1.asm"
INCLUDE "audio/sfx/cry13_1.asm"
INCLUDE "audio/sfx/cry14_1.asm"
INCLUDE "audio/sfx/cry1e_1.asm"
INCLUDE "audio/sfx/cry15_1.asm"
INCLUDE "audio/sfx/cry17_1.asm"
INCLUDE "audio/sfx/cry1c_1.asm"
INCLUDE "audio/sfx/cry1a_1.asm"
INCLUDE "audio/sfx/cry1d_1.asm"
INCLUDE "audio/sfx/cry18_1.asm"
INCLUDE "audio/sfx/cry1f_1.asm"
INCLUDE "audio/sfx/cry20_1.asm"
INCLUDE "audio/sfx/cry21_1.asm"
INCLUDE "audio/sfx/cry22_1.asm"

	dr $BFF4, $4000 * $3

SECTION "bank3",ROMX,BANK[$3]
INCBIN "baserom.gbc", $4000 * $3, $529

PrintStrengthTxt:: ; 03:4529
	dr $C529, $C5E2
AddItemToInventory_:: ; 03:45E2
	dr $C5E2, $C652
RemoveItemFromInventory_:: ; 03:4652
	dr $C652, $CB75
PrintSafariZoneSteps:: ; 03:4B75
	dr $CB75, $CBBF
GetTileAndCoordsInFrontOfPlayer:: ; 03:4BBF
	dr $CBBF, $CBF7
GetTileTwoStepsInFrontOfPlayer:: ; 03:4BF7
	dr $CBF7, $CC44
CheckForCollisionWhenPushingBoulder:: ; 03:4C44
	dr $CC44, $CCD5
ApplyOutOfBattlePoisonDamage:: ; 03:4CD5
	dr $CCD5, $CD8D
LoadTilesetHeader:: ; 03:4D8D
	dr $CD8D, $ED0E
DrawBadges:: ; 03:6D0E
	dr $ED0E, $F1A9
ReplaceTileBlock:: ; 03:71A9
	dr $F1A9, $F262
UsedCut:: ; 03:7262
	dr $F262, $F427
LoadMissableObjects:: ; 03:7427
	dr $F427, $F445
MarkTownVisitedAndLoadMissableObjects:: ; 03:7445
	dr $F445, $F4D8
IsObjectHidden:: ; 03:74D8
	dr $F4D8, $F4FA
ShowObject:: ; 03:74FA
	dr $F4FA, $F4FA
ShowObject2:: ; 03:74FA
	dr $F4FA, $F509
HideObject:: ; 03:7509
	dr $F509, $F617
_AddPartyMon:: ; 03:7617
	dr $F617, $F7A9
LoadMovePPs:: ; 03:77A9
	dr $F7A9, $F99C
FlagActionPredef:: ; 03:799C
	dr $F99C, $F9DB
HealParty:: ; 03:79DB
	dr $F9DB, $FA54
DivideBCDPredef4:: ; 03:7A54
	dr $FA54, $FA54
DivideBCDPredef3:: ; 03:7A54
	dr $FA54, $FA54
DivideBCDPredef2:: ; 03:7A54
	dr $FA54, $FA54
DivideBCDPredef:: ; 03:7A54
	dr $FA54, $FB53
AddBCDPredef:: ; 03:7B53
	dr $FB53, $FB6C
SubBCDPredef:: ; 03:7B6C
	dr $FB6C, $FB86
InitPlayerData:: ; 03:7B86
	dr $FB86, $FB86
InitPlayerData2:: ; 03:7B86
	dr $FB86, $FBE0
GetQuantityOfItemInBag:: ; 03:7BE0
	dr $FBE0, $FBF5
FindPathToPlayer:: ; 03:7BF5
	dr $FBF5, $FC65
CalcPositionOfPlayerRelativeToNPC:: ; 03:7C65
	dr $FC65, $FCDF
ConvertNPCMovementDirectionsToJoypadMasks:: ; 03:7CDF
	dr $FCDF, $FD1B
HPBarLength:: ; 03:7D1B
	dr $FD1B, $FD5E
UpdateHPBar:: ; 03:7D5E
	dr $FD5E, $FD5E
UpdateHPBar2:: ; 03:7D5E
	dr $FD5E, $4000 * $4

SECTION "bank4",ROMX,BANK[$4]
MoveNames:: ; 04:4000
	dr $10000, $11AD7
UpdateSpriteFacingOffsetAndDelayMovement:: ; 04:5AD7
	dr $11AD7, $11AF8
StartMenu_Pokedex:: ; 04:5AF8
	dr $11AF8, $11B0C
StartMenu_Pokemon:: ; 04:5B0C
	dr $11B0C, $11DE6
StartMenu_Item:: ; 04:5DE6
	dr $11DE6, $11F60
StartMenu_TrainerInfo:: ; 04:5F60
	dr $11F60, $120E6
StartMenu_SaveReset:: ; 04:60E6
	dr $120E6, $120F9
StartMenu_Option:: ; 04:60F9
	dr $120F9, $12241
CanLearnTM:: ; 04:6241
	dr $12241, $12266
TMToMove:: ; 04:6266
	dr $12266, $13644
DrawHP:: ; 04:7644
	dr $13644, $1364B
DrawHP2:: ; 04:764B
	dr $1364B, $1369D
StatusScreen:: ; 04:769D
	dr $1369D, $13896
StatusScreen2:: ; 04:7896
	dr $13896, $4000 * $5

SECTION "bank5",ROMX,BANK[$5]
INCBIN "baserom.gbc", $4000 * $5, $3840

InitMapSprites:: ; 05:7840
	dr $17840, $17C47

EmotionBubble:: ; 05:7C47
	dr $17C47, $4000 * $6

SECTION "bank6",ROMX,BANK[$6]
INCBIN "baserom.gbc", $4000 * $6, $DEE

TrackPlayTime::
	dr ($6 * $4000) + $DEE, $4000 * $7

SECTION "bank7",ROMX,BANK[$7]
INCBIN "baserom.gbc", $4000 * $7, $270

DisplayElevatorFloorMenu:: ; 07:4270
	dr $1C270, $1FA99
PrintSafariGameOverText:: ; 07:7A99
	dr $1FA99, $4000 * $8

SECTION "bank8",ROMX,BANK[$8]

INCLUDE "engine/menu/bills_pc.asm"
INCLUDE "audio/engine_2.asm"

Music_PokeFluteInBattle::
	; begin playing the "caught mon" sound effect
	ld a, $9A ; SFX_CAUGHT_MON
	call PlaySoundWaitForCurrent
	; then immediately overwrtie the channel pointers
	ld hl, wChannelCommandPointers + Ch4 * 2
	ld de, SFX_08_PokeFlute_Ch4
	call Audio2_OverwriteChannelPointer
	ld de, SFX_08_PokeFlute_Ch5
	call Audio2_OverwriteChannelPointer
	ld de, SFX_08_PokeFlute_Ch6

Audio2_OverwriteChannelPointer:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret

INCLUDE "audio/sfx/pokeflute_ch4_ch5.asm"
INCLUDE "audio/sfx/unused2_2.asm"
INCLUDE "audio/music/gymleaderbattle.asm"
INCLUDE "audio/music/trainerbattle.asm"
INCLUDE "audio/music/wildbattle.asm"
INCLUDE "audio/music/finalbattle.asm"
INCLUDE "audio/sfx/level_up.asm"
INCLUDE "audio/sfx/get_item2_2.asm"
INCLUDE "audio/sfx/caught_mon.asm"
INCLUDE "audio/music/defeatedtrainer.asm"
INCLUDE "audio/music/defeatedwildmon.asm"
INCLUDE "audio/music/defeatedgymleader.asm"

Music_DoLowHealthAlarm::
	ld a, [wLowHealthAlarm]
	cp $ff
	jr z, .disableAlarm

	bit 7, a  ;alarm enabled?
	ret z     ;nope

	and $7f   ;low 7 bits are the timer.
	jr nz, .asm_21383 ;if timer > 0, play low tone.

	call .playToneHi
	ld a, 30 ;keep this tone for 30 frames.
	jr .asm_21395 ;reset the timer.

.asm_21383
	cp 20
	jr nz, .asm_2138a ;if timer == 20,
	call .playToneLo  ;actually set the sound registers.

.asm_2138a
	ld a, $86
	ld [wChannelSoundIDs + Ch4], a ;disable sound channel?
	ld a, [wLowHealthAlarm]
	and $7f ;decrement alarm timer.
	dec a

.asm_21395
	; reset the timer and enable flag.
	set 7, a
	ld [wLowHealthAlarm], a
	ret

.disableAlarm
	xor a
	ld [wLowHealthAlarm], a  ;disable alarm
	ld [wChannelSoundIDs + Ch4], a  ;re-enable sound channel?
	ld de, .toneDataSilence
	jr .playTone

;update the sound registers to change the frequency.
;the tone set here stays until we change it.
.playToneHi
	ld de, .toneDataHi
	jr .playTone

.playToneLo
	ld de, .toneDataLo

;update sound channel 1 to play the alarm, overriding all other sounds.
.playTone
	ld hl, rNR10 ;channel 1 sound register
	ld c, $5
	xor a

.copyLoop
	ld [hli], a
	ld a, [de]
	inc de
	dec c
	jr nz, .copyLoop
	ret

;bytes to write to sound channel 1 registers for health alarm.
;starting at FF11 (FF10 is always zeroed), so these bytes are:
;length, envelope, freq lo, freq hi
.toneDataHi
	db $A0,$E2,$50,$87

.toneDataLo
	db $B0,$E2,$EE,$86

;written to stop the alarm
.toneDataSilence
	db $00,$00,$00,$80

INCLUDE "audio/headers/sfxheaders2.asm"
INCLUDE "audio/headers/musicheaders2.asm"

INCLUDE "audio/sfx/snare1_2.asm"
INCLUDE "audio/sfx/snare2_2.asm"
INCLUDE "audio/sfx/snare3_2.asm"
INCLUDE "audio/sfx/snare4_2.asm"
INCLUDE "audio/sfx/snare5_2.asm"
INCLUDE "audio/sfx/triangle1_2.asm"
INCLUDE "audio/sfx/triangle2_2.asm"
INCLUDE "audio/sfx/snare6_2.asm"
INCLUDE "audio/sfx/snare7_2.asm"
INCLUDE "audio/sfx/snare8_2.asm"
INCLUDE "audio/sfx/snare9_2.asm"
INCLUDE "audio/sfx/cymbal1_2.asm"
INCLUDE "audio/sfx/cymbal2_2.asm"
INCLUDE "audio/sfx/cymbal3_2.asm"
INCLUDE "audio/sfx/muted_snare1_2.asm"
INCLUDE "audio/sfx/triangle3_2.asm"
INCLUDE "audio/sfx/muted_snare2_2.asm"
INCLUDE "audio/sfx/muted_snare3_2.asm"
INCLUDE "audio/sfx/muted_snare4_2.asm"

Audio2_WavePointers: INCLUDE "audio/wave_instruments.asm"

INCLUDE "audio/sfx/press_ab_2.asm"
INCLUDE "audio/sfx/start_menu_2.asm"
INCLUDE "audio/sfx/tink_2.asm"
INCLUDE "audio/sfx/heal_hp_2.asm"
INCLUDE "audio/sfx/heal_ailment_2.asm"
INCLUDE "audio/sfx/silph_scope.asm"
INCLUDE "audio/sfx/ball_toss.asm"
INCLUDE "audio/sfx/ball_poof.asm"
INCLUDE "audio/sfx/faint_thud.asm"
INCLUDE "audio/sfx/run.asm"
INCLUDE "audio/sfx/dex_page_added.asm"
INCLUDE "audio/sfx/pokeflute_ch6.asm"
INCLUDE "audio/sfx/peck.asm"
INCLUDE "audio/sfx/faint_fall.asm"
INCLUDE "audio/sfx/battle_09.asm"
INCLUDE "audio/sfx/pound.asm"
INCLUDE "audio/sfx/battle_0b.asm"
INCLUDE "audio/sfx/battle_0c.asm"
INCLUDE "audio/sfx/battle_0d.asm"
INCLUDE "audio/sfx/battle_0e.asm"
INCLUDE "audio/sfx/battle_0f.asm"
INCLUDE "audio/sfx/damage.asm"
INCLUDE "audio/sfx/not_very_effective.asm"
INCLUDE "audio/sfx/battle_12.asm"
INCLUDE "audio/sfx/battle_13.asm"
INCLUDE "audio/sfx/battle_14.asm"
INCLUDE "audio/sfx/vine_whip.asm"
INCLUDE "audio/sfx/battle_16.asm"
INCLUDE "audio/sfx/battle_17.asm"
INCLUDE "audio/sfx/battle_18.asm"
INCLUDE "audio/sfx/battle_19.asm"
INCLUDE "audio/sfx/super_effective.asm"
INCLUDE "audio/sfx/battle_1b.asm"
INCLUDE "audio/sfx/battle_1c.asm"
INCLUDE "audio/sfx/doubleslap.asm"
INCLUDE "audio/sfx/battle_1e.asm"
INCLUDE "audio/sfx/horn_drill.asm"
INCLUDE "audio/sfx/battle_20.asm"
INCLUDE "audio/sfx/battle_21.asm"
INCLUDE "audio/sfx/battle_22.asm"
INCLUDE "audio/sfx/battle_23.asm"
INCLUDE "audio/sfx/battle_24.asm"
INCLUDE "audio/sfx/battle_25.asm"
INCLUDE "audio/sfx/battle_26.asm"
INCLUDE "audio/sfx/battle_27.asm"
INCLUDE "audio/sfx/battle_28.asm"
INCLUDE "audio/sfx/battle_29.asm"
INCLUDE "audio/sfx/battle_2a.asm"
INCLUDE "audio/sfx/battle_2b.asm"
INCLUDE "audio/sfx/battle_2c.asm"
INCLUDE "audio/sfx/psybeam.asm"
INCLUDE "audio/sfx/battle_2e.asm"
INCLUDE "audio/sfx/battle_2f.asm"
INCLUDE "audio/sfx/psychic_m.asm"
INCLUDE "audio/sfx/battle_31.asm"
INCLUDE "audio/sfx/battle_32.asm"
INCLUDE "audio/sfx/battle_33.asm"
INCLUDE "audio/sfx/battle_34.asm"
INCLUDE "audio/sfx/battle_35.asm"
INCLUDE "audio/sfx/battle_36.asm"
INCLUDE "audio/sfx/unused_2.asm"
INCLUDE "audio/sfx/cry09_2.asm"
INCLUDE "audio/sfx/cry23_2.asm"
INCLUDE "audio/sfx/cry24_2.asm"
INCLUDE "audio/sfx/cry11_2.asm"
INCLUDE "audio/sfx/cry25_2.asm"
INCLUDE "audio/sfx/cry03_2.asm"
INCLUDE "audio/sfx/cry0f_2.asm"
INCLUDE "audio/sfx/cry10_2.asm"
INCLUDE "audio/sfx/cry00_2.asm"
INCLUDE "audio/sfx/cry0e_2.asm"
INCLUDE "audio/sfx/cry06_2.asm"
INCLUDE "audio/sfx/cry07_2.asm"
INCLUDE "audio/sfx/cry05_2.asm"
INCLUDE "audio/sfx/cry0b_2.asm"
INCLUDE "audio/sfx/cry0c_2.asm"
INCLUDE "audio/sfx/cry02_2.asm"
INCLUDE "audio/sfx/cry0d_2.asm"
INCLUDE "audio/sfx/cry01_2.asm"
INCLUDE "audio/sfx/cry0a_2.asm"
INCLUDE "audio/sfx/cry08_2.asm"
INCLUDE "audio/sfx/cry04_2.asm"
INCLUDE "audio/sfx/cry19_2.asm"
INCLUDE "audio/sfx/cry16_2.asm"
INCLUDE "audio/sfx/cry1b_2.asm"
INCLUDE "audio/sfx/cry12_2.asm"
INCLUDE "audio/sfx/cry13_2.asm"
INCLUDE "audio/sfx/cry14_2.asm"
INCLUDE "audio/sfx/cry1e_2.asm"
INCLUDE "audio/sfx/cry15_2.asm"
INCLUDE "audio/sfx/cry17_2.asm"
INCLUDE "audio/sfx/cry1c_2.asm"
INCLUDE "audio/sfx/cry1a_2.asm"
INCLUDE "audio/sfx/cry1d_2.asm"
INCLUDE "audio/sfx/cry18_2.asm"
INCLUDE "audio/sfx/cry1f_2.asm"
INCLUDE "audio/sfx/cry20_2.asm"
INCLUDE "audio/sfx/cry21_2.asm"
INCLUDE "audio/sfx/cry22_2.asm"

SECTION "bank9",ROMX,BANK[$9]
INCBIN "baserom.gbc", $4000 * $9, $3DF4

PrintMonType:: ; 09:7DF4
	dr $27DF4, $27E24
PrintMoveType:: ; 09:7E24
	dr $27E24, $4000 * $A

SECTION "bankA",ROMX,BANK[$A]
INCBIN "baserom.gbc", $4000 * $A, $4000

SECTION "bankB",ROMX,BANK[$B]
INCBIN "baserom.gbc", $4000 * $B, $3EE3

ScaleSpriteByTwo:: ; 0B:7EE3
	dr $2FEE3, $4000 * $C

SECTION "bankC",ROMX,BANK[$C]
INCBIN "baserom.gbc", $4000 * $C, $4000

SECTION "bankD",ROMX,BANK[$D]
INCBIN "baserom.gbc", $4000 * $D, $3DD3

PewterGuys:: ; 0D:7DD3
	dr $37DD3, $4000 * $E

SECTION "bankE",ROMX,BANK[$E]
INCBIN "baserom.gbc", $4000 * $E, $1068

MonsterNames:: ; 0E:5068
	dr $39068, $39D1C
TrainerNames:: ; 0E:5D1C
	dr $39D1C, $3AD11
PokeballTileGraphics:: ; 0E:6D11
	dr $3AD11, $3B0AF
EvolutionAfterBattle:: ; 0E:70AF
	dr $3B0AF, $3B326
LearnMoveFromLevelUp:: ; 0E:7326
	dr $3B326, $3B383
WriteMonMoves:: ; 0E:7383
	dr $3B383, $4000 * $F

SECTION "bankF",ROMX,BANK[$F]
INCBIN "baserom.gbc", $4000 * $F, $BA3

AnyPartyAlive:: ; 0F:4BA3
	dr $3CBA3, $3CEBE
DrawPlayerHUDAndHPBar:: ; 0F:4EBE
	dr $3CEBE, $3CF49
DrawEnemyHUDAndHPBar:: ; 0F:4F49
	dr $3CF49, $3D00D
DisplayBattleMenu:: ; 0F:500D
	dr $3D00D, $3EFF3
DoubleOrHalveSelectedStats:: ; 0F:6FF3
	dr $3EFF3, $3F20A
InitOpponent:: ; 0F:720A
	dr $3F20A, $3F366
AnimateSendingOutMon:: ; 0F:7366
	dr $3F366, $3F3BA
CopyUncompressedPicToTilemap:: ; 0F:73BA
	dr $3F3BA, $3F3F8
LoadMonBackPic:: ; 0F:73F8
	dr $3F3F8, $4000 * $10

SECTION "bank10",ROMX,BANK[$10]
ShowPokedexMenu:: ; 10:4000
	dr $40000, $402BA
ShowPokedexData:: ; 10:42BA
	dr $402BA, $42786
IndexToPokedex:: ; 10:6786
	dr $42786, $42858
InternalClockTradeAnim:: ; 10:6858
	dr $42858, $42869
ExternalClockTradeAnim:: ; 10:6869
	dr $42869, $42E69
PlayIntro:: ; 10:6E69
	dr $42E69, $4000 * $11

SECTION "bank11",ROMX,BANK[$11]
INCBIN "baserom.gbc", $4000 * $11, $28E

DisplayDexRating:: ; 11:428E
	dr $4428E, $4000 * $12

SECTION "bank12",ROMX,BANK[$12]
INCBIN "baserom.gbc", $4000 * $12, $EB

ChangeBGPalColor0_4Frames:: ; 12:40EB
	dr $480EB, $48103
PredefShakeScreenVertically:: ; 12:4103
	dr $48103, $48129
PredefShakeScreenHorizontally:: ; 12:4129
	dr $48129, $4000 * $13

SECTION "bank13",ROMX,BANK[$13]
INCBIN "baserom.gbc", $4000 * $13, $3EA5

INCLUDE "engine/predefs.asm"

	dr $4FFFE, $4000 * $14

SECTION "bank14",ROMX,BANK[$14]
INCBIN "baserom.gbc", $4000 * $14, $4000

SECTION "bank15",ROMX,BANK[$15]
INCBIN "baserom.gbc", $4000 * $15, $3EB9

TrainerEngage:: ; 15:7EB9
	dr $57EB9, $4000 * $16

SECTION "bank16",ROMX,BANK[$16]
INCBIN "baserom.gbc", $4000 * $16, $D99

OaksAideScript:: ; 16:4D99
	dr $58D99, $4000 * $17

SECTION "bank17",ROMX,BANK[$17]
INCBIN "baserom.gbc", $4000 * $17, $DC

StarterDex:: ; 17:40DC
	dr $5C0DC, $5F8BC
SetPartyMonTypes:: ; 17:78BC
	dr $5F8BC, $4000 * $18

SECTION "bank18",ROMX,BANK[$18]
INCBIN "baserom.gbc", $4000 * $18, $4000

SECTION "bank19",ROMX,BANK[$19]
INCBIN "baserom.gbc", $4000 * $19, $4000

SECTION "bank1A",ROMX,BANK[$1A]
INCBIN "baserom.gbc", $4000 * $1A, $4000

SECTION "bank1B",ROMX,BANK[$1B]
INCBIN "baserom.gbc", $4000 * $1B, $4000

SECTION "bank1C",ROMX,BANK[$1C]
HallOfFamePC:: ; 1C:4000
	dr $70000, $70A61
EnterMapAnim:: ; 1C:4A61
	dr $70A61, $70B0B
_LeaveMapAnim:: ; 1C:4B0B
	dr $70B0B, $70ED9
BattleTransition:: ; 1C:4ED9
	dr $70ED9, $710C9
FlashScreen:: ; 1C:50C9
	dr $710C9, $714CE
LoadTownMap_Nest:: ; 1C:54CE
	dr $714CE, $71F9D
DoInGameTradeDialogue:: ; 1C:5F9D
	dr $71F9D, $723BF
_RunPaletteCommand:: ; 1C:63BF
	dr $723BF, $72604
LoadSGB:: ; 1C:6604
	dr $72604, $73A3E
LoadSAV:: ; 1C:7A3E
	dr $73A3E, $73B27
LoadSAV2:: ; 1C:7B27
	dr $73B27, $73B74
SaveSAV:: ; 1C:7B74
	dr $73B74, $73C26
SaveSAVtoSRAM0:: ; 1C:7C26
	dr $73C26, $73C7D
SaveSAVtoSRAM1:: ; 1C:7C7D
	dr $73C7D, $73CAA
SaveSAVtoSRAM2:: ; 1C:7CAA
	dr $73CAA, $73D1B
ChangeBox:: ; 1C:7D1B
	dr $73D1B, $4000 * $1D

SECTION "bank1D",ROMX,BANK[$1D]
INCBIN "baserom.gbc", $4000 * $1D, $E36

VendingMachineMenu:: ; 1D:4E36
	dr $74E36, $4000 * $1E

SECTION "bank1E",ROMX,BANK[$1E]
INCBIN "baserom.gbc", $4000 * $1E, $D99

MoveAnimation:: ; 1E:4D99
	dr $78D99, $798A0
GetMoveSoundB:: ; 1E:58A0
	dr $798A0, $79AF1
CopyDownscaledMonTiles:: ; 1E:5AF1
	dr $79AF1, $79E04
CopyTileIDsFromList:: ; 1E:5E04
	dr $79E04, $4000 * $1F

SECTION "bank1F",ROMX,BANK[$1F]
INCLUDE "audio/music/credits.asm"

PlayPokedexRatingSfx::
	ld a, [$ffdc]
	ld c, $0
	ld hl, OwnedMonValues
.getSfxPointer
	cp [hl]
	jr c, .gotSfxPointer
	inc c
	inc hl
	jr .getSfxPointer
.gotSfxPointer
	push bc
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySoundWaitForCurrent
	pop bc
	ld b, $0
	ld hl, PokedexRatingSfxPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld c, [hl]
	call PlayMusic
	jp PlayDefaultMusic

PokedexRatingSfxPointers:
	db $A5, $1F
	db $91,  2              ; 2
	db $86,  2              ; 4
	db $9A,  8              ; 6
	db $86,  8              ; 8
	db $94,  2              ; 10
	db $89,  2              ; 12

OwnedMonValues: ; 7d170 (1f:5170)
	db 10, 40, 60, 90, 120, 150, $ff

Audio3_UpdateMusic::
	dr $7C417, $7CB8A

Audio3_PlaySound::
	dr $7CB8A, $7CE5B

INCLUDE "audio/music/bikeriding.asm"
INCLUDE "audio/music/dungeon1.asm"
INCLUDE "audio/music/gamecorner.asm"
INCLUDE "audio/music/titlescreen.asm"
INCLUDE "audio/sfx/get_item1_3.asm"
INCLUDE "audio/music/dungeon2.asm"
INCLUDE "audio/music/dungeon3.asm"
INCLUDE "audio/music/cinnabarmansion.asm"
INCLUDE "audio/sfx/pokedex_rating_3.asm"
INCLUDE "audio/sfx/get_item2_3.asm"
INCLUDE "audio/sfx/get_key_item_3.asm"
INCLUDE "audio/music/oakslab.asm"
INCLUDE "audio/music/pokemontower.asm"
INCLUDE "audio/music/silphco.asm"
INCLUDE "audio/music/meeteviltrainer.asm"
INCLUDE "audio/music/meetfemaletrainer.asm"
INCLUDE "audio/music/meetmaletrainer.asm"
INCLUDE "audio/music/introbattle.asm"
INCLUDE "audio/music/surfing.asm"
INCLUDE "audio/music/jigglypuffsong.asm"
INCLUDE "audio/music/halloffame.asm"

INCLUDE "audio/headers/sfxheaders3.asm"
INCLUDE "audio/headers/musicheaders3.asm"

INCLUDE "audio/sfx/snare1_3.asm"
INCLUDE "audio/sfx/snare2_3.asm"
INCLUDE "audio/sfx/snare3_3.asm"
INCLUDE "audio/sfx/snare4_3.asm"
INCLUDE "audio/sfx/snare5_3.asm"
INCLUDE "audio/sfx/triangle1_3.asm"
INCLUDE "audio/sfx/triangle2_3.asm"
INCLUDE "audio/sfx/snare6_3.asm"
INCLUDE "audio/sfx/snare7_3.asm"
INCLUDE "audio/sfx/snare8_3.asm"
INCLUDE "audio/sfx/snare9_3.asm"
INCLUDE "audio/sfx/cymbal1_3.asm"
INCLUDE "audio/sfx/cymbal2_3.asm"
INCLUDE "audio/sfx/cymbal3_3.asm"
INCLUDE "audio/sfx/muted_snare1_3.asm"
INCLUDE "audio/sfx/triangle3_3.asm"
INCLUDE "audio/sfx/muted_snare2_3.asm"
INCLUDE "audio/sfx/muted_snare3_3.asm"
INCLUDE "audio/sfx/muted_snare4_3.asm"

Audio3_WavePointers: INCLUDE "audio/wave_instruments.asm"

INCLUDE "audio/sfx/start_menu_3.asm"
INCLUDE "audio/sfx/cut_3.asm"
INCLUDE "audio/sfx/go_inside_3.asm"
INCLUDE "audio/sfx/swap_3.asm"
INCLUDE "audio/sfx/tink_3.asm"
INCLUDE "audio/sfx/59_3.asm"
INCLUDE "audio/sfx/purchase_3.asm"
INCLUDE "audio/sfx/collision_3.asm"
INCLUDE "audio/sfx/go_outside_3.asm"
INCLUDE "audio/sfx/press_ab_3.asm"
INCLUDE "audio/sfx/save_3.asm"
INCLUDE "audio/sfx/heal_hp_3.asm"
INCLUDE "audio/sfx/poisoned_3.asm"
INCLUDE "audio/sfx/heal_ailment_3.asm"
INCLUDE "audio/sfx/trade_machine_3.asm"
INCLUDE "audio/sfx/turn_on_pc_3.asm"
INCLUDE "audio/sfx/turn_off_pc_3.asm"
INCLUDE "audio/sfx/enter_pc_3.asm"
INCLUDE "audio/sfx/shrink_3.asm"
INCLUDE "audio/sfx/switch_3.asm"
INCLUDE "audio/sfx/healing_machine_3.asm"
INCLUDE "audio/sfx/teleport_exit1_3.asm"
INCLUDE "audio/sfx/teleport_enter1_3.asm"
INCLUDE "audio/sfx/teleport_exit2_3.asm"
INCLUDE "audio/sfx/ledge_3.asm"
INCLUDE "audio/sfx/teleport_enter2_3.asm"
INCLUDE "audio/sfx/fly_3.asm"
INCLUDE "audio/sfx/denied_3.asm"
INCLUDE "audio/sfx/arrow_tiles_3.asm"
INCLUDE "audio/sfx/push_boulder_3.asm"
INCLUDE "audio/sfx/ss_anne_horn_3.asm"
INCLUDE "audio/sfx/withdraw_deposit_3.asm"
INCLUDE "audio/sfx/intro_lunge.asm"
INCLUDE "audio/sfx/intro_hip.asm"
INCLUDE "audio/sfx/intro_hop.asm"
INCLUDE "audio/sfx/intro_raise.asm"
INCLUDE "audio/sfx/intro_crash.asm"
INCLUDE "audio/sfx/intro_whoosh.asm"
INCLUDE "audio/sfx/slots_stop_wheel.asm"
INCLUDE "audio/sfx/slots_reward.asm"
INCLUDE "audio/sfx/slots_new_spin.asm"
INCLUDE "audio/sfx/shooting_star.asm"
INCLUDE "audio/sfx/unused_3.asm"
INCLUDE "audio/sfx/cry09_3.asm"
INCLUDE "audio/sfx/cry23_3.asm"
INCLUDE "audio/sfx/cry24_3.asm"
INCLUDE "audio/sfx/cry11_3.asm"
INCLUDE "audio/sfx/cry25_3.asm"
INCLUDE "audio/sfx/cry03_3.asm"
INCLUDE "audio/sfx/cry0f_3.asm"
INCLUDE "audio/sfx/cry10_3.asm"
INCLUDE "audio/sfx/cry00_3.asm"
INCLUDE "audio/sfx/cry0e_3.asm"
INCLUDE "audio/sfx/cry06_3.asm"
INCLUDE "audio/sfx/cry07_3.asm"
INCLUDE "audio/sfx/cry05_3.asm"
INCLUDE "audio/sfx/cry0b_3.asm"
INCLUDE "audio/sfx/cry0c_3.asm"
INCLUDE "audio/sfx/cry02_3.asm"
INCLUDE "audio/sfx/cry0d_3.asm"
INCLUDE "audio/sfx/cry01_3.asm"
INCLUDE "audio/sfx/cry0a_3.asm"
INCLUDE "audio/sfx/cry08_3.asm"
INCLUDE "audio/sfx/cry04_3.asm"
INCLUDE "audio/sfx/cry19_3.asm"
INCLUDE "audio/sfx/cry16_3.asm"
INCLUDE "audio/sfx/cry1b_3.asm"
INCLUDE "audio/sfx/cry12_3.asm"
INCLUDE "audio/sfx/cry13_3.asm"
INCLUDE "audio/sfx/cry14_3.asm"
INCLUDE "audio/sfx/cry1e_3.asm"
INCLUDE "audio/sfx/cry15_3.asm"
INCLUDE "audio/sfx/cry17_3.asm"
INCLUDE "audio/sfx/cry1c_3.asm"
INCLUDE "audio/sfx/cry1a_3.asm"
INCLUDE "audio/sfx/cry1d_3.asm"
INCLUDE "audio/sfx/cry18_3.asm"
INCLUDE "audio/sfx/cry1f_3.asm"
INCLUDE "audio/sfx/cry20_3.asm"
INCLUDE "audio/sfx/cry21_3.asm"
INCLUDE "audio/sfx/cry22_3.asm"

	dr $7FFFC, $80000
