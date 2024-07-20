// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherTransfer {
    address public owner;

    constructor() {
        owner = msg.sender;
    }


    function transferEther(address payable _to) public payable {
        require(msg.sender == owner, "Only the owner can transfer Ether");
        require(msg.value > 0, "Transfer amount must be greater than zero");

        _to.transfer(msg.value);

        emit Transfer(msg.sender, _to, msg.value, msg.sender.balance, _to.balance);

    }

     function getBalance() public view returns (uint) {
        return msg.sender.balance;
    }

    receive() external payable {}

    event Transfer(address from, address to, uint amount, uint senderBalance, uint receiverBalance);

}