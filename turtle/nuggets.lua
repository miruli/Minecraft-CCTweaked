function dropFlint()
  for i = 1, 16, 1 do
    turtle.select(i) 
    turtle.suckDown()
    itemDetail = turtle.getItemDetail()
    if (itemDetail ~= nil and string.find(itemDetail.name, "flint")) then turtle.drop() end
  end
end

while true do
  dropFlint()
  sleep(60)
end