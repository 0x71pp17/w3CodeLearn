// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title ChangeHelloWorld
/// @author Developer
/// @notice A simple contract to store and update a string value
contract ChangeHelloWorld {
    // State variable: Stores a string that can be accessed externally due to 'public'
    // The compiler automatically generates a getter function for 'public' variables
    string public myString = "Hello world";

    /// @notice Updates the value of `myString`
    /// @dev This function acts as a setter to change the stored string
    /// @param _myString The new string value to set
    function updateOurString(string memory _myString) public {
        myString = _myString;
    }
}   
