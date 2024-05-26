pragma solidity ^0.8.13;
// this is a script to get bytes32 from the namehash algo
import {Test, console2} from "forge-std/Test.sol";
import {ENSNamehash} from "src/namehash.sol";

contract testNameHash {
    ENSNamehash public ENSNH;

    function setUp() public {
        ENSNH = new ENSNamehash();
    }

    function testtheNameHash() public {
        bytes32 stuff1 = ENSNH.namehash("eth");
        bytes32 stuff2 = ENSNH.namehash("foo.eth");
        bytes32 stuff3 = ENSNH.namehash("energy.eth");
    }

    function testGetTokenId() public {
        uint256 stuff1 = ENSNH.getDerivedTokenId("energy");
        console2.log(stuff1);
    }
}
