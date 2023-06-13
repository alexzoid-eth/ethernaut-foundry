// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/2_Fallout.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_2_FALLOUT_ADDRESS, 0);

        // Additional setup
    }

    function testAttack() public validateInstance {
        Fallout fallout = Fallout(levelInstance);
        
        fallout.Fal1out();
    }
}