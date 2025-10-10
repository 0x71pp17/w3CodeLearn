// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// import {SimpleStorage, SimpleStorage2} from "./SimpleStorage.sol";
import {SimpleStorage} from "./SimpleStorage.sol";

/// @title StorageFactory 
/// @author 0x71pp17 
/// @notice A factory contract that deploys and manages multiple instances of the SimpleStorage contract. 
/// Demonstrates contract creation, external function calls, and array management. 
contract StorageFactory {
    // Dynamic array to store instances of SimpleStorage contracts created by this factory
    SimpleStorage[] public listOfSimpleStorageContracts;

    /// @notice Deploys a new SimpleStorage contract and adds its reference to the list
    /// @dev Uses the 'new' keyword to create a contract instance on the blockchain
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorageContractVariable = new SimpleStorage();
        // SimpleStorage simpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(simpleStorageContractVariable);
    }

    /// @notice Stores a number in a specific SimpleStorage contract instance
    /// @dev Performs an external call to the 'store' function of the targeted SimpleStorage contract
    /// @param _simpleStorageIndex Index of the SimpleStorage contract in the list
    /// @param _simpleStorageNumber Value to store in the target contract
    function sfStore(
        uint256 _simpleStorageIndex,
        uint256 _simpleStorageNumber
    ) public {
        // Address
        // ABI
        // SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
        listOfSimpleStorageContracts[_simpleStorageIndex].store(
            _simpleStorageNumber
        );
    }

    /// @notice Retrieves a number from a specific SimpleStorage contract instance
    /// @dev Calls the 'retrieve' view function of the target contract
    /// @param _simpleStorageIndex Index of the SimpleStorage contract in the list
    /// @return The stored number from the target contract
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}
