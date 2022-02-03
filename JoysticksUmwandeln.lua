-- Joystick events werden in Tastatur events umgewandelt
-- damit spart man sich ein extra Programm zum "auswerten der Joysticks"

local M = {}
local deadZone = 0.333

-- events die nachher gebraucht werden
local eventCache = {}

-- Tastenzuornung speichern
local map = {}

-- Achsen werden den Pfeiltasten und wasd zugeornet
map["axis1-"] = "left"
map["axis1+"] = "right"
map["axis2-"] = "up"
map["axis2+"] = "down"

map["axis3-"] = "a"
map["axis3+"] = "d"
map["axis4-"] = "w"
map["axis4+"] = "s"

-- Achsenereignis wird erfasst
local function axis( event )
  local num = event.axis.number or 1
  local name = "axis" .. num
  local value = event.normalizedValue
  local oppositeAxis = "none"

  event.name = "key" -- event überschreiben

  -- variable map wird in das event key eingesetzt
  if value > 0 then
    event.keyName = map[name .. "+"]
    oppositeAxis = map[name .. "-"]
  elseif value < 0 then
    event.keyName = map[name .. "-"]
    oppositeAxis = map[name .. "+"]     
  else
    -- wenn der Fall mit genau 0 eintrifft
    event.keyName = map[name .. "-"]
    oppositeAxis = map[name .. "+"]
  end

  if math.abs(value) > deadZone then
       -- benutzen der entgegengesetzte Achse wenn diese zuletzt gedrückt wurde
    if eventCache[oppositeAxis] then
      event.phase = "up"      
      eventCache[oppositeAxis] = false
      event.keyName = oppositeAxis
      Runtime:dispatchEvent(event)
    end 
    -- bunutzen dieser Achse, wenn sie nicht zuletzt gedrückt wurde
    if not eventCache[event.keyName] then
      event.phase = "down"      
      eventCache[event.keyName] = true
      Runtime:dispatchEvent(event)
    end    
  else
    if eventCache[event.keyName] then
      event.phase = "up"      
      eventCache[event.keyName] = false
      Runtime:dispatchEvent(event)
    end
    if eventCache[oppositeAxis] then
      event.phase = "up"      
      eventCache[oppositeAxis] = false
      event.keyName = oppositeAxis
      Runtime:dispatchEvent(event)
    end     
  end
  return true
end

function M.start()
  Runtime:addEventListener( "axis", axis )
end

return M