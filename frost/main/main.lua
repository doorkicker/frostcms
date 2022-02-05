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
local TextElement
do
  local _class_0
  local _base_0 = {
    draw = function(self)
      love.graphics.setColor(self.col)
      return love.graphics.print(self.text, self.x, self.y, 255 / 255)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, text, x, y, col)
      if col == nil then
        col = {
          1 / 255,
          1 / 255,
          1 / 255,
          0
        }
      end
      self.text, self.x, self.y, self.col = text, x, y, col
      self.x = self.x
      self.y = self.y
      self.col = self.col
    end,
    __base = _base_0,
    __name = "TextElement"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  TextElement = _class_0
end
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
local el_txt
el_txt = TextElement("Frost CMS", 0, 0, {
  0,
  0,
  0,
  255 / 255
})
love.draw = function()
  return el_txt:draw()
end
