shell.run("wget https://raw.githubusercontent.com/NiftyNarwhal11/ModularOS/v0.0.1/.Modules/RednetModule?token=GHSAT0AAAAAACRUSC4CSNXKXCNDHTQJCP5EZRTRTJQ /startup/RednetModule")
settings.define("MOS.rednet.modemside", {
    description = "The side for the rednet modules modem",
    default = "back",
    type = string,
})
write("What is the side your modem is on? >")
local side = read()
settings.set("MOS.rednet.modemside", side)
