-- input.lua

local state = require('state')
local sound = require('sound')
local opps = require("entities").opps
local tick = require("tick")

local press_functions = {
	escape = function()
		love.event.quit()
	end,
	space = function()
		state.paused = not state.paused
		if state.paused then
			sound.effect_pause()
		else
			sound.effect_unpause()
		end
	end,
	backspace = function()
		love.event.quit("restart")
	end
}

local click_functions = {
-- left click destroys all opps in a certain radius
	function()
		if not state.powerup_active and state.powerup_destroy_around_count > 0 then
			state.powerup_active = true
			state.destroy_around = true
			state.powerup_destroy_around_count = state.powerup_destroy_around_count - 1
			tick.delay(
				function()
					state.destroy_around = false
					state.powerup_active = false
				end,
				3
			)
		end
	end,
-- right click repels all opps in a certain radius
	function()
		if not state.powerup_active and state.powerup_repel_count > 0 then
			state.powerup_active = true
			state.repel = true
			state.powerup_repel_count = state.powerup_repel_count - 1
			tick.delay(
				function()
					state.repel = false
					state.powerup_active = false
				end,
				3
			)
		end
	end,
-- middle click slows down all ops (za worldo)
	function()
		sound.effect_slow_motion()
		if state.powerup_slow_motion_count > 0 then
			state.powerup_slow_motion_count = state.powerup_slow_motion_count - 1
			for i=1, #opps do
				opps[i].slow_motion = true
			end
		end
	end
}

return {
	press = function(pressed_key)
		if press_functions[pressed_key] then
			press_functions[pressed_key]()
		end
	end,
	click = function (clicked_button)
		if click_functions[clicked_button] then
			click_functions[clicked_button]()
		end
	end,
	toggle_focus = function(focused)
		if not focused then
			state.paused = true
		end
	end
}
