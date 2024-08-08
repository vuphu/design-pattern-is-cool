# chain-of-responsibility

## Example 01: Task Processing

Implemented in `samples/chain-of-responsibility.go`

This code apply the Chain of Responsibility pattern for processing tasks with the following components:

- **TaskHandler**: An interface for handling tasks.
- **Task**: Represents a task.
- **Handler**: Implements the `TaskHandler` interface and processes tasks.

The `main` function sets up a chain of handlers (`Developer`, `QA`, and `Manager`) and processes a `Task`.
