interface MethodStep {
    get(url: string): HeaderStep & ProcessStep;

    delete(url: string): HeaderStep & ProcessStep;

    post(url: string): BodyStep;

    put(url: string): BodyStep;
}

interface HeaderStep {
    addHeader(key: string, value: string): HeaderStep & ProcessStep;
}

interface BodyStep {
    setBody(body: unknown): HeaderStep & ProcessStep;
}

interface ProcessStep {
    dump(): void

    execute(): Promise<Record<string, any>>;
}

class HttpRequest implements MethodStep, BodyStep, HeaderStep, ProcessStep {
    private method?: "GET" | "POST" | "PUT" | "DELETE";
    private url?: string;
    private headers: Record<string, string> = {};
    private body?: object;

    private constructor() {
    }


    static new(): MethodStep {
        return new HttpRequest();
    }

    get(url: string): HeaderStep & ProcessStep {
        this.method = "GET"
        this.url = url
        return this
    }

    post(url: string): BodyStep {
        this.method = "POST"
        this.url = url
        return this
    }

    put(url: string): BodyStep {
        this.method = "PUT"
        this.url = url
        return this
    }

    delete(url: string): HeaderStep & ProcessStep {
        this.method = "DELETE"
        this.url = url
        return this
    }

    setBody(body: object): HeaderStep & ProcessStep {
        this.body = body
        return this
    }

    addHeader(key: string, value: string): HeaderStep & ProcessStep {
        this.headers[key] = value
        return this
    }

    dump(): void {
        console.group(`[HTTP Request] ${this.method!} ${this.url!}`);
        console.log("Headers ", this.headers);
        console.log("Body ", this.body);
        console.groupEnd();
    }

    // @ts-ignore
    async execute(): Promise<Record<string, any>> {
        const response = await fetch(this.url!, {
            method: this.method!,
            headers: this.headers,
            body: this.body ? JSON.stringify(this.body) : undefined
        })
        return await response.json()
    }
}

// @ts-ignore
async function main() {
    console.log(
        await HttpRequest.new()
            .get("https://api.github.com/users/vuphu")
            .addHeader("Content-Type", "application/json")
            .execute()
    );

    HttpRequest.new()
        .post("http://localhost:3000")
        .setBody({"title": "Step Builder"})
        .addHeader("Content-Type", "application/json")
        .dump();
}

main().then();