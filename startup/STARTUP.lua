shell.exit()
shell.run( "set motd.enable false" )
shell.run( "set shell.allow_disk_startup false" )
local version = "1.07"
local latestVersion = http.get("https://raw.githubusercontent.com/NiftyNarwhal11/ModularOS/refs/heads/main/latestVersion")
local lversion = latestVersion.readLine()
print(lversion)
print(version)
print(lversion > version == true)
print(settings.get("MOS.auto-update.enable"))
settings.load(".settings")
if settings.get("MOS.auto-update.enable") == true then
if lversion > version then
    term.setBackgroundColor( colors.yellow )
    term.clear()
    printError("Updating")
    term.setCursorPos(5, 8)
    sleep(2)
    term.clear()
    term.write("Press Enter to update to new version.")
    term.setCursorPos(5,9)
    term.write("\n Add other characters before enter to cancel")
    a = read()
    if a == "" then
        shell.run("delete /startup")
        shell.run("delete Installer.lua")
        shell.run("wget run https://raw.githubusercontent.com/NiftyNarwhal11/ModularOS/refs/heads/main/Installer.lua")
        
    else
        shell.run("/.os/.password.lua")
    end
    else
        shell.run("/.os/.password.lua")
end
else
    shell.run("/.os/.password.lua")
end
