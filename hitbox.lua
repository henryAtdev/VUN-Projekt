--Variablen für die Bilder erstellen
local steinebenegroß = display.newImage("steinebene.png", 100, 200) --100 und 200 sind vermutlich Koordinaten, Bild muss noch skaliert werden
local steinebeneklein = display.newImage("steinebene2.png", 50, 150) -- "
local Grasstreifen = display.newImage("Grasstreifen.png", 3, -20) -- "
local Grasblock = display.newImage("Grasblock.png", 20, -50) -- "

local Steinmaterial = { density=1.5, friction=0.4, bounce=0.2 }
-- Variable für Beschaffenheit der Bilder Dichte, Reibung, Abprallen 
local Grasmaterial = { density=1.2, friction=0.2, bounce=0.3 }

physics.addBody( steinebenegroß, Steinmaterial )
physics.addBody( steinebeneklein, Steinmaterial)
physics.addBody( Grasstreifen, Grasmaterial)
physics.addBody( Grasblock, Grasmaterial)
-- den Bilder-Variablen wurde ein physikalischer Körper hinzugefügt
