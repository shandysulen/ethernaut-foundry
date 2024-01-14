// SPDX-License-Identifier: UNLICENSED
// !! THIS FILE WAS AUTOGENERATED BY abi-to-sol v0.8.0. SEE SOURCE BELOW. !!
pragma solidity >=0.7.0 <0.9.0;

interface IHelloEthernaut {
    function authenticate(string memory passkey) external;

    function getCleared() external view returns (bool);

    function info() external pure returns (string memory);

    function info1() external pure returns (string memory);

    function info2(string memory param) external pure returns (string memory);

    function info42() external pure returns (string memory);

    function infoNum() external view returns (uint8);

    function method7123949() external pure returns (string memory);

    function password() external view returns (string memory);

    function theMethodName() external view returns (string memory);
}

// THIS FILE WAS AUTOGENERATED FROM THE FOLLOWING ABI JSON:
/*
[{"inputs":[{"internalType":"string","name":"_password","type":"string"}],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[{"internalType":"string","name":"passkey","type":"string"}],"name":"authenticate","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"getCleared","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"info","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"pure","type":"function"},{"inputs":[],"name":"info1","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"pure","type":"function"},{"inputs":[{"internalType":"string","name":"param","type":"string"}],"name":"info2","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"pure","type":"function"},{"inputs":[],"name":"info42","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"pure","type":"function"},{"inputs":[],"name":"infoNum","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"method7123949","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"pure","type":"function"},{"inputs":[],"name":"password","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"theMethodName","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"}]
*/

contract HelloEthernaut is IHelloEthernaut {
    uint8 public infoNum = 42;
    string public theMethodName = 'The method name is method7123949.';
    string public password;
    bool cleared;

    constructor(string memory _password) {
        password = _password;
    }

    function authenticate(string memory passkey) external {
        require(keccak256(bytes(passkey)) == keccak256(bytes('ethernaut0')));

        cleared = true;
    }

    function getCleared() external view returns (bool) {
        return cleared;
    }

    function info() external pure returns (string memory) {
        return 'You will find what you need in info1().';
    }

    function info1() external pure returns (string memory) {
        return 'Try info2(), but with "hello" as a parameter.';
    }

    function info2(string memory param) external pure returns (string memory) {
        require(keccak256(bytes(param)) == keccak256(bytes('hello')), 'Wrong parameter');

        return 'The property infoNum holds the number of the next info method to call.';
    }

    function info42() external pure returns (string memory) {
        return 'theMethodName is the name of the next method.';
    }

    function method7123949() external pure returns (string memory) {
        return 'If you know the password, submit it to authenticate().';
    }
}
