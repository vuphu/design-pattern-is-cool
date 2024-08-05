# flyweight

## Example 01: Button Style Factory

Implemented in `samples/flyweight.kt`

This code implements the Flyweight design pattern for managing button styles efficiently with the following components:

- **Style**: A data class representing the style of a button with `backgroundColor` and `foregroundColor`.
- **Button**: A class representing a button with a `title`, `position`, and a `Style`. It includes a `render` method to display button details.
- **StyleFactory**: An object managing a collection of shared `Style` instances, providing them based on type. It ensures that only one instance of each style is created and reused.
- **Canvas**: A class managing a list of `Component` instances. It can add buttons with specified or default styles and render all buttons.

The `main` method shows how to add buttons to the canvas with various styles and render them. This approach efficiently manages button styles using the Flyweight pattern, reducing memory usage by sharing common style objects.
