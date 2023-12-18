-- spawn-man.lua

local tick = require("tick")
local state = require('state')
local smh = require('spawn-man-helpers')

local MAX_OPP_COUNT = 25
local MAX_POWERUP_COUNT = 4
local SPAWN_INTERVAL_OPP = 0.4
local SPAWN_INTERVAL_POWERUP = 10

local man_opp = function(entities)
  tick.recur(
    function()
      if state.opp_count < MAX_OPP_COUNT then
        smh.spawn_opp(entities)
      end
    end,
    SPAWN_INTERVAL_OPP
  )
end

local man_powerup = function(entities)
  tick.recur(
    function()
      if state.powerup_count < MAX_POWERUP_COUNT then
        smh.spawn_powerup(entities)
      end
    end,
    SPAWN_INTERVAL_POWERUP
  )
end

local man_dead = function(entities)
  for idx, entity in ipairs(entities) do
    smh.remove_dead(entities, entity, idx)
  end
end

return {
  opp = man_opp,
  powerup = man_powerup,
  dead = man_dead
}
