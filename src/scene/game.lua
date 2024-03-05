GameScene = Scene:new({
  name = 'game',
  score,
  init = function(_ENV)
    ui = UI:new()
    tree = Tree:new()
  end,
  update = function(_ENV)
    ui:update()
    tree:update()
    return 'game'
  end,
  draw = function(_ENV)
    ui:draw()
    tree:draw()
  end
})