// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

/// @title SimpleStorage
/// @author 0x71pp17
/// @notice A basic contract demonstrating core Solidity concepts including state variables,
///         structs, arrays, mappings, and functions for storing and retrieving data.
/// @dev Designed to be extended, with the `store` function marked as virtual for overriding.
contract SimpleStorage {
    /// @dev Stores a single unsigned integer on the blockchain
    uint256 myFavoriteNumber;

    /// @dev Defines a structured data type `Person` with a name and favorite number
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    /// @dev Dynamic array to store multiple `Person` instances; public for auto-generated getter
    Person[] public listOfPeople;

    /// @dev Mapping to efficiently associate a person's name with their favorite number; public for getter
    mapping(string => uint256) public nameToFavoriteNumber;

    /// @notice Updates the stored favorite number with the provided value
    /// @dev This function can be overridden by derived contracts
    /// @param _favoriteNumber The new favorite number to store
    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    /// @notice Retrieves the currently stored favorite number
    /// @dev A view function that does not modify state and is free to call
    /// @return The current value of `myFavoriteNumber`
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    /// @notice Creates a new `Person` and adds them to the list and mapping
    /// @dev Uses `push` to append to the `listOfPeople` array and updates the `nameToFavoriteNumber` mapping
    /// @param _name The name of the person to add
    /// @param _favoriteNumber The favorite number of the person to add
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}   
