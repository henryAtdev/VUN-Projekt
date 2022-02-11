
-- Grundeinstellungen
local composer = require( "composer" )
system.activate("multitouch")
display.setStatusBar( display.HiddenStatusBar )

-- Platform prüfen
local isSimulator = "simulator" == system.getInfo( "environment" )
local isMobile = ( "ios" == system.getInfo("platform") ) or ( "android" == system.getInfo("platform") )

-- Joysticks umwandeln
require( "JoysticksUmwandeln" ).start()

-- Joysticks hinzufügen
if isMobile or isSimulator then
	local vjoy = require( "Joysticks" )
	local stick = vjoy.newStick()
	stick.x, stick.y = 128, display.contentHeight - 128
	local button = vjoy.newButton()
	button.x, button.y = display.contentWidth - 128, display.contentHeight - 128
end

-- Musikkanal resservieren
audio.reserveChannels(1)

--Menu öffnen
composer.gotoScene( "menu" )