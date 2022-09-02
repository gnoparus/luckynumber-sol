// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuckyNumber3 {
    // address immutable owner;
    // uint256 public myLuckyNumber = 42;

    mapping(address => uint256) public luckyNumbers;

    event LuckyNumber3__LuckyNumberSet(address person, uint256 luckyNumber);

    function setLuckyNumber(uint256 _luckyNumber) public {
        luckyNumbers[msg.sender] = _luckyNumber;

        emit LuckyNumber3__LuckyNumberSet(msg.sender, _luckyNumber);
    }
}
