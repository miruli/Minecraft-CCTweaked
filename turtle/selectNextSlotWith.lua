
function selectNextSlotWith(nameFilter)
  for i = 1, 16, 1 do
    print("selecting slot " .. i) turtle.select(i) itemDetail = turtle.getItemDetail()
    if (itemDetail ~= nil) then print(itemDetail.name) if string.find(itemDetail.name, nameFilter) then print("match found.") return i end end
  end print("item not found") return 16
end