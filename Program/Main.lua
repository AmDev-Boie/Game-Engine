local MathEngine = require("Scripts/Mod_MathEng")
local Common = require("Scripts/Mod_CommonFunctions")
local ClassHandler = require("Scripts/Mod_ClassHandler")
local PhysicsEngine = require("Scripts/Mod_PhysicsEng")

-- 'lua54 Main.lua'

local color = Common.color

local BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)")
local OperatingSystem = "N/A"

if BinaryFormat == "dll" then
    function os.name()
        OperatingSystem = "Windows"
    end
elseif BinaryFormat == "so" then
    function os.name()
        OperatingSystem = "Linux"
    end
elseif BinaryFormat == "dylib" then
    function os.name()
        OperatingSystem = "MacOS"
    end
end

-- General Variables
local round = 5
local Version = "V 0.1.1.0 Alpha"

-- Vector Variables
local Coordinate_1 = {}
Coordinate_1["x"] = 1
Coordinate_1["y"] = 6
Coordinate_1["z"] = 2

local Coordinate_2 = {}
Coordinate_2["x"] = 10
Coordinate_2["y"] = 5
Coordinate_2["z"] = -6

-- Math Variables
local LowerSummationLim = 2
local UpperSummationLim = 4

local IntegralLimits = {}
IntegralLimits[1] = {1,5}

-- Class Handler Variables
local InstanceName = "Object"
local InstanceType = "Object"
local Inst = ClassHandler:New(InstanceType, InstanceName)
local Inst2 = PhysicsEngine.PhysicsStep( Inst )

-- print output log
os.execute("clear")
os.execute("clr")
print("--------------------------------------------------------------")
print("               ______             _            ")
print("              |  ____|           (_)           ")
print("              | |__   _ __   __ _ _ _ __   ___ ")
print("              |  __| | '_ \\ / _` | | '_ \\ / _ \\")
print("              | |____| | | | (_| | | | | |  __/")
print("              |______|_| |_|\\__, |_|_| |_|\\___|")
print("                             __/ |             ")
print(" Powered by: grappling hook |___/               "..Version)
print("")
print("------------------------| Variables |-------------------------")
print("")
print("Rounding = " .. color.yellow .. tostring(round) .. color.none )
print("Coordinate_1 = " .. color.yellow .. "{"..Coordinate_1["x"]..","
..Coordinate_1["y"]..","
..Coordinate_1["z"].."}" .. color.none )
print("Coordinate_2 = " .. color.yellow .. "{"..Coordinate_2["x"]..","
..Coordinate_2["y"]..","
..Coordinate_2["z"].."}" .. color.none )
print("LowerSummationLim = " .. color.yellow .. LowerSummationLim .. color.none )
print("UpperSummationLim = " .. color.yellow .. UpperSummationLim .. color.none )
print("IntegralLimits = " .. color.yellow .. "{{1,5}}" .. color.none )
print("InstanceName = " .. color.yellow .. InstanceName .. color.none )
print("InstanceType = " .. color.yellow .. InstanceType .. color.none )
print("")
print("---------------------| Vector Functions |---------------------")
print("")
print("Distance: " .. color.yellow .. math.floor(
     (MathEngine.Distance_3D(Coordinate_1["x"],Coordinate_1["y"],Coordinate_1["z"],
      Coordinate_2["x"],Coordinate_2["y"],Coordinate_2["z"]))
*10^round + 0.5 )/10^round .. color.cyan ..
 " | Args: (Coordinate_1,Coordinate_2)" .. color.none )
print("Direction: " .. color.yellow .. math.floor(
     (MathEngine.RDirection_3D(Coordinate_1["x"],Coordinate_1["y"],Coordinate_1["z"],
      Coordinate_2["x"],Coordinate_2["y"],Coordinate_2["z"]))
*10^round + 0.5 )/10^round.. " deg" .. color.cyan ..
 " | Args: (Coordinate_1,Coordinate_2)" .. color.none )
print("")
print("------------------| Mathematical Functions |------------------")
print("")
print("Summation: " .. color.yellow .. MathEngine.Summate( 2, 4, {"2:x:3"}, "+" )
 .. color.cyan .. " | Args: (2, 4, {'2:x:3'}, '+')" .. color.none )
print("Differentiation: " .. color.yellow .. MathEngine.Derive( {"2:x:3"}, 1, false )
 .. color.cyan .. " | Args: ({'2:x:3'}, 1, false)" .. color.none )
print("Integration: " .. color.yellow ..  MathEngine.Integrate( {{1,5}}, {"2:x:3"} )
 .. color.cyan .. " | Args: ({{1,5}}, {'2:x:3'})" .. color.none )
print("")
print("---------------------| Physics Functions |--------------------")
print("")
--print("Physics Step: " .. color.yellow .. Inst2["Position"]["X"] 
--.. color.cyan .. " | Args: ({{1,5}}, {'2:x:3'})" .. color.none )
print("")
print("------------------| Class Handler Functions |-----------------")
print("")
print("Instance.New: " .. color.yellow .. Inst.Name.. color.cyan .. 
" | Method: ClassHandler:New().Name)" .. color.none )
print("Object Func: " .. color.yellow .. Inst:Test() .. color.cyan .. 
" | Method: Object:Test())" .. color.none  .. color.none)
print("")
print("------------------| Additional Information |------------------")
print("")
print("Print again with: >".. color.blue .." lua54 Main.lua " .. color.none .."< ")
print("Engine Version: " .. color.blue .. Version .. color.none)
print("OS: " .. color.blue .. OperatingSystem .. color.none)
print("")
print("|-------------------| " .. color.blue .. "Mentions" .. color.none .. " |-----------------|")
print("")
print("Engine Developer: " .. color.blue .. "AmDeth" .. color.none)
print("")
print("--------------------------------------------------------------")
print("")