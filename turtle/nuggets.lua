local modem = peripheral.wrap("back")
local turtleName = modem.getNameLocal()
local chest = peripheral.find("chest")

chest.pushItems(turtleName, 1, 1)