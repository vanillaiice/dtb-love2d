-- entities/opp.lua

local world = require('world')
local colors = require('colors')
local tick = require("tick")
local state = require("state")

return function(pos_x, pos_y, radius, color_palette, impulse_x, impulse_y)
  local entity = {}

  entity.type = 'opp'
  entity.health = 3
  entity.slow_motion = false
  entity.grey = false
	entity.speed_multiplier = 1
  entity.body = love.physics.newBody(world, pos_x, pos_y, "dynamic")
  entity.shape = love.physics.newCircleShape(radius)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
  entity.fixture:setRestitution(1)
  entity.fixture:setCategory(1)
  entity.fixture:setMask(2)
	entity.fixture:setUserData(entity)

  entity.draw = function(self)
		local self_x, self_y = self.body:getWorldCenter()
		if not self.grey then
			love.graphics.setColor(colors[color_palette[self.health] or color_palette[1]])
		else
			love.graphics.setColor(colors["grey"])
		end
		love.graphics.circle('fill', self_x, self_y, self.shape:getRadius())
  end

  entity.begin_contact = function(self, other)
    if other.type == 'boundary' then
      self.health = self.health - 1
      if self.health == 0 then
				state.opp_count = state.opp_count - 1
				state.score = state.score + 1
			end
    end
  end

	entity.update = function(self)
		local vx, vy = self.body:getLinearVelocity()
		self.body:setLinearVelocity(vx*self.speed_multiplier, vy*self.speed_multiplier)
		if self.slow_motion then
			self.slow_motion = false
			self.grey = true
			self.speed_multiplier = 0.95
			tick.delay(
				function()
					self.speed_multiplier = 1
					self.grey = false
					self.body:setLinearVelocity(vx, vy)
				end,
				2
			)
		end
	end

  entity.body:applyLinearImpulse(impulse_x, impulse_y)

  return entity
end
