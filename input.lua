-- input.lua

local state = require('state')
local sound = require('sound')

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

return {
	press = function(pressed_key)
		if press_functions[pressed_key] then
			press_functions[pressed_key]()
		end
	end,
	toggle_focus = function(focused)
		if not focused then
			state.paused = true
		end
	end
}
