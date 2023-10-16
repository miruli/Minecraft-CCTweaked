-- turtle
myName = "Leonardo"
n = 10

function Log(message)
  msg = myName .. ": " .. message
  print(msg)
  if (rednet.isOpen()) then
    rednet.send(2, msg)
  end
end

peripheral.find("modem", rednet.open)
if (rednet.isOpen()) then
  Log("connected")
else
  Log("not connected")
end

turtle.refuel()
Log("refueled!")

for i = 1, n, 1 do
  Log(("loop number %d"):format(i))
  if (i%2 == 0) then
    Log("moving forward")
    turtle.forward()
  else
    Log("moving back")
    turtle.back()
  end
end

Log("bye bye")