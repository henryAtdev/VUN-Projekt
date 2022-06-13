-- Include modules/libraries
local composer = require( "composer" )

-- Variables local to scene
local prevScene = composer.getSceneName( "previous" )
local questionFilename = "scene/game/map/questions.json"
local questionMapData = json.decodeFile( system.pathForFile( questionFilename, system.ResourceDirectory ) )
var rndQuestion = questionMapData[ math.random( #questionMapData ) ]

-- Create a new Composer scene
local scene = composer.newScene()

function scene:show( event )

local question = rndQuestion.question
local answer1 = rndQuestion.answers[0]
local answer2 = rndQuestion.answers[1]

local myText1 = display.newText( question, display.contentCenterX, display.contentCenterY, 1000, 600, native.systemFont, 50 )
local myText2 = display.newText( answer1, display.contentCenterX, display.contentCenterY, 1000,  300, native.systemFont, 30 )
local myText3 = display.newText( answer2, display.contentCenterX, display.contentCenterY, 1000, 0, native.systemFont, 30 )

function test(event)
	composer.gotoScene( "scene.menu")
	transition.to( myText1, { time=1000, alpha=0 } )
	transition.to( myText2, { time=1000, alpha=0 } )
	transition.to( myText3, { time=1000, alpha=0 } )
end
    myText3:addEventListener( "tap", test )

function test2(event)
	transition.to( myText1, { time=2000, alpha=0,  y=centerY, x=centerX } )
	transition.to( myText2, { time=2000, alpha=0,  y=centerY, x=centerX } )
	transition.to( myText3, { time=2000, alpha=0,  y=centerY, x=centerX } )
end
	myText2:addEventListener( "tap", test2)


	local phase = event.phase
	local options = { params = event.params }
	if ( phase == "will" ) then
		composer.removeScene( prevScene )
	elseif ( phase == "did" ) then
		composer.gotoScene( prevScene, options )
	end
end

scene:addEventListener( "show", scene )

return scene
