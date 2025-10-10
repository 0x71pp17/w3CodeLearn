## StorageFactory Contract Overview

A factory contract that dynamically deploys and manages multiple instances of the `SimpleStorage` contract, demonstrating contract composability, external calls, and state management in Solidity.

### Key Features
- **Dynamic Deployment**: Uses the `new` keyword to create new `SimpleStorage` contract instances on-chain.
- **Instance Management**: Maintains a public array `listOfSimpleStorageContracts` to store and reference deployed contracts.
- **Cross-Contract Interaction**: Enables storage and retrieval of data in specific `SimpleStorage` instances via external function calls.

### Usage
Call `createSimpleStorageContract()` to deploy a new `SimpleStorage` instance. Use `sfStore(index, number)` to store a value in a specific instance, and `sfGet(index)` to retrieve it. The contract supports extensibility, working with derived contracts like `AddFiveStorage` that override the `store` function.
