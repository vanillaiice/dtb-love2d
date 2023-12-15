-- entities/boundary.lua

local world = require('world')
local colors = require('colors')
local sound = require('sound')

return function(pos_x, pos_y, width, height, angle, color)
  local entity = {}

  entity.type = 'boundary'
  
  entity.body = love.physics.newBody(world, pos_x, pos_y, 'static')
  entity.body:setAngle(angle)
  entity.shape = love.physics.newRectangleShape(width, height)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
  
	entity.fixture:setUserData(entity)

	entity.draw = function(self)
    love.graphics.setColor(colors[color])
		love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
	end

  local sound_played = false
  entity.begin_contact = function(self, other)
    if other.type == 'player' and not sound_played then
      sound_played = true
      sound.effect_collision()
    end
  end

  entity.end_contact = function(self, other)
    if other.type == 'player' then
      sound_played = false
    end
  end

  return entity
end
