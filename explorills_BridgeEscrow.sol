    // SPDX-License-Identifier: BSD-3-Clause
    pragma solidity ^0.8.0;

    /**
     * ORIGINAL AUTHOR INFORMATION:
     * 
     * @author explorills community 2025
     * @custom:web https://explorills.com
     * @custom:contact info@explorills.com
     * @custom:security-contact info@explorills.ai
     * @custom:repository https://github.com/explorills/node-bridge-escrow
     * @title explorills_BridgeEscrow
     * @dev Non-custodial ERC721 cross-chain escrow contract for explorills_Nodes tokens that facilitates token transfers between chains, with read-only functionality 
     * and exclusive main contract interaction through a4ReceiveTnftFromUserToOtherChainsSupply/a5SendTnftToUserFromOtherChainsSupply bridge functions
     * 
     * Contract redistribution or modification:
     * 
     * 1. Any names or terms related to "explorills," "EXPL_NODE," or their variations, cannot be used in any modified version's contract names, variables, or promotional materials without permission.
     * 2. The original author information (see above) must remain intact in all versions.
     * 3. In case of redistribution/modification, new author details must be added in the section below:
     * 
     * REDISTRIBUTED/MODIFIED BY:
     * 
     * /// @custom:redistributed-by <name or entity>
     * /// @custom:website <website of the redistributor>
     * /// @custom:contact <contact email or info of the redistributor>
     * 
     * Redistribution and use in source and binary forms, with or without modification, are permitted under the 3-Clause BSD License. 
     * This license allows for broad usage and modification, provided the original copyright notice and disclaimer are retained.
     * The software is provided "as-is," without any warranties, and the original authors are not liable for any issues arising from its use.
     */

    /// @author explorills community 2025
    /// @custom:web https://explorills.com
    /// @custom:contact info@explorills.com
    /// @custom:security-contact info@explorills.ai
    /// @custom:repository https://github.com/explorills/node-bridge-escrow
    contract explorills_BridgeEscrow {
        // Contract identity
        bool public IS_CROSSCHAIN_ESCROW = true;
        string public constant ESCROW_TYPE = "ERC721 Bridge Escrow";
        address public NODE_MAIN_CONTRACT = address(0x468F1F91fc674e0161533363B13c2ccBE3769981);

        // receiver
        function onERC721Received(
            address /* operator */,
            address /* from */,
            uint256 /* tokenId */,
            bytes calldata /* data */
        ) external view returns (bytes4) {
            require(msg.sender == NODE_MAIN_CONTRACT, "Only explorills_Nodes MAIN CONTRACT can interact with explorills_BridgeEscrow");
            return 0x150b7a02;
        }

        // view only functions
        function a1EthereumSupply() public view returns (uint256) {
        (bool success1, bytes memory data1) = NODE_MAIN_CONTRACT.staticcall(
            abi.encodeWithSignature("isWhitelistNetwork()")
        );
        require(success1, "Network check failed");
        bool isWhitelistNetwork = abi.decode(data1, (bool));
        
        if (isWhitelistNetwork) {
            (bool success2, bytes memory data2) = NODE_MAIN_CONTRACT.staticcall(
                abi.encodeWithSignature("a2OtherChainsTnftSupply()")
            );
            require(success2, "Supply check failed");
            return abi.decode(data2, (uint256));
        } else {
            (bool success2, bytes memory data2) = NODE_MAIN_CONTRACT.staticcall(
                abi.encodeWithSignature("a1CurrentChainTnftSupply()")
            );
            require(success2, "Supply check failed");
            return abi.decode(data2, (uint256));
        }
        }

        function a2FlareSupply() public view returns (uint256) {
        (bool success1, bytes memory data1) = NODE_MAIN_CONTRACT.staticcall(
            abi.encodeWithSignature("isWhitelistNetwork()")
        );
        require(success1, "Network check failed");
        bool isWhitelistNetwork = abi.decode(data1, (bool));
        
        if (isWhitelistNetwork) {
            (bool success2, bytes memory data2) = NODE_MAIN_CONTRACT.staticcall(
                abi.encodeWithSignature("a1CurrentChainTnftSupply()")
            );
            require(success2, "Supply check failed");
            return abi.decode(data2, (uint256));
        } else {
            (bool success2, bytes memory data2) = NODE_MAIN_CONTRACT.staticcall(
                abi.encodeWithSignature("a2OtherChainsTnftSupply()")
            );
            require(success2, "Supply check failed");
            return abi.decode(data2, (uint256));
        }
        }

    }
