print("Rednet opened")
local modem = peripheral.find("modem")
rednet.open(settings.get("MOS.rednet.modemside"))
