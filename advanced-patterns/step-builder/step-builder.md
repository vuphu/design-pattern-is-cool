# step-builder

## Example 01: HTTP Request Builder

Implemented in `samples/step_builder.ts`

This code implements the **Step Builder** pattern for constructing and executing HTTP requests with a clear and type-safe flow.

- **MethodStep**: Defines available HTTP methods (`GET`, `POST`, `PUT`, `DELETE`).
- **HeaderStep**: Defines the step for adding request headers.
- **BodyStep**: Defines the step for setting a request body.
- **ProcessStep**: Defines the final steps for dumping or executing the request.
- **HttpRequest**: Implements all steps (`MethodStep`, `BodyStep`, `HeaderStep`, `ProcessStep`) and provides a fluent API for building requests.

The main function shows how the step builder enforces a logical flow:
- Choose the HTTP method.
- Optionally set the request body and headers.
- Dump the request for debugging or execute it to send the HTTP call.