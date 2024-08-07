# LuaNarrator: A Text Adventure Engine

LuaNarrator is a text-based adventure game engine written in Lua. It provides a simple yet powerful framework for creating and playing interactive fiction games.

## Features
- Core game engine with basic command parsing
- State management for game world and inventory
- Simple room navigation and item interaction
- Expandable structure for adding more complex game mechanics

## Getting Started

### Prerequisites
- Lua 5.3 or later

### Installation
1. Clone the repository
2. Navigate to the project directory

### Running the Game
To start the game, run the following command in the project directory:
lua main.lua

## Project Structure
- `main.lua`: Entry point of the game
- `engine.lua`: Core game logic and loop
- `world.lua`: Manages game world state, locations, and items
- `parser.lua`: Handles parsing of player commands

## Basic Commands
- `go [direction]`: Move to a new location (e.g., `go north`)
- `look`: Examine the current location
- `take [item]`: Pick up an item
- `quit`: Exit the game

## Customization
You can customize the game world by modifying the `Engine.init()` function in `engine.lua`. Add new locations, items, and exits to create your own adventure.

## Future Enhancements (Planned)
- Custom scripting language for creating adventures
- More complex command parsing
- Expanded item interactions
- Character dialog system
- Save/Load game functionality

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.