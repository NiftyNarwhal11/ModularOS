shell.exit()
shell.run( "set motd.enable false" )
shell.run( "set shell.allow_disk_startup false" )
local version = "0.10"
local latestVersion = http.get("http://www.pastebin.com/raw/qsPhpy6x")
local lversion = latestVersion.readAll()
settings.load(".settings")
if settings.get("MOS.auto-update.enabled") == true then
if lversion > version then
    term.setBackgroundColor( colors.yellow )
    term.clear()
    printError("Updating")
    term.setCursorPos(20, 8)
    sleep(2)
    term.clear()
    term.write("Press Enter to update to new version")
    a = read()
    if a == "" then
        shell.run("delete /startup")
        shell.run("delete Installer.lua")
        shell.run("wget https://raw.githubusercontent.com/NiftyNarwhal11/ModularOS/main/Installer.lua?token=GHSAT0AAAAAACRUSC4C5YDZTPOSL6YTRJ64ZRTR2EA Installer.lua")
        shell.run("Installer.lua")
        
    else
        shell.run("/.os/.password")
    end
    else
        shell.run("/.os/.password")
end
else
    shell.run("/.os/.password")
end
