// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title Constructor
/// @author 0x71pp17
/// @notice A contract that initializes a state variable using constructor
contract Constructor {

    // State variable: Stores an Ethereum address that can be read externally
    // 'public' generates a getter function automatically
    address public myAddress;

    /// @notice Initializes the contract with a given address
    /// @param _someAddress The initial address to set
    /// @dev Constructor runs once during contract deployment and cannot be called again
    constructor(address _someAddress) {
        myAddress = _someAddress;
    }

    /// @notice Updates myAddress to a new value
    /// @param _myAddress The new address to set
    /// @dev Can be called by anyone to change the stored address
    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    /// @notice Sets myAddress to the caller's address (msg.sender)
    /// @dev Uses msg.sender to identify the transaction origin
    function setMyAddressToMsgSender() public {
        myAddress = msg.sender;
    }
}
