-- main.lua

local entities = require('entities')
local input = require('input')
local world = require('world')
local state = require('state')
local colors = require('colors')
local spawn_man = require('spawn-man')

love.graphics.setBackgroundColor(colors['black-medium'])

love.draw = function()
	for _, e in ipairs(entities) do
		if e.draw then e:draw() end
	end
end

love.update = function(dt)
	if not state.paused and not state.game_over then
		for idx, e in ipairs(entities) do
			if e.update then e:update(dt) end
		end
		spawn_man(entities)
		world:update(dt)
	end
end

love.keypressed = function(key) input.press(key) end

love.focus = function(focused) input.toggle_focus(focused) end
