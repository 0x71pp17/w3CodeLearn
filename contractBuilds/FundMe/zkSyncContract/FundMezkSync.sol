// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

/// @title PriceConverter
/// @author 0x71pp17
/// @notice A library for converting ETH amounts to USD using Chainlink price feeds.
/// @dev The library uses a fixed price feed address for Sepolia and scales the returned price to 18 decimals.
library PriceConverter {
    /// @notice Retrieves the current ETH/USD price from a Chainlink price feed
    /// @dev The price is scaled from 8 decimals (returned by Chainlink) to 18 decimals to match wei
    /// @return The current price of ETH in USD, scaled to 18 decimals
    function getPrice() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF
        );
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        return uint256(answer * 10000000000);
    }

    /// @notice Calculates the USD value of a given amount of ETH
    /// @dev Uses the current ETH/USD price and accounts for 18 decimals in the input amount
    /// @param ethAmount The amount of ETH, expressed in wei
    /// @return The equivalent value in USD, scaled to 18 decimals
    function getConversionRate(
        uint256 ethAmount
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        return ethAmountInUsd;
    }
}

/// @custom:error NotOwner Thrown when a non-owner attempts to call an owner-only function.
error NotOwner();

/// @title FundMe
/// @author dev
/// @notice A contract that allows users to fund a project with a minimum ETH value, determined by a USD conversion.
/// @dev Uses Chainlink oracles to get the current ETH/USD price and enforces a minimum funding threshold.
contract FundMe {
    using PriceConverter for uint256;

    /// @dev Tracks the amount funded by each address
    mapping(address => uint256) public addressToAmountFunded;

    /// @dev Stores the list of funders
    address[] public funders;

    /// @dev The address of the contract owner, set at deployment
    address public i_owner;

    /// @dev The minimum funding amount in USD, scaled to 18 decimals (5 USD)
    uint256 public constant MINIMUM_USD = 5 * 10 ** 18;

    /// @notice Initializes the contract owner upon deployment
    constructor() {
        i_owner = msg.sender;
    }

    /// @notice Allows a user to fund the contract with ETH
    /// @dev Reverts if the converted ETH value is below `MINIMUM_USD`
    /// @dev Updates the funder's balance and adds them to the funders list
    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "You need to spend more ETH!");
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    /// @notice Retrieves the version of the Chainlink price feed
    /// @dev Used for debugging and verifying the data source
    /// @return The version number of the price feed aggregator
    function getVersion() public view returns (uint256) {
        AggregatorV3Interface pr   
