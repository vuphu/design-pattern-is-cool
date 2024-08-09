# template-method

## Example: Bluetooth Connection

Implemented in `samples/template-method.cpp`

This code apply the Template Method pattern for managing Bluetooth connections, using the following components:

- **BluetoothConnector**: An abstract base class that defines the `connectBluetooth()` method. This method outlines the steps for connecting to a Bluetooth device and calls abstract methods.
- **SpeakerConnector**: A concrete subclass of `BluetoothConnector` that provides specific implementations for discovering, pairing, and connecting to Bluetooth speakers.
- **HeadsetConnector**: Another concrete subclass of `BluetoothConnector` that implements the methods to discover, pair with, and connect to Bluetooth headsets.

The `main` function show how to use SpeakerConnector and HeadsetConnector to perform Bluetooth connections with different devices