display.setStatusBar(display.HiddenStatusBar)

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- set up forward references
local gameTitle
local scoreTxt
-- preload audio


-- create play screen

local function createPlayScreen()													
	local background = display.newImage("background.jpg")	
	background:scale(0.5, 0.5)
	background.y = centerY			
	background.alpha = 0		 
	
	character = display.newImage("man.png")
	character:scale(1, 1)		--evt. verübergehend
	character.x = centerX
	character.y = display.contentHeight + 60
	character.alpha = 0
	
	transition.to( background, { time=2000, alpha=1,  y=centerY, x=centerX } )		
	
	local function showTitle()
		gameTitle = display.newImage("gametitle.png")
		gameTitle.alpha = 0
		gameTitle:scale(4, 4)
		transition.to( gameTitle, {time=500, alpha=1, xScale=1, yScale=1, y=centerY-125, x=centerX} )
		startGame()
	end
	transition.to( character, { time=2000, alpha=1, y=centerY+77, x=centerX+25, onComplete=showTitle, xScale=0.25, yScale=0.25 } ) 
	end	

-- game functions
function startGame()
	local text = display.newText( "Hier tippen zum starten. Beantworte die Fragen!", 0, 0, "Helvetica", 25 )			--Text anzeigen lassen
	text.x = centerX																						--wo im Bildschirm anzeigen lassen? 
	text.y = display.contentHeight - 30
	text:setTextColor(1, 1, 1)																			--farbe für text 
	local function goAway(event)																			--funktion um "vorbereitungs screen" wegzuzmachen und zu beginnen
		display.remove(event.target)
		display.remove(character)
		display.remove(background)
		display.remove(gameTitle)
		spawnWorld()
	end
	text:addEventListener ( "tap", goAway )
end

function spawnWorld()

end
createPlayScreen()
