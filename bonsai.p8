pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--bonsai 0.1.0
--by IgnoreIntuition
--game
#include src/entity.lua
#include src/game.lua
#include src/scene/scene.lua
#include src/scene/game.lua
#include src/scene/title.lua
#include src/scene/settings.lua
#include src/scene/gameOver.lua
#include src/ui.lua
#include src/controller.lua
#include src/tree.lua
__gfx__
00000000555555555555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000dd11dd11d111ddd1000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007005d111111111111d1003bb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000111155111151111003bb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700005511151111151110033b0000004f44444f44f4400000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700005551115111115100030000004f444f4f44f4f400000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000055551555151551000000000ff44ff44f44f44f00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000555555555555500000000555555555555555500000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000