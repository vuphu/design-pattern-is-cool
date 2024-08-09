#include <iostream>
#include <string>

class BluetoothConnector {
public:
    void connectBluetooth() {
        discoverDevices();
        pairWithDevice();
        establishConnection();
    }

protected:
    virtual void discoverDevices() = 0;
    virtual void pairWithDevice() = 0;
    virtual void establishConnection() = 0;
};

class SpeakerConnector : public BluetoothConnector {
protected:
    void discoverDevices() override {
        std::cout << "Discovering Bluetooth speakers" << std::endl;
    }

    void pairWithDevice() override {
        std::cout << "Pairing with selected speaker" << std::endl;
    }

    void establishConnection() override {
        std::cout << "Connecting to Bluetooth speaker" << std::endl;
    }
};

class HeadsetConnector : public BluetoothConnector {
protected:
    void discoverDevices() override {
        std::cout << "Discovering Bluetooth headsets" << std::endl;
    }

    void pairWithDevice() override {
        std::cout << "Pairing with selected headset" << std::endl;
    }

    void establishConnection() override {
        std::cout << "Connecting to Bluetooth headset" << std::endl;
    }
};

int main() {
    SpeakerConnector speakerConnector;
    speakerConnector.connectBluetooth();

    HeadsetConnector headsetConnector;
    headsetConnector.connectBluetooth();

    return 0;
}
