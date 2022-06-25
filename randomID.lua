local  u = 0

local function real_randint( x , y )
    u = u + 1
    if x ~= nil and y ~= nil then
        return math.floor( x + (math.random(math.randomseed(os.time() + u )) * 999999 % y ))
    else
        return math.floor( (math.random(math.randomseed(os.time() + u )) * 100 ))
    end
end

local function randomID(prefix , hyphen , maxchar)

    if not ( type(prefix)  == "string"  ) then prefix  = ""     end
    if not ( type(hyphen)  == "boolean" ) then hyphen  = false  end
    if not ( type(maxchar) == "number"  ) then maxchar = 16     end

	local ID = prefix
    local char_luck
    local char_count

    if hyphen then
        char_count = 0
        ID = ID.."-"
    end

--[[

    maxchar = maxchar - #prefix    -- If you want to count the prefix

  ]]

    for i=1,maxchar do

        char_luck = real_randint(1, 6)    -- "Chances of getting a char (1/3)"

        if char_luck < 3 then
             ID = ID..string.char(math.random(65, 90))
        else ID = ID..real_randint(0, 9) end

        if hyphen then
            char_count = char_count + 1
            if  char_count == 4 and i ~= maxchar then
                char_count, ID = 0, ID .. "-"
            end
        end

    end

    return ID

end

return randomID
