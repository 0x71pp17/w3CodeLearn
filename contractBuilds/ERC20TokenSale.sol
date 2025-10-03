// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title TokenSale
/// @author 0x71pp17
/// @notice A contract to sell ERC20 tokens in exchange for ETH
interface IERC20 {
    /// @notice Transfers tokens to a recipient
    /// @param to The recipient address
    /// @param amount The amount to transfer
    function transfer(address to, uint amount) external;

    /// @notice Returns the token's number of decimals
    /// @return The number of decimals
    function decimals() external view returns(uint);
}

/// @title TokenSale
/// @author 0x71pp17
/// @notice Enables users to purchase ERC20 tokens with ETH
/// @dev The contract owner must ensure sufficient token balance before sale
contract ERC20TokenSale {
    // State variable: Price of one token in Wei (1 ether = 1 ETH)
    uint tokenPriceInWei = 1 ether;

    // State variable: Reference to the ERC20 token being sold
    IERC20 token;

    /// @notice Initializes the contract with the token address
    /// @param _token The address of the ERC20 token to sell
    constructor(address _token) {
        token = IERC20(_token);
    }

    /// @notice Allows users to purchase tokens with ETH
    /// @param _amount The amount of ETH sent (in msg.value)
    /// @dev Sends back excess ETH (remainder) after purchase
    /// @dev Reverts if insufficient ETH is sent
    function purchase() public payable {
        require(msg.value >= tokenPriceInWei, "Not enough money sent");
        uint tokensToTransfer = msg.value / tokenPriceInWei;
        uint remainder = msg.value - tokensToTransfer * tokenPriceInWei;
        token.transfer(msg.sender, tokensToTransfer * 10 ** token.decimals());
        payable(msg.sender).transfer(remainder); // send the rest back
    }
}   
