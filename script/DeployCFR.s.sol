// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

//forge script script/deployTESTNET.s.sol --rpc-url $SEP_RPC_URL  -vvvv --slow
import {Script, console2} from "forge-std/Script.sol";
import {CanoicalFrontendRegistry} from "src/CanonicalFrontendRegister.sol";

contract Deploy is Script {
    uint256 deployerPrivateKey;
    CanoicalFrontendRegistry canoicalFrontendRegistry;

    function setUp() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY_TESTACC");
    }

    function deploy() public {
        canoicalFrontendRegistry = new CanoicalFrontendRegistry(
            0x57f1887a8BF19b14fC0dF6Fd9B2acc9Af147eA85
        );
    }

    function commit() public {
        bytes32 test1 = 0xac0bd22a1e1f45d0804628a26dee089f207a91fbc137b25454ed2ae4cea347c5;
        bytes32[] memory hashes = new bytes32[](1);
        hashes[0] = test1;
        canoicalFrontendRegistry.commitFrontendWithEns("energy", hashes);
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        deploy();
        commit();
        vm.stopBroadcast();
    }
}
