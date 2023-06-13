// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/20_Denial.sol";

contract ContractTest is Test {

    Denial denial;

    function setUp() public {
        denial = new Denial();
    }

    function testAttack() public {
        _attack();
    }

    function _attack() internal {

    }
}

contract ContractTestnet is ContractTest {
    function attack(address target) external {
        denial = Denial(payable(target));
        _attack();
    }
}