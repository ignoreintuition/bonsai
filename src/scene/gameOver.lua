GameOverScene = Scene:new({
  name = 'gameOver',
  init = function(_ENV, score)
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    cls()
    print('game over', 40, 40, 7)
  end
})