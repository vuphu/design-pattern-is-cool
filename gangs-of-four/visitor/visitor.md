# visitor

## Example 01: File System Traversal

Implemented in samples/visitor.cpp

This code implements a file system traversal using the Visitor design pattern with the following components:

- **Element**: An abstract base class representing both files and folders. It defines the `accept` method, which must be implemented by subclasses to accept a visitor.
- **File**: Represents a file in the file system. Inherits from `Element` and implements the `accept` method to accept a visitor.
- **Folder**: Represents a folder that can contain multiple elements (files or other folders). Inherits from `Element`, implements the `accept` method, and provides a method to add elements. It also maintains a list of child elements.

- **Visitor**: An abstract base class defining `visit` methods for files and folders. Concrete visitors implement these methods to perform specific operations on files and folders.
- **PrintVisitor**: A concrete visitor that prints the names of files and folders, with indentation representing the hierarchy level.

The code creates a hierarchical structure of files and folders, then uses the `PrintVisitor` to traverse and print the structure with appropriate indentation.