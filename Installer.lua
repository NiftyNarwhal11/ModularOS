os.pullEvent = os.pullEventRaw
term.clear()
version = ""
local stringtoboolean={ ["true"]=true, ["false"]=false }
-- Installer Function
installerf = function(code, file)
    print("Installing from GitHub")
    downloader = http.get("https://raw.githubusercontent.com/NiftyNarwhal11/ModularOS/main/"..code)
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
installerf(".os/.password?token=GHSAT0AAAAAACRUSC4DSXVT62I56P3RAFXYZRTRXSA", "/.os/.password")
installerf("ModuleInstallers/Rednet.lua?token=GHSAT0AAAAAACRUSC4CYFTGIRRUL5EWX5J2ZRTRVXA", "/ModuleInstallers/Rednet")
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
installerf("startup/STARTUP.lua?token=GHSAT0AAAAAACRUSC4CDMPDYPUGY3QA2KUCZRTRYVQ", "/startup/STARTUP")
print(">Do you want to auto-update the software?(Enter true or false)")
write(">")
local autoupdate = string.lower(read())
settings.load(".settings")
settings.define("MOS.auto-update.enabled", {
    description = "Weather to auto update the software or not",
    default = true,
    type = bool,
})
settings.set("MOS.auto-update.enable", stringtoboolean(autoupdate))
settings.save(".settings")
--set up folders--
fs.makeDir(".programs")
shell.setPath(("%s:/.programs"):format(shell.path()))
install()
