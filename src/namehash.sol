// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ENSNamehash {
    function getDerivedTokenId(
        string memory domainName
    ) public pure returns (uint256) {
        bytes32 labelHash = keccak256(abi.encodePacked(domainName));
        uint256 derivedTokenId = uint256(labelHash);
        return derivedTokenId;
    }
    function namehash(string memory name) public pure returns (bytes32) {
        if (bytes(name).length == 0) {
            return bytes32(0);
        } else {
            (string memory label, string memory remainder) = split(name);
            return
                keccak256(
                    abi.encodePacked(
                        namehash(remainder),
                        keccak256(abi.encodePacked(label))
                    )
                );
        }
    }

    function split(
        string memory name
    ) internal pure returns (string memory label, string memory remainder) {
        bytes memory nameBytes = bytes(name);
        uint256 dotIndex = nameBytes.length;

        for (uint256 i = 0; i < nameBytes.length; i++) {
            if (nameBytes[i] == ".") {
                dotIndex = i;
                break;
            }
        }

        if (dotIndex == nameBytes.length) {
            return (name, "");
        } else {
            bytes memory labelBytes = new bytes(dotIndex);
            for (uint256 i = 0; i < dotIndex; i++) {
                labelBytes[i] = nameBytes[i];
            }
            label = string(labelBytes);

            bytes memory remainderBytes = new bytes(
                nameBytes.length - dotIndex - 1
            );
            for (uint256 i = dotIndex + 1; i < nameBytes.length; i++) {
                remainderBytes[i - dotIndex - 1] = nameBytes[i];
            }
            remainder = string(remainderBytes);
        }
    }
}
