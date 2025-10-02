// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

/// @title Address
/// @author 0x71pp17
/// @notice Demonstrates address manipulation and balance querying
contract Address {
    // Public state variable to store an Ethereum address
    address public someAddress;

    /// @notice Updates the stored address
    /// @param _someAddress The new address to store
    function setSomeAddress(address _someAddress) public {
        someAddress = _someAddress;
    }

    /// @notice Retrieves the Ether balance of `someAddress`
    /// @dev Returns balance in Wei; safe even if address has no Ether
    /// @return The balance of the address in Wei
    function getAddressBalance() public view returns (uint) {
        return someAddress.balance;
    }
}   
