## Solidity Exception Handling

A focused project area for mastering error handling mechanisms in Solidity, including `require`, `revert`, `assert`, and custom errors.

### Key Concepts
- **`require`**: Validates inputs and conditions; reverts transaction and refunds unused gas if false. Used for user-facing validation.
- **`revert`**: Manually triggers a revert with an optional reason string; useful for complex error conditions.
- **`assert`**: Checks for internal invariants; reverts transaction and consumes all gas if false, indicating a critical bug.
- **`try`/`catch`**: Handle failures from **external function calls** or **contract creation**. Only exceptions during the external call are caught, not internal ones.
- **Custom Errors (introduced in Solidity 0.8.4,)**: Gas-efficient, parameterized errors defined with the `error` keyword.

### Usage
Each `.sol` file includes NatSpec comments (`@title`, `@notice`, `@dev`, `@param`, `@return`) that provide standardized documentation directly within the code. 

These comments explain the purpose, behavior, and usage of contracts and functions, making the code self-documenting and easier to understand.
