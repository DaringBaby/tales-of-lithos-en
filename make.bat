@echo off
set GBDK=C:\Users\Utente\Desktop\Tirocinio\gbdk-win64\gbdk\bin\lcc.exe


del *.o *.gb *.map *.lst *.sym *.ihx *.asm


:: --- BANCO 6 (Intro) ---
%GBDK% -c -Wf-bo6 -o tiles_slide1.o src/tiles/IntroSlide1.c
%GBDK% -c -Wf-bo6 -o slide1.o src/maps/IntroSlide1.c
%GBDK% -c -Wf-bo6 -o intro.o src/scripts/intro.c

:: --- BANCO 5 (Canzoni) ---
%GBDK% -c -Wf-bo5 -o camp_song.o src/songs/camp_song.c
%GBDK% -c -Wf-bo5 -o intro_song.o src/songs/intro_song.c

:: --- BANCO 4 (Canzoni) ---
%GBDK% -c -Wf-bo4 -o dungeon_song.o src/songs/dungeon_song.c
%GBDK% -c -Wf-bo4 -o boss_song.o src/songs/boss_song.c


:: --- BANCO 3 (Titlescreen, minimap, script gui) ---
%GBDK% -c -Wf-bo3 -o titlescr.o src/scripts/titlescreen.c
%GBDK% -c -Wf-bo3 -o minimap.o src/tiles/minimap.c
%GBDK% -c -Wf-bo3 -o gui_management.o src/scripts/gui_management.c
%GBDK% -c -Wf-bo3 -o spawn_enemy.o src/scripts/spawn_enemy.c
%GBDK% -c -Wf-bo3 -o combat_system.o src/scripts/combat_system.c
%GBDK% -c -Wf-bo3 -o insert_name.o src/scripts/insert_name.c
%GBDK% -c -Wf-bo3 -o namescreenmap.o src/maps/NameScreenMap.c
%GBDK% -c -Wf-bo3 -o locked_doors.o src/scripts/locked_doors.c
%GBDK% -c -Wf-bo3 -o eyeboss.o src/tiles/Eyeboss.c
%GBDK% -c -Wf-bo3 -o boss.o src/scripts/boss.c
%GBDK% -c -Wf-bo3 -o sound.o src/scripts/sound.c
%GBDK% -c -Wf-bo3 -o gameover_sound.o src/songs/gameover_sound.c
%GBDK% -c -Wf-bo3 -o boss_defeated.o src/songs/boss_defeated.c
%GBDK% -c -Wf-bo3 -o tutorial_map.o src/maps/TutorialMap.c

:: --- BANCO 2 (Mappe e Tiles banked, Script game over) ---
:: Usiamo -Wf-bo2 per ogni singolo file
%GBDK% -c -Wf-bo2 -o CampMap.o src/maps/CampMap.c
%GBDK% -c -Wf-bo2 -o Dungeon.o src/maps/Dungeon.c
%GBDK% -c -Wf-bo2 -o Title.o src/maps/Title.c
%GBDK% -c -Wf-bo2 -o CampTiles.o src/tiles/CampTiles.c
%GBDK% -c -Wf-bo2 -o Text.o src/tiles/Text.c
%GBDK% -c -Wf-bo2 -o DungeonTiles.o src/tiles/DungeonTiles.c
%GBDK% -c -Wf-bo2 -o Titlescreen.o src/tiles/Titlescreen.c
%GBDK% -c -Wf-bo2 -o TitleText.o src/tiles/TitleText.c
%GBDK% -c -Wf-bo2 -o dungeon_management.o src/scripts/dungeon_management.c
%GBDK% -c -Wf-bo2 -o obstacles.o src/maps/Obstacles.c


:: --- BANCO 1 (Tiles) ---
%GBDK% -c -Wf-bo1 -o character.o src/tiles/character.c
%GBDK% -c -Wf-bo1 -o Hector.o src/tiles/Hector.c
%GBDK% -c -Wf-bo1 -o Safy.o src/tiles/Safy.c
%GBDK% -c -Wf-bo1 -o Arrow.o src/tiles/Arrow.c
%GBDK% -c -Wf-bo1 -o DungeonObjects.o src/tiles/DungeonObjects.c
%GBDK% -c -Wf-bo1 -o Enemies.o src/tiles/Enemies.c
%GBDK% -c -Wf-bo1 -o key.o src/tiles/key.c
%GBDK% -c -Wf-bo1 -o Lock.o src/tiles/Lock.c
%GBDK% -c -Wf-bo1 -o textbox.o src/tiles/textbox.c
%GBDK% -c -Wf-bo1 -o mugshot.o src/tiles/mugshot.c
%GBDK% -c -Wf-bo1 -o mythril.o src/tiles/mythril.c
%GBDK% -c -Wf-bo1 -o Numbers.o src/tiles/Numbers.c
%GBDK% -c -Wf-bo1 -o wpn_arrow.o src/tiles/wpn_arrow.c
%GBDK% -c -Wf-bo1 -o enemy_drops.o src/tiles/enemyDrops.c
%GBDK% -c -Wf-bo1 -o gen_dung.o src/scripts/generate_dungeon.c
%GBDK% -c -Wf-bo1 -o GameOver.o src/maps/GameOver.c
%GBDK% -c -Wf-bo1 -o GameOverText.o src/tiles/GameOverText.c
%GBDK% -c -Wf-bo1 -o gameoverscript.o src/scripts/gameover.c
%GBDK% -c -Wf-bo1 -o sword.o src/tiles/sword.c
%GBDK% -c -Wf-bo1 -o effects.o src/tiles/effects.c
%GBDK% -c -Wf-bo1 -o play_effects.o src/scripts/play_effects.c

:: --- BANCO 0 (Logica principale) ---
%GBDK% -c -o main.o main.c
%GBDK% -c -o gui.o src/scripts/gui.c
%GBDK% -c -o enemy.o src/scripts/enemy.c
%GBDK% -c -o drop.o src/scripts/drop.c
%GBDK% -c -o save_manager.o src/scripts/save_manager.c

%GBDK% -Wl-m -Wl-yt0x1B -Wl-ya1 -Wl-yo8 -o progetto.gb main.o gen_dung.o gui.o enemy.o drop.o titlescr.o character.o Hector.o Safy.o Arrow.o DungeonObjects.o Enemies.o key.o Lock.o textbox.o mugshot.o mythril.o Numbers.o wpn_arrow.o minimap.o gameoverscript.o CampMap.o Dungeon.o GameOver.o Title.o CampTiles.o Text.o DungeonTiles.o Titlescreen.o TitleText.o GameOverText.o gui_management.o spawn_enemy.o combat_system.o insert_name.o namescreenmap.o enemy_drops.o obstacles.o locked_doors.o eyeboss.o boss.o sound.o gameover_sound.o boss_defeated.o hUGEDriver.lib dungeon_management.o dungeon_song.o boss_song.o camp_song.o intro_song.o save_manager.o tutorial_map.o sword.o effects.o play_effects.o tiles_slide1.o slide1.o intro.o

del *.o *.lst *.sym *.asm
pause