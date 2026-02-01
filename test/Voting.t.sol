// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Voting.sol";

contract VotingTest is Test {
    Voting voting;
    address voter = address(0x1);

    function setUp() public {
        uint256 start = block.timestamp;
        uint256 end = block.timestamp + 1 hours;

        voting = new Voting(start, end);
        voting.addCandidate("me");
        voting.addCandidate("other guy");
    }

    function testVoteOnce() public {
        vm.prank(voter);
        voting.vote(0);

        vm.prank(voter);
        vm.expectRevert("Already voted");
        voting.vote(1);
    }

    function testVoteCountIncrements() public {
        vm.prank(voter);
        voting.vote(1);

        (, uint256 votes) = voting.candidates(1);
        assertEq(votes, 1);
    }

    function testVotingClosedReverts() public {
        vm.warp(block.timestamp + 2 hours);

        vm.prank(voter);
        vm.expectRevert("Voting closed");
        voting.vote(0);
    }
}
