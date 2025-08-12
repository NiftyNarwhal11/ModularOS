function menu( title, ... )
    --edit the background color to make the GUI more unique
    term.setBackgroundColor( colors.black )
    local debug = false --#turn to true to see what it's thinking
    local tArgs = { ... }
    local dulist = tArgs[1]
    local pages = {[1]={}}
    for i = 1, #dulist, 1 do
        if #pages[ #pages ] == 7 then
            pages[ #pages + 1 ] = {}
        end
        pages[ #pages ][ #pages[#pages] + 1 ] = dulist[i]
    end
    local maxLen = 0
    for k, v in ipairs( tArgs ) do
        if #v > maxLen then maxLen = #v end
    end
    local maxx, maxy = term.getSize()
    if maxLen > maxx - 20 then
        error( 'largest string is too large', 2 )
    end
    local centerx = math.ceil( maxx/2 )
    local centery
    local yValue = {}
    local page = 1
    local selected = math.ceil( #pages[ page ] / 2 )
    local function render()
        local tbl = pages[ page ]
        centery = (maxy/2) - #tbl/2
        term.clear()
        term.setCursorPos( centerx - #title/2 + 1, 2 )
        term.write( title )
        for i = 1, #tbl do
            term.setCursorPos( centerx - (#tbl[i]/2), centery + i )
            yValue[ i ] = centery + i
            term.write( tbl[ i ] )
        end
        if pages[ page - 1 ] then
            term.setCursorPos( 3, centery + #tbl/2 + 1 )
            term.write( "previous" )
        end
        if pages[ page + 1 ] then
            term.setCursorPos( maxx - 5, centery + #tbl/2 + 1 )
            term.write( "next" )
        end
        local str = "(" .. page .. "/" .. #pages .. ")"
        term.setCursorPos( centerx - (#str/2), maxy )
        term.write( str )
    end
    while true do
        render()
        if debug then
            term.setCursorPos( 1, 1 )
            term.write( selected )
            term.setCursorPos( 1, 2 )
            term.write( page )
        end
        if term.isColor() then
            term.setTextColor( colors.yellow )
        end
        if selected == "previous" and not pages[ page - 1 ] then
            selected = math.ceil( #pages[ page ]/2 )
        elseif selected == "next" and not pages[ page + 1 ] then
            selected = math.ceil( #pages[ page ]/2 )
        end
        if type( selected ) == "number" then
            term.setCursorPos( centerx - (#pages[page][selected]/2) - 3, yValue[ selected ] )
            term.write( "[" )
            term.setCursorPos( centerx + (#pages[page][selected]/2) + 2, yValue[ selected ] )
            term.write( "]" )
        elseif selected == "previous" then
            term.setCursorPos( 1, centery + #pages[ page ]/2 + 1 )
            term.write( "[" )
            term.setCursorPos( 12, centery + #pages[ page ]/2 + 1 )
            term.write( "]" )
        elseif selected == "next" then
            term.setCursorPos( maxx - 7, centery + #pages[ page ]/2 + 1 )
            term.write( "[" )
            term.setCursorPos( maxx, centery + #pages[ page ]/2 + 1 )
            term.write( "]" )
        end
        if term.isColor() then
            term.setTextColor( colors.white )
        end
        local event, key = os.pullEvent( "key" )
        local old = selected
        if key == 200 and type( selected ) == "number" and pages[ page ][ selected - 1 ] then
            selected = selected - 1
        elseif key == 208 and type( selected ) == "number" and pages[ page ][ selected + 1 ] then
            selected = selected + 1
        elseif key == 28 then
            if type( selected ) == "number" then
                return pages[ page ][ selected ]
            elseif selected == "next" and pages[ page + 1 ] then
                page = page + 1
            elseif selected == "previous" and pages[ page - 1 ] then
                page = page - 1
            end
        elseif key == 203 then
            if selected == "next" then
                selected = math.ceil( #pages[ page ]/2 )
            elseif type( selected ) == "number" and pages[ page - 1 ] then
                selected = "previous"
            end
        elseif key == 205 then
            if selected == "previous" then
                selected = math.ceil( #pages[ page ]/2 )
            elseif type( selected ) == "number" and pages[ page + 1 ] then
                selected = "next"
            end
        end
    end
end
packages = http.get("https://raw.githubusercontent.com/NiftyNarwhal11/ModularOS/refs/heads/main/packagelist").readAll()
print(packages)
packagelist = require "cc.strings".split(packages, "%n+")
local package = menu("Hello", packagelist)
print(packagelist[2])
