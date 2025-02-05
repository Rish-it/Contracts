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
        assert(c.totalStakes() == value);  // Corrected the variable name
    }

    function testFailStake() public {
        uint value = 10 ether;
        c.stake(value);
        assert(c.totalStakes() == value);  // Corrected the variable name
    }
}
