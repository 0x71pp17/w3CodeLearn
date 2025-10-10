## Solidity Functions

A focused project area for core function concepts in Solidity, including constructors, state mutability, and function modifiers.

### Key Concepts
- **Constructors**: The `Constructor` contract demonstrates initialization logic using a `constructor(address _someAddress)` that sets a state variable once during deployment.
- **View Functions**: Functions like `getMyStorageVariable()` read from state and are marked `view`, allowing free, gasless calls.
- **Pure Functions**: Functions like `getAddition(uint a, uint b)` perform computations without accessing or modifying state and are marked `pure`.
- **State Modification**: Functions like `setMyStorageVariable(uint _newVar)` change state and incur gas costs, requiring a transaction.


### Usage
Each `.sol` file includes NatSpec comments (`@title`, `@notice`, `@dev`, `@param`, `@return`) that provide standardized documentation directly within the code. 

These comments explain the purpose, behavior, and usage of contracts and functions, making the code self-documenting and easier to understand.
