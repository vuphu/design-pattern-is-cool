# abstract-factory

## Example 01: Database Factory

Implemented in `samples/abstract_factory.kt`

This code implements the Abstract Factory pattern for managing database connections and query builders with the following components:

- **DBFactory**: An interface that defines methods for creating `Connection` and `QueryBuilder` objects.
- **Connection**: An interface representing a connection to a database.
- **QueryBuilder**: An interface for building queries.

The `main` method show how to use the abstract factory to create the appropriate database connection and query builder based on the specified database type.
