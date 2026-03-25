CC = C:\Users\Utente\Desktop\Tirocinio\gbdk-win64\gbdk\bin\lcc.exe
PROJECT_NAME = progetto.gb
OBJDIR = obj
BGB = D:\bgbw64\bgb64.exe


LCCFLAGS = -Wl-m -Wl-yt0x1B -Wl-ya1 -Wl-yo8
.PHONY: all clean


B6_SOURCES = src/tiles/IntroSlide1Tiles.c src/maps/IntroSlide1.c src/scripts/intro.c \
			 src/tiles/IntroSlide2Tiles.c src/maps/IntroSlide2.c src/tiles/IntroSlide3Tiles.c \
			 src/maps/IntroSlide3.c src/maps/IntroText.c
B5_SOURCES = src/songs/camp_song.c src/songs/intro_song.c src/tiles/DungeonTiles3.c src/tiles/DungeonTiles4.c \
			 src/tiles/DungeonTiles5.c
B4_SOURCES = src/songs/dungeon_song.c src/songs/boss_song.c
B3_SOURCES = src/scripts/titlescreen.c src/tiles/minimap.c src/scripts/gui_management.c \
             src/scripts/spawn_enemy.c src/scripts/combat_system.c src/scripts/insert_name.c \
             src/maps/NameScreenMap.c src/scripts/locked_doors.c src/tiles/bosses.c \
             src/scripts/boss.c src/scripts/sound.c src/songs/gameover_sound.c src/tiles/Enemies.c \
             src/songs/boss_defeated.c src/maps/TutorialMap.c
B2_SOURCES = src/maps/CampMap.c src/maps/Dungeon.c src/maps/Title.c \
             src/tiles/CampTiles.c src/tiles/Text.c src/tiles/DungeonTiles.c \
             src/tiles/Titlescreen.c src/tiles/TitleText.c \
             src/scripts/dungeon_management.c src/maps/Obstacles.c \
             src/tiles/DungeonTiles2.c
B1_SOURCES = src/tiles/character.c src/tiles/Hector.c src/tiles/Safy.c \
             src/tiles/Arrow.c src/tiles/DungeonObjects.c \
             src/tiles/key.c src/tiles/Lock.c src/tiles/textbox.c \
             src/tiles/mugshot.c src/tiles/mythril.c src/tiles/numbers.c \
             src/tiles/wpn_arrow.c src/tiles/enemyDrops.c src/scripts/generate_dungeon.c \
             src/maps/GameOver.c src/tiles/GameOverText.c src/scripts/gameover.c \
             src/tiles/sword.c src/tiles/effects.c src/scripts/play_effects.c
B0_SOURCES = main.c src/scripts/gui.c src/scripts/enemy.c src/scripts/drop.c src/scripts/save_manager.c


define make_obj_list
	$(patsubst %.c,$(OBJDIR)/%.o,$(1))
endef

B6_OBJS = $(call make_obj_list,$(B6_SOURCES))
B5_OBJS = $(call make_obj_list,$(B5_SOURCES))
B4_OBJS = $(call make_obj_list,$(B4_SOURCES))
B3_OBJS = $(call make_obj_list,$(B3_SOURCES))
B2_OBJS = $(call make_obj_list,$(B2_SOURCES))
B1_OBJS = $(call make_obj_list,$(B1_SOURCES))
B0_OBJS = $(call make_obj_list,$(B0_SOURCES))

ALL_OBJS = $(B0_OBJS) $(B1_OBJS) $(B2_OBJS) $(B3_OBJS) $(B4_OBJS) $(B5_OBJS) $(B6_OBJS)


all: $(PROJECT_NAME)

$(PROJECT_NAME): $(ALL_OBJS)
	$(CC) $(LCCFLAGS) -o $(PROJECT_NAME) $(ALL_OBJS) hUGEDriver.lib


$(OBJDIR)/%.o: %.c
	@mkdir -p $(dir $@)
	@echo "Compiling $< -> $@"
	$(CC) $(BANK_FLAGS) -c $< -o $@


$(B6_OBJS): BANK_FLAGS = -Wf-bo6
$(B5_OBJS): BANK_FLAGS = -Wf-bo5
$(B4_OBJS): BANK_FLAGS = -Wf-bo4
$(B3_OBJS): BANK_FLAGS = -Wf-bo3
$(B2_OBJS): BANK_FLAGS = -Wf-bo2
$(B1_OBJS): BANK_FLAGS = -Wf-bo1
$(B0_OBJS): BANK_FLAGS =

clean:
	rm -f *.gb *.map *.lst *.sym *.ihx *.asm *.rel *.noi *.o
	rm -rf $(OBJDIR) *.gb *.lst *.sym *.ihx *.asm



run: all
	$(BGB) $(PROJECT_NAME)
