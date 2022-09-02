// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuckyNumber2 {
    address immutable owner;
    uint256 public myLuckyNumber = 42;

    constructor() {        
        owner = msg.sender;
    }
    
    function setLuckyNumber(uint256 _luckyNumber) public {
        require(msg.sender == owner, "Not owner");
        myLuckyNumber = _luckyNumber;
    }

}

