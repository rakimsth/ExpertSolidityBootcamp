// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Add {
    function addAssembly(uint256 x, uint256 y) public pure returns (uint256) {
        assembly {
            let result := add(x, y)
            let fmp := mload(0x40)
            mstore(fmp, result)
        }

        assembly {
            let fmp := mload(0x40)
            return(fmp, 32)
        }
    }
}
