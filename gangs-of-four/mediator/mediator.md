# mediator

## Example 01: Checkbox Group

Implemented in `samples/mediator.swift`

This code apply the Mediator pattern by using a `CheckboxGroup` to coordinate interactions between multiple `Checkbox` instances. The components include:

- **Checkbox**: Represents an individual checkbox and interacts with the `CheckboxGroup` mediator.
- **CheckboxGroup**: Serves as the mediator that manages the state of multiple checkboxes.

The example sets up a `CheckboxGroup` and several `Checkbox` instances. When checkboxes are checked, the mediator ensures that the state is properly managed, enforcing a FIFO order for the checked checkboxes.

