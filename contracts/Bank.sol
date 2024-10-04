// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Bank {
    mapping(address => uint256) private balances;
    address public owner;

    event Deposit(address indexed account, uint256 amount);

    event Withdrawal(address indexed account, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        payable(msg.sender).transfer(_amount);
        balances[msg.sender] -= _amount;
        emit Withdrawal(msg.sender, _amount);
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function getBankBalance() public view returns (uint256) {
        require(msg.sender == owner, "Only the owner can check the total balance");
        return address(this).balance;
    }
}

