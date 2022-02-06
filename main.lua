
-- Bibliotheken hinzufügen
local composer = require( "composer" )

-- Grundeinstellungen
display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")
local isSimulator = "simulator" == system.getInfo( "environment" )
local isMobile = ( "ios" == system.getInfo("platform") ) or ( "android" == system.getInfo("platform") )

-- generelle Variablen festlegen
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local gameTitle
local scoreTxt
-- Audio Files


-- Startbildschirm

local function createPlayScreen()													
	local background = display.newImage("images/background.jpg")	
	background:scale(0.5, 0.5)
	background.y = centerY			
	background.alpha = 0		 
	
	character = display.newImage("images/man.png")
	character:scale(1, 1)		--evt. verübergehend
	character.x = centerX
	character.y = display.contentHeight + 60
	character.alpha = 0
	
	transition.to( background, { time=2000, alpha=1,  y=centerY, x=centerX } )		
	
	local function showTitle()
		gameTitle = display.newImage("images/gametitle.png")
		gameTitle.alpha = 0
		gameTitle:scale(4, 4)
		transition.to( gameTitle, {time=500, alpha=1, xScale=1, yScale=1, y=centerY-125, x=centerX} )
		startGame()
	end
	transition.to( character, { time=2000, alpha=1, y=centerY+77, x=centerX+25, onComplete=showTitle, xScale=0.25, yScale=0.25 } ) 
	end	

-- spiel Starten(Startbildschirm zurücksetzen)
function startGame()
	local text = display.newText( "Hier tippen zum starten. Beantworte die Fragen!", 0, 0, "Helvetica", 25 )
	text.x = centerX
	text.y = display.contentHeight - 30
	text:setTextColor(1, 1, 1)
	local function goAway(event)
		display.remove(event.target)
		display.remove(character)
		display.remove(background)
		display.remove(gameTitle)
		spawnWorld()
	end
	text:addEventListener ( "tap", goAway )

	require( "Joysticksumwandeln" ).start()
	
	if isMobile or isSimulator then
		local vjoy = require( "Joysticks" )
		local stick = vjoy.newStick()
		stick.x, stick.y = 128, display.contentHeight - 128
		local button = vjoy.newButton()
		button.x, button.y = display.contentWidth - 128, display.contentHeight - 128
	end
end

--Lvl starten
function spawnWorld()

end
createPlayScreen()
