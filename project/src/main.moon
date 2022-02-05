Push = require "push"
Camera = require "camera"
flux = require "flux"
--moon = require "moon.all"
moonshine = require "moonshine"
Gamestate = require "gamestate"
--ow1 = require "ow1"
--mainmenu = require "mainmenu"

love.window.setTitle "Frost CMS for Game Development"
gameWidth, gameHeight = 1280, 720
windowWidth, windowHeight = love.window.getDesktopDimensions()

love.resize = (w, h) ->
  push\resize w, h

Push\setupScreen gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen: true} --{fullscreen: true}



    
--local logobg, obj_logo --, video
love.load = ->
    --print "main love.load success!"
    love.graphics.setDefaultFilter "nearest"
    love.keyboard.setKeyRepeat(false)
    love.graphics.setBackgroundColor(214/255, 215/255, 216/255, 0)
    

love.keypressed = (key, scancode) ->
    if key == "escape" then
        love.event.quit!

local ticks, acc
ticks = 1/50
acc = 0.0
love.update = (dt) ->
  flux.update(dt)
  acc = acc + dt
  if acc >= ticks then
    acc = acc - ticks --assures we dont lose any ticks in case acc is above ticks, instead of setting it to 0

    
love.draw = () ->
    love.graphics.print("Frost Alpha.", 256, 256)
    love.graphics.setColor 1.0, 1.0, 1.0, 1.0



