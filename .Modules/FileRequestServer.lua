print("What side is your modem on?")
side = io.read()
rednet.open(side)
term.clear()
while true do
  id,msg = rednet.receive()
  if msg == "REQUEST" then
    id2,msg2 = rednet.receive()
    rednet.send(id, "RECEIVE")
    print("Request for " .. msg2 .. " coming in from ID: " .. id2)
    if id2 == id then
      f = fs.open(msg2, "r")
      rednet.send(id, f.readAll()
      f.close()
    end
  end
end
