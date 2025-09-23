# pub-sub

## Example 01: Event Bus in Kotlin

Implemented in `samples/pub_sub.kt`

This code implements the **Publish–Subscribe (Pub/Sub)** pattern in Kotlin, where publishers send messages without knowing who will receive them, and subscribers receive messages without knowing who sent them.

- **Event**: A simple data class representing a message with a `topic` and `payload`.
- **Subscriber**: Encapsulates a handler function for a specific topic and allows unsubscribing via `close()`.
- **EventBus**: Acts as the **message broker**
- **Publisher**: Wraps the bus and sends events (optional convenience class).

The main function shows how the event bus works:
- Subscribe to the `"news"` topic with a custom handler.
- Publish a message → the subscriber receives it.
- Unsubscribe the subscriber → further messages on `"news"` are ignored.
