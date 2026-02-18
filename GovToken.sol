// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GovToken {

    string public name = "Governance Token";
    string public symbol = "GOV";
    uint8 public decimals = 18;

    uint public totalSupply;
    mapping(address=>uint) public balanceOf;

    event Transfer(address indexed from,address indexed to,uint value);

    constructor(){
        uint supply = 1_000_000 ether;
        totalSupply = supply;
        balanceOf[msg.sender] = supply;
        emit Transfer(address(0),msg.sender,supply);
    }

    function transfer(address to,uint value) external returns(bool){
        require(balanceOf[msg.sender] >= value,"balance low");

        balanceOf[msg.sender]-=value;
        balanceOf[to]+=value;

        emit Transfer(msg.sender,to,value);
        return true;
    }
}
