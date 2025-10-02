// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title HelloWorld
/// @author Developer
/// @notice A minimal contract that stores a public string
contract HelloWorld {
    // State variable: Declares a string that is publicly accessible
    // 'public' automatically generates a getter function for external reading
    string public ourString = "Hello World";
}   
