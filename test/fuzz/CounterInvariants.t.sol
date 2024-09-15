// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {StdInvariant} from "forge-std/StdInvariant.sol";
import {Test} from "forge-std/Test.sol";
import {Counter} from "../../src/Counter.sol";

contract CounterInvariants is StdInvariant, Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        targetContract(address(counter));
    }

    function invariant_ShouldAlwaysBeZero() public view {
        assertEq(counter.shouldAlwaysBeZero(), 0);
    }
}
