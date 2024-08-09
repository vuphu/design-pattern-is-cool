# strategy

## Example 01: Payment Processing

Implemented in `samples/strategy.py`

This code implements the Strategy pattern for handling different payment methods with the following components:

- **PaymentStrategy**: An abstract base class that defines the `pay` method.
- **CreditCardPayment**: A concrete implementation of `PaymentStrategy` for credit card payments.
- **PayPalPayment**: A concrete implementation of `PaymentStrategy` for PayPal payments.
- **Order**: Represents an order with an ID and an amount.
- **PaymentGateway**: Handles payment processing by accepting a `PaymentStrategy` and an `Order`.

The `main` method shows how to use the `PaymentGateway` to process payments with different payment methods for different orders.
