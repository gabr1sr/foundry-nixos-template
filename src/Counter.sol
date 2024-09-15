// SDPX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Counter {
    uint256 public number;
    uint256 public shouldAlwaysBeZero;

    function increment() public {
        number++;
    }

    function setNumber(uint256 x) public {
        if (x == 7) shouldAlwaysBeZero = 1;
        number = x;
    }
}
