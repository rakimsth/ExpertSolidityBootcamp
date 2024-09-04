// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Scope {
    uint256 public count = 10;

    function increment(uint256 num) public {
        // Modify the state of the count variable from within
        // the assembly segment
        assembly {
            // Load the storage slot of `count` which is at slot 0
            let countSlot := sload(0)

            // Increment the value by the provided `num`
            let newCount := add(countSlot, num)

            // Store the new value back into the `count` slot (slot 0)
            sstore(0, newCount)
        }
    }
}
