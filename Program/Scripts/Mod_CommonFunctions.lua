local Mod = {}

Mod.CharacterTable = {
    'a','A',
    'b','B',
    'c','C',
    'd','D',
    'e','E',
    'f','F',
    'g','G',
    'h','H',
    'i',"I",
    "j","J",
    "k","K",
    "l","L",
    "m","M",
    "n","N",
    "o","O",
    "p","P",
    "q",'Q',
    "r","R",
    "s","S",
    "t","T",
    "u","U",
    "v","V",
    "w","W",
    "x","X",
    "y","Y",
    "z","Z",
    "1","2","3","4","5","6","7","8","9",
    "!","@","#","$","%","^","&","*","+","-",
}

Mod.color = {
    ["none"] = '\27[0m',
    ["black"] = '\27[0;30m',
    ['red'] = '\27[0;31m',
    ['green'] = '\27[0;32m',
    ['yellow'] = '\27[0;33m',
    ['blue'] = '\27[0;34m',
    ['magenta'] = '\27[0;35m',
    ['cyan'] = '\27[0;36m',
    ['white'] = '\27[0;37m',
    ['_black'] = '\27[40m',
    ['_red'] = '\27[41m',
    ['_green'] = '\27[42m',
    ['_yellow'] = '\27[43m',
    ['_blue'] = '\27[44m',
    ['_magenta'] = '\27[45m',
    ['_cyan'] = '\27[46m',
    ['_white'] = '\27[47m',
}

function Mod.SplitString(input_string, divider)
    local result_table = {}
    local pattern = string.format("[^%s]+", divider)

    for item in string.gmatch(input_string, pattern) do
        table.insert(result_table, item)
    end
    return result_table
end

function Mod.tableToString(Table)
    local OutputString = ""
    
    for i, value in ipairs(Table) do
        if i > 1 then
            OutputString = OutputString .. ","
        end
        OutputString = OutputString .. tostring(value)
    end

    return OutputString
end

function Mod.StichPolynomial(Table)
    local OutputString = ""
    
    for i, value in ipairs(Table) do
        if i > 1 then
            OutputString = OutputString .. ":"
        end
        OutputString = OutputString .. tostring(value)
    end

    return OutputString
end

function Mod.Wait( Seconds )
    if not Seconds then
        Seconds = 1/999
    end
    local StartTime = os.clock
    while os.clock() - StartTime <= Seconds do
        
    end
end

function Mod.GenerateRandomString( length )
    local Result = ""
    local charCount = #Mod.CharacterTable
  
    for i = 1, length do
      local randomIndex = math.random(1, charCount)
      local randomChar = Mod.CharacterTable[randomIndex]
      Result = Result .. randomChar
    end
  
    return Result
end

function Mod.FindRootTable(value, table)
    if type(table) == "table" then
        for k, v in pairs(table) do
            if type(v) == "table" then
                local result = Mod.FindUpperMostTable(value, v)
                if result then
                    if type(result) == "table" then
                        return table
                    else
                        return result
                    end
                end
            elseif v == value then
                return table
            end
        end
    end
    return nil
end

function Mod.findInstanceWithTag(table, tag)
    if type(table) == "table" then
      for _, value in pairs(table) do
        if type(value) == "table" then
          local instance = Mod.findInstanceWithTag(value, tag)
          if instance then
            return true, instance
          end
        elseif type(value) == "userdata" and value.Tag == tag then
          return true, value
        end
      end
    end
    return false, nil
  end

return Mod