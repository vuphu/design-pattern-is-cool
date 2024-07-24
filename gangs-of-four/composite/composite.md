# composite

## Example 01: File System

Implemented in `samples/composite.py`

This code implements a file system using the composite design pattern with the following components:

- **Component**: An abstract base class defining the `get_size` method, which must be implemented by subclasses.
- **File**: Represents a file with a specific size. Implements the `get_size` method to return its size.
- **Folder**: Represents a folder containing multiple `Component` instances (files or other folders). Implements the `get_size` method to return the sum of sizes of all contained components.

The code builds a hierarchical structure of files and folders and calculates the total size of the root folder.
