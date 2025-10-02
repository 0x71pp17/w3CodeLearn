// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

/// @title StringsAndBytes
/// @author 0x71pp17
/// @notice Demonstrates string and bytes usage, comparison, and length operations
contract StringsAndBytes {
    // Public string state variable, initialized to "Hello World"
    // 'public' generates a getter function automatically
    string public myString = "Hello World";

    // Public bytes variable storing same text as raw UTF-8 bytes
    // Unlike string, bytes supports `.length` for byte count
    bytes public myBytes = "Hello World";

    /// @notice Updates the stored string value
    /// @param _myString New string to store
    function setMyString(string memory _myString) public {
        myString = _myString;
    }

    /// @notice Compares two strings for equality
    /// @dev Uses keccak256 hash of packed bytes since direct string comparison isn't supported
    /// @param _myString String to compare against `myString`
    /// @return bool True if strings are identical, false otherwise
    function compareTwoStrings(string memory _myString) public view returns (bool) {
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }

    /// @notice Returns the byte length of `myBytes`
    /// @dev Useful for checking size; note: UTF-8 chars like 'ö' use multiple bytes
    /// @return uint Length in bytes
    function getBytesLength() public view returns (uint) {
        return myBytes.length;
    }
}   
