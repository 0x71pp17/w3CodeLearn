// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./PriceConverter.sol";

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
    /// @param msg.value The amount of ETH sent (in wei)
    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "You need to spend more ETH!");
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    /// @notice Retrieves the version of the Chainlink price feed
    /// @dev Used for debugging and verifying the data source
    /// @return The version number of the price feed aggregator
    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    /// @dev Restricts function access to the contract owner
    modifier onlyOwner() {
        if (msg.sender != i_owner) revert NotOwner();
        _;
    }

    /// @notice Withdraws all funds from the contract
    /// @dev Only callable by the owner. Resets funder balances and clears the funders list.
    /// @dev Uses low-level `call` to send ETH, which is more reliable than `transfer` or `send`.
    function withdraw() public onlyOwner {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    /// @dev Fallback function to accept ETH sent to the contract
    fallback() external payable {
        fund();
    }

    /// @dev Receive function to accept plain ETH transfers
    receive() external payable {
        fund();
    }
}   
