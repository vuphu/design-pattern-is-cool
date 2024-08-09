# state

## Example 01: Task State Management

Implemented in `samples/state.kt`

This code implements the State pattern for managing task states with the following components:

- **TaskState**: An interface that defines methods for handling state transitions.
- **TodoState**, **InProgressState**, **DoneState**: A concrete implementation of `TaskState` representing the state of a task.
- **Task**: Represents a task with a `title` and manages its state transitions and notifications.

The `main` method show how to use the `Task` class to transition through different states.
