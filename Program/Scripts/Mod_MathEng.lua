---@diagnostic disable: missing-parameter
local CommonFunctions = require("Scripts/Mod_CommonFunctions")

Mod = {}

function SolveValueOfPolynomial( Polynomial, VarNumber )
    if type(VarNumber) ~= "number" then
        error("Invalid Variable Number, an Integer is needed.")
    end

    local SeperatedPolynomial = CommonFunctions.SplitString(Polynomial, ":")
    
    local Multiplier = tonumber(SeperatedPolynomial[1])
    local Exponent = tonumber(SeperatedPolynomial[3])

    if Multiplier == nil or Exponent == nil then
        error("Invalid polynomial format, try using the format '(Coefficient:x:Exponent)'.")
    end

    local Result = (VarNumber ^ Exponent) * Multiplier
    return Result
end

function Mod.SolveValueOfPolynomial( Polynomial, VarNumber )
    SolveValueOfPolynomial( Polynomial, VarNumber )
end

function Mod.Distance_3D ( x1, y1, z1, x2, y2, z2 )
    for _, Val in ipairs({x1, x2, y1, y2, z1, z2}) do
        if type(Val) ~= "number" then
            error("Invalid coordinates. All fields must be filled in and must be numbers.")
        end
    end
    return math.sqrt(((x2-x1)^2) + ((y2-y1)^2) + ((z2-z1)^2))
end

function Mod.RDirection_3D( x1, y1, z1, x2, y2, z2 )
    for _, Val in ipairs({x1, x2, y1, y2, z1, z2}) do
        if type(Val) ~= "number" then
            error("Invalid coordinates. All fields must be filled in and must be numbers.")
        end
    end
    return math.deg(math.atan2( x2-x1 )), math.deg(math.atan2( y2-y1 )), math.deg(math.atan2( z2-z1 ))
end

function Derive(Equation, Times, Inverse, Partial)

    if Times < 1 then
        error(
            "Invalid Differentiation amount, you cannot differentiate a polynomial less than once,"..
            " if you are looking for antiderivative then make parameter 'Inverse' = 'true'.")
    end

    if type(Times) ~= "number" then
        error("Invalid Argument, a Polynomial must be derived a number of")
    end

    local Derivative = {}
    local SeperatedPolynomial = {}
    local PreviousDerivative

    for i=1, Times do
        for _, v in ipairs(Equation) do
            SeperatedPolynomial = CommonFunctions.SplitString(v, ":")

            local coefficient = tonumber(SeperatedPolynomial[1])
            local exponent = tonumber(SeperatedPolynomial[3])

            if Inverse == false then
                Derivative[1] = coefficient * exponent
                Derivative[2] = "x"
                Derivative[3] = exponent - 1
            else
                Derivative[1] = coefficient * (1 / (exponent + 1))
                Derivative[2] = "x"
                Derivative[3] = exponent + 1
            end

            PreviousDerivative = Derivative
        end
    end

    local Result = CommonFunctions.TableToString(PreviousDerivative)
    return Result
end

function Mod.Derive(Equation, Times, Inverse, Partial)
    return Derive(Equation, Times, Inverse, Partial)
end

function Mod.Summate(LowerInt, UpperInt, Equation, SummationType)
    if UpperInt < LowerInt then
        error("Invalid Summation Limits, Upper limit cannot be above lower limit.")
    end

    for _, Val in ipairs({LowerInt, UpperInt}) do
        if type(Val) ~= "number" then
            error("Invalid Limit(s), an Upper or Lower limit must be a number.")
        end
    end

    local Sum = 0

    for i = LowerInt, UpperInt,1 do
        for _, k2 in pairs( Equation ) do
            local result = SolveValueOfPolynomial(k2,i)
            if SummationType == "+" or SummationType == "add" or SummationType == "Add" then
                Sum = Sum + result
            end
            if SummationType == "-" or SummationType == "subtract" or SummationType == "Subtract" then
                Sum = Sum - result
            end
            if SummationType == "*" or SummationType == "multiply" or SummationType == "Multiply" then
                if i == LowerInt then
                    Sum = 1
                end
                Sum = Sum * result
            end
            if SummationType == "/" or SummationType == "divide" or SummationType == "Divide" then
                if i == LowerInt then
                    Sum = 1
                end
                Sum = Sum / result
            end
        end
    end

    return Sum
end

function Mod.Integrate( BoundaryTables, Equation )
    local Entries = 0
    for _ in pairs(BoundaryTables) do
        Entries = Entries + 1
    end
    if Entries < 1 then
        error("Invalid Integration Limits, you must provide a table of values for the limits of the integral.")
    end 
    Boundaries = 0
    for _, v in pairs(BoundaryTables) do
        for _ in pairs(v) do
            Boundaries = Boundaries + 1
        end
    end
    if Boundaries ~= Entries*2 then
        error("Invalid Integration Limits, Every Entry for an Integral Boundary must have only 2 integers, the upper, and the lower limits.")
    end 

    local Integrals = Boundaries/Entries

    for i=1,Integrals,1 do
        
    end

    local antiderivative = Derive(Equation, 1, true, false)

    local result = 0
    for i,v in pairs(BoundaryTables) do
        if i == 1 then
            result = SolveValueOfPolynomial(antiderivative, BoundaryTables[i][2]) - SolveValueOfPolynomial(antiderivative, BoundaryTables[i][1])
        else
            result = result - SolveValueOfPolynomial(antiderivative, BoundaryTables[i][2]) - SolveValueOfPolynomial(antiderivative, BoundaryTables[i][1])
        end
    end
    return result
end

return Mod