## Solidity Intro

A foundational project area for intro to Solidity, demonstrating how to define, store, and modify a "Hello World" string in smart contracts.

### Key Concepts
- **State Variables**: Data permanently stored on-chain (e.g., `string public myString`).
- **Public Variables**: Automatically generate a getter function for external access.
- **Functions**: Modify state (e.g., `updateOurString`) and are marked `public` for external calls.
- **Data Types**: Introduction to `string` and memory management (`memory` keyword).

### Usage
Each `.sol` file includes NatSpec comments (`@title`, `@notice`, `@dev`, `@param`, `@return`) that provide standardized documentation directly within the code. 

These comments explain the purpose, behavior, and usage of contracts and functions, making the code self-documenting and easier to understand.
