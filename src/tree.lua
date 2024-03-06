Tree = entity:new({
  x = 30, y = 90,
  pot, buttress, apex, branches,
  init = function(_ENV)
    branches = {}
    apex = Apex:new()
    buttress = Buttress:new({
      x = x + 8,
      y = y - 8,
      width = 0,
      height = 1
    })
    lastSegment = buttress:addSegment(slantLeft)
    lastSegment = buttress:addSegment(upright)
    lastSegment:addBranch(branches, slantDownLeft)
    lastSegment = buttress:addSegment(slantRight)
    lastBranch = lastSegment:addBranch(branches, slantUpRight)
    lastBranch = lastBranch:grow(branches, slantDownRight)
    lastBranch:grow(branches, slantDownRight)
    lastSegment = buttress:addSegment(upright)
    pot = Pot:new({ x = x, y = y, width = 2 })
  end,
  update = function(_ENV)
    apex:update()
    buttress:update()
    pot:update()
    for i, v in ipairs(branches) do
      v:update()
    end
  end,
  draw = function(_ENV)
    apex:draw()
    buttress:draw()
    pot:draw()
    for i, v in ipairs(branches) do
      v:draw()
    end
  end
})

Buttress = entity:new({
  x, y,
  width, height,
  segment = {},
  init = function(_ENV)
    segment = {}
  end,
  update = function(_ENV)
    for i, v in ipairs(segment) do
      v:update()
    end
  end,
  draw = function(_ENV)
    spr(4, x, y)
    for i = 1, width, 1 do
      spr(5, x + i * 8, y)
    end
    spr(4, x + width * 8 + 8, y, 1, 1, true)
    for i, v in ipairs(segment) do
      v:draw()
    end
  end,
  addSegment = function(_ENV, style)
    local len = #segment
    if len > 0 then
      newSegmentX = segment[len].x2
      newSegmentY = segment[len].y2
    else
      newSegmentX = x + 6
      newSegmentY = y + 4
    end
    newSegment = TrunkLineSegment:new({
      x1 = newSegmentX,
      y1 = newSegmentY,
      width = 4,
      style = style
    })
    add(
      segment, newSegment
    )
    return newSegment
  end
})

TrunkLineSegment = entity:new({
  x1, y1,
  width, style,
  x2, y2,
  segmentBranches,
  init = function(_ENV, self)
    branches = {}
    styles = { { 0, -4 }, { -4, -4 }, { 4, -4 } }
    self.x2 = self.x1 + styles[self.style][1]
    self.y2 = self.y1 + styles[self.style][2]
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    color = 4
    for i = 0, width - 1, 1 do
      if i == width - 1 then
        color = 15
      end
      line(x1 + i, y1, x2 + i, y2, color)
    end
  end,
  addBranch = function(_ENV, branches, style)
    offset = 0
    if style < 4 then
      offset = 4
    end
    newBranch = Branch:new({
      x1 = x2 + offset,
      y1 = y2,
      width = 2,
      style = style
    })
    add(branches, newBranch)
    add(segmentBranches, #branches)
    return newBranch
  end,
  addJin = function(_ENV)
  end
})

Branch = entity:new({
  x1, y1, x2, y2, width, style,
  init = function(_ENV, self)
    styles = { { 4, 0 }, { 4, -2 }, { 4, 2 }, { -4, 0 }, { -4, -2 }, { -4, 2 } }
    self.x2 = self.x1 + styles[self.style][1]
    self.y2 = self.y1 + styles[self.style][2]
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    color = 4
    for i = 0, width - 1, 1 do
      if i == width - 1 then
        color = 15
      end
      line(x1, y1 + i, x2, y2 + i, color)
    end
  end,
  grow = function(_ENV, branches, style)
    newBranch = Branch:new({
      x1 = x2,
      y1 = y2,
      width = 2,
      style = style
    })
    add(branches, newBranch)
    return newBranch
  end
})

Jin = entity:new({
  init = function(_ENV)
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
  end
})

Apex = entity:new({
  init = function(_ENV)
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
  end
})

Pot = entity:new({
  x, y, width,
  init = function(_ENV)
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    spr(1, x, y)
    for i = 1, width, 1 do
      spr(2, x + i * 8, y)
    end
    spr(1, x + width * 8 + 8, y, 1, 1, true)
  end
})