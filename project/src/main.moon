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


--love.graphics.setColor(@border_col[0], @border_col[1], @border_col[2], 255/255)
--love.graphics.setColor(@border_col)
--love.graphics.rectangle("fill", @x, @y, @w, @h) --border
--love.graphics.setColor(@col[1], @col[2], @col[3])
--love.graphics.setColor(@col)
--love.graphics.rectangle("fill", @x+@border_w, @y+@border_w, @w-@border_w, @h-@border_w)
--love.graphics.setColor 1.0, 1.0, 1.0, 1.0

class TextElement
    new: (@text, @x, @y, @col) =>
    draw: =>
        love.graphics.setColor(@col)
        love.graphics.print(@text, @x, @y)

-- 49/255, 54/255, 64/255
class SimpleRect
    new: (@x, @y, @w, @h, @border_w, @colorFG) =>

    draw: =>
        love.graphics.setColor(@colorFG)
        love.graphics.rectangle("fill", @x+@border_w, @y+@border_w, @w-@border_w, @h-@border_w)
        love.graphics.setColor 1.0, 1.0, 1.0, 1.0


love.load = ->
    love.filesystem.setIdentity("frost")
    --print "main love.load success!"
    love.graphics.setDefaultFilter "nearest"
    love.keyboard.setKeyRepeat(false)
    love.graphics.setBackgroundColor(214/255, 215/255, 216/255, 0)
    if love.filesystem.getInfo("config.ini")
        print("found configuration. reading...")
        file = love.filesystem.read("config.ini")
        print(file)
    else
        print("no initial configuration file found, overwriting...")
        ok = love.filesystem.createDirectory("content")
        --success = love.filesystem.write("content/config.ini", "init=true")
        success = love.filesystem.write("config.ini", "init=true")
    --love.system.openURL(cwd)

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



local el_txt, el_shape, bg_color

bg_color = {214/255, 215/255, 216/255}
el_txt = TextElement "Frost CMS", 0, 0, {0.0, 0.0, 0.0, 1.0}
--el_shape = SimpleRect 64, 64, 256, 512, 0, {0.1921, 0.2117, 0.25, 1.0}
el_shape = SimpleRect 64, 64, 256, 512, 0, {0.1921, 0.2117, 0.25, 1.0}

love.draw = () ->
    --love.graphics.print("Frost Alpha.", 256, 256)
    el_txt\draw!
    el_shape\draw!
    --love.graphics.setColor 1.0, 1.0, 1.0, 1.0
    



