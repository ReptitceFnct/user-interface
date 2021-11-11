-- title:  Main.lua
-- author(s): ReptitceFnct
-- desc:   display a demo of complete UI 
-- script: lua
-- input:
-- saveid: user interface

--========--
-- H E A D--
--========--

-- This line make mark in the console during the excution 
io.stdout:setvbuf('no')

-- Stop love filters when we re-size image, it's essential for pixel art
love.graphics.setDefaultFilter("nearest")

-- with this line we can debugg step with step in Zerobrain
if arg[#arg] == "-debug" then require("mobdebug").start() end

--===================--
-- V A R I A B L E S --
--===================--

local myGUI = require("GCGUI")
local mainFont = love.graphics.newFont("Images/kenvector_future_thin.ttf", 15)
love.graphics.setFont(mainFont)

------------
-- images --
------------

-- button
local imgButtonDefault = love.graphics.newImage("Images/button_default.png")
local imgButtonHover = love.graphics.newImage("Images/button_hover.png")
local imgButtonPressed = love.graphics.newImage("Images/button_pressed.png")

-- panel
local imgPanel1 = love.graphics.newImage("Images/panel1.png")
local imgPanel2 = love.graphics.newImage("Images/panel2.png")

-- dot
local imgRedDot = love.graphics.newImage("Images/dotRed.png")
local imgGreenDot = love.graphics.newImage("Images/dotGreen.png")

-- progress
local imgProgressGrey = love.graphics.newImage("Images/progress_grey.png")
local imgProgressOrange = love.graphics.newImage("Images/progress_orange.png")
local imgProgressGreen = love.graphics.newImage("Images/progress_green.png")

-----------
-- group --
-----------

local groupTest

--=================--
-- F U N C T I O N --
--=================--

function onPanelHover(pState)
  print("Panel is hover:"..pState)
end

function onCheckboxSwitch(pState)
  print("Switch is:"..pState)
end

function love.load()
  
  -- set title of the xreen 
  love.window.setTitle("GUI Demo")
  
  -- set the color of the background
  love.graphics.setBackgroundColor(63/255, 124/255, 182/255)
  
  -- recuperation of the size of the screen 
  screenWidth = love.graphics.getWidth()
  screenHeight = love.graphics.getHeight()
  
  -- call the function for set variable of the button and display them
  buttonYes = myGUI.newButton(10, 20, 100, 43,"Yes", mainFont, {151, 220, 250})
  buttonYes:setImages(imgButtonDefault, imgButtonHover, imgButtonPressed)
  buttonNo = myGUI.newButton(115, 20, 100, 43,"No", mainFont, {151, 220, 250})
  buttonNo:setImages(imgButtonDefault, imgButtonHover, imgButtonPressed)
  
  buttonTest3 = myGUI.newButton(55, 100, 120, 80,"No images", mainFont, {250, 250, 250})
  
  -- call the function for set variable of the panel and display them
  panelTest1 = myGUI.newPanel(10, 220, 300, 200)
  panelTest1:setImage(imgPanel1)
  panelTest1:setEvent("hover", onPanelHover)

  panelTest2 = myGUI.newPanel(350, 250)
  panelTest2:setImage(imgPanel2)

  -- call the function text and display text on the screen(position x, position y , width, height, text, font, align or not, color)
  textTest = myGUI.newText(panelTest1.X+10, panelTest1.Y, 300, 28, "HULL STATUS", mainFont, "", "center", {151, 220, 250})
  
  -- call the function checkbox set variables and display them (position x, position y, width, height)
  checkBoxTest1 = myGUI.newCheckbox(250, 30, 24, 24)
  checkBoxTest1:setImages(imgRedDot, imgGreenDot)
  checkBoxTest1:setEvent("pressed", onCheckboxSwitch)
  
  title1 = myGUI.newText(panelTest1.X + 35, panelTest1.Y + 45, 0, 0, "Shield Generator", mainFont, "", "", {157, 164, 174})
  
  -- call the function prgress bar set variabale and display them 
  progressTest1 = myGUI.newProgressBar(panelTest1.X + 35, panelTest1.Y + 68, 220, 26, 100, {50,50,50}, {250, 129, 50})
  progressTest1:setImages(imgProgressGrey, imgProgressOrange)

  
  title2 = myGUI.newText(panelTest1.X + 35, panelTest1.Y + 45 + 70, 0, 0, "Generator Shield", mainFont, "", "", {157, 164, 174})
  
  progressTest2 = myGUI.newProgressBar(panelTest1.X + 35, panelTest1.Y + 68 + 70, 220, 26, 100, {50,50,50}, {250, 129, 50})
  progressTest2:setImages(imgProgressGrey, imgProgressGreen)
  progressTest2:setValue(0)


  -- link all the element to group test for display them 
  groupTest = myGUI.newGroup()
  groupTest:addElement(buttonYes)
  groupTest:addElement(buttonNo)
  groupTest:addElement(buttonTest3)
  groupTest:addElement(panelTest1)
  groupTest:addElement(panelTest2)
  groupTest:addElement(checkBoxTest1)
  groupTest:addElement(textTest)
  groupTest:addElement(title1)
  groupTest:addElement(progressTest1)
  groupTest:addElement(title2)
  groupTest:addElement(progressTest2)
  
end

function love.update(dt)

  -- update all the element of group test 
  groupTest:update(dt)
  
  -- change the value of progress bar for test them 
  if progressTest1.Value > 0.01 then
    progressTest1:setValue(progressTest1.Value - 0.01)
  end
  if progressTest2.Value < 100 then
    progressTest2:setValue(progressTest2.Value + 0.01)
  end

end

function love.draw()
  
  -- darw all the element of group test
  groupTest:draw()
  
end

-- dispaly the pressed key 
function love.keypressed(key)
  
  print(key)
  
end
