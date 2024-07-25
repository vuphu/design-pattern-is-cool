# observer

## Example 01: Real-Time Stock Price

Implemented in `samples/observer.ts`

This code implements the Observer design pattern to manage stock price updates with the following components:

- **StockObserver**: An interface defining the **onPriceUpdated** method, which must be implemented by any observer.
- **StockNotifier**: A class that manages a list of observers and notifies them of price updates.
  - **addObserver**: Adds an observer to the list.
  - **removeObserver**: Removes an observer from the list.
  - **notifyPrice**: Notifies all registered observers of a price update.
- **StockCompany**: A concrete observer that represents a company receiving stock price updates.
- **StockBoard**: A concrete observer that represents a stock board receiving stock price updates.

The `main` function sets up the notifier with multiple observers, sends out a price update, removes one observer, and sends another price update.