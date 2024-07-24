# factory-method

## Example 01: Notification System
Implemented in `samples/factory-method.kt`

This code implements a notification system with the following components:

- **Notification**: Defines a `send` method for sending a notification.
- **EmailNotification**: Sends a notification via email.
- **AppNotification**: Sends a notification through an app.
- **SMSNotification**: Sends a SMS notification.

The `chooseNotification` function selects the appropriate notification type based on the input string (e.g., "email", "app", "sms").