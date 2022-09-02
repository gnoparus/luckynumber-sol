// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuckyNumber4 {
    // address immutable owner;
    // uint256 public myLuckyNumber = 42;

    mapping(address => uint256) public luckyNumbers;

    event LuckyNumber4__LuckyNumberSet(address person, uint256 luckyNumber);

    function setLuckyNumber(uint256 _luckyNumber) public payable {
        require(msg.value > 1e18, "Need more eth");

        luckyNumbers[msg.sender] = _luckyNumber;

        emit LuckyNumber4__LuckyNumberSet(msg.sender, _luckyNumber);
    }

    function ethBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
