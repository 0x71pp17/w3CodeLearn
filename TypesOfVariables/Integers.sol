// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title ExampleUint
/// @author 0x71pp17
/// @notice Demonstrates unsigned and signed integer types, ranges, and arithmetic operations
contract Integers {
    // Unsigned integer: 256-bit, range 0 to (2^256 - 1)
    // Automatically initialized by default to 0, when not explicitly set
    uint256 public myUint;

    // 8-bit unsigned integer: range 0 to 255
    // Initialized to 250
    uint8 public myUint8 = 250;

    // Exponentiation example: 2^4 = 16
    uint8 public myUint8_EXP = 2**4;

    // Signed integer: range -(2^255) to (2^255 - 1)
    // Explicitly initialized to -10, otherwise defaults to 0
    int public myInt = -10;

    /// @notice Sets `myUint` to a new value
    /// @param _myUint The value to assign
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    /// @notice Decrements `myUint` by 1
    /// @dev Reverts on underflow (e.g., from 0 to max) due to Solidity 0.8+ built-in checks
    function decrementUint() public {
        myUint--;
    }

    /// @notice Increments `myUint8` by 1
    /// @dev Reverts on overflow (e.g., from 255 to 0) due to Solidity 0.8+ safety
    function incrementUint8() public {
        myUint8++;
    }

    /// @notice Increments `myInt` by 1
    /// @dev Reverts on overflow/underflow thanks to Solidity 0.8+ arithmetic checks
    function incrementInt() public {
        myInt++;
    }
}   
