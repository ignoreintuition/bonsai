TitleScene = Scene:new({
  name = 'title',
  init = function(_ENV)
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    cls()
    print('Bonsai', 61, 54, 7)
  end
})