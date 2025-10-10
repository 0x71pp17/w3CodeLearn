// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title SimpleStorage
/// @author 0x71pp17
/// @notice A simple contract to demonstrate basic Solidity concepts like state variables,
///         structs, arrays, mappings, and functions for storing and retrieving data.
contract SimpleStorage {
    // State variable to store a favorite number persistently on the blockchain
    uint256 myFavoriteNumber;

    // Defines a custom data type 'Person' with a name and favorite number
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Dynamic array to store multiple Person structs; automatically generates a public getter
    Person[] public listOfPeople;

    // Mapping to associate a person's name directly with their favorite number (public getter)
    mapping(string => uint256) public nameToFavoriteNumber;

    // Updates the stored favorite number with the provided value
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    // Reads and returns the current favorite number (view function, no gas cost to call)
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    // Adds a new person to the list and records their data in the mapping
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}   
