function clr() return term.clear() end
function cp(x,y) return term.setCursorPos(x,y) end
function setText(col) return term.setTextColor(colors[col]) end
function setBack(col) return term.setBackgroundColor(colors[col]) end
function notnil(vari) if vari == nil then return false else return true end end
 
-- Inported some of my shortcut functions -- (Just Does Games was here! :))
 
local w,h = term.getSize()
 
--Vars
  bkColor = colors.gray
  lnColor = colors.lightGray
  txtColor = colors.lime
  settings.load(".settings")
  local logins = {{settings.get("MOS.user.username"), settings.get("MOS.user.password")}} -- {username, password}
--Functions
 
 
--Code
function passwordDraw()
  local running = true
  while running do
    setBack("black") setText("white") clr()
    paintutils.drawFilledBox(2,2,13,10,colors["lightBlue"])
    paintutils.drawFilledBox(2,13,w,17,colors["ligthGray"])
    paintutils.drawLine(1,12,w,12,colors["gray"])
    paintutils.drawLine(1,18,w,18,colors["gray"])
    paintutils.drawLine(1,12,1,18,colors["gray"])
	write("Username » ") user = read() cp(2,16)
    write("Password » ") pass = read(string.char(7))
    local login = false
    for i=1, #logins do
      if logins[i][1] == user and logins[i][2] == pass then
        login = true
      end
    end
    if login then
      setBack("black") clr() term.setCursorPos(1,1) shell.run("shell")
      running = false
    else
      paintutils.drawFilledBox(1,3,w,6,colors["blue"])
      cp(w/2-(string.len("Username or Password is incorrect.")/2),4) print("Username or Password is incorrect.")
      cp(w/2-(string.len("Please try again.")/2),5) print("Please try again.")
      paintutils.drawLine(1,2,w,2,colors["lightBlue"])
      paintutils.drawLine(1,7,w,7,colors["lightBlue"])
      sleep(2)
    end
  end
end
-- shell.run("/.os/.gui") -- SUCCESS!
local ok, err = pcall(passwordDraw)
 
if not ok then
    setBack("yellow") setText("white") clr()
  setBack("gray") cp(1,h/2-4) term.clearLine() cp(1,h/2-4)
  print("Yellow screen of Death") setText("yellow")
  setBack("white")
  cp(1,h/2-3)
  for i=1, w do
    write(" ")
  end
  setBack("black")
  for i=1, 7 do
    cp(1,h/2-3+i)
    term.clearLine()
  end
  cp(1,h/2-2)
  print("A yellow screen error (also called a stop error) can occur if a problem causes your device to shut down or restart unexpectedly. Your device ran into a problem and needs to restart.")
  print("")
  write("Error Code: ")
  printError(err)
    term.setCursorBlink(false)
else
    print("Exited without Errors")
end
pcall(sleep, 5)
os.reboot()
