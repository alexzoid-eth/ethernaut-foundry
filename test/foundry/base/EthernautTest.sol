// SPDX-License-Identifier: MIT
pragma solidity >=0.6.2;
pragma experimental ABIEncoderV2;

import "./Cheatcodes.sol"; 
import "forge-std/Test.sol";

interface ILevel {
    function createInstance(address _player) external payable returns (address);
    function validateInstance(address payable _instance, address _player) external returns (bool);
}

abstract contract EthernautTest is Test {
    address levelFactory;
    address payable levelInstance;

    address constant LEVEL_1_FALLBACK_ADDRESS = 0x80934BE6B8B872B364b470Ca30EaAd8AEAC4f63F;
    address constant LEVEL_2_FALLOUT_ADDRESS = 0x0AA237C34532ED79676BCEa22111eA2D01c3d3e7;
    address constant LEVEL_3_COINFLIP_ADDRESS = 0x9240670dbd6476e6a32055E52A0b0756abd26fd2;
    address constant LEVEL_4_TELEPHONE_ADDRESS = 0x1ca9f1c518ec5681C2B7F97c7385C0164c3A22Fe;
    address constant LEVEL_5_TOKEN_ADDRESS = 0xB4802b28895ec64406e45dB504149bfE79A38A57;
    address constant LEVEL_6_DELEGATION_ADDRESS = 0xF781b45d11A37c51aabBa1197B61e6397aDf1f78;
    address constant LEVEL_7_FORCE_ADDRESS = 0x46f79002907a025599f355A04A512A6Fd45E671B;
    address constant LEVEL_8_VAULT_ADDRESS = 0x3A78EE8462BD2e31133de2B8f1f9CBD973D6eDd6;
    address constant LEVEL_9_KING_ADDRESS = 0x725595BA16E76ED1F6cC1e1b65A88365cC494824;
    address constant LEVEL_10_REENTRANCY_ADDRESS = 0x573eAaf1C1c2521e671534FAA525fAAf0894eCEb;
    address constant LEVEL_11_ELEVATOR_ADDRESS = 0x4A151908Da311601D967a6fB9f8cFa5A3E88a251;
    address constant LEVEL_12_PRIVACY_ADDRESS = 0xcAac6e4994c2e21C5370528221c226D1076CfDAB;
    address constant LEVEL_13_GATEKEEPERONE_ADDRESS = 0x2a2497aE349bCA901Fea458370Bd7dDa594D1D69;
    address constant LEVEL_14_GATEKEEPERTWO_ADDRESS = 0xf59112032D54862E199626F55cFad4F8a3b0Fce9;

    fallback() payable virtual external {}

    modifier validateInstance() {
        _;
        assert(ILevel(levelFactory).validateInstance(levelInstance, address(this)));
    }

    function levelSetUp(address _levelFactory, uint256 _value) internal {
        CheatCodes(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D).createSelectFork("goerli");
        vm.deal(address(this), 100 ether);
        levelFactory = _levelFactory;
        levelInstance = payable(ILevel(levelFactory).createInstance{value: _value}(address(this)));
    }
}

