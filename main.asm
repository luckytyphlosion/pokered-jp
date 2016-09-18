INCLUDE "constants.asm"

IMPORT SFX_Shooting_Star
IMPORT Music_PalletTown

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

INCLUDE "data/facing.asm"

MewPicFront:: INCBIN "pic/rgmon/mew.pic"
MewPicBack::  INCBIN "pic/monback/mewb.pic"
INCLUDE "data/baseStats/mew.asm"

INCLUDE "data/item_prices.asm"
INCLUDE "text/item_names.asm"
INCLUDE "text/unused_names.asm"

INCLUDE "engine/overworld/oam.asm"
INCLUDE "engine/oam_dma.asm"
INCLUDE "engine/titlescreen.asm"

INCLUDE "engine/print_waiting_text.asm"

INCLUDE "engine/overworld/map_sprite_functions1.asm"

INCLUDE "engine/test_battle.asm"

INCLUDE "engine/overworld/item.asm"
INCLUDE "engine/overworld/movement.asm"

INCLUDE "engine/cable_club.asm"

INCLUDE "engine/menu/main_menu.asm"

INCLUDE "engine/oak_speech.asm"

INCLUDE "engine/special_warps.asm"

INCLUDE "engine/debug1.asm"

INCLUDE "engine/menu/naming_screen.asm"

INCLUDE "engine/oak_speech2.asm"

INCLUDE "engine/subtract_paid_money.asm"

INCLUDE "engine/menu/swap_items.asm"

INCLUDE "engine/overworld/pokemart.asm"

INCLUDE "engine/learn_move.asm"

DisplayPokemonCenterDialogue_:: ; 01:7121
	dr $7121, $724B
DisplayTextIDInit:: ; 01:724B
	dr $724B, $72C0
DrawStartMenu:: ; 01:72C0
	dr $72C0, $736B
CableClubNPC:: ; 01:736B
	dr $736B, $754C
CloseLinkConnection:: ; 01:754C
	dr $754C, $755F
ResetStatusAndHalveMoneyOnBlackout:: ; 01:755F
	dr $755F, $75C1

INCLUDE "engine/load_mon_data.asm"

	dr $7613, $766C
DisplayTextBoxID_:: ; 01:766C
	dr $766C, $7BF8
PlayerPC:: ; 01:7BF8
	dr $7BF8, $7F19
_RemovePokemon:: ; 01:7F19
	dr $7F19, $7FC9
_DisplayPokedex:: ; 01:7FC9
	dr $7FC9, $8000

SECTION "bank3",ROMX,BANK[$3]
INCBIN "baserom.gbc", $4000 * $3, $529

PrintStrengthTxt:: ; 03:4529
	dr $C529, $C5E2
AddItemToInventory_:: ; 03:45E2
	dr $C5E2, $C652
RemoveItemFromInventory_:: ; 03:4652
	dr $C652, $C693
MapSongBanks:: ; 03:4693
	dr $C693, $C883
MapHeaderBanks:: ; 03:4883
	dr $C883, $C97B
ClearVariablesAfterLoadingMapData:: ; 03:497B
	dr $C97B, $C9A5
IsPlayerStandingOnWarp:: ; 03:49A5
	dr $C9A5, $C9D1
CheckForceBikeOrSurf:: ; 03:49D1
	dr $C9D1, $CA45
IsPlayerFacingEdgeOfMap:: ; 03:4A45
	dr $CA45, $CA94
IsWarpTileInFrontOfPlayer:: ; 03:4A94
	dr $CA94, $CAE3
IsPlayerStandingOnDoorTileOrWarpTile:: ; 03:4AE3
	dr $CAE3, $CB75
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
	dr $CD8D, $CF2E
LoadWildData:: ; 03:4F2E
	dr $CF2E, $D63D
UseItem_:: ; 03:563D
	dr $D63D, $E9C4
TossItem_:: ; 03:69C4
	dr $E9C4, $EA6F
IsKeyItem_:: ; 03:6A6F
	dr $EA6F, $EAAF
SendNewMonToBox:: ; 03:6AAF
	dr $EAAF, $ED0E
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
	dr $F509, $F557
TryPushingBoulder:: ; 03:7557
	dr $F557, $F5E7
DoBoulderDustAnimation:: ; 03:75E7
	dr $F5E7, $F617
_AddPartyMon:: ; 03:7617
	dr $F617, $F7A9
LoadMovePPs:: ; 03:77A9
	dr $F7A9, $F7D3
_AddEnemyMonToPlayerParty:: ; 03:77D3
	dr $F7D3, $F854
_MoveMon:: ; 03:7854
	dr $F854, $F99C
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
	dr $FD5E, $FE8A
PrintBookshelfText:: ; 03:7E8A
	dr $FE8A, $4000 * $4

SECTION "bank4",ROMX,BANK[$4]

INCLUDE "text/move_names.asm"

PokemonLogoGraphics:            INCBIN "gfx/pokemon_logo.2bpp"
FontGraphics:                   INCBIN "gfx/font.1bpp"
FontGraphicsEnd:
ABTiles:                        INCBIN "gfx/AB.2bpp"
HpBarAndStatusGraphics:         INCBIN "gfx/hp_bar_and_status.2bpp"
HpBarAndStatusGraphicsEnd:
BattleHudTiles1:                INCBIN "gfx/battle_hud1.1bpp"
BattleHudTiles1End:
BattleHudTiles2:                INCBIN "gfx/battle_hud2.1bpp"
BattleHudTiles3:                INCBIN "gfx/battle_hud3.1bpp"
BattleHudTiles3End:
CopyrightGraphics::             INCBIN "gfx/copyright.2bpp"
CopyrightGraphicsEnd::
TextBoxGraphics:                INCBIN "gfx/text_box.2bpp"
TextBoxGraphicsEnd:
PokedexTileGraphics:            INCBIN "gfx/pokedex.2bpp"
PokedexTileGraphicsEnd:
WorldMapTileGraphics:           INCBIN "gfx/town_map.2bpp"
WorldMapTileGraphicsEnd:
PlayerCharacterTitleGraphics:   INCBIN "gfx/player_title.2bpp"
PlayerCharacterTitleGraphicsEnd:

RedPicFront:: ; 04:5941
	dr $11941, $11A4B
ShrinkPic1:: ; 04:5A4B
	dr $11A4B, $11AA5
ShrinkPic2:: ; 04:5A4B
	dr $11AA5, $11AD7
UpdateSpriteFacingOffsetAndDelayMovement:: ; 04:5AD7
	dr $11AD7, $11AF8
StartMenu_Pokedex:: ; 04:5AF8
	dr $11AF8, $11B0C
StartMenu_Pokemon:: ; 04:5B0C
	dr $11B0C, $11DD1
ErasePartyMenuCursors:: ; 04:5DD1
	dr $11DD1, $11DE6
StartMenu_Item:: ; 04:5DE6
	dr $11DE6, $11F60
StartMenu_TrainerInfo:: ; 04:5F60
	dr $11F60, $120E6
StartMenu_SaveReset:: ; 04:60E6
	dr $120E6, $120F9
StartMenu_Option:: ; 04:60F9
	dr $120F9, $12116
SwitchPartyMon:: ; 04:6116
	dr $12116, $12241
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
	dr $13896, $13A0C
DrawPartyMenu_:: ; 04:7A0C
	dr $13A0C, $13A1D
RedrawPartyMenu_:: ; 04:7A1D
	dr $13A1D, $13FB3
GetTrainerName_:: ; 04:7FB3
	dr $13FB3, $13FEA
Random_:: ; 04:7FEA
	dr $13FEA, $4000 * $5

SECTION "bank5",ROMX,BANK[$5]
RedCyclingSprite:     INCBIN "gfx/sprites/cycling.2bpp"
RedSprite:            INCBIN "gfx/sprites/red.2bpp"
BlueSprite:           INCBIN "gfx/sprites/blue.2bpp"
OakSprite:            INCBIN "gfx/sprites/oak.2bpp"
BugCatcherSprite:     INCBIN "gfx/sprites/bug_catcher.2bpp"
SlowbroSprite:        INCBIN "gfx/sprites/slowbro.2bpp"
LassSprite:           INCBIN "gfx/sprites/lass.2bpp"
BlackHairBoy1Sprite:  INCBIN "gfx/sprites/black_hair_boy_1.2bpp"
LittleGirlSprite:     INCBIN "gfx/sprites/little_girl.2bpp"
BirdSprite:           INCBIN "gfx/sprites/bird.2bpp"
FatBaldGuySprite:     INCBIN "gfx/sprites/fat_bald_guy.2bpp"
GamblerSprite:        INCBIN "gfx/sprites/gambler.2bpp"
BlackHairBoy2Sprite:  INCBIN "gfx/sprites/black_hair_boy_2.2bpp"
GirlSprite:           INCBIN "gfx/sprites/girl.2bpp"
HikerSprite:          INCBIN "gfx/sprites/hiker.2bpp"
FoulardWomanSprite:   INCBIN "gfx/sprites/foulard_woman.2bpp"
GentlemanSprite:      INCBIN "gfx/sprites/gentleman.2bpp"
DaisySprite:          INCBIN "gfx/sprites/daisy.2bpp"
BikerSprite:          INCBIN "gfx/sprites/biker.2bpp"
SailorSprite:         INCBIN "gfx/sprites/sailor.2bpp"
CookSprite:           INCBIN "gfx/sprites/cook.2bpp"
BikeShopGuySprite:    INCBIN "gfx/sprites/bike_shop_guy.2bpp"
MrFujiSprite:         INCBIN "gfx/sprites/mr_fuji.2bpp"
GiovanniSprite:       INCBIN "gfx/sprites/giovanni.2bpp"
RocketSprite:         INCBIN "gfx/sprites/rocket.2bpp"
MediumSprite:         INCBIN "gfx/sprites/medium.2bpp"
WaiterSprite:         INCBIN "gfx/sprites/waiter.2bpp"
ErikaSprite:          INCBIN "gfx/sprites/erika.2bpp"
MomGeishaSprite:      INCBIN "gfx/sprites/mom_geisha.2bpp"
BrunetteGirlSprite:   INCBIN "gfx/sprites/brunette_girl.2bpp"
LanceSprite:          INCBIN "gfx/sprites/lance.2bpp"
MomSprite:            INCBIN "gfx/sprites/mom.2bpp"
BaldingGuySprite:     INCBIN "gfx/sprites/balding_guy.2bpp"
YoungBoySprite:       INCBIN "gfx/sprites/young_boy.2bpp"
GameboyKidSprite:     INCBIN "gfx/sprites/gameboy_kid.2bpp"
ClefairySprite:       INCBIN "gfx/sprites/clefairy.2bpp"
AgathaSprite:         INCBIN "gfx/sprites/agatha.2bpp"
BrunoSprite:          INCBIN "gfx/sprites/bruno.2bpp"
LoreleiSprite:        INCBIN "gfx/sprites/lorelei.2bpp"
SeelSprite:           INCBIN "gfx/sprites/seel.2bpp"

InitMapSprites:: ; 05:7840
	dr $17840, $17C47

EmotionBubble:: ; 05:7C47
	dr $17C47, $17E34

ActivatePC:: ; 05:7E34
	dr $17E34, $4000 * $6

SECTION "bank6",ROMX,BANK[$6]
INCBIN "baserom.gbc", $4000 * $6, $DEE

TrackPlayTime:: ; 06:4DEE
	dr $18DEE, $1BC98
PlayerStepOutFromDoor:: ; 06:7C98
	dr $1BC98, $1BCD5
_EndNPCMovementScript:: ; 06:7CD5
	dr $1BCD5, $1BCFA
PalletMovementScriptPointerTable:: ; 06:7CFA
	dr $1BCFA, $1BDC8
PewterMuseumGuyMovementScriptPointerTable:: ; 06:7DC8
	dr $1BDC8, $1BE35
PewterGymGuyMovementScriptPointerTable:: ; 06:7E35
	dr $1BE35, $1BE9F
FreezeEnemyTrainerSprite:: ; 06:7E9F
	dr $1BE9F, $1BF2A
HandleLedges:: ; 06:7F2A
	dr $1BF2A, $4000 * $7

SECTION "bank7",ROMX,BANK[$7]
INCBIN "baserom.gbc", $4000 * $7, $21E

DoClearSaveDialogue:: ; 07:421E
	dr $1C21E, $1C270
DisplayElevatorFloorMenu:: ; 07:4270
	dr $1C270, $1FA34
SafariZoneCheck:: ; 07:7A34
	dr $1FA34, $1FA43
SafariZoneCheckSteps:: ; 07:7A43
	dr $1FA43, $1FA99
PrintSafariGameOverText:: ; 07:7A99
	dr $1FA99, $1FD15
UpdateCinnabarGymGateTileBlocks_:: ; 07:7D15
	dr $1FD15, $4000 * $8

SECTION "bank9",ROMX,BANK[$9]
INCBIN "baserom.gbc", $4000 * $9, $3DF4

PrintMonType:: ; 09:7DF4
	dr $27DF4, $27E24
PrintMoveType:: ; 09:7E24
	dr $27E24, $27EB2
SaveTrainerName:: ; 09:7EB2
	dr $27EB2, $4000 * $A
SECTION "bankA",ROMX,BANK[$A]
INCBIN "baserom.gbc", $4000 * $A, $4000

SECTION "bankB",ROMX,BANK[$B]
INCBIN "baserom.gbc", $4000 * $B, $3BF6

TrainerInfoTextBoxTileGraphics:: ; 0B:7BF6
	dr $2FBF6, $2FC86
TrainerInfoTextBoxTileGraphicsEnd:: ; 0B:7C86
	dr $2FC86, $2FEE3
ScaleSpriteByTwo:: ; 0B:7EE3
	dr $2FEE3, $4000 * $C

SECTION "bankC",ROMX,BANK[$C]
INCBIN "baserom.gbc", $4000 * $C, $4000

SECTION "bankD",ROMX,BANK[$D]
INCBIN "baserom.gbc", $4000 * $D, $3DD3

PewterGuys:: ; 0D:7DD3
	dr $37DD3, $37E73
_Multiply:: ; 0D:7E73
	dr $37E73, $37ED7
_Divide:: ; 0D:7ED7
	dr $37ED7, $4000 * $E

SECTION "bankE",ROMX,BANK[$E]
BaseStats:: ; 0E:4000
	dr $38000, $39068

INCLUDE "text/monster_names.asm"
INCLUDE "data/cries.asm"
INCLUDE "data/moves.asm"

	dr $39A36, $39C31

INCLUDE "engine/battle/trainer_pic_money_pointers.asm"
INCLUDE "text/trainer_names.asm"

FormatMovesString:: ; 0E:5E5F
	dr $39E5F, $39EAD
InitList:: ; 0E:5EAD
	dr $39EAD, $39F0F
GetMonSpecies:: ; 0E:5F0F
	dr $39F0F, $3AD11
PokeballTileGraphics:: ; 0E:6D11
	dr $3AD11, $3B0A1
TryEvolvingMon:: ; 0E:70A1
	dr $3B0A1, $3B0AF
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
	dr $3D00D, $3EDF1
LoadEnemyMonData:: ; 0F:6DF1
	dr $3EDF1, $3EFF3
DoubleOrHalveSelectedStats:: ; 0F:6FF3
	dr $3EFF3, $3F14C
LoadHudTilePatterns:: ; 0F:714C
	dr $3F14C, $3F204
InitBattle:: ; 0F:7204
	dr $3F204, $3F20A
InitOpponent:: ; 0F:720A
	dr $3F20A, $3F366
AnimateSendingOutMon:: ; 0F:7366
	dr $3F366, $3F3BA
CopyUncompressedPicToTilemap:: ; 0F:73BA
	dr $3F3BA, $3F3C5
CopyUncompressedPicToHL:: ; 0F:73C5
	dr $3F3C5, $3F3F8
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
	dr $4428E, $457B0
LoadSpinnerArrowTiles:: ; 11:57B0
	dr $457B0, $478C5
CheckForHiddenObject:: ; 11:78C5
	dr $478C5, $4000 * $12

SECTION "bank12",ROMX,BANK[$12]
INCBIN "baserom.gbc", $4000 * $12, $EB

ChangeBGPalColor0_4Frames:: ; 12:40EB
	dr $480EB, $48103
PredefShakeScreenVertically:: ; 12:4103
	dr $48103, $48129
PredefShakeScreenHorizontally:: ; 12:4129
	dr $48129, $4000 * $13

SECTION "bank13",ROMX,BANK[$13]

TrainerPics::
YoungsterPic::     INCBIN "pic/trainer/youngster.pic"
BugCatcherPic::    INCBIN "pic/trainer/bugcatcher.pic"
LassPic::          INCBIN "pic/trainer/lass.pic"
SailorPic::        INCBIN "pic/trainer/sailor.pic"
JrTrainerMPic::    INCBIN "pic/trainer/jr.trainerm.pic"
JrTrainerFPic::    INCBIN "pic/trainer/jr.trainerf.pic"
PokemaniacPic::    INCBIN "pic/trainer/pokemaniac.pic"
SuperNerdPic::     INCBIN "pic/trainer/supernerd.pic"
HikerPic::         INCBIN "pic/trainer/hiker.pic"
BikerPic::         INCBIN "pic/trainer/biker.pic"
BurglarPic::       INCBIN "pic/trainer/burglar.pic"
EngineerPic::      INCBIN "pic/trainer/engineer.pic"
FisherPic::        INCBIN "pic/trainer/fisher.pic"
SwimmerPic::       INCBIN "pic/trainer/swimmer.pic"
CueBallPic::       INCBIN "pic/trainer/cueball.pic"
GamblerPic::       INCBIN "pic/trainer/gambler.pic"
BeautyPic::        INCBIN "pic/trainer/beauty.pic"
PsychicPic::       INCBIN "pic/trainer/psychic.pic"
RockerPic::        INCBIN "pic/trainer/rocker.pic"
JugglerPic::       INCBIN "pic/trainer/juggler.pic"
TamerPic::         INCBIN "pic/trainer/tamer.pic"
BirdKeeperPic::    INCBIN "pic/trainer/birdkeeper.pic"
BlackbeltPic::     INCBIN "pic/trainer/blackbelt.pic"
Rival1Pic::        INCBIN "pic/trainer/rival1.pic"
ProfOakPic::       INCBIN "pic/trainer/prof.oak.pic"
ChiefPic::
ScientistPic::     INCBIN "pic/trainer/scientist.pic"
GiovanniPic::      INCBIN "pic/trainer/giovanni.pic"
RocketPic::        INCBIN "pic/trainer/rocket.pic"
CooltrainerMPic::  INCBIN "pic/trainer/cooltrainerm.pic"
CooltrainerFPic::  INCBIN "pic/trainer/cooltrainerf.pic"
BrunoPic::         INCBIN "pic/trainer/bruno.pic"
BrockPic::         INCBIN "pic/trainer/brock.pic"
MistyPic::         INCBIN "pic/trainer/misty.pic"
LtSurgePic::       INCBIN "pic/trainer/lt.surge.pic"
ErikaPic::         INCBIN "pic/trainer/erika.pic"
KogaPic::          INCBIN "pic/trainer/koga.pic"
BlainePic::        INCBIN "pic/trainer/blaine.pic"
SabrinaPic::       INCBIN "pic/trainer/sabrina.pic"
GentlemanPic::     INCBIN "pic/trainer/gentleman.pic"
Rival2Pic::        INCBIN "pic/trainer/rival2.pic"
Rival3Pic::        INCBIN "pic/trainer/rival3.pic"
LoreleiPic::       INCBIN "pic/trainer/lorelei.pic"
ChannelerPic::     INCBIN "pic/trainer/channeler.pic"
AgathaPic::        INCBIN "pic/trainer/agatha.pic"
LancePic::         INCBIN "pic/trainer/lance.pic"

	dr $4FD04, $4FDA1

INCLUDE "engine/give_pokemon.asm"
INCLUDE "engine/predefs.asm"

	dr $4FFFE, $4000 * $14

SECTION "bank14",ROMX,BANK[$14]
	dr $50000, $53AB3

CeladonPrizeMenu:: ; 14:7AB3
	dr $53AB3, $4000 * $15

SECTION "bank15",ROMX,BANK[$15]
	dr $4000 * $15, $57DA3

_GetSpritePosition1:: ; 15:7DA3
	dr $57DA3, $57DC3
_GetSpritePosition2:: ; 15:7DC3
	dr $57DC3, $57DE7
_SetSpritePosition1:: ; 15:7DE7
	dr $57DE7, $57E07
_SetSpritePosition2:: ; 15:7E07
	dr $57E07, $57E2B
TrainerWalkUpToPlayer:: ; 15:7E2B
	dr $57E2B, $57EB9
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

Version_GFX:: ; 1A:4000
	dr $68000, $68050
Version_GFXEnd:: ; 1A:4050
	dr $68050, $4000 * $1B

SECTION "bank1B",ROMX,BANK[$1B]
INCBIN "baserom.gbc", $4000 * $1B, $3670

Club_GFX:: ; 1B:7670
	dr $6F670, $70000

SECTION "bank1C",ROMX,BANK[$1C]
HallOfFamePC:: ; 1C:4000
	dr $70000, $70A61
EnterMapAnim:: ; 1C:4A61
	dr $70A61, $70B0B
_LeaveMapAnim:: ; 1C:4B0B
	dr $70B0B, $70CD8
IsPlayerStandingOnWarpPadOrHole:: ; 1C:4CD8
	dr $70CD8, $70DEA
_HandleMidJump:: ; 1C:4DEA
	dr $70DEA, $70ED9
BattleTransition:: ; 1C:4ED9
	dr $70ED9, $710C9
FlashScreen:: ; 1C:50C9
	dr $710C9, $714CE
LoadTownMap_Nest:: ; 1C:54CE
	dr $714CE, $714FE
LoadTownMap_Fly:: ; 1C:54FE
	dr $714FE, $71B8A
TownMapSpriteBlinkingAnimation:: ; 1C:5B8A
	dr $71B8A, $71BBB
AnimatePartyMon_ForceSpeed1:: ; 1C:5BBB
	dr $71BBB, $71BC3
AnimatePartyMon:: ; 1C:5BC3
	dr $71BC3, $71C30
LoadMonPartySpriteGfx:: ; 1C:5C30
	dr $71C30, $71D46
WriteMonPartySpriteOAMBySpecies:: ; 1C:5D46
	dr $71D46, $71F9D
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
PrintStatusAilment:: ; 1E:4000
	dr $78000, $78D99
MoveAnimation:: ; 1E:4D99
	dr $78D99, $798A0
GetMoveSoundB:: ; 1E:58A0
	dr $798A0, $79AF1
CopyDownscaledMonTiles:: ; 1E:5AF1
	dr $79AF1, $79E04
CopyTileIDsFromList:: ; 1E:5E04
	dr $79E04, $7BFB2
GetMachinePrice:: ; 1E:7FB2
	dr $7BFB2, $4000 * $1F
