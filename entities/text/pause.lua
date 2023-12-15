-- entities/text/pause.lua

local state = require('state')
local colors = require('colors')

return function()
	local window_width, window_height = love.window.getMode()
	
	local entity = {}

	entity.draw = function(self)
		if state.paused and not state.game_over then
			love.graphics.setColor(colors['green'])
			love.graphics.print(
				'Paused',
				math.floor(window_width / 2) - 70,
				math.floor(window_height / 2) - 30,
				0,
				3,
				3
			)
		end
	end

	return entity
end
