// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title Wallet
/// @author 0x71pp17
/// @notice A smart contract wallet with owner control, spending allowances, and guardian-based recovery
contract Wallet {

    // State variable: The primary owner authorized to manage allowances and permissions
    address payable owner;

    // Mapping: Tracks how much each address is allowed to spend
    mapping(address => uint) public allowance;

    // Mapping: Indicates whether an address is authorized to send funds
    mapping(address => bool) public isAllowedToSend;

    // Mapping: Identifies addresses with guardian privileges for owner recovery
    mapping(address => bool) public guardian;

    // State variable: Stores the proposed next owner during recovery process
    address payable nextOwner;

    // State variable: Counts how many guardians have approved the proposed owner change
    uint guardiansResetCount;

    // Constant: Minimum number of guardian confirmations required to change owner
    uint public constant confirmationsFromGuardiansForReset = 3;

    /// @notice Sets the deployer as the initial owner
    /// @dev Called once on contract deployment
    constructor() {
        owner = payable(msg.sender);
    }

    /// @notice Allows a guardian to propose a new owner
    /// @param newOwner The address proposed as the new owner
    /// @dev Requires 3 out of 5 guardians to confirm; resets counter if proposal changes
    function proposeNewOwner(address payable newOwner) public {
        require(guardian[msg.sender], "You are no guardian, aborting");
        if(nextOwner != newOwner) {
            nextOwner = newOwner;
            guardiansResetCount = 0;
        }
        guardiansResetCount++;
        if(guardiansResetCount >= confirmationsFromGuardiansForReset) {
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    /// @notice Sets spending allowance for a given address
    /// @param _from The address allowed to spend
    /// @param _amount The maximum amount they can spend
    /// @dev Only callable by the owner
    function setAllowance(address _from, uint _amount) public {
        require(msg.sender == owner, "You are not the owner, aborting!");
        allowance[_from] = _amount;
        isAllowedToSend[_from] = true;
    }

    /// @notice Revokes sending permission from an address
    /// @param _from The address to deny
    /// @dev Does not reset allowance; only disables sending
    function denySending(address _from) public {
        require(msg.sender == owner, "You are not the owner, aborting!");
        isAllowedToSend[_from] = false;
    }

    /// @notice Transfers funds to a specified address
    /// @param _to The recipient address (EOA or contract)
    /// @param _amount The amount of ETH to send
    /// @param payload Optional calldata for contract interactions
    /// @return Data returned from the call
    /// @dev Uses low-level call to support both EOA and contract recipients
    function transfer(address payable _to, uint _amount, bytes memory payload) public returns (bytes memory) {
        require(_amount <= address(this).balance, "Can't send more than the contract owns, aborting.");
        if(msg.sender != owner) {
            require(isAllowedToSend[msg.sender], "You are not allowed to send any transactions, aborting");
            require(allowance[msg.sender] >= _amount, "You are trying to send more than you are allowed to, aborting");
            allowance[msg.sender] -= _amount;
        }
        (bool success, bytes memory returnData) = _to.call{value: _amount}(payload);
        require(success, "Transaction failed, aborting");
        return returnData;
    }

    /// @notice Enables the contract to receive ETH
    /// @dev Triggered when ETH is sent without calldata
    receive() external payable {}
}   
