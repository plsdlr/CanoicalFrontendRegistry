// SPDX-License-Identifier: UNLICENSED
import {minInterface} from "./minInterfaceENS.sol";

pragma solidity ^0.8.13;

contract CanoicalFrontendRegistry {
    //@dev Maps a bytes32 key (e.g. keccak256(abi.encodePacked(domainName)) to
    //@dev a version number (uint256) to a commit struct.
    mapping(bytes32 => mapping(uint256 => commit)) public cfrontend;
    //@dev Mapping to store the current version number for each bytes32 key.
    mapping(bytes32 => uint256) currentVersionNumber;
    //@dev ens registar
    address ens;

    //@dev commit structure
    struct commit {
        bytes32[] fileHashes;
        uint128 timestamp;
    }

    //@dev constructor with ensRegister
    constructor(address ensRegister) {
        ens = ensRegister;
    }
    //@dev derive the TokenId from the domain name string
    function getDerivedTokenId(
        string memory domainName
    ) internal pure returns (uint256, bytes32) {
        bytes32 labelHash = keccak256(abi.encodePacked(domainName));
        uint256 derivedTokenId = uint256(labelHash);
        return (derivedTokenId, labelHash);
    }

    //@dev derive the TokenId from the domain name string
    function changeEnsAddress(address newAddress) external {
        ens = newAddress;
    }

    function verification(uint256 tokenId) internal view {
        minInterface minIn;
        minIn = minInterface(ens);
        address _owner = minIn.ownerOf(tokenId);
        require(_owner == msg.sender, "NOT_OWNER_OF_ENS");
    }

    function commitFrontendWithEns(
        string memory _ens,
        bytes32[] memory files
    ) external {
        (uint256 tokenId, bytes32 enshash) = getDerivedTokenId(_ens);
        verification(tokenId);
        uint256 currentVersion = currentVersionNumber[enshash];
        uint256 timestamp = block.timestamp;
        cfrontend[enshash][currentVersion] = commit(files, uint128(timestamp));
        currentVersionNumber[enshash] = currentVersionNumber[enshash] + 1;
    }

    // function commitFrontend(bytes32 enshash, bytes32[] memory files) external {
    //     verification(enshash);
    //     uint256 currentVersion = currentVersionNumber[enshash];
    //     uint256 timestamp = block.timestamp;
    //     cfrontend[enshash][currentVersion] = commit(files, uint128(timestamp));
    //     currentVersionNumber[enshash] = currentVersionNumber[enshash] + 1;
    // }

    function _getFrontend(
        bytes32 enshash,
        uint256 version,
        bool withVersion
    )
        internal
        view
        returns (
            bytes32[] memory files,
            uint128 timestamp,
            uint256 versionNumber
        )
    {
        if (withVersion) {
            return (
                cfrontend[enshash][version].fileHashes,
                cfrontend[enshash][version].timestamp,
                version
            );
        } else {
            uint256 cVersionNumber = currentVersionNumber[enshash] - 1;
            return (
                cfrontend[enshash][cVersionNumber].fileHashes,
                cfrontend[enshash][cVersionNumber].timestamp,
                cVersionNumber
            );
        }
    }

    function getFrontendFullVersion(
        bytes32 enshash,
        uint256 version
    )
        external
        view
        returns (
            bytes32[] memory files,
            uint128 timestamp,
            uint256 versionNumber
        )
    {
        return _getFrontend(enshash, version, true);
    }

    function getFrontendFull(
        bytes32 enshash
    )
        external
        view
        returns (
            bytes32[] memory files,
            uint128 timestamp,
            uint256 versionNumber
        )
    {
        return _getFrontend(enshash, 0, false);
    }
}
