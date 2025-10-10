## FundMe Contract Overview (zkSync)

A decentralized crowdfunding contract deployed on zkSync Era, allowing users to send ETH with a minimum amount enforced in USD via Chainlink price feeds.

### Key Features
- **zkSync Compatibility**: Built for zkSync Era, a ZK rollup offering lower fees and higher throughput than Ethereum mainnet while maintaining security.
- **Chainlink Integration**: Uses Chainlink Price Feeds on zkSync Sepolia testnet to get real-time ETH/USD prices for accurate USD-based funding thresholds.
- **EVM Compatibility**: Leverages zkSync's EVM-compatible environment, allowing Solidity contracts to be deployed with minimal changes.

### Usage
Funders send ETH to the contract. If the value meets the USD minimum, their address and amount are recorded. The owner can later withdraw all funds. For deployment on zkSync Sepolia testnet, ensure the correct Chainlink price feed address is used.   
