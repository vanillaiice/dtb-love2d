-- entities/player.lua

local world = require('world')
local colors = require('colors')
local state = require('state')
local defaults = require('defaults')
local sound = require('sound')

return function(pos_x, pos_y, radius, color)
  local entity = {}

  entity.type = 'player'
  
  entity.body = love.physics.newBody(world, pos_x, pos_y, "dynamic")
  entity.shape = love.physics.newCircleShape(radius)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)

  entity.fixture:setCategory(3)
		
	entity.fixture:setUserData(entity)
	
  entity.draw = function(self)
		local self_x, self_y = self.body:getWorldCenter()
    love.graphics.setColor(colors[color])
		love.graphics.circle('fill', self_x, self_y, self.shape:getRadius())
  end

  local clearance_x_lower = defaults.BOUNDARY_H + 10
  local clearance_x_upper = defaults.screen_w - clearance_x_lower
  local clearance_y_lower = clearance_x_lower
  local clearance_y_upper = defaults.screen_h - clearance_y_lower
  entity.update = function(self)
    local new_x, new_y = love.mouse.getPosition()
    if new_x > clearance_x_lower
    and new_x < clearance_x_upper
    and new_y > clearance_y_lower
    and new_y < clearance_y_upper
    then
      self.body:setX(new_x)
      self.body:setY(new_y)
    end
  end

  entity.begin_contact = function(self, other)
    if other.type == 'opp' then
      sound.effect_collision()
      if state.health == 1 then
        state.game_over = not state.game_over
      end
      state.health = state.health - 1
    end
  end
  
  return entity
end
