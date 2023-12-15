-- defaults.lua

local screen_w, screen_h = love.window.getMode()

local STRAIGHT_ANGLE = math.rad(180)
local RIGHT_ANGLE = STRAIGHT_ANGLE / 2
local RIGHT_ANGLE_HALF = RIGHT_ANGLE / 2

local COLOR_PAIRS = {
 {'red-dark', 'red', 'red-light'},
 {'green-dark', 'green', 'green-light'},
 {'blue-dark', 'blue', 'blue-light'},
 {'orange-red', 'orange-dark', 'orange'},
 {'purple-rebecca', 'purple', 'purple-medium'},
 {'pink-deep', 'pink-hot', 'pink-light'},
 {'grey-slate-dark', 'grey-slate', 'grey-slate-light'}
}

local MIN_IMPULSE_X, MAX_IMPULSE_X = 100, 250
local MIN_IMPULSE_Y, MAX_IMPULSE_Y = 100, 250

local BOUNDARY_H = 10
local BOUNDARY_W = screen_w
local BOUNDARY_POS_X = screen_w / 2
local BOUNDARY_POS_Y = BOUNDARY_H / 2
local BOUNDARY_COLOR = 'white'

local PLAYER_POS_X = BOUNDARY_POS_X
local PLAYER_POS_Y = screen_h / 2
local PLAYER_RADIUS = 15
local PLAYER_COLOR = 'white'

local OPP_RADIUS_MIN = 10
local OPP_RADIUS_MAX = 20
local OPP_SPAWN_POS_CLEAREANCE = 50
local OPP_SPAWN_POS = {
  -- top left
  {BOUNDARY_H + OPP_SPAWN_POS_CLEAREANCE, OPP_SPAWN_POS_CLEAREANCE},
  -- top right
  {screen_w - OPP_SPAWN_POS_CLEAREANCE, BOUNDARY_H + OPP_SPAWN_POS_CLEAREANCE},
  -- bottom left
  {screen_w - OPP_SPAWN_POS_CLEAREANCE, screen_h - OPP_SPAWN_POS_CLEAREANCE - BOUNDARY_H},
  -- bottom right
  {BOUNDARY_H + OPP_SPAWN_POS_CLEAREANCE, screen_h - OPP_SPAWN_POS_CLEAREANCE - BOUNDARY_H}
}

local POWERUP_W = 10
local POWERUP_H = 10
local POWERUP_ANGLE = RIGHT_ANGLE_HALF
local POWERUP_COLOR = 'white'
local POWERUP_SPAWN_POS_CLEARANCE = 50
local POWERUP_SPAWN_POS = {
  -- top middle
  {screen_w / 2 , BOUNDARY_H + POWERUP_SPAWN_POS_CLEARANCE},
  -- right middle
  {screen_w - BOUNDARY_H - POWERUP_SPAWN_POS_CLEARANCE, screen_h / 2},
  -- bottom middle
  {screen_w / 2, screen_h - BOUNDARY_H - POWERUP_SPAWN_POS_CLEARANCE},
  -- left middle
  {BOUNDARY_H + POWERUP_SPAWN_POS_CLEARANCE, screen_h / 2}
}
  
return {
  screen_w = screen_w,
  screen_h = screen_h,
  
  STRAIGHT_ANGLE = STRAIGHT_ANGLE,
  RIGHT_ANGLE = RIGHT_ANGLE,
  RIGHT_ANGLE_HALF = RIGHT_ANGLE_HALF,
  COLOR_PAIRS = COLOR_PAIRS,

  MIN_IMPULSE_X = MIN_IMPULSE_X,
  MAX_IMPULSE_X = MAX_IMPULSE_X,
  MIN_IMPULSE_Y = MIN_IMPULSE_Y,
  MAX_IMPULSE_Y = MAX_IMPULSE_Y,
  
  BOUNDARY_H = BOUNDARY_H,
  BOUNDARY_W = BOUNDARY_W,
  BOUNDARY_POS_X = BOUNDARY_POS_X,
  BOUNDARY_POS_Y = BOUNDARY_POS_Y,
  BOUNDARY_COLOR = BOUNDARY_COLOR,
  
  PLAYER_POS_X = PLAYER_POS_X,
  PLAYER_POS_Y = PLAYER_POS_Y,
  PLAYER_RADIUS = PLAYER_RADIUS,
  PLAYER_COLOR = PLAYER_COLOR,

  OPP_RADIUS_MIN = OPP_RADIUS_MIN,
  OPP_RADIUS_MAX = OPP_RADIUS_MAX,
  OPP_SPAWN_POS = OPP_SPAWN_POS,

  POWERUP_W = POWERUP_W,
  POWERUP_H = POWERUP_H,
  POWERUP_ANGLE = POWERUP_ANGLE,
  POWERUP_COLOR = POWERUP_COLOR,
  POWERUP_SPAWN_POS = POWERUP_SPAWN_POS
}
