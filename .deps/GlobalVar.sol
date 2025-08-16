// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;


contract GlobalVar{
    function CallerAddress() public view returns(address){
        return msg.sender;
    }
    function returnBlockTimeStamp() public view returns(uint){
        return block.timestamp;
    }
    function returnBlockNumber() public view returns(uint){
        return block.number;
    }
    //tranfer ether to my contract 

    function sendEtherContract() public payable{

    }

    function balanceOfMyContract() public view returns(uint){
        return address(this).balance;
    }

    //payable address 
    function sendEth(address payable receiver) payable public {
        receiver.transfer(msg.value);
    }
    

    

}