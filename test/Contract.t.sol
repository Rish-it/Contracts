// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Contract.sol";

contract StakingTestContract is Test {
    StakingContract c;

    function setUp() public {
        c = new StakingContract();
    }

    function testStake() public {
        uint value = 10 ether;
        c.stake{value: value}(value);
        assert(c.totalStakes() == value); 
    }

    function testFailStake() public {
        uint value = 10 ether;
        c.stake(value);
        assert(c.totalStakes() == value);  
        
    }
    //     function testUnStake() public {
    //     uint value = 10 ether;
    //     c.stake{value: value}(value);
    //     c.unstake(value);
    //     assert(c.totalStakes() == 0); 

    // }// failing beacuse of the unstake transfer function beacuse the contract assuming that the msg.sender is stakingTestContract which cannot recieve the ETH.
    

    function testUnStake() public {
    uint value = 10 ether;
    address user = address(0x1234); // Simulating a real user

    vm.startPrank(user);
    vm.deal(user, 100 ether); // Give user ETH

    c.stake{value: value}(value);
    c.unstake(value);

    assert(c.totalStakes() == 0);
    vm.stopPrank();
}

}
