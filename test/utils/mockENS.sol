// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// this is just a mock for internal tests

contract MockEnsContract {
    bool works = true;

    function ownerOf(uint256) external view returns (address) {
        if (works) {
            return address(111);
        } else {
            return address(0);
        }
    }

    function changeWorks(bool _works) external {
        works = _works;
    }
}
