-- spawn-man-helpers.lua

local state = require('state')
local defaults = require('defaults')
local sound = require('sound')
local powerup = require('entities/powerup')
local opp = require('entities/opp')

local random_color_palette = function()
  return defaults.COLOR_PAIRS[
    love.math.random(
      1,
      #defaults.COLOR_PAIRS
    )
  ]
end

local random_opp_radius = function()
  return love.math.random(
    defaults.OPP_RADIUS_MIN, 
    defaults.OPP_RADIUS_MAX
  )
end

local random_position = function(positions)
  local n = love.math.random(1, #positions)
  return positions[n][1], positions[n][2]
end

local random_impulse = function()
  return
    love.math.random(defaults.MIN_IMPULSE_X, defaults.MAX_IMPULSE_X),
    love.math.random(defaults.MIN_IMPULSE_Y, defaults.MAX_IMPULSE_Y)
end

local spawn_opp = function(entities)
  local o_x, o_y = random_position(defaults.OPP_SPAWN_POS)
  local o_color = random_color_palette()
  local o_impulse_x, o_impulse_y = random_impulse()

  local o = opp(
    o_x,
    o_y,
    random_opp_radius(),
    o_color,
    o_impulse_x,
    o_impulse_y
  )
  
  table.insert(entities, 1, o)
  state.opp_count = state.opp_count + 1
end

local spawn_powerup = function(entities)
  local n = love.math.random(1, 4)
  if n == 1 then
    -- FIXME: make it so that powerup does not spawn at occupied location
    local p_x, p_y = random_position(defaults.POWERUP_SPAWN_POS)
    local p = powerup(
      p_x,
      p_y,
      defaults.POWERUP_W,
      defaults.POWERUP_H,
      defaults.POWERUP_ANGLE,
      defaults.POWERUP_COLOR
    )
    
    table.insert(entities, 1, p)
    state.powerup_count = state.powerup_count + 1
  end
end

local remove_dead = function(entities, entity, index)
  if entity.type == 'opp' or entity.type == 'powerup' then
    if entity.health <= 0 then
      table.remove(entities, index)
      entity.fixture:destroy()
      if entity.type == 'opp' then
        state.opp_count = state.opp_count - 1
        state.score = state.score + 1
      elseif entity.type == 'powerup' then
        state.powerup_count = state.powerup_count - 1
        sound.effect_powerup()
      end
    end
  end
end

return {
  spawn_opp = spawn_opp,
  spawn_powerup = spawn_powerup,
  remove_dead = remove_dead
}
