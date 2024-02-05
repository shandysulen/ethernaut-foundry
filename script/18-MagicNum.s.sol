// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/18-MagicNum.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    MagicNum magicNumber = MagicNum(0x61F690A23252892459cA25D3eaa9EA0839E4264a);

    function run() external{
        vm.startBroadcast();

        // Create contract from bytes
        bytes memory code = hex"600a600c600039600a6000f3602a60805260206080f3";
        address solver;
        assembly {
            solver := create(0, add(code, 0x20), mload(code))
        }

        magicNumber.setSolver(solver);

        vm.stopBroadcast();
    }
}