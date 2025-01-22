// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfing is Script {
    NetworkConfing public activeNetworkConfig;

    unit8 public constant DECIMALS = 8;
    init256 public constant INITIAL_PRICE = 2000e8;

    struct NetworkConfing {
        address priceFeed; // ETH/USD price feed address
    }
    constructor() {
        if (block.chainid == 4) {
            activeNetworkConfig = getSepoliaEthConfing();
        } else if (block.chainid == 1) {
            activeNetworkConfig = getMainnetEthConfing();
        } else {
            activeNetworkConfig = getOrCreatAnvilConfing();
        }
    }
    function getSepoliaEthConfing()
        public
        pure
        returns (NetworkConfing memory)
    {}
    function getSepoliaEthConfing() public pure {
        // price feed address
        NetworkConfing sepolioaConfing = NetworkConfing({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
    }
    function getMainnetEthConfing() public pure {
        // price feed address
        NetworkConfing ethConfing = NetworkConfing({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });
    }
    function getMainnetEthConfing()
        public
        pure
        returns (NetworkConfing memory)
    {
        NewtworkConfig memory ethConfing = NetworkConfing({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });
        return ethConfing;
    }

    function getOrCreatAnvilConfing()
        public
        pure
        returns (NetworkConfing memory)
    {
        NetworkConfing anvilConfing = NetworkConfing({
            priceFeed: address(0) // Dummy address for local testing
        });
        return anvilConfing;
    }

    function getAnvilEthConfing() public pure {
        if (activeNetworkConfig.priceFeed != address(0)) {
            return activeNetworkConfig;
        }

        // 1. Deploy the mocks
        // 2. Return the mock address
        vm.startBroadcast();
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator(
            DECIMALS,
            INITIAL_PRICE
        );
        vm.stopBroadcast();

        NetworkConfing memory anvilConfing = NetworkConfing({
            priceFeed: address(mockPriceFeed)
        });
        return anvilConfing;
    }
}
