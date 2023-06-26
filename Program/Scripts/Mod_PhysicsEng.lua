Mod = {}

local ClassHandler = require("Scripts/Mod_ClassHandler")

function Mod.PhysicsStep( Object, Enviroment )

    for _, Val in ipairs({ Enviroment }) do
        if type(Val) ~= "table" then
            error("Invalid Arguments: All parameters must be instances")
        end
    end

    if Object.ClassName == "Object" and Object["Parent"] == Enviroment then
        Object["Position"] = {
            (Object["Position"][1] + Object["Velocity"][2]),
            (Object["Position"][2] + Object["Velocity"][2]),
            (Object["Position"][3] + Object["Velocity"][3]),
        }
    end

    return Object
end

return Mod