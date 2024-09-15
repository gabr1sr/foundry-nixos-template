// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {SymTest} from "halmos-cheatcodes/SymTest.sol";
import {Test} from "forge-std/Test.sol";
import {Counter} from "../../src/Counter.sol";

contract CounterSymTest is SymTest, Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function check_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assert(counter.number() == x);
        assert(counter.shouldAlwaysBeZero() == 0);
    }
}
