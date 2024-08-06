interface Row {
    [key: string]: any;
}

function executeQuery(query: string): Row[] {
    switch (query) {
        case "SELECT * FROM tasks":
            return [
                {id: 1, description: "Fix bugs"},
                {id: 2, description: "Implement new feature"},
                {id: 3, description: "Write documentation"},
            ];
        default:
            return [];
    }
}

class SQLIterator {
    private readonly items: Row[];
    private index: number;

    constructor(query: string) {
        this.items = executeQuery(query);
        this.index = 0;
    }

    hasNext(): boolean {
        return this.index < this.items.length;
    }

    next(): Row | null {
        if (this.hasNext()) {
            return this.items[this.index++];
        } else {
            return null;
        }
    }
}

function main() {
    const query = "SELECT * FROM tasks";
    const iterator = new SQLIterator(query);

    while (iterator.hasNext()) {
        const row = iterator.next();
        if (row) {
            console.log(`Task ${row.id}: ${row.description}`)
        }
    }
}

main();