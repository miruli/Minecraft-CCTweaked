function placePathColInFront(height, nameFilter)
  if (turtle.detect()) then turtle.dig() end assert(turtle.forward())
  
  for turtleHeight = 1, height-1, 1 do
    if (turtle.detectUp()) then turtle.digUp() end
    if (turtleHeight + 1 < height) then assert(turtle.up()) end 
  end
  
  for turtleHeight = height-1, 2, -1 do assert(turtle.down()) end
    
  if (turtle.detectDown()) then turtle.digDown() end tryPlace(nameFilter)
end

function buildPath(height, width, length, nameFilter)
  left = false
  for i = 1, length, 1 do
    placePathColInFront(height, nameFilter) 
    if (left) then turtle.turnLeft() else turtle.turnRight() end
    for j = 1, width-1, 1 do placePathColInFront(height) end
    if (left) then turtle.turnRight() else turtle.turnLeft() end
    left = not left
  end
end

function selectNextSlotWith(nameFilter)
  for i = 1, 16, 1 do
    turtle.select(i) itemDetail = turtle.getItemDetail()
    if (itemDetail ~= nil) then print(itemDetail.name) if string.find(itemDetail.name, nameFilter) then return i end end
  end return 16
end

function tryPlace(nameFilter) if (turtle.getItemCount() <= 0) then selectNextSlotWith(nameFilter) end assert(turtle.placeDown()) end

buildPath(4, 4, 50, "stone")