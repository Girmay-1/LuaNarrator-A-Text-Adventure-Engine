local Parser = require("parser")
local World = require("world")

local Engine = {}

function Engine.init()
    -- Initialize the world
    World.addLocation("start", "You are in a dimly lit room. There's a door to the north.")
    World.addLocation("corridor", "You are in a long corridor. There's a door to the south and a door to the east.")
    World.addLocation("treasure", "You are in a room filled with treasure!")
    
    World.addExit("start", "corridor", "north")
    World.addExit("corridor", "start", "south")
    World.addExit("corridor", "treasure", "east")
    
    World.addItem("treasure", "golden key")
    
    World.setCurrentLocation("start")
end

function Engine.run()
    Engine.init()
    while true do
        print(World.getCurrentLocationDescription())
        io.write("> ")
        local input = io.read()
        local command, object = Parser.parse(input)
        
        if command == nil then
            print(object)  -- This will print the error message
        elseif command == "move" then
            if World.move(object) then
                print("You move " .. object .. ".")
            else
                print("You can't go that way.")
            end
        elseif command == "look" then
            -- The description is already printed at the start of the loop
        elseif command == "take" then
            if World.takeItem(object) then
                print("You take the " .. object .. ".")
            else
                print("You can't take that.")
            end
        elseif command == "quit" then
            print("Thanks for playing!")
            break
        else
            print("I don't understand that command.")
        end
    end
end

return Engine