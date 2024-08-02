# decorator

## Example 01: Text Formatting

Implemented in `samples/decorator.swift`

- **Text (Protocol)**: Defines the interface for text objects that can be dynamically decorated. It includes the `render` method to produce the text output.

- **NormalText**: A concrete class implementing the `Text` protocol. It holds a basic text string and provides the `render` method to return this text.

- **TextDecorator**: An abstract class that implements the `Text` protocol and wraps a `Text` object. It delegates the `render` method to the wrapped `Text` object.

The code allows for flexible and reusable text formatting without altering the original `SimpleText` class.
