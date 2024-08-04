# proxy

## Example 01: AI Service Proxy

Implemented in `samples/proxy.go`

This example uses the Proxy design pattern to manage multiple AI services through a single proxy. The proxy helps distribute requests among different services in a round-robin fashion.

### Components

- **AIService**: An interface with the `Ask` method, which takes a request string and returns a response string and an error.

- **ProxyGPTService**: Manages multiple `AIService` instances and distributes requests. Includes:
  - **services**: A list of `AIService` instances.
  - **currentIndex**: An index to track the current service.
  - **Ask**: Routes requests to the current `AIService` instance and cycles through services in a round-robin fashion.

### Usage

The `main` function shows how to create a `ProxyAIService` instance with multiple services and process several requests. It illustrates how the proxy distributes requests and handles responses.
