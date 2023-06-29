Mod = {}

function Mod.ReadFile(FilePath)
    local file = io.open(FilePath, "r")
    if not file then
        return nil
    end

    local contents = file:read("*a")
    file:close()
    return contents
end

function Mod.WriteFile(FilePath, contents)
    local file = io.open(FilePath, "w")
    if not file then
        return false
    end

    file:write(contents)
    file:close()
    return true
end

return Mod