pragma solidity ^0.8.13;
// this is the base register:
// sepolia: 0x57f1887a8BF19b14fC0dF6Fd9B2acc9Af147eA85
// after unwrapping the ens token (at https://app.ens.domains/) you can call owner of with the esoteric tokenId
// BaseRegistrarImplementation

interface minInterface {
    //function owner(bytes32 node) external view returns (address owner);
    function ownerOf(uint256 tokenId) external view returns (address);
}
