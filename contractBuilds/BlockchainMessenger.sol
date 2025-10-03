// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title BlockchainMessenger
/// @author 0x71pp17
/// @notice A simple message board where only the deployer can update the message
contract BlockchainMessenger {

    // State variable: Tracks how many times the message has been updated
    // 'public' allows external reading of the counter
    uint public changeCounter;

    // State variable: Stores the address of the contract deployer
    // This address has special privileges to modify the message
    address public owner;

    // State variable: Stores the public message
    // Only the owner can update this string
    string public theMessage;

    /// @notice Sets the contract deployer as the initial owner
    /// @dev Called once during deployment; records msg.sender as owner
    constructor() {
        owner = msg.sender;
    }

    /// @notice Updates the stored message if called by the owner
    /// @param _newMessage The new message to store
    /// @dev Increments changeCounter on each successful update
    function updateTheMessage(string memory _newMessage) public {
        if (msg.sender == owner) {
            theMessage = _newMessage;
            changeCounter++;
        }
    }
}   
