// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title UseMapping
/// @author 0x71pp17
/// @notice Tracks and manages user balances with deposit and withdrawal functionality
contract UseMapping {

    // State variable: Maps user addresses to their deposited balances
    mapping(address => uint) public balanceReceived;

    /// @notice Returns the current contract balance
    /// @return The total amount of ETH stored in the contract
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    /// @notice Allows users to deposit ETH into their balance
    /// @dev Updates sender's balance by adding msg.value
    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    /// @notice Withdraws a specified amount to a given address
    /// @param _to Recipient address
    /// @param _amount Amount to withdraw
    /// @dev Fails if sender's balance is insufficient
    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "not enough funds");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    /// @notice Withdraws entire balance to a given address
    /// @param _to Recipient address
    /// @dev Resets sender's balance to zero after withdrawal
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSend);
    }
}   
