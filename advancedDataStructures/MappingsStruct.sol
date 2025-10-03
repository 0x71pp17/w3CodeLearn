// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title MappingsStruct
/// @author 0x71pp17
/// @notice Tracks deposits and withdrawals per user with full transaction history
contract MappingsStruct {

    // Struct: Represents a single transaction with amount and timestamp
    struct Transaction {
        uint amount;
        uint timestamp;
    }

    // Struct: Holds a user's balance and records of deposits and withdrawals
    struct Balance {
        uint totalBalance;
        uint numDeposits;
        mapping(uint => Transaction) deposits;
        uint numWithdrawals;
        mapping(uint => Transaction) withdrawals;
    }

    // State variable: Maps user addresses to their balance and transaction history
    mapping(address => Balance) public balanceReceived;

    /// @notice Returns the total balance of a given address
    /// @param _addr The address to query
    /// @return The total balance of the address
    function getBalance(address _addr) public view returns(uint) {
        return balanceReceived[_addr].totalBalance;
    }

    /// @notice Allows user to deposit ETH
    /// @dev Updates totalBalance and records deposit in deposits mapping
    function depositMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balanceReceived[msg.sender].deposits[balanceReceived[msg.sender].numDeposits] = deposit;
        balanceReceived[msg.sender].numDeposits++;
    }

    /// @notice Withdraws ETH from user's balance
    /// @param _to Recipient address
    /// @param _amount Amount to withdraw
    /// @dev Records withdrawal, reduces balance, and sends funds
    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender].totalBalance, "not enough funds");
        balanceReceived[msg.sender].totalBalance -= _amount;
        Transaction memory withdrawal = Transaction(_amount, block.timestamp);
        balanceReceived[msg.sender].withdrawals[balanceReceived[msg.sender].numWithdrawals] = withdrawal;   
