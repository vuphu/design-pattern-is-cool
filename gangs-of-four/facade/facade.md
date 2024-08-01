# facade

## Example 01: Computer Facade

Implemented in `samples/facade.rs`

This code demonstrates the Facade design pattern to simplify interactions with computer subsystems:

- **CPU**: Manages CPU operations
- **Memory**: Handles memory operations
- **HardDrive**: Manages hard drive operations
- **Computer (Facade)**: Provides a unified interface with methods to:
  - `start_computer()`: Initiates the computer system by coordinating `CPU`, `Memory`, and `HardDrive`.
  - `shutdown_computer()`: Shuts down the computer system, managing the subsystems accordingly.

The `Computer` facade simplifies complex interactions into easy-to-use methods for starting and shutting down the computer.
