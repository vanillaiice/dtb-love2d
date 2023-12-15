-- entities/text/game-over.lua

local state = require('state')
local colors = require('colors')
local sound = require('sound')

return function()
  local window_width, window_height = love.window.getMode()

  local entity = {}

  local sound_played = false
  entity.draw = function()
    if state.game_over then
      love.graphics.setColor(colors['red-dark'])
      love.graphics.print(
        'Game Over',
        math.floor(window_width / 2) - 110,
        math.floor(window_height / 2) - 30,
        0,
        3,
        3
      )
      if not sound_played then
        sound.effect_game_over()
        sound_played = true
      end
    end
  end

  return entity
end
