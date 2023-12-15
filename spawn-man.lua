-- spawn-man.lua

local state = require('state')
local smh = require('spawn-man-helpers')

local MAX_OPP_COUNT = 25
local MAX_POWERUP_COUNT = 4
local SPAWN_INTERVAL_OPP = 0.4
local SPAWN_INTERVAL_POWERUP = 10

local last_time_spawn_opp = 0
local last_time_spawn_powerup = 0

local man_opp = function(entities, current_time)
  if current_time - last_time_spawn_opp >= SPAWN_INTERVAL_OPP then
    last_time_spawn_opp = current_time
    if state.opp_count < MAX_OPP_COUNT then
      smh.spawn_opp(entities)
    end
  end
end

local man_powerup = function(entities, current_time)
  if current_time - last_time_spawn_powerup 
    >= SPAWN_INTERVAL_POWERUP
  then
    last_time_spawn_powerup = current_time
    if state.powerup_count < MAX_POWERUP_COUNT then
      smh.spawn_powerup(entities)
    end
  end
end

local man_dead = function(entities)
  for idx, entity in ipairs(entities) do
    smh.remove_dead(entities, entity, idx)
  end
end

return function(entities)
  local current_time = love.timer.getTime()
  
  man_opp(entities, current_time)
  man_powerup(entities, current_time)
  man_dead(entities)
end
