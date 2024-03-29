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

### Level 12 - Privacy

[Level](levels/12-Privacy.sol) | [Solution (Script)](script/12-Privacy.s.sol)

Inspect 5th storage slot of `Privacy` and cast down to `bytes16`, pass value to `unlock()`.

### Level 13 - GatekeeperOne

[Level](levels/13-GatekeeperOne.sol) | [Solution (Script)](script/13-GatekeeperOne.s.sol) | [Solution (Contract)](src/13-GatekeeperOne.sol)

This level is an exercise in three things:

1. Difference between `msg.sender` and `tx.origin`
2. Specifiying gas in `call()`
3. Bit operators, namely using the `&` to create a mask

### Level 14 - GatekeeperTwo

[Level](levels/14-GatekeeperTwo.sol) | [Solution (Script)](script/14-GatekeeperTwo.s.sol) | [Solution (Contract)](src/14-GatekeeperTwo.sol)

This level is an exercise in three things:

1. Difference between `msg.sender` and `tx.origin`
2. Understanding a contract lacks code size during its constructor
3. The `~` unary negation bit operator to find the complementary bytes for an `XOR` (^) operation

### Level 15 - NaughtCoin

[Level](levels/15-NaughtCoin.sol) | [Solution (Script)](script/15-NaughtCoin.s.sol) | [Solution (Contract)](src/15-NaughtCoin.sol)

To beat this level, take advantage of `approve()` and `transferFrom()` to transfer tokens from the locked player's balance.

### Level 16 - Preservation

[Level](levels/16-Preservation.sol) | [Solution (Script)](script/16-Preservation.s.sol) | [Solution (Contract)](src/16-Preservation.sol)

To beat this level, overwrite the first storage slot of `Preservation` with the address of a contract that can in turn overwite the storage slot of `owner`.

### Level 17 - Recovery

[Level](levels/17-Recovery.sol) | [Solution (Script)](script/17-Recovery.s.sol)

After learning the address of the `SimpleToken` deployment, simply call `destroy()` on it to `selfdestruct()` and recover the contract's balance.

### Level 18 - MagicNumber

[Level](levels/18-MagicNum.sol) | [Solution (Script)](script/18-MagicNum.s.sol)

This is an exercise in writing contract bytecode. Start with writing the runtime bytecode (10 bytes, 6 opcodes):

PUSH 0x2a
PUSH 0x80
MSTORE
PUSH 0x20
PUSH 0x80
RETURN

Then write the initialization bytecode which must return the runtime bytecode (12 bytes, 7 opcodes):

PUSH 0x0a
PUSH 0x0c
PUSH 0x00
CODECOPY
PUSH 0x0a
PUSH 0x00
RETURN

### Level 19 - Alien Codex

[Level](levels/19-AlienCodex.sol) | [Solution (Contract)](src/19-AlienCodex.sol)

First, we map the storage layout:

| Slot              | Storage Variable(s)                    |
| ----------------- | -------------------------------------- |
| 0                 | \_owner (20 bytes), contact (1 byte)   |
| 1                 | codex length                           |
| ...               | ...                                    |
| keccak(1)         | codex[0]                               |
| keccak(1) + 1     | codex[1]                               |
| ...               | ...                                    |
| 2<sup>256</sup>-1 | codex[2<sup>256</sup> - 1 - keccak(1)] |
| 0 (overflow)      | codex[2<sup>256</sup> - keccak(1)]     |

We can overwrite `_owner` in storage slot 0, by replacing the value at codex[2<sup>256</sup> - keccak(1)].

### Level 20 - Denial

[Level](levels/19-Denial.sol) | [Solution (Script)](script/19-Denial.s.sol) | [Solution (Contract)](src/19-Denial.sol)

Since `call()` won't bubble up a revert, to perform a denial of service (DoS) we must exhaust all gas units. We do this by simply entering an infinite loop when `Denial.sol` calls into our (malicious) partner contract.

### Level 21 - Shop

[Level](levels/21-Shop.sol) | [Solution (Script)](script/21-Shop.s.sol) | [Solution (Contract)](src/21-Shop.sol)

This attack leverages the fact that `Shop::isSold()` changes between the two `Buyer::price()` calls.
