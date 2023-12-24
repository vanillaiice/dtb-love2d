-- entities.lua

local defaults = require('defaults')
local boundary = require('entities/boundary')
local player = require('entities/player')
local game_over = require('entities/text/game-over')
local score = require('entities/text/score')
local health = require('entities/text/health')
local pause = require('entities/text/pause')
 
local entities = {
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
  ),
  -- player
  player(
    defaults.PLAYER_POS_X,
    defaults.PLAYER_POS_Y,
    defaults.PLAYER_RADIUS,
    defaults.PLAYER_COLOR
  ),
  -- game over text
  game_over(),
  -- score text
  score(),
  -- health text
  health(),
  -- pause text
  pause()
}

return entities
