# Ethernaut Foundry

[Ethernaut CTF](https://ethernaut.openzeppelin.com/) solved completely in [Foundry](https://foundry.paradigm.xyz/).

Ethernaut Wallet: [0xd68507ad129cC90eDCf31E295EafBEbBf0987Ac2](0xd68507ad129cc90edcf31e295eafbebbf0987ac2)

## Levels

### Level 1 - Hello Ethernaut

[Level](levels/1-HelloEthernaut.sol) | [Script](script/1-HelloEthernaut.s.sol)

### Level 2 - Fallback

[Level](levels/2-Fallback.sol) | [Script](script/2-Fallback.s.sol)

### Level 3 - Fallout

[Level](levels/3-Fallout.sol) | [Script](script/2-Fallout.s.sol)

### Level 4 - CoinFlip

[Level](levels/4-CoinFlip.sol) | [Contract](src/4-CoinFlip.sol)

Foundry scripts are inadequate at solving this particular CFT because of the delay between local/onchain simulations and the broadcasted tx on Sepolia, which may mean that `block.number` differs between simulation and broadcast, effectively leaving the `_guess` up to chance.

An intermediary contract guarantees that `block.number` is the same within both the `CoinFlip` instance and `CoinFlipAttacker`.
