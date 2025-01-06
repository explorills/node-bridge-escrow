# explorills_BridgeEscrow Contract
Non-custodial ERC721 cross-chain escrow contract for explorills_Nodes tokens that facilitates cross-chain token transfers and balance management

## General Functionality
1. Facilitates secure cross-chain token transfers
2. Provides read-only access to chain supply data
3. Handles token bridging between Ethereum and Flare networks
4. Exclusive interaction with main explorills_Nodes contract
5. Non-custodial design for enhanced security

## View Functions
* `a1EthereumSupply`: Query total supply on Ethereum network
* `a2FlareSupply`: Check total supply on Flare network

## Cross-Chain Bridge System
* Facilitates token movement between:
 - Ethereum ↔ Flare Network
* Integration with main contract bridge functions:
 - a4ReceiveTnftFromUserToOtherChainsSupply
 - a5SendTnftToUserFromOtherChainsSupply

## Build and Deployment Settings
* Contract Name: explorills_BridgeEscrow
* Compiler Version: v0.8.24
* EVM Version: London
* Optimization: Enabled (200 runs)
* Networks: [Ethereum](https://ethereum.org/en/); [Flare](https://flare.network/)
```
## Contract Architecture
explorills_BridgeEscrow
├── View Functions
│   ├── Network Supply
│   │   ├── a1EthereumSupply
│   │   └── a2FlareSupply
│   └── Contract Identity
│       ├── IS_CROSSCHAIN_ESCROW
│       └── ESCROW_TYPE
└── Storage
   └── Contract References
       └── NODE_MAIN_CONTRACT
```
## License
BSD-3-Clause License

## Contact
- main: [explorills.com](https://explorills.com)
- mint: [mint.explorills.com](https://mint.explorills.com)
- contact: info@explorills.com
- security contact: info@explorills.ai

## Contract Address
- 0x129D9dce2326492d073D147762230e60c01e0f97

### find at
- [Etherscan.io](https://etherscan.io/address/0x129D9dce2326492d073D147762230e60c01e0f97#code)
- [Flare-explorer](https://flare-explorer.flare.network/address/0x129D9dce2326492d073D147762230e60c01e0f97?tab=contract)

## Main Contract Integration
- 0x468F1F91fc674e0161533363B13c2ccBE3769981
* Github: [explorills/nodes](https://github.com/explorills/nodes)

---
explorills community 2025
