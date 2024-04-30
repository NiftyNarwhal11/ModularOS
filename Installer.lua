os.pullEvent = os.pullEventRaw
term.clear()
version = ""
 
-- Installer Function
installerf = function(code, file)
    print("Downloading pastebin.com/"..code)
    downloader = http.get("http://pastebin.com/raw/"..code)
    if downloader then
        input = io.open(file, "w")
        input:write(downloader.readAll())
        input:close()
		term.setCursorPos( 16,3 )
		print("Downloaded file pastebin.com/"..code)
		sleep(2)
        return true
    else
        print("Download Failed Error Check HTTP . . .")
    end
end
-- End of function

-- Installers go here:
installerf("YrHD1eZL", "/.os/.password")
installerf("YDKTXHtR", "/ModuleInstallers/Rednet")
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
installerf("EHuR63d1", "/startup/STARTUP")
--set up folders--
fs.makeDir(".programs")
shell.setPath(("%s:/.programs"):format(shell.path()))
install()
