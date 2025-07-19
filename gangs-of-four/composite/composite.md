# composite

## Example 01: File System

Implemented in `samples/composite.py`

This code implements a file system using the composite design pattern with the following components:

- **Component**: An abstract base class defining the `get_size` method, which must be implemented by subclasses.
- **File**: Represents a file with a specific size. Implements the `get_size` method to return its size.
- **Folder**: Represents a folder containing multiple `Component` instances (files or other folders). Implements the `get_size` method to return the sum of sizes of all contained components.

The code builds a hierarchical structure of files and folders and calculates the total size of the root folder.

## Example 02: Logger System

Implemented in `samples/composite.rs`

This code implements a logging system using the composite design pattern with the following components:

- **Logger**: Defines the log method, which must be implemented by all logger types.
- **ConsoleLogger**: Logs messages by printing them to the console.
- **RemoteLogger**: Simulates logging messages to a remote service.
- **ComposeLogger**: Contains multiple Logger instances and forwards log messages to each of them.

It enables combining multiple loggers so that a single log call is propagated to all of them.
