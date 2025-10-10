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

    /// @notice Updates the stored favorite number in the contract
    /// @dev Assigns the provided value to the state variable `myFavoriteNumber`
    /// @param _favoriteNumber The new favorite number to store
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    /// @notice Retrieves the currently stored favorite number
    /// @dev This is a view function, meaning it does not modify the state and incurs no gas cost when called
    /// @return The current value of `myFavoriteNumber`
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    /// @notice Creates and adds a new person to the list of people and updates the name-to-number mapping
    /// @dev Uses `push` to append a new `Person` struct to `listOfPeople` and updates the `nameToFavoriteNumber` mapping
    /// @param _name The name of the person to add
    /// @param _favoriteNumber The favorite number of the person to add
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }   
}   
