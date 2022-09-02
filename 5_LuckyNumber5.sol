// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error LuckyNumber5__NeedMoreEth();
error LuckyNumber5__WithdrawNotSuccess();

contract LuckyNumber5 {
    address public immutable owner;
    // uint256 public myLuckyNumber = 42;

    mapping(address => uint256) public luckyNumbers;

    event LuckyNumberSet(address person, uint256 luckyNumber);

    constructor() {
        owner = msg.sender;
    }

    function setLuckyNumber(uint256 _luckyNumber) public payable {
        if (msg.value < 1e18) {
            revert LuckyNumber5__NeedMoreEth();
        }

        luckyNumbers[msg.sender] = _luckyNumber;

        emit LuckyNumberSet(msg.sender, _luckyNumber);
    }

    function ethBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner");
        // payable(msg.sender).transfer(ethBalance());
        (bool sent, bytes memory data) = payable(msg.sender).call{
            value: ethBalance()
        }("");
        if (!sent) revert LuckyNumber5__WithdrawNotSuccess();
    }
}
