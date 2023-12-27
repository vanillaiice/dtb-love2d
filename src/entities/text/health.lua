-- entities/text/health.lua

local state = require('state')
local colors = require('colors')

return function()
  local entity = {}
  
  entity.draw = function()
    love.graphics.setColor(colors['white'])
    love.graphics.print(
      'Health: '..state.health,
      20,
      40,
      0,
      1,
      1
    )
  end

  return entity
end
