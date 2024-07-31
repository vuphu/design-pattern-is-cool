interface StockObserver {
    onPriceUpdated(name: string, price: number): void;
}


class StockNotifier {
    private readonly observers: StockObserver[];

    constructor() {
        this.observers = [];
    }

    addObserver(observer: StockObserver) {
        this.observers.push(observer);
    }

    removeObserver(observer: StockObserver) {
        const index = this.observers.indexOf(observer);
        if (index !== -1) {
            this.observers.splice(index, 1);
        }
    }
    
    notifyPrice(name: string, price: number): void {
        for (const observer of this.observers) {
            observer.onPriceUpdated(name, price);
        }
    }
}

class StockCompany implements StockObserver {
    private readonly companyName: string;
    
    constructor(companyName: string) {
        this.companyName = companyName;
    }
    
    onPriceUpdated(name: string, price: number): void {
        console.log(`The company ${this.companyName} received the price update: ${name} price is now ${price}`);
    }
}

class StockBoard implements StockObserver {
    onPriceUpdated(name: string, price: number): void {
        console.log(`The stockboard is just updated: ${name} price is now ${price}`);
    }
}

function main(): void {
    const notifier = new StockNotifier();
    const companyA = new StockCompany('A');
    const companyB = new StockCompany('B');
    const board = new StockBoard();
    
    notifier.addObserver(companyA);
    notifier.addObserver(companyB);
    notifier.addObserver(board);
    notifier.notifyPrice('GOOG', 100);
    
    notifier.removeObserver(companyB)
    notifier.notifyPrice('GOOG', 102);
}

main()