local Parser = {}

function Parser.parse(input)
    local words = {}
    for word in input:gmatch("%w+") do
        table.insert(words, word:lower())
    end

    if #words == 0 then
        return nil, "No command given"
    end

    local command = words[1]
    local object = words[2]

    -- Basic command recognition
    if command == "go" or command == "move" then
        if object then
            return "move", object
        else
            return nil, "Go where?"
        end
    elseif command == "look" or command == "examine" then
        if object then
            return "examine", object
        else
            return "look"
        end
    elseif command == "take" or command == "get" then
        if object then
            return "take", object
        else
            return nil, "Take what?"
        end
    elseif command == "quit" or command == "exit" then
        return "quit"
    else
        return nil, "I don't understand that command."
    end
end

return Parser