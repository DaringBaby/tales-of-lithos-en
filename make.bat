@echo off
set GBDK=C:\Users\Utente\Desktop\Tirocinio\gbdk-win64\gbdk\bin\lcc.exe


del *.o *.gb *.map *.asm *.lst *.sym *.ihx

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

:: --- BANCO 2 (Mappe e Tiles banked, Script game over) ---
:: Usiamo -Wf-bo2 per ogni singolo file
%GBDK% -c -Wf-bo2 -o CampMap.o src/maps/CampMap.c
%GBDK% -c -Wf-bo2 -o Dungeon.o src/maps/Dungeon.c
%GBDK% -c -Wf-bo2 -o GameOver.o src/maps/GameOver.c
%GBDK% -c -Wf-bo2 -o Title.o src/maps/Title.c
%GBDK% -c -Wf-bo2 -o CampTiles.o src/tiles/CampTiles.c
%GBDK% -c -Wf-bo2 -o Text.o src/tiles/Text.c
%GBDK% -c -Wf-bo2 -o DungeonTiles.o src/tiles/DungeonTiles.c
%GBDK% -c -Wf-bo2 -o Titlescreen.o src/tiles/Titlescreen.c
%GBDK% -c -Wf-bo2 -o TitleText.o src/tiles/TitleText.c
%GBDK% -c -Wf-bo2 -o GameOverText.o src/tiles/GameOverText.c
%GBDK% -c -Wf-bo2 -o gameoverscript.o src/scripts/gameover.c
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


:: --- BANCO 0 (Logica principale) ---
%GBDK% -c -o main.o main.c
%GBDK% -c -o gen_dung.o src/scripts/generate_dungeon.c
%GBDK% -c -o gui.o src/scripts/gui.c
%GBDK% -c -o enemy.o src/scripts/enemy.c
%GBDK% -c -o drop.o src/scripts/drop.c

%GBDK% -Wl-m -Wl-yt0x19 -Wl-yo4 -o progetto.gb main.o gen_dung.o gui.o enemy.o drop.o titlescr.o character.o Hector.o Safy.o Arrow.o DungeonObjects.o Enemies.o key.o Lock.o textbox.o mugshot.o mythril.o Numbers.o wpn_arrow.o minimap.o gameoverscript.o CampMap.o Dungeon.o GameOver.o Title.o CampTiles.o Text.o DungeonTiles.o Titlescreen.o TitleText.o GameOverText.o gui_management.o spawn_enemy.o combat_system.o insert_name.o namescreenmap.o enemy_drops.o obstacles.o locked_doors.o eyeboss.o boss.o

del *.o *.asm *.lst *.sym
pause