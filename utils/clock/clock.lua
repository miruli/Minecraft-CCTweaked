local monitor

function GetGameTime()
  return "Day " .. os.day() .. " - " .. textutils.formatTime(os.time())
end

function GetRealTime()
  return os.date("%b-%d - %I:%M %p")
end

function DisplayMessage(message)
  print(message)
  term.redirect(monitor)
  print(message)
  term.redirect(term.native())
end

function Init()
  monitor = peripheral.find("monitor") or error("error: no monitor detected")
  monitor.setTextScale(3)
end

Init()
while true do
  DisplayMessage(GetGameTime())
  sleep(3)
  DisplayMessage(GetRealTime())
  sleep(3)
  DisplayMessage("tomen awita")
  sleep(3)
end