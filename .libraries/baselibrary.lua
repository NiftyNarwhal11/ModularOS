function printCenter(str,centerVert,customY)
    local MX,MY = term.getSize()
    local X = (MX/2)-(string.len(str)/2)
    if centerVert then
        term.setCursorPos(X,MY/2)
    else
        term.setCursorPos(X,customY)
    end
    return true
end
function wget(url,path,runAfterSave)
    shell.run("wget",url,path)
    if runAfterSave then
        shell.run(path)
    end
end
return {printCenter=printCenter, wget=wget}