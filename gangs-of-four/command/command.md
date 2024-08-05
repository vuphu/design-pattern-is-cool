# command

## Example 01: Music Player Controller
Implemented in `samples/command.rb`

This code applies the Command design pattern to control a `MusicPlayer` using commands. It includes:

- **Command**: An abstract base class with an `execute` method that must be implemented by subclasses.
- **MusicPlayer**: A class with methods to `play`, `stop`, and `pause` music.
- **RemoteControl**: A class that sets and executes commands via a `press_button` method.

The example initializes a `MusicPlayer` and uses a `RemoteControl` to set and execute each command.
