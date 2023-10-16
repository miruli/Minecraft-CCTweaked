--[[config]] name = "Leonardo"
serverId = 2

--[[functions]]
function Log(message)
    msg = name .. ": " .. message
    print(msg)
    if (rednet.isOpen()) then
        rednet.send(serverId, msg)
    end
end

function ReportStatus()
    fuelLevel = turtle.getFuelLevel()
    fuelLimit = turtle.getFuelLimit()
    Log(("fuel level: %d/%d"):format(fuelLevel, fuelLimit))
    detect = turtle.detect()
    Log(("detect front: %s"):format(detect))
    detectUp = turtle.detectUp()
    Log(("detect up: %s"):format(detectUp))
    detectDown = turtle.detectDown()
    Log(("detect down: %s"):format(detectDown))

end

function TryRefuel()
    turtle.refuel()
    Log("refueled!")
end

function Init()
    Log("initializing")
    peripheral.find("modem", rednet.open)
    if (rednet.isOpen()) then
        Log("modem connected")
    else
        Log("modem failed to connect")
    end
    ReportStatus()
end

function MoveTest(n)
    for i = 1, n, 1 do
        Log(("loop number %d"):format(i))
        if (i % 2 == 0) then
            Log("moving forward")
            turtle.forward()
        else
            Log("moving back")
            turtle.back()
        end
    end
end

function PlacePathColInFront(Height)
  Log("Height:" .. Height) if (Height <= 1) then Log("invalid Height") return end

  if (turtle.detect()) then Log("block in front") turtle.dig() end assert(turtle.forward())
  
  for turtleHeight = 1, Height-1, 1 do
    Log("turtle height: " .. turtleHeight)
    if (turtle.detectUp()) then Log("block above") turtle.digUp() end
    if (turtleHeight + 1 < Height) then assert(turtle.up()) end 
  end
  
  Log("moving down again") 
  for turtleHeight = Height-1, 2, -1 do 
    Log("turtle height: " .. turtleHeight)
    assert(turtle.down()) 
  end
    
  if (turtle.detectDown()) then Log("block below") turtle.digDown() end
  assert(turtle.placeDown()) Log("placed path")
end

function BuildPath(height, width, length)
  left = false wd = width
  for i = 1, length, 1 do
    PlacePathColInFront(height) 
    if (left) then turtle.turnLeft() else turtle.turnRight() end
    for j = 1, width-1, 1 do PlacePathColInFront(height) end
    if (left) then turtle.turnRight() else turtle.turnLeft() end
    left = not left
  end
end

function selectNextSlotWith(nameFilter)
  for i = 1, 16, 1 do
    print("selecting slot " .. i) turtle.select(i) itemDetail = turtle.getItemDetail()
    if (itemDetail ~= nil) then print(itemDetail.name) if string.find(itemDetail.name, nameFilter) then print("match found.") return i end end
  end print("item not found") return 16
end

--[[program]]
Init()
BuildPath(3, 3, 2)
Log("bye bye")
