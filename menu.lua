-- hinzufügen von Modulen/Bibliotheken
local composer = require( "composer" )


--neue composer scene
local scene = composer.newScene()

-- scene erstellen
function scene:create()                                                    
    local background = display.newImage("images/background.jpg")    
    background:scale(0.5, 0.5)
    background.y = centerY            
    background.alpha = 0         
    
    character = display.newImage("images/man.png")
    character:scale(1, 1)        --evt. verübergehend
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

function start:tap()
    local text = display.newText( "Hier tippen zum starten. Beantworte die Fragen!", 0, 0, "Helvetica", 25 )
    text.x = centerX
    text.y = display.contentHeight - 30
    text:setTextColor(1, 1, 1)
    composer.gotoScene( "game")
    end
    text:addEventListener ( "tap", goAway )