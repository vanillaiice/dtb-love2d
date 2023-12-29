-- entities/text/powerup.lua

local state = require("state")
local colors = require("colors")

return function()
	local entity = {}

	local status_box = love.physics.newRectangleShape(63, 55, 100, 35)
	local health = love.physics.newRectangleShape(25, 50, 8, 8, math.rad(45))
	local destroy = love.physics.newRectangleShape(50, 50, 8, 8, math.rad(45))
	local repel = love.physics.newRectangleShape(75, 50, 8, 8, math.rad(45))
	local slow = love.physics.newRectangleShape(100, 50, 8, 8, math.rad(45))

	entity.draw = function ()
		love.graphics.setColor(colors["green"])
		love.graphics.polygon("fill", health:getPoints())
		love.graphics.setColor(colors["red"])
		love.graphics.polygon("fill", destroy:getPoints())
		love.graphics.setColor(colors["blue"])
		love.graphics.polygon("fill", repel:getPoints())
		love.graphics.setColor(colors["yellow"])
		love.graphics.polygon("fill", slow:getPoints())

		love.graphics.setColor(colors["white"])
		love.graphics.polygon("line", status_box:getPoints())
		love.graphics.print("x"..state.health, 15, 55)
		love.graphics.print("x"..state.powerup_destroy_around_count, 40, 55)
		love.graphics.print("x"..state.powerup_repel_count, 65, 55)
		love.graphics.print("x"..state.powerup_slow_motion_count, 90, 55)
	end
	return entity
end
