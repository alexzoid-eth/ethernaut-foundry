// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/18_MagicNumber.sol";

contract ContractTest is Test {

    MagicNum magicNum;

    function setUp() public {
        magicNum = new MagicNum();
    }

    function testAttack() public {
        _attack();
    }

    function _attack() internal {
        
    }
}

contract ContractTestnet is ContractTest {
    function attack(address target) external {
        magicNum = MagicNum(target);
        _attack();
    }
}