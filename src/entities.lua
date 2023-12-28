-- entities.lua

local defaults = require("defaults")
local b = require("entities/boundary")
local p = require("entities/player")
local game_over = require('entities/text/game-over')
local score = require('entities/text/score')
local pause = require('entities/text/pause')
local powerup = require('entities/text/powerup')

local player = p(
	defaults.PLAYER_POS_X,
	defaults.PLAYER_POS_Y,
	defaults.PLAYER_RADIUS,
	defaults.PLAYER_COLOR
)

local boundary = {
  -- top
  b(
    defaults.BOUNDARY_POS_X,
    defaults.BOUNDARY_POS_Y,
    defaults.BOUNDARY_W,
    defaults.BOUNDARY_H,
    0,
    defaults.BOUNDARY_COLOR
  ),
  -- bottom
  b(
    defaults.BOUNDARY_POS_X,
    defaults.screen_h - defaults.BOUNDARY_POS_Y,
    defaults.BOUNDARY_W,
    defaults.BOUNDARY_H,
    0,
    defaults.BOUNDARY_COLOR
  ),
  -- left
  b(
    defaults.BOUNDARY_H / 2,
    defaults.screen_h / 2,
    defaults.screen_h - defaults.BOUNDARY_H * 2,
    defaults.BOUNDARY_H,
    defaults.RIGHT_ANGLE,
    defaults.BOUNDARY_COLOR
  ),
  -- right
  b(
    defaults.BOUNDARY_W - defaults.BOUNDARY_H / 2,
    defaults.screen_h / 2,
    defaults.BOUNDARY_H,
    defaults.screen_h - defaults.BOUNDARY_H * 2,
    defaults.STRAIGHT_ANGLE,
    defaults.BOUNDARY_COLOR
  )
}

local text = {
  -- game over text
  game_over(),
  -- score text
  score(),
  -- pause text
  pause(),
	-- powerup count text
	powerup()
}

local opps = {}
local health = {}
local powerups = {}

return {
  player = player,
  boundary = boundary,
  text = text,
  opps = opps,
  health = health,
  powerups = powerups
}
