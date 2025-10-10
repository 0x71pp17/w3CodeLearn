// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

/// @title AddFiveStorage
/// @author 0x71pp17
/// @notice A contract that extends SimpleStorage to always add 5 to the number being stored.
/// @dev Demonstrates function overriding and inheritance in Solidity.
contract AddFiveStorage is SimpleStorage {
    /// @notice Overrides the store function to add 5 to the input value before storing
    /// @dev Increases the provided number by 5 and assigns it to the state variable `myFavoriteNumber`
    /// @param _favoriteNumber The base number to store (will be stored as _favoriteNumber + 5)
    function store(uint256 _favoriteNumber) public override {
        myFavoriteNumber = _favoriteNumber + 5;
    }
}   
