// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {CanoicalFrontendRegistry} from "src/CanonicalFrontendRegister.sol";

contract FillContract is Script {
    uint256 deployerPrivateKey;
    CanoicalFrontendRegistry canoicalFrontendRegistry;

    function setUp() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY_TESTACC");
        canoicalFrontendRegistry = CanoicalFrontendRegistry(
            0x0FF64e781b0fc0b5595604C2f9B660a40B73c231
        );
    }

    function getStuff1() public {
        bytes32 enshash = keccak256(abi.encodePacked("energy"));
        (
            bytes32[] memory files,
            uint128 timestamp,
            uint256 versionNumber
        ) = canoicalFrontendRegistry.getFrontendFull(enshash);
        console2.log(timestamp);
    }

    function getStuff2() public {
        bytes32 enshash = keccak256(abi.encodePacked("f"));
        (
            bytes32[] memory files,
            uint128 timestamp,
            uint256 versionNumber
        ) = canoicalFrontendRegistry.getFrontendFull(enshash);
        console2.log(timestamp);
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        getStuff1();
        getStuff2();
        vm.stopBroadcast();
    }
}
