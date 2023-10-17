local monitor

function GameTime()
  return "Day " .. os.day() .. " - " .. textutils.formatTime(os.time())
end

function RealTime()
  return os.date("%b-%d - %I:%M %p")
end

function Init()
  monitor = peripheral.find("monitor") or error("error: no monitor detected")
end

Init()
while true do
  message = GameTime()
  print(message)
  monitor.write(message)
  sleep(3)
end