// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

/// @title PriceConverter
/// @author 0x71pp17
/// @notice A library for converting ETH amounts to USD using Chainlink price feeds.
/// @dev Uses a fixed Sepolia price feed address; functions are internal and meant to be used via `using for`.
library PriceConverter {
    /// @notice Retrieves the current ETH/USD price from a Chainlink price feed
    /// @dev The returned price is scaled from 8 decimals to 18 decimals to match wei
    /// @return The current price of ETH in USD, scaled to 18 decimals
    function getPrice() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        return uint256(answer * 10000000000);
    }

    /// @notice Calculates the USD value of a given amount of ETH
    /// @dev Uses the price from `getPrice` and accounts for 18 decimals in the input
    /// @param ethAmount The amount of ETH, in wei
    /// @return The equivalent value in USD, scaled to 18 decimals
    function getConversionRate(
        uint256 ethAmount
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        return ethAmountInUsd;
    }
}   
