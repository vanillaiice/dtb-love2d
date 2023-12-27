-- main.lua

local tick = require("tick")
local state = require("state")
local input = require("input")
local colors = require("colors")
local world = require("world")
local entities = require("entities")
local push_man = require("push-man")
local spawn_man = require("spawn-man")

love.load = function()
	love.graphics.setBackgroundColor(colors["black-medium"])
	spawn_man.opp(entities.opps)
	spawn_man.health(entities.health)
	spawn_man.powerup(entities.powerups)
end

love.draw = function()
	entities.player:draw()
	for _, o in ipairs(entities.opps) do o:draw() end
	for _, p in ipairs(entities.powerups) do p:draw() end
	for _, h in ipairs(entities.health) do h:draw() end
	for _, b in ipairs(entities.boundary) do b:draw() end
	for _, t in ipairs(entities.text) do t:draw() end
end

love.update = function(dt)
	if not state.paused and not state.game_over then
		entities.player:update()
		for _, o in ipairs(entities.opps) do
			if o.update then o:update() end
		end
		push_man(entities.player, entities.opps)
		spawn_man.dead(entities.opps)
		spawn_man.dead(entities.powerups)
		spawn_man.dead(entities.health)
		tick.update(dt)
		world:update(dt)
	end
end

love.keypressed = function(key) input.press(key) end

love.mousepressed = function(_,_,button) input.click(button) end

love.focus = function(focused) input.toggle_focus(focused) end
