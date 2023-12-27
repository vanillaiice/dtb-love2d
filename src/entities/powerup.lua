-- entities/powerup.lua

local world = require('world')
local colors = require('colors')
local state = require('state')
local sound = require("sound")

return function(pos_x, pos_y, width, height, angle, color)
  local entity = {}

  entity.type = "powerup"
  entity.health = 1
  entity.body = love.physics.newBody(world, pos_x, pos_y, 'dynamic')
  entity.body:setAngle(angle)
  entity.shape = love.physics.newRectangleShape(width, height)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
  entity.fixture:setCategory(2)
  entity.fixture:setMask(1)
	entity.fixture:setUserData(entity)

	entity.draw = function(self)
    love.graphics.setColor(colors[color])
		love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
	end

  return entity
end
