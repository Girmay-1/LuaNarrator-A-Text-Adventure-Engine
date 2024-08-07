local World = {}

World.locations = {}
World.currentLocation = nil
World.inventory = {}

function World.addLocation(name, description)
    World.locations[name] = {
        name = name,
        description = description,
        items = {},
        exits = {}
    }
end

function World.setCurrentLocation(name)
    if World.locations[name] then
        World.currentLocation = name
        return true
    end
    return false
end

function World.addExit(from, to, direction)
    if World.locations[from] and World.locations[to] then
        World.locations[from].exits[direction] = to
        return true
    end
    return false
end

function World.move(direction)
    if World.currentLocation and World.locations[World.currentLocation].exits[direction] then
        World.currentLocation = World.locations[World.currentLocation].exits[direction]
        return true
    end
    return false
end

function World.getCurrentLocationDescription()
    if World.currentLocation then
        local location = World.locations[World.currentLocation]
        local description = location.description .. "\n\nExits:"
        for direction, _ in pairs(location.exits) do
            description = description .. " " .. direction
        end
        return description
    end
    return "You are nowhere."
end

function World.addItem(location, item)
    if World.locations[location] then
        table.insert(World.locations[location].items, item)
        return true
    end
    return false
end

function World.takeItem(item)
    if World.currentLocation then
        for i, locationItem in ipairs(World.locations[World.currentLocation].items) do
            if locationItem == item then
                table.remove(World.locations[World.currentLocation].items, i)
                table.insert(World.inventory, item)
                return true
            end
        end
    end
    return false
end

return World