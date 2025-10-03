// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title ExceptionAssert
/// @author 0x71pp17
/// @notice Tracks deposits with strict internal invariants using assert
contract ExceptionAssert {

    // State variable: Maps user addresses to their balance (uint8, limited range)
    mapping(address => uint8) public balanceReceived;

    /// @notice Accepts ETH and updates sender's balance
    /// @dev Uses assert to ensure no overflow and valid state transitions
    function receiveMoney() public payable {
        assert(msg.value == uint8(msg.value)); // Ensure value fits in uint8
        uint8 value = uint8(msg.value);
        balanceReceived[msg.sender] += value;
        assert(balanceReceived[msg.sender] >= value); // Prevent underflow (always true)
    }

    /// @notice Withdraws ETH from user's balance
    /// @param _to Recipient address
    /// @param _amount Amount to withdraw
    ///    
