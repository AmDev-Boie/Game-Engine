local MathEngine = require("Scripts/Mod_MathEng")
local Common = require("Scripts/Mod_CommonFunctions")
local ClassHandler = require("Scripts/Mod_ClassHandler")
local DataHandler = require("Scripts/Mod_DataHandler")

local color = Common.color

local Path_To_File = "/home/amdeth/Desktop/Program" -- CHANGE THIS IF NESSESSARY

local SystemInfo = {
    BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)"),
    OperatingSystem = "N/A",
}

if SystemInfo.BinaryFormat == "dll" then
    SystemInfo.OperatingSystem = "Windows"
elseif SystemInfo.BinaryFormat == "so" then
    SystemInfo.OperatingSystem = "Linux"
elseif SystemInfo.BinaryFormat == "dylib" then
    SystemInfo.OperatingSystem = "MacOS"
end

-- Clear Output log
if SystemInfo.OperatingSystem == "Windows" then
    os.execute("clr")
elseif SystemInfo.OperatingSystem == "Linux" then
    os.execute("clear")
end

local Debug_Print = true

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

local FilePath = Path_To_File .. "/Data/Dat_Data.GeDF"

local Text_To_write = 
(
    "[Data_Table_1]\n"..
    "Test1 = 'ABC'\n"..
    "Test2 = 2\n"..
    "end"
)

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

if Debug_Print == true then
    List_of_Quotes = {
        [1] = {
            "Some people just have the intelligance of a grapevine - AmDeth",
            "Thats crazy - everyone",
            "*looks at outlet with fork in hand* ... the urge... - Dave",
            "Im gonna punch you so hard that i crash the simulation we live in with a 'Physics Violation' - AmDeth",
            "A weapon is only good when you get seconds per frame instead of frames per second - Random Youtube comment",
            "You cant just quote me - Dave",
        },
        [2] = {
            "If theres a hole, theres a goal - Dave",
            "I have 5 drop boxes of p*** - Random discord user",
            "Im going to peel your skin like a banana - Dmg_Damage",
        },
        [3] = {
            "192.168.1.1 - random internet meme",
            "No more skin, pain = pleasure - Dave",
            "C8H10N4O2 - Vozath",
        },
        [4] = {
            "The law is a suggestion, and i finna bouta turn off tutorial mode - Someone",
        },
        [5] = {
            "crazy? i was crazy once, they locked me in a room, a rubber room, a rubber room with rats, and rats make me crazy. ".. 
            "\n crazy? i was crazy once, they locked me in a room, a rubber room, a rubber room with rats, and rats make me crazy. "..
            "\n crazy? i was crazy once, they locked me in a room, a rubber room, a rubber room with rats, and rats make me crazy. "..
            "\n crazy? i was crazy once, they locked me in a room, a rubber room, a rubber room with rats, and rats make me crazy. "..
            "\n crazy? i was crazy once, they locked me in a room, a rubber room, a rubber room with rats, and rats make me crazy. "..
            "\n crazy? i was crazy once, they locked me in a room, a rubber room, a rubber room with rats, and rats make me crazy. "..
            "\n crazy? i was crazy once, they locked me in a room, a rubber room, a rubber room with rats, and rats make me crazy. "..
            "\n crazy? i was crazy once, they locked me in a room, a rubber room, a rubber room with rats, and rats make me crazy. - everyone",
        },
        [6] = {
            "this was a 1 in one million chance find... you lucky bastard. - AmDeth",
        },
    }
    
    -- General Variables
    local round = 5
    local Version = "V 0.1.1.0 Alpha"
    local Quotes = true
    
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
    local Inst = ClassHandler:New(InstanceType, InstanceName, ClassHandler.CreatedObjects.Game["Children"].Environment)
    
    local InstancePosition = {x=1,y=4,z=2}
    local InstanceVelocity = {x=0,y=-0.1,z=0}
    
    Inst["Position"] = InstancePosition
    Inst["Velocity"] = InstanceVelocity
    
    -- Physics Variables
    Amount_of_Frames = 10
    Fps = 1

    -- FileHandler Variables
    local FilePath = Path_To_File .. "/Data/Dat_Data.GeDF"

    local Text_To_write = (
    "[Data_Table_1]\n"..
    "Test1 = 'ABC'\n"..
    "Test2 = 2\n"..
    "end")
    
    -- print Debug log
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
    print("------------------| Additional Information |------------------")
    print("")
    print("Print again with: >".. color.blue .." lua Main.lua " .. color.none .."< ")
    print("Engine Version: " .. color.blue .. Version .. color.none)
    print("OS: " .. color.blue .. SystemInfo.OperatingSystem .. color.none)
    print("")
    print("----------------------| Mentions |--------------------")
    print("")
    print("Engine Developer: " .. color.blue .. "AmDeth" .. color.none)
    if Quotes == true then
        local Quote = ""
        local Quotelist = 1
        local RandQuoteInt = math.random(1,10)
        local chance = ""
        if RandQuoteInt == 1 then
            RandQuoteInt = math.random(1,10)
            if RandQuoteInt == 1 then
                RandQuoteInt = math.random(1,10)
                if RandQuoteInt == 1 then
                    RandQuoteInt = math.random(1,10)
                    if RandQuoteInt == 1 then
                        RandQuoteInt = math.random(1,10)
                        if RandQuoteInt == 1 then
                            Quotelist = 6
                            chance = "1 in " .. tostring( (1000000 * (#List_of_Quotes[Quotelist])))
                        else
                            Quotelist = 5
                            chance = "1 in " .. tostring( (9999 * (#List_of_Quotes[Quotelist])))
                        end
                    else
                        Quotelist = 4
                        chance = "1 in " .. tostring( (999 * (#List_of_Quotes[Quotelist])))
                    end
                else
                    Quotelist = 3
                    chance = "1 in " .. tostring( (999 * (#List_of_Quotes[Quotelist])))
                end
            else
                Quotelist = 2
                chance = "1 in " .. tostring( (99 * (#List_of_Quotes[Quotelist])))
            end
        else
            Quotelist = 1
            chance = "1 in " .. tostring( (9 * (#List_of_Quotes[Quotelist])))
        end
        local Key = (math.random(1,#List_of_Quotes[Quotelist]))
        
        print("Random Quote (" .. chance .. " chance, Quote "..Key.."/"..#List_of_Quotes[Quotelist].."): \n" .. color.yellow .. List_of_Quotes[Quotelist][Key] .. color.none)
    end
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
    local Methanfetamengine = math.random(1,100)
    if Methanfetamengine == 1 then
        MethanfetamenginePrint = "----------------| Methanfetaengine Functions |-----------------"
    else
        MethanfetamenginePrint = "------------------| Math Engine Functions |-------------------"
    end
    print(MethanfetamenginePrint)
    print("")
    print("Summation: " .. color.yellow .. MathEngine.Summate( 2, 4, {"2:x:3"}, "+" )
     .. color.cyan .. " | Args: (2, 4, {'2:x:3'}, '+')" .. color.none )
    print("Differentiation: " .. color.yellow .. MathEngine.Derive( {"2:x:3"}, 1, false )
     .. color.cyan .. " | Args: ({'2:x:3'}, 1, false)" .. color.none )
    print("Integration: " .. color.yellow ..  MathEngine.Integrate( IntegralLimits, {"2:x:3"} )
     .. color.cyan .. " | Args: ({{1,5}}, {'2:x:3'})" .. color.none )
    print("")
    print("------------------| Class Handler Functions |-----------------")
    print("")
    print("Instance.New: " .. color.yellow .. Inst.Name.. color.cyan ..
    " | Method: ClassHandler:New().Name)" .. color.none )
    print("")
    print("---------------------| Physics Functions |--------------------")
    print("")
    print("Instance:update(1/Fps): " .. Amount_of_Frames .. "x, " .. Fps .. " Fps")
    for i=1, Amount_of_Frames, 1 do
        print("Frame " .. i .." of '" .. Inst.Name .. "' Position: " .. color.yellow .. "{" .. Inst["Position"].x .. ", " .. Inst["Position"].y .. ", " .. Inst["Position"].z .. "}" .. color.none)
        Inst:Update(1/Fps, ClassHandler.CreatedObjects.Game["Children"].Environment)
    end
    print("") 
    print("------------------| File Handler Functions |------------------")
    print("")
    DataHandler.WriteFile(FilePath,Text_To_write)
    print("DataHandler.Write(): \n" .. color.yellow .. DataHandler.ReadFile(FilePath) .. color.none)
    print("")
end