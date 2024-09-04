// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Intro {
    function intro() public pure returns (uint16) {
        uint256 mol = 999999999999999999420;

        // Yul assembly magic happens within assembly{} section
        assembly {
            // Stack variables are instantiated with "let variable_name := VALUE"
            let stackVar := mol

            // To return it needs to be stored in memory with "mstore(MEMORY_LOCATION, STACK_VARIABLE)"
            mstore(0x80, stackVar)

            // To return, you need to specify the address and the size from the starting point
            // Returning a 16-bit (2-byte) value, so the size is 0x20 (32 bytes) and the memory location is 0x80
            return(0x80, 0x20)
        }
    }
}
