// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CanoicalFrontendRegistry} from "../src/CanonicalFrontendRegister.sol";
import {MockEnsContract} from "./utils/mockENS.sol";

contract CanonicalFrontendRegisterTest is Test {
    CanoicalFrontendRegistry public CFR;
    MockEnsContract public MEC;

    function setUp() public {
        MEC = new MockEnsContract();
        CFR = new CanoicalFrontendRegistry(address(MEC));
    }

    function commit(string memory ens) public returns (bytes32[] memory) {
        bytes32[] memory hashes = new bytes32[](3);
        for (uint256 i = 0; i < hashes.length; i++) {
            hashes[i] = blockhash(i);
            //console.logBytes32(blockhash(i));
            vm.roll(i + 10);
        }
        vm.prank(address(111));
        CFR.commitFrontendWithEns(ens, hashes);
        return hashes;
    }

    function test_commit() public {
        string memory name = "smol.dollar.supply";
        bytes32 enshash = keccak256(abi.encodePacked(name));
        bytes32[] memory hashes = commit(name);
        (bytes32[] memory files, uint128 timestamp, uint256 versionNumber) = CFR
            .getFrontendFull(enshash);
        assertEq(hashes, files);
        assertEq(versionNumber, 0);
        assertEq(timestamp, block.timestamp);
    }

    function test_getFrontendFullVersion() public {
        string memory name = "smol.dollar.supply";
        bytes32 enshash = keccak256(abi.encodePacked(name));
        bytes32[] memory hashes = commit(name);
        (bytes32[] memory files, uint128 timestamp, uint256 versionNumber) = CFR
            .getFrontendFullVersion(enshash, 0);
        assertEq(hashes, files);
        assertEq(versionNumber, 0);
        assertEq(timestamp, block.timestamp);
    }
}
