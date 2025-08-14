os.pullEvent = os.pullEventRaw
term.clear()
version = http.get("https://raw.githubusercontent.com/NiftyNarwhal11/ModularOS/refs/heads/main/latestVersion").readLine()
local stringtoboolean={ ["true"]=true, ["false"]=false }
-- Installer Function
installerf = function(code, file)
    print("Installing from GitHub")
    downloader = http.get("https://raw.githubusercontent.com/NiftyNarwhal11/ModularOS/refs/heads/main/" .. code)
    if downloader then
        input = io.open(file, "w")
        input:write(downloader.readAll())
        input:close()
		term.setCursorPos( 16,3 )
		print("Downloaded file"..code)
		sleep(2)
        return true
    else
        print("Download Failed Error Check HTTP . . .")
    end
end
-- End of function

-- Installers go here:
installerf(".os/.password.lua", "/.os/.password.lua")
installerf("ModuleInstallers/Rednet.lua", "/ModuleInstallers/Rednet")
installerf("packagebrowser.lua", "/packagebrowser.lua")
term.clear()
function install()
	term.clear()
    shell.run("set shell.allow_disk_startup false")
    term.clear()
    term.setCursorPos( 1,1 )
end
install()
sleep(2)
term.setCursorPos( 16, 6 )
--Install startup Script
installerf("startup/STARTUP.lua", "/startup/STARTUP")
term.setCursorPos(1,1)
term.clear()
print(">Do you want to auto-update the software?(Enter true or false)")
write(">")
print()

local autoupdate = string.lower(read())
print("Set Username")
write(">")
local username = read()
print()
print("Set Password")
write(">")
local password = read()
settings.load(".settings")
settings.define("MOS.auto-update.enabled", {
    description = "Weather to auto update the software or not",
    default = true,
    type = bool,
})
 settings.define("MOS.user.username", {
    description = "Username for ModularOS.",
    default = "admin",
    type = "string",
  })
  settings.define("MOS.user.password", {
    description = "Password for ModularOS.",
    default = "root",
    type = "string",
  })
  settings.define("MOS.version", {
    description = "Version of ModularOS.",
    default = "0.0.0",
    type = "string",
  })
settings.set("MOS.auto-update.enable", stringtoboolean[autoupdate])
settings.set("MOS.user.username", username)
settings.set("MOS.user.password", password)
settings.set("MOS.version", version)
settings.save(".settings")
--set up folders--
fs.makeDir(".programs")
shell.setPath(("%s:/.programs"):format(shell.path()))
install()
