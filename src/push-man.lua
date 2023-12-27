-- push-man.lua

local state = require("state")

return function(player, opps)
	for idx, o in ipairs(opps) do
		local distance = love.physics.getDistance(player.fixture, o.fixture)
		if state.repel and distance <= 50 then
			local vx, vy = o.body:getLinearVelocity()
			o.body:setLinearVelocity(0, 0)
			local ix, iy = -vx*10, -vy*10
			o.body:applyLinearImpulse(ix, iy)
		elseif state.destroy_around and distance <= 50 then
			table.remove(opps, idx)
			o.fixture:destroy()
			state.opp_count = state.opp_count - 1
			state.score = state.score + 1
		end
	end
end
