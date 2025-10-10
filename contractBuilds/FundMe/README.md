## FundMe Contract Overview

A decentralized crowdfunding contract where users can send ETH, with a minimum amount enforced in USD via Chainlink price feeds.

### Key Features
- **Minimum Funding**: Uses Chainlink's `AggregatorV3Interface` to convert ETH to USD, ensuring only sufficient contributions are accepted.
- **Owner-Only Withdrawals**: Only the deployer can withdraw funds, preventing unauthorized access.
- **Fallback Handling**: Implements both `receive()` and `fallback()` functions to manage incoming Ether safely:
  - `receive()`: Triggered when ETH is sent with empty calldata.
  - `fallback()`: Handles invalid function calls or ETH transfers with data, redirecting to `fund()`.

### Usage
Funders send ETH to the contract. If the value meets the USD minimum, their address and amount are recorded. The owner can later withdraw all funds.   


### Ether Reception Flow
Based on [Solidity by Example](https://solidity-by-example.org/fallback/):

             send Ether
                  |
       msg.data is empty?
            /           \
         yes             no
          |                \
receive() exists?        fallback()
    /        \  
 yes          no  
  |            |  
receive() fallback()  
