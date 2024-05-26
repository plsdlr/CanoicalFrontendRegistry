// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.13;

// import {Script, console2} from "forge-std/Script.sol";
// import {CanoicalFrontendRegistry} from "src/CanonicalFrontendRegister.sol";

// //forge script script/deployTESTNET.s.sol --rpc-url $SEP_RPC_URL  -vvvv --slow

// contract FillContract is Script {
//     uint256 deployerPrivateKey;

//     function setUp() public {
//         deployerPrivateKey = vm.envUint("PRIVATE_KEY_TESTACC");
//     }

//     function addStuff() public {
//         CanoicalFrontendRegistry canoicalFrontendRegistry;
//         bytes32 test1 = 0xac0bd22a1e1f45d0804628a26dee089f207a91fbc137b25454ed2ae4cea347c5;

//         canoicalFrontendRegistry = CanoicalFrontendRegistry(
//             0x6Daa439054602609d18644B0D83c2b687ae96445
//         );
//         bytes32[] memory hashes = new bytes32[](1);
//         hashes[0] = test1;
//         bytes32 enshash = keccak256(abi.encodePacked("nascent.energy"));
//         //function commitFrontend(bytes32 enshash, bytes32[] memory files)
//         canoicalFrontendRegistry.commitFrontend(enshash, hashes);

//         // afToken = new AFToken(
//         //     "https://terra0.org/nft/af/",
//         //     ".jpg",
//         //     "",
//         //     "",
//         //     0xfcd64d5fadb563aa2eb1585b8a897a9bbd45280a37269dd5c397e5e067b669f6
//         // );
//     }

//     // function deployStaking() public {
//     //     aufoStaking = new AufoStaking(address(afToken));
//     //     writerHelper("Staking_Sepolia", address(aufoStaking));
//     // }

//     function run() public {
//         vm.startBroadcast(deployerPrivateKey);
//         addStuff();
//         //deployStaking();
//         vm.stopBroadcast();
//     }
// }
