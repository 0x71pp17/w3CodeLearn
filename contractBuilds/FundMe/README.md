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

---

### Ether Reception Flow
Based on [Solidity by Example](https://solidity-by-example.org/fallback/):

```
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
```

---

## Chainlink Resources: Data, Docs & Faucets
- **[data.chain.link](https://data.chain.link)**: Official Chainlink data page for viewing price feeds and oracle performance.
- **[docs.chain.link](https://docs.chain.link)**: Official Chainlink documentation for developers.
- **[faucets.chain.link](https://faucets.chain.link)**: Official Chainlink faucet for testnet LINK.

- **[Using Data Feeds](https://docs.chain.link/data-feeds/using-data-feeds)**: Step-by-step guide with **Solidity code** for reading data feeds.
- **[Chainlink VRF](https://docs.chain.link/vrf)**: Official documentation for Chainlink's Verifiable Random Function, including setup and usage guides.
- **[Chainlink Automation](https://docs.chain.link/chainlink-automation)**: Official documentation for Chainlink `Automation` (formerly known as `Keepers`), enabling automated smart contract execution based on time, logs, or custom logic.



