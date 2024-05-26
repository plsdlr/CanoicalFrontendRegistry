//  this is just an example script how to use the name resolver
// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.13;
// import {Script, console2} from "forge-std/Script.sol";
// import {minInterface} from "src/minInterfaceENS.sol";
// import {ENSNamehash} from "src/namehash.sol";

// // import {ENSNamehash} from "src/namehash.sol";

// // contract testNameHash {
// //     ENSNamehash public ENSNH;

// //     function setUp() public {
// //         ENSNH = new ENSNamehash();
// //     }

// //forge script script/deployTESTNET.s.sol --rpc-url $SEP_RPC_URL  -vvvv --slow

// contract Resolver is Script {
//     uint256 deployerPrivateKey;
//     minInterface SepInterface;
//     ENSNamehash public ENSNH;

//     function setUp() public {
//         deployerPrivateKey = vm.envUint("PRIVATE_KEY_TESTACC");
//         ENSNH = new ENSNamehash();
//     }

//     function checkStuff() public {
//         SepInterface = minInterface(0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e);
//         bytes32 enshash = ENSNH.namehash("nascent.energy.eth");
//         //console2.logBytes32(enshash);
//         address _owner = SepInterface.owner(enshash);
//         console2.log(_owner);
//     }

//     // function deployStaking() public {
//     //     aufoStaking = new AufoStaking(address(afToken));
//     //     writerHelper("Staking_Sepolia", address(aufoStaking));
//     // }

//     function run() public {
//         vm.startBroadcast(deployerPrivateKey);
//         checkStuff();
//         //deployStaking();
//         vm.stopBroadcast();
//     }
// }
