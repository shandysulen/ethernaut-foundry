# Ethernaut Foundry

[Ethernaut CTF](https://ethernaut.openzeppelin.com/) solved completely in [Foundry](https://foundry.paradigm.xyz/).

Ethernaut Wallet: [0xd68507ad129cC90eDCf31E295EafBEbBf0987Ac2](0xd68507ad129cc90edcf31e295eafbebbf0987ac2)

## Levels

### Level 0 - Hello Ethernaut

[Level](levels/0-HelloEthernaut.sol) | [Solution (Script)](script/0-HelloEthernaut.s.sol)

### Level 1 - Fallback

[Level](levels/1-Fallback.sol) | [Solution (Script)](script/1-Fallback.s.sol)

### Level 2 - Fallout

[Level](levels/2-Fallout.sol) | [Solution (Script)](script/2-Fallout.s.sol)

### Level 3 - CoinFlip

[Level](levels/3-CoinFlip.sol) | [Solution (Contract)](src/3-CoinFlip.sol)

Foundry scripts are inadequate at solving this particular CFT because of the delay between local/onchain simulations and the broadcasted tx on Sepolia, which may mean that `block.number` differs between simulation and broadcast, effectively leaving the `_guess` up to chance.

An intermediary contract guarantees that `block.number` is the same within both the `CoinFlip` instance and `CoinFlipAttacker`.

### Level 4 - Telephone

[Level](levels/4-Telephone.sol) | [Solution (Contract)](src/4-Telephone.sol)

Once [`TelephoneAttacker`](src/4-Telephone.sol) is deployed, run the following to issue the attack.

```bash
$ cast send $TELEPHONE_ATTACKER "attack()" --private-key $ETHERNAUT_PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL
```

### Level 5 - Token

[Level](levels/5-Token.sol) | [Solution (Contract)](src/5-Token.s.sol)

Exploit the underflow vulnerability in Solidity v0.6.

### Level 6 - Delegation

[Level](levels/6-Delegation.sol) | [Solution (Script)](src/6-Delegation.s.sol)

### Level 7 - Force

[Level](levels/7-Force.sol) | [Solution (Contract)](src/7-Force.sol) | [Solution (Script)](src/7-Force.s.sol)

### Level 8 - Vault

[Level](levels/8-Vault.sol) | [Solution (Script)](src/8-Vault.s.sol)

Read storage slot 1 of the `Vault` instance and pass it to `Vault::unlock()`.

### Level 9 - King

[Level](levels/9-King.sol) | [Solution (Contract)](src/9-King.sol) | [Solution (Script)](script/9-King.s.sol)

The `King` contract is susceptible to denial of service (DoS). To exploit, create a contract that becomes king and reverts in `receive()` upon an ETH transfer.

### Level 10 - Reentrance

[Level](levels/10-Reentrance.sol) | [Solution (Contract)](src/10-Reentrance.sol) | [Solution (Script)](script/10-Reentrance.s.sol)

The `Reentrance` contract is susceptible to a reentrancy attack. Donate and withdraw from a contract with a receive/fallback function that continues to withdraw until the contract is drained.

### Level 11 - Elevator

[Level](levels/11-Elevator.sol) | [Solution (Contract)](src/11-Elevator.sol) | [Solution (Script)](script/11-Elevator.s.sol)

Simply implement `isLastFloor()` to first return `false` then `true` in order to reach the desired code path.
