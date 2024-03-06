UI = entity:new({
  init = function(_ENV)
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    cls()
    drawHeader(_ENV)
    drawCanvas(_ENV)
    drawRightRail(_ENV)
    drawFooter(_ENV)
  end,
  drawHeader = function(_ENV)
    rectfill(0,0,127,7,1)
    line(0, 7, 127, 7, 7)
    print('day 1', 0, 0, 7)
    print('score 0', 92, 0, 7)
  end,
  drawCanvas = function(_ENV)
    rectfill(0,8,95,103,0)
  end,
  drawRightRail = function(_ENV)
    rectfill(96,8,127,103,5)
    rectfill(98,10,125,101,1)
    rect(98,10,125,101,7)
    spr(48, 108, 14)
    print('spring', 100, 24)
    spr(20, 103, 40, 2, 2)
  end,
  drawFooter = function(_ENV)
    rectfill(0,104,127,127,5) 
    spr(16, 2, 108, 2, 2)
    spr(22, 6, 112, 1, 1)
    spr(16, 20, 108, 2, 2)
    spr(23, 24, 112, 1, 1)
    spr(16, 38, 108, 2, 2)
    spr(24, 42, 112, 1, 1)
    spr(16, 56, 108, 2, 2)
    spr(25, 60, 112, 1, 1)
    spr(16, 74, 108, 2, 2)
    spr(26, 78, 112, 1, 1)
 
    spr(64, 94, 108, 4, 2)
  end,
})