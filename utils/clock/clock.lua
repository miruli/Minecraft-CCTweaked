function GameTime()
  return "Day " .. os.day() .. " - " .. textutils.formatTime(os.time())
end

function RealTime()
  return os.date("%b-%d - %I:%M %p")
end

while true do
  message = GameTime()
  print(message)
end