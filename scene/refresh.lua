-- Include modules/libraries
-- package.path = package.path .. ";../lib/?.lua"
-- local lunajson = require("lunajson")

local composer = require( "composer" )
local json = require( "json" )  -- Include the Corona JSON library


-- https://docs.coronalabs.com/tutorial/data/jsonSaveLoad/index.html
function readJSONFromFile( filename, location )
 
    local loc = location
    if not location then
        loc = system.ResourceDirectory
    end
 
    -- Path for the file to read
    local path = system.pathForFile( filename, loc )
 
    -- Open the file handle
    local file, errorString = io.open( path, "r" )
 
    if not file then
        -- Error occurred; output the cause
        print( "File error: " .. errorString )
    else
        -- Read data from file
        local contents = file:read( "*a" )
        -- Decode JSON data into Lua table
        local t = json.decode( contents )
        -- Close the file handle
        io.close( file )
        -- Return table
        return t
    end
end



-- Variables local to scene
local prevScene = composer.getSceneName( "previous" )

-- Create a new Composer scene
local scene = composer.newScene()

function scene:show( event )

local questionMapData = readJSONFromFile( "config/questions.json", system.ResourceDirectory )
--print( json.encode( questionMapData ) ) 
print(#questionMapData )


--ToDo: Rest screen after every level

math.randomseed(os.time()) -- random initialize
math.random(); math.random(); math.random() -- warming up

local rndNumber = math.random( 1, #questionMapData)
print ( rndNumber )
print( math.random( 1, #questionMapData) )

local rndQuestion = questionMapData[ rndNumber ]
print( json.encode( rndQuestion ) )


local question = rndQuestion.question
local answer1 = rndQuestion.answers[1].value
local answer2 = rndQuestion.answers[2].value

local myText1 = display.newText( json.encode( question ), display.contentCenterX, display.contentCenterY, 1000, 600, native.systemFont, 50 )
local myText2 = display.newText( json.encode( answer1 ), display.contentCenterX, display.contentCenterY, 1000,  300, native.systemFont, 30 )
local myText3 = display.newText( json.encode(answer2 ), display.contentCenterX, display.contentCenterY, 1000, 0, native.systemFont, 30 )

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
