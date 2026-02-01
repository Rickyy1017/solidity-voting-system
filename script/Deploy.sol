// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Voting} from "../src/Voting.sol";

contract VotingScript is Script {
    Voting public voting;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        uint256 start = block.timestamp;
        uint256 end = block.timestamp + 1 hours;
        voting = new Voting(start, end);

        vm.stopBroadcast();
    }
}
