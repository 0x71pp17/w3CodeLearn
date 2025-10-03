// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title Structs
/// @author 0x71pp17
/// @notice Stores details of the last incoming payment using a struct
contract Structs {

    // Struct: Groups related data for a payment (sender and amount)
    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }

    // State variable: Public instance of the struct, storing the latest payment
    // Automatically generates a getter function due to 'public' visibility
    PaymentReceivedStruct public payment;

    /// @notice Accepts ETH and records the sender and value in the struct
    /// @dev Overwrites previous payment data with each new transaction
    function payContract() public payable {
        payment = PaymentReceivedStruct(msg.sender, msg.value);
    }
}   
