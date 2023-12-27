-- entities/text/powerup.lua

local state = require("state")
local colors = require("colors")

return function()
	local entity = {}

	entity.draw = function ()
		love.graphics.setColor(colors["white"])
		love.graphics.print(
			"Repel: "..state.powerup_repel_count,
			20,
			60,
			0,
			1,
			1
		)
		love.graphics.print(
			"Destroy: "..state.powerup_destroy_around_count,
			20,
			80,
			0,
			1,
			1
		)
		love.graphics.print(
			"Slow Motion: "..state.powerup_slow_motion_count,
			20,
			100,
			0,
			1,
			1
		)
	end

	return entity
end
