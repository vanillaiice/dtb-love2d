-- boundary.lua

local defaults = require('defaults')
local boundary = require('entities/boundary')

local b = {
  -- top
  boundary(
    defaults.BOUNDARY_POS_X,
    defaults.BOUNDARY_POS_Y,
    defaults.BOUNDARY_W,
    defaults.BOUNDARY_H,
    0,
    defaults.BOUNDARY_COLOR
  ),
  -- bottom
  boundary(
    defaults.BOUNDARY_POS_X,
    defaults.screen_h - defaults.BOUNDARY_POS_Y,
    defaults.BOUNDARY_W,
    defaults.BOUNDARY_H,
    0,
    defaults.BOUNDARY_COLOR
  ),
  -- left
  boundary(
    defaults.BOUNDARY_H / 2,
    defaults.screen_h / 2,
    defaults.screen_h - defaults.BOUNDARY_H * 2,
    defaults.BOUNDARY_H,
    defaults.RIGHT_ANGLE,
    defaults.BOUNDARY_COLOR
  ),
  -- right
  boundary(
    defaults.BOUNDARY_W - defaults.BOUNDARY_H / 2,
    defaults.screen_h / 2,
    defaults.BOUNDARY_H,
    defaults.screen_h - defaults.BOUNDARY_H * 2,
    defaults.STRAIGHT_ANGLE,
    defaults.BOUNDARY_COLOR
  )
}

return b
