// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Candidate {
        string name;
        uint256 votes;
    }

    Candidate[] public candidates;
    mapping(address => bool) public hasVoted;
    uint256 public startTime;
    uint256 public endTime;

    constructor(uint256 _start, uint256 _end) {
        startTime = _start;
        endTime = _end;
    }

    function addCandidate(string memory _name) public {
        candidates.push(Candidate(_name, 0));
    }

    function vote(uint256 _index) public {
        require(block.timestamp >= startTime && block.timestamp <= endTime, "Voting closed");
        require(!hasVoted[msg.sender], "Already voted");
        require(_index < candidates.length, "Invalid candidate");

        hasVoted[msg.sender] = true;
        candidates[_index].votes++;
    }
}
