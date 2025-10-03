// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title NamedExceptions
/// @author 0x71pp17
/// @notice Demonstrates the use of custom errors with parameters in Solidity
contract NamedExceptions {
    /// @notice Custom error with two string parameters for detailed revert messages
    /// @param param1 First descriptive string
    /// @param param2 Second descriptive string
    error ThisIsACustomError(string param1, string param2);

    /// @notice Function that reverts using the custom error
    /// @dev Triggers `ThisIsACustomError` with predefined text, showcasing gas-efficient error handling
    function aFunction() public pure {
        revert ThisIsACustomError("Text 1", "text message 2");
    }
}   
