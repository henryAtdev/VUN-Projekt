-- Include modules/libraries
local composer = require( "composer" )

-- Variables local to scene
local prevScene = composer.getSceneName( "previous" )

-- Create a new Composer scene
local scene = composer.newScene()

function scene:show( event )

local myString1 = "Was ist die allgemeine Formel fuer F"
local myString2 = "F= m*a"
local myString3 = "F= m*v"

local myText1 = display.newText( myString1, display.contentCenterX, display.contentCenterY, 1000, 600, native.systemFont, 50 )
local myText2 = display.newText( myString2, display.contentCenterX, display.contentCenterY, 1000,  300, native.systemFont, 30 )
local myText3 = display.newText( myString3, display.contentCenterX, display.contentCenterY, 1000, 0, native.systemFont, 30 )

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
