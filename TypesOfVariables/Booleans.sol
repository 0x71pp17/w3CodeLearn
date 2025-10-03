// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title Booleans
/// @author 0x71pp17
/// @notice A simple contract to manage a boolean state variable
contract Booleans {
    // State variable: Declares a boolean with default value 'false'
    // 'public' generates an automatic getter function for external access
    bool public myBool;

    /// @notice Updates the value of `myBool`
    /// @dev This function acts as a setter to modify the stored boolean value
    /// @param _myBool The new boolean value to set (true or false)
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
}   
