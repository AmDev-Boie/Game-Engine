local CommonFunctions = require("Scripts/Mod_CommonFunctions")

local Mod = {}

local Class = {
    Object = {
        ClassName = "Object",
        Parent = nil,

        ["Position"] = {x=0, y=0, z=0},
        ["Rotation"] = {x=0, y=0, z=0},
        ["Scale"] = {x=1, y=1, z=1},

        ["Velocity"] = {x=0, y=0, z=0},
        ["RotVelocity"] = {x=0, y=0, z=0},

        ["Shape"] = "Cube",
    },

    Enviroment = {
        ClassName = "Enviroment",
        Parent = "Game",

        ["Gravity"] = {0,0,0},
        ["AirResistance"] = 1,
    },
}

local CreatedObjects = {
    Game = {
        ClassName = "Game",
    },

    Enviroment = {
        ClassName = "Enviroment",
        Parent = "Game",

        ["Gravity"] = {0,0,0},
        ["AirResistance"] = 1,
    },
}

function Mod:New( ClassName, InstanceName, Parent )
    local Success = false
    local InstanceClass = nil
    
    local Instance = {
        Name = InstanceName,
    }

    for key, value in pairs(Class) do
        if key == ClassName then
            Success = true
            InstanceClass = value
            break
        end
    end

    repeat
        Tag = CommonFunctions.GenerateRandomString( 8 )
    until CreatedObjects[Tag] == nil

    CreatedObjects[Tag] = Instance
    Instance["Tag"] = Tag

    if Parent ~= nil then
        Sucess, Result = CommonFunctions.findInstanceWithTag( CreatedObjects, Parent["Tag"] ) 
    end

    if Success == false and (Result == nil or Result ~= Parent) then
        error("Temp error")
        return nil
    else
        CreatedObjects[Tag] = Instance
    end

    if Success then 
        setmetatable(Instance, self)
        self.__index = self

        return Instance
    else
        return nil
    end
end


function Mod:Test()
    return "This instance is: " .. self.Name
end

return Mod