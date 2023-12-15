-- conf.lua, LÖVE configuration file

love.conf = function(t)
	t.console = true -- enable debg console for Windows
	t.window.width = 500 -- game's screen width (pixels)
	t.window.height = 700 -- game's screen height (pixels)
	t.window.title = 'Dodge the Balls'
end
