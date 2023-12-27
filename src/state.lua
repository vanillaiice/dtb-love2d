-- state.lua

return {
  paused = false,
  game_over = false,
	repel = false,
	destroy_around = false,
	powerup_active = false,
	speed_multiplier = 1,
  health = 3,
  score = 0,
  opp_count = 0,
  health_count = 0,
  powerup_count = 0,
	powerup_repel_count = 1,
	powerup_destroy_around_count = 1,
	powerup_slow_motion_count = 1
}
