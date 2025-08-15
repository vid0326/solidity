// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;

contract CondAndLoop{
    uint[] numbers = [1,2,3,4,5,6,7,8,9,10];
    address public owner;
    constructor(){
        owner = msg.sender;
    }


    function countEven() public view returns(uint){
        uint   count =0;
        for (uint i =0; i<numbers.length;i++){
            if(isEvenNumber(numbers[i]))
            count++;
        }
        return count;
    }
    function isEvenNumber(uint _num) public pure returns(bool){
        if(_num%2==0){
            return true;
        }
        else{
            return false;
        }
    }

    function isOwner() public view returns(bool){
        return(msg.sender==owner);
    }


}