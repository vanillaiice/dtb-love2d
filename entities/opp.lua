-- entities/opp.lua

local world = require('world')
local colors = require('colors')

return function(pos_x, pos_y, radius, color_palette, impulse_x, impulse_y)
  local entity = {}

  entity.type = 'opp'
  entity.health = 3
  
  entity.body = love.physics.newBody(world, pos_x, pos_y, "dynamic")
  entity.shape = love.physics.newCircleShape(radius)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
	
  entity.fixture:setRestitution(1)
  entity.fixture:setCategory(1)
  entity.fixture:setMask(2)
	
	entity.fixture:setUserData(entity)
	
  entity.draw = function(self)
		local self_x, self_y = self.body:getWorldCenter()
    love.graphics.setColor(colors[color_palette[entity.health] or color_palette[1]])
		love.graphics.circle('fill', self_x, self_y, self.shape:getRadius())
  end

  entity.begin_contact = function(self, other)
    if other.type == 'boundary' then
      self.health = self.health - 1
    end
  end

  entity.body:applyLinearImpulse(impulse_x, impulse_y)
  
  return entity
end
