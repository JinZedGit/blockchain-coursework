// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Caller must be the owener");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}

/*

Създава портфейл (owner). Всеки може да изпраща до owner-a. Само owner-a може да тегли от себе си, чрез withdraw().
Може да се види текущия баланс на owner-a чрез getBalance().

*/