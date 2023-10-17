local monitor

function getGameTime()
  return "Day " .. os.day() .. " - " .. textutils.formatTime(os.time())
end

function getRealTime()
  return os.date("%b-%d - %I:%M %p")
end

function displayMessage(message)
  print(message)
  term.redirect(monitor)
  print(message)
  term.redirect(term.native())
end

function Init()
  monitor = peripheral.find("monitor") or error("error: no monitor detected")
end

Init()
while true do
  displayMessage(getGameTime)
  sleep(3)
  displayMessage(getRealTime)
  sleep(3)
  displayMessage("tomen awita")
end