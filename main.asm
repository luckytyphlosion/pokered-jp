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

INCLUDE "engine/overworld/pokecenter.asm"

INCLUDE "engine/overworld/set_blackout_map.asm"

INCLUDE "engine/display_text_id_init.asm"
INCLUDE "engine/menu/draw_start_menu.asm"

INCLUDE "engine/overworld/cable_club_npc.asm"

INCLUDE "engine/black_out.asm"

INCLUDE "engine/load_mon_data.asm"

INCLUDE "engine/battle/safari_zone.asm"

INCLUDE "engine/menu/text_box.asm"

INCLUDE "engine/battle/moveEffects/drain_hp_effect.asm"

INCLUDE "engine/menu/players_pc.asm"

INCLUDE "engine/remove_pokemon.asm"

INCLUDE "engine/display_pokedex.asm"

	dr $7FFA, $8000

SECTION "bank3",ROMX,BANK[$3]

INCLUDE "engine/joypad.asm"

INCLUDE "data/hide_show_data.asm"

INCLUDE "engine/overworld/field_move_messages.asm"

INCLUDE "engine/items/inventory.asm"

INCLUDE "data/map_songs.asm"

MapHeaderBanks:: ; 03:4883
	dr $C883, $C97B

INCLUDE "engine/overworld/clear_variables.asm"
INCLUDE "engine/overworld/player_state.asm"
INCLUDE "engine/overworld/poison.asm"
INCLUDE "engine/overworld/tileset_header.asm"
INCLUDE "engine/overworld/daycare_exp.asm"

INCLUDE "engine/overworld/wild_mons.asm"

INCLUDE "engine/items/items.asm"

INCLUDE "engine/menu/draw_badges.asm"

INCLUDE "engine/overworld/update_map.asm"
INCLUDE "engine/overworld/cut.asm"
INCLUDE "engine/overworld/missable_objects.asm"
INCLUDE "engine/overworld/push_boulder.asm"

INCLUDE "engine/add_mon.asm"
INCLUDE "engine/flag_action.asm"
INCLUDE "engine/heal_party.asm"
INCLUDE "engine/bcd.asm"
INCLUDE "engine/init_player_data.asm"
INCLUDE "engine/get_bag_item_quantity.asm"
INCLUDE "engine/pathfinding.asm"
INCLUDE "engine/hp_bar.asm"
INCLUDE "engine/hidden_object_functions3.asm"

	dr $FFE1, $10000

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

RedPicFront:: INCBIN "pic/trainer/red.pic"
ShrinkPic1::  INCBIN "pic/trainer/shrink1.pic"
ShrinkPic2::  INCBIN "pic/trainer/shrink2.pic"

INCLUDE "engine/turn_sprite.asm"
INCLUDE "engine/menu/start_sub_menus.asm"
INCLUDE "engine/items/tms.asm"

	dr $122AD, $1362D

INCLUDE "engine/overworld/is_player_just_outside_map.asm"
INCLUDE "engine/menu/status_screen.asm"
INCLUDE "engine/menu/party_menu.asm"

INCLUDE "engine/battle/end_of_battle.asm"
INCLUDE "engine/battle/wild_encounters.asm"
INCLUDE "engine/battle/moveEffects/recoil_effect.asm"
INCLUDE "engine/battle/moveEffects/conversion_effect.asm"
INCLUDE "engine/battle/moveEffects/haze_effect.asm"
INCLUDE "engine/battle/get_trainer_name.asm"
INCLUDE "engine/random.asm"

	dr $13FFB, $4000 * $5

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
	dr $1BE9F, $1BEC1
IsPlayerStandingOnDoorTile:: ; 06:7EC1
	dr $1BEC1, $1BF2A
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

TrainerInfoTextBoxTileGraphics:  INCBIN "gfx/trainer_info.2bpp"
TrainerInfoTextBoxTileGraphicsEnd:
BlankLeaderNames:                INCBIN "gfx/leader_names.2bpp"
CircleTile:                      INCBIN "gfx/circle_tile.2bpp"
BadgeNumbersTileGraphics:        INCBIN "gfx/badge_numbers.2bpp"

CheckIfMoveIsKnown:: ; 0B:7E76
	dr $2FE76, $2FEE3
ScaleSpriteByTwo:: ; 0B:7EE3
	dr $2FEE3, $4000 * $C

SECTION "bankC",ROMX,BANK[$C]
INCBIN "baserom.gbc", $4000 * $C, $4000

SECTION "bankD",ROMX,BANK[$D]
INCBIN "baserom.gbc", $4000 * $D, $3D9B

DisplayLinkBattleVersusTextBox:: ; 0D:7D9B
	dr $37D9B, $37DD3
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

INCLUDE "engine/evos_moves.asm"

	dr $3BDB7, $4000 * $F

SECTION "bankF",ROMX,BANK[$F]
INCBIN "baserom.gbc", $4000 * $F, $BA3

AnyPartyAlive:: ; 0F:4BA3
	dr $3CBA3, $3CEA1
ReadPlayerMonCurHPAndStatus:: ; 0F:4EA1
	dr $3CEA1, $3CEBE
DrawPlayerHUDAndHPBar:: ; 0F:4EBE
	dr $3CEBE, $3CF49
DrawEnemyHUDAndHPBar:: ; 0F:4F49
	dr $3CF49, $3D00D
DisplayBattleMenu:: ; 0F:500D
	dr $3D00D, $3D377
MoveSelectionMenu:: ; 0F:5377
	dr $3D377, $3D9A0
IsGhostBattle:: ; 0F:59A0
	dr $3D9A0, $3EDF1
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
	dr $3F3F8, $3F427
JumpMoveEffect:: ; 0F:7427
	dr $3F427, $3F762
StatModifierUpEffect:: ; 0F:7762
	dr $3F762, $3FF4E
PrintButItFailedText_:: ; 0F:7F4E
	dr $3FF4E, $3FFDB
PlayCurrentMoveAnimation:: ; 0F:7FDB
	dr $3FFDB, $4000 * $10

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
	dr $50000, $539EB

PrintCardKeyText:: ; 14:79EB
	dr $539EB, $53AB3
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
	dr $58D99, $58F8E
CalcLevelFromExperience:: ; 16:4F8E
	dr $58F8E, $58FB5
CalcExperience:: ; 16:4FB5
	dr $58FB5, $4000 * $17

SECTION "bank17",ROMX,BANK[$17]
INCBIN "baserom.gbc", $4000 * $17, $DC

StarterDex:: ; 17:40DC
	dr $5C0DC, $5F8BC
SetPartyMonTypes:: ; 17:78BC
	dr $5F8BC, $4000 * $18

SECTION "bank18",ROMX,BANK[$18]
INCBIN "baserom.gbc", $4000 * $18, $4000

SECTION "bank19",ROMX,BANK[$19]
Overworld_GFX:: ; 19:4000
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
	dr $70000, $70984
AnimateHealingMachine:: ; 1C:4984
	dr $70984, $70A61
EnterMapAnim:: ; 1C:4A61
	dr $70A61, $70B0B
_LeaveMapAnim:: ; 1C:4B0B
	dr $70B0B, $70CD8
IsPlayerStandingOnWarpPadOrHole:: ; 1C:4CD8
	dr $70CD8, $70D07
FishingAnim:: ; 1C:4D07
	dr $70D07, $70DEA
_HandleMidJump:: ; 1C:4DEA
	dr $70DEA, $70ED9
BattleTransition:: ; 1C:4ED9
	dr $70ED9, $710C9
FlashScreen:: ; 1C:50C9
	dr $710C9, $713AA
DisplayTownMap:: ; 1C:53AA
	dr $713AA, $714CE
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
	dr $71C30, $71C55
LoadMonPartySpriteGfxWithLCDDisabled:: ; 1C:5C55
	dr $71C55, $71D2C
WriteMonPartySpriteOAMByPartyIndex:: ; 1C:5D2C
	dr $71D2C, $71D46
WriteMonPartySpriteOAMBySpecies:: ; 1C:5D46
	dr $71D46, $71F9D
DoInGameTradeDialogue:: ; 1C:5F9D
	dr $71F9D, $723BF
_RunPaletteCommand:: ; 1C:63BF
	dr $723BF, $72596
InitPartyMenuBlkPacket:: ; 1C:6596
	dr $72596, $72604
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
	dr $73CAA, $73CE3
SaveSAVtoSRAM:: ; 1C:7CE3
	dr $73CE3, $73D1B
ChangeBox:: ; 1C:7D1B
	dr $73D1B, $4000 * $1D

SECTION "bank1D",ROMX,BANK[$1D]
INCBIN "baserom.gbc", $4000 * $1D, $5C

HiddenItemNear:: ; 1D:405C
	dr $7405C, $74E36
VendingMachineMenu:: ; 1D:4E36
	dr $74E36, $4000 * $1E

SECTION "bank1E",ROMX,BANK[$1E]
PrintStatusAilment:: ; 1E:4000
	dr $78000, $78557
AnimationTileset2:: ; 1E:4557
	dr $78557, $78D99
MoveAnimation:: ; 1E:4D99
	dr $78D99, $798A0
GetMoveSoundB:: ; 1E:58A0
	dr $798A0, $79AF1
CopyDownscaledMonTiles:: ; 1E:5AF1
	dr $79AF1, $79E04
CopyTileIDsFromList:: ; 1E:5E04
	dr $79E04, $79EC2
AnimCut:: ; 1E:5EC2
	dr $79EC2, $79F80
AnimateBoulderDust:: ; 1E:5F80
	dr $79F80, $7BE15
EvolveMon:: ; 1E:7E15
	dr $7BE15, $7BFB2
GetMachinePrice:: ; 1E:7FB2
	dr $7BFB2, $4000 * $1F
