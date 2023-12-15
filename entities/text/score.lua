-- entities/text/score.lua

local state = require('state')
local colors = require('colors')

return function()
  local entity = {}
  
  entity.draw = function()
    love.graphics.setColor(colors['white'])
    love.graphics.print(
      'Score: '..state.score,
      20,
      20,
      0,
      1,
      1
    )
  end

  return entity
end
