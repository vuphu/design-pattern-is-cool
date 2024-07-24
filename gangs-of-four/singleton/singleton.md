# singleton

## Example 01: Game Setting

Implemented in `samples/singleton.java`

This code implements the Singleton design pattern for managing game setting with the following components:

- **GameSetting**: A singleton class responsible for managing game setting.
  - **increaseVolume**: Increases the volume by 1.
  - **getVolume**: Returns the current volume level.
  - **getInstance**: Provides access to the single instance of the class, creating it if necessary in a thread-safe manner.

The `main` method shows how to use the singleton instance to modify and access the game setting.
