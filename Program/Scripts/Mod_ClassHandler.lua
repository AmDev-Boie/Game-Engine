local CommonFunctions = require("Scripts/Mod_CommonFunctions")

Mod = {}

Class = {
    Enumerator = {
        ClassName = "Enumerator",
        Core = false,

        Value = 0,
        Term = "",
    },

    Vector3 = {
        ClassName = "Vector3",

        x = 0,
        y = 0,
        z = 0,

        New = function(x,y,z)
            local instance = {
                Class = "Vector3",
                
                x=x,
                y=y,
                z=z,
            }
            return instance
        end,
    },
}

Class.Environment = {
    ClassName = "Environment",
    Core = false,

    ["Gravity"] = {x=0,y=-9.8,z=0},
    ["AirResistance"] = 1,
    ["TerminalVelocity"] = {x=120,y=120,z=120},
    ["Children"] = {},
}

Class.Object = {
    ClassName = "Object",
    Name = "Object",
    Core = false,

    ["Position"] = Class.Vector3.New(0,0,0),
    ["Rotation"] = Class.Vector3.New(0,0,0),
    ["Scale"] = Class.Vector3.New(0,0,0),

    ["Velocity"] = Class.Vector3.New(0,0,0),
    ["RotVelocity"] = Class.Vector3.New(0,0,0),

    ["Shape"] = "Cube",

    ["Children"] = {},
}

CreatedObjects = {
    Game = {
        ClassName = "Game",
        Core = true,

        ['Children'] = {
            Environment = {
                ClassName = "Environment",
                Core = true,
    
                ["Gravity"] = {x=0,y=-1.2,z=0},
                ["AirResistance"] = 0.1,
                ["TerminalVelocity"] = {x=120,y=120,z=120},
                ["Children"] = {},
            },
        },
    },
}

function FindObjectEnvironment( object )
    local function RecursiveSearch(table, object)
        for key, value in pairs(table) do
            if type(value) == "table" and value.Children then
                for childKey, childValue in pairs(value.Children) do
                    if childValue == object then
                        return value
                    end
                end
                local Environment = RecursiveSearch( value.Children, object)
                if Environment then
                    return Environment
                end
            end
        end
        return nil
    end

    return RecursiveSearch(CreatedObjects, object)
end

function Mod.CreatedObjects( Object )
    return FindObjectEnvironment( Object )
end

function Class.Object:Update( dt, Environment )

    local _Environment = nil

    local Gravity = nil
    local AirResistance = nil
    
    if Environment == nil then
        _Environment = FindObjectEnvironment( self )
        Gravity = _Environment.Gravity
        AirResistance = _Environment.AirResistance
        TerminalVelocity = _Environment.TerminalVelocity
    else
        Gravity = Environment.Gravity
        AirResistance = Environment.AirResistance
        TerminalVelocity = Environment.TerminalVelocity
    end

    self.Position.x = self.Position.x + (self.Velocity.x * dt)
    self.Position.y = self.Position.y + (self.Velocity.y * dt)
    self.Position.z = self.Position.z + (self.Velocity.z * dt)

    if math.abs((self.Velocity.x + (Gravity.x * dt)) * (1 - AirResistance * dt)) < TerminalVelocity.x then
        self.Velocity.x = self.Velocity.x + (Gravity.x * dt)
        self.Velocity.x = self.Velocity.x * (1 - AirResistance * dt)
    else
        if (self.Velocity.x + (Gravity.x * dt)) * (1 - AirResistance * dt) >= 0 then
            self.Velocity.x = TerminalVelocity.x 
        else
            self.Velocity.x = TerminalVelocity.x - (TerminalVelocity.x * 2)
        end
    end

    if math.abs((self.Velocity.y + (Gravity.y * dt)) * (1 - AirResistance * dt)) < TerminalVelocity.y then
        self.Velocity.y = self.Velocity.y + (Gravity.y * dt)
        self.Velocity.y = self.Velocity.y * (1 - AirResistance * dt)
    else
        if (self.Velocity.y + (Gravity.y * dt)) * (1 - AirResistance * dt) >= 0 then
            self.Velocity.y = TerminalVelocity.y 
        else
            self.Velocity.y = TerminalVelocity.y - (TerminalVelocity.y * 2)
        end
    end

    if math.abs((self.Velocity.z + (Gravity.z * dt)) * (1 - AirResistance * dt)) < TerminalVelocity.z then
        self.Velocity.z = self.Velocity.z + (Gravity.z * dt)
        self.Velocity.z = self.Velocity.z * (1 - AirResistance * dt)
    else
        if (self.Velocity.z + (Gravity.z * dt)) * (1 - AirResistance * dt) >= 0 then
            self.Velocity.z = TerminalVelocity.z 
        else
            self.Velocity.z = TerminalVelocity.z - (TerminalVelocity.z * 2)
        end
    end

    return nil
end

function Class.Environment:Update( Enviroment, dt )

    for i,v in pairs( Enviroment.Children ) do
        if type(v) == "metatable" and v["ClassName"] == "Object" then
            v:Update( dt )
        end
    end

    return nil
end

function Mod:New( ClassName, InstanceName, Parent )
    local Success = false
    
    local Instance = Class[ClassName]
    Instance.Name = InstanceName

    if type(Parent) ~= "table" and type(Parent) == "nil" then
        Tag = CommonFunctions.GenerateRandomString( 8 )
        Success, Result = CommonFunctions.findInstanceWithTag( Mod.CreatedObjects.Game['Children'].Environment["Children"], Tag )
        if Success == false and Result == nil then
            error("Temp error")
            return nil
        else
            Result.Children[Tag] = Instance
            Instance["Tag"] = Tag
        end
    else
        Success = true
        repeat
            Tag = CommonFunctions.GenerateRandomString( 8 )
        until Parent["Children"][Tag] == nil

        Parent["Children"][Tag] = Instance
        Instance["Tag"] = Tag
    end

    if Success then
        setmetatable( Instance, self )
        self.__index = self

        return Instance
    else
        return nil
    end
end

Mod.Class = Class
Mod.CreatedObjects = CreatedObjects

return Mod