local args = {...}
print("What side is your modem on?")
side = io.read()
rednet.open(side)
print("Usage:")
print("FileRequest (ComputerID) (Filename)")
if #args ~= 2 then
  print("The program requires two arguments. You gave "..#args..".")
end
if #args == 2 then
  id = tonumber(args[1])
  rednet.send(id, "REQUEST")
  rednet.send(id, args[2])
  id,msg = rednet.receive()
  if msg == "RECEIVE" then
    id2,msg2 = rednet.receive()
    f = fs.open(args[2], "w")
    f.write(msg2)
    f.close()
    print("File "..args[2].." successfully requested.")
  end
end
