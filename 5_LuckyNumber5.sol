// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuckyNumber5 {
    address public immutable owner;
    // uint256 public myLuckyNumber = 42;

    mapping(address => uint256) public luckyNumbers;

    constructor() {
        owner = msg.sender;
    }

    function setLuckyNumber(uint256 _luckyNumber) public payable {
        require(msg.value >= 1e18, "Need more eth");
        luckyNumbers[msg.sender] = _luckyNumber;
    }

    function ethBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner");
        payable(msg.sender).transfer(ethBalance());
    }
}
