-- sound.lua

function playFromSource(source)
  love.audio.play(love.audio.newSource(source, 'static'))
end

return {
  effect_collision = function() playFromSource('sound/effect/collision.mp3') end,
  effect_game_over = function() playFromSource('sound/effect/game-over.mp3') end,
  effect_pause = function() playFromSource('sound/effect/pause.mp3') end,
  effect_unpause = function() playFromSource('sound/effect/unpause.mp3') end,
  effect_powerup = function() playFromSource('sound/effect/powerup.mp3') end
}
