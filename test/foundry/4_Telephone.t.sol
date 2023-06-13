// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/4_Telephone.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_4_TELEPHONE_ADDRESS, 0);

        // Additional setup
    }

    function testAttack() public validateInstance {
        Telephone telephone = Telephone(levelInstance);
        
        telephone.changeOwner(address(this));
    }
}
