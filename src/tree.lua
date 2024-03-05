Tree = entity:new({
  x = 30, y = 90,
  pot, buttress, apex,
  init = function(_ENV)
    apex = Apex:new()
    buttress = Buttress:new({ x = x + 8, y = y - 8, width = 0, height = 1 })
    buttress:addSegment()
    buttress:addSegment()
    buttress:addSegment()
    pot = Pot:new({ x = x, y = y, width = 2 })
  end,
  update = function(_ENV)
    apex:update()
    buttress:update()
    pot:update()
  end,
  draw = function(_ENV)
    apex:draw()
    buttress:draw()
    pot:draw()
  end
})

Buttress = entity:new({
  x, y, width, height, segment = {},
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
  addSegment = function(_ENV)
    local len = #segment
    if len > 0 then
      newSegmentX = segment[len].x2
      newSegmentY = segment[len].y2
    else
      newSegmentX = x + 6
      newSegmentY = y + 4
    end
    local newSegment = TrunkLineSegment:new({
      x1 = newSegmentX,
      y1 = newSegmentY,
      width = 4,
      style = 'upright'
    })
    newSegment:addBranch()
    add(segment, newSegment)
  end
})

TrunkLineSegment = entity:new({
  x1, y1,
  width, style,
  x2, y2,
  branches,
  init = function(_ENV, self)
    branches = {}
    if self.style == 'upright' then
      self.x2 = self.x1
      self.y2 = self.y1 - 4
    elseif self.style == 'slantLeft' then
      self.x2 = self.x1 - 4
      self.y2 = self.y1 - 4
    elseif self.style == 'slantRight' then
      self.x2 = self.x1 + 4
      self.y2 = self.y1 - 4
    else
      self.x2 = self.x1
      self.y2 = self.y1
    end
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
    for i, v in ipairs(branches) do
      v:draw()
    end
  end,
  addBranch = function(_ENV)
    add(
      branches, Branch:new({
        x1 = x1,
        y1 = y1,
        width = 2,
        style = 'straight',
        position = 'right'
      })
    )
  end,
  addJin = function(_ENV)
  end
})

Branch = entity:new({
  x1, y1, x2, y2, width, style,
  init = function(_ENV, self)
    if self.style == 'straight' then
      self.x1 = self.x1 + 4
      self.x2 = self.x1 + 4
      self.y2 = self.y1
    elseif self.style == 'slantUp' then
    elseif self.style == 'slantDown' then
    else
    end
  end,
  update = function(_ENV)
  end,
  draw = function(_ENV)
    color = 4
    for i = 0, width - 1, 1 do
      if i == width - 1 then
        color = 15
      end
      line(x1, y1 + i, x2 , y2+i, color)
    end
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