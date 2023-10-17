--start server
print("initializing remote display")
monitor = peripheral.find("monitor") or error("error: no monitor detected")
monitor.clear()

peripheral.find("modem", rednet.open)
if (rednet.isOpen()) then
  print("connected, waiting for messages:")
  while true do
    id, message = rednet.receive()
    print(("computer %d: %s"):format(id, message))
  end
else
  print("not connected")
end