shell.exit()
shell.run( "set motd.enable false" )
shell.run( "set shell.allow_disk_startup false" )
local version = "0.8"
local latestVersion = http.get("http://www.pastebin.com/raw/qsPhpy6x")
local lversion = latestVersion.readAll()
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
        shell.run("pastebin run wbv76X5Y")
        
    else
        shell.run("/.os/.password")
    end
    else
        shell.run("/.os/.password")
end
