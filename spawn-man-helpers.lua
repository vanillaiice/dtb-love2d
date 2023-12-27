-- spawn-man-helpers.lua

local state = require('state')
local defaults = require('defaults')
local sound = require('sound')
local health = require('entities/health')
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

local random_type_and_color = function()
  local idx = love.math.random(1, #defaults.POWERUP_TYPES)
  return defaults.POWERUP_TYPES[idx], defaults.POWERUP_COLORS[idx]
end

local random_powerup = function()
  local rtype, rcolor = random_type_and_color()
  local p_x, p_y = love.math.random(50, 450), love.math.random(50, 650)
  
  local p = powerup(
    p_x,
    p_y,
    defaults.POWERUP_W,
    defaults.POWERUP_H,
    defaults.POWERUP_ANGLE,
    rcolor
  )

  if rtype == defaults.POWERUP_TYPES[1] then
    p.begin_contact = function(self, other)
      if other.type == 'player' then
        self.health = self.health - 1
        state.powerup_repel_count = state.powerup_repel_count + 1
        state.powerup_count = state.powerup_count - 1
        sound.effect_powerup()
      end
    end
  elseif rtype == defaults.POWERUP_TYPES[2] then
    p.begin_contact = function(self, other)
      if other.type == 'player' then
        self.health = self.health - 1
        state.powerup_destroy_around_count = state.powerup_destroy_around_count + 1
        state.powerup_count = state.powerup_count - 1
        sound.effect_powerup()
      end
    end
  elseif rtype == defaults.POWERUP_TYPES[3] then
    p.begin_contact = function(self, other)
      if other.type == 'player' then
        self.health = self.health - 1
        state.powerup_slow_motion_count = state.powerup_slow_motion_count + 1
        state.powerup_count = state.powerup_count - 1
        sound.effect_powerup()
      end
    end
  end

  return p
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

  table.insert(entities, o)
  state.opp_count = state.opp_count + 1
end

local spawn_health = function(entities)
  local n = love.math.random(1, 4)
  if n > 0 then
    -- FIXME: make it so that health does not spawn at occupied location
    local p_x, p_y = random_position(defaults.POWERUP_SPAWN_POS)
    local p = health(
      p_x,
      p_y,
      defaults.POWERUP_W,
      defaults.POWERUP_H,
      defaults.POWERUP_ANGLE
    )

    table.insert(entities, p)
    state.health_count = state.health_count + 1
  end
end

local spawn_powerup = function(entities)
  local n = love.math.random(1, 4)
  if n == 1 then
    local p = random_powerup()
    table.insert(entities, p)
    state.powerup_count = state.powerup_count + 1
  end
end

local remove_dead = function(entities, entity, index)
  if entity.health <= 0 then
    table.remove(entities, index)
    entity.fixture:destroy()
  end
end

return {
  spawn_opp = spawn_opp,
	spawn_health = spawn_health,
  spawn_powerup = spawn_powerup,
  remove_dead = remove_dead
}
