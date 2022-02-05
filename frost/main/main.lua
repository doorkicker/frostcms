local Push = require("push")
local Camera = require("camera")
local flux = require("flux")
local moonshine = require("moonshine")
local Gamestate = require("gamestate")
love.window.setTitle("Frost CMS for Game Development")
local gameWidth, gameHeight = 1280, 720
local windowWidth, windowHeight = love.window.getDesktopDimensions()
love.resize = function(w, h)
  return push:resize(w, h)
end
Push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {
  fullscreen = true
})
love.load = function()
  love.graphics.setDefaultFilter("nearest")
  love.keyboard.setKeyRepeat(false)
  return love.graphics.setBackgroundColor(214 / 255, 215 / 255, 216 / 255, 0)
end
love.keypressed = function(key, scancode)
  if key == "escape" then
    return love.event.quit()
  end
end
local ticks, acc
ticks = 1 / 50
acc = 0.0
love.update = function(dt)
  flux.update(dt)
  acc = acc + dt
  if acc >= ticks then
    acc = acc - ticks
  end
end
love.draw = function()
  love.graphics.print("Frost Alpha.", 256, 256)
  return love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
end
