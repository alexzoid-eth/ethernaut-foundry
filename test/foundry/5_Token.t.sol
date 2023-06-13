// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/5_Token.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_5_TOKEN_ADDRESS, 0);

        // Additional setup
    }

    function testAttack() public validateInstance {
        Token token = Token(levelInstance);
        
        token.transfer(address(0), 21);
    }
}