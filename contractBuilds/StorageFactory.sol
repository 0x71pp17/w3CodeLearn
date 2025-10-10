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

    // Deploys a new SimpleStorage contract and saves its address in the array
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorageContractVariable = new SimpleStorage();
        // SimpleStorage simpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(simpleStorageContractVariable);
    }

    // Calls the store function on a specific SimpleStorage contract from the list
    // _simpleStorageIndex: position of the contract in the array
    // _simpleStorageNumber: value to store in that contract
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

    // Calls the retrieve function on a specific SimpleStorage contract
    // _simpleStorageIndex: position of the contract in the array
    // Returns the stored value from that contract
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}
