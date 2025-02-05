// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract StakingContract {
    mapping (address => uint ) stakes;
    uint public totalStakes;

    constructor (){
    }

    function stake(uint   _amount) public payable {
        require(_amount>0);
        require(_amount == msg.value);
        stakes[msg.sender] += _amount;
        totalStakes += _amount;


    }

    function unstake(uint  _amount) public {      //sending doesn't need to be payable
        require(stakes[msg.sender] >= _amount);
        payable(msg.sender).transfer(_amount);
        totalStakes -= _amount;
        stakes[msg.sender] -= _amount;
    }
 }
