# iterrator

## Example 01: SQL Iterator

Implemented in `samples/iterator.ts`

This code implements an iterator pattern for processing SQL query results with the following components:

- **Row**: An interface representing a row of data with arbitrary properties.
- **executeQuery**: A mock function that simulates executing a SQL query and returns an array of `Row` objects.
- **SQLIterator**: A class that iterates over the results of a SQL query.

The `main` function uses the `SQLIterator` to iterate over query results and print task descriptions.
