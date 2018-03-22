-----------------------------------------------------------------------------------------
---- Title: TouchAndDrag
-- Name: Nice Mena
-- Course: ICS2O/3C
-- This program displays images that can be touched and dragged

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local variables set the x-value 
local backgroundImage = display.newImageRect("Images/chawengbeach.png", 2050, 3000)
local girl3 = display.newImageRect("Images/girl3.png", 150, 150)
local girl3wWidth = girl3.width
local girl3Height = girl3.height 

local girl5 = display.newImageRect("Images/girl5.png", 175, 150)
local girl5wWidth = girl5.width
local girl5Height = girl5.height 

-- my boolean variables to keep track of which object i touched first
local alreadyTouchedGirl3 = false
local alreadyTouchedGirl5 = false

-- set the initial x and y position of my image
girl3.x = 650
girl3.y = 145

girl5.x = 300
girl5.y = 200

--Funtion: Girl3Listener
--Input: touch listener
--Output: none
--Description: when girl 3 is touched, move her
local function Girl3Listener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedGirl5 == false) then
			alreadyTouchedGirl3 = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedGirl3 == true) ) then
		girl3.x = touch.x
		girl3.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedGirl3 = false
		alreadyTouchedGirl5 = false
	end
end

girl3:addEventListener("touch", Girl3Listener)

--Funtion: Girl5Listener
--Input: touch listener
--Output: none
--Description: when girl 5 is touched, move her
local function Girl5Listener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedGirl3 == false) then
			alreadyTouchedGirl5 = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedGirl5 == true) ) then
		girl5.x = touch.x
		girl5.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedGirl3 = false
		alreadyTouchedGirl5 = false
	end
end

girl5:addEventListener("touch", Girl5Listener)

-- create local variables
local RandomSound

--correct sound
local RandomSound = audio.loadSound( "sounds/ChaChing.mp3" )
local backgroundMusic

-- setting th
backgroundMusic = audio.play(RandomSound)
