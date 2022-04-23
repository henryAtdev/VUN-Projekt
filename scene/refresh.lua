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
end
    myText3:addEventListener( "tap", test )


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
