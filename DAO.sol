// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IToken{
    function balanceOf(address) external view returns(uint);
}

contract DAO {

    struct Proposal {
        string description;
        uint deadline;
        uint votesFor;
        uint votesAgainst;
        bool executed;
        mapping(address=>bool) voted;
    }

    IToken public token;
    uint public proposalCount;

    mapping(uint=>Proposal) public proposals;

    constructor(address _token){
        token = IToken(_token);
    }

    function createProposal(string memory desc,uint duration) external {

        proposalCount++;

        Proposal storage p = proposals[proposalCount];
        p.description = desc;
        p.deadline = block.timestamp + duration;
    }

    function vote(uint id,bool support) external {

        Proposal storage p = proposals[id];

        require(block.timestamp < p.deadline,"ended");
        require(!p.voted[msg.sender],"already voted");

        uint power = token.balanceOf(msg.sender);
        require(power > 0,"no power");

        p.voted[msg.sender] = true;

        if(support){
            p.votesFor += power;
        } else {
            p.votesAgainst += power;
        }
    }

    function execute(uint id) external {

        Proposal storage p = proposals[id];

        require(block.timestamp >= p.deadline,"not ended");
        require(!p.executed,"done");

        p.executed = true;

        if(p.votesFor > p.votesAgainst){
            // execution logic placeholder
        }
    }

    function result(uint id) external view returns(string memory){
        Proposal storage p = proposals[id];

        if(block.timestamp < p.deadline){
            return "Voting still active";
        }

        if(p.votesFor > p.votesAgainst){
            return "Proposal Passed";
        } else {
            return "Proposal Rejected";
        }
    }
}
