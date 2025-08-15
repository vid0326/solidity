// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;


contract MyContract1{
    uint[] public uintArray =[1,2,3];
    string[] public stringArray =["apple","banane"];
    string[] public value;

    function addValue(string memory _value) public{
        value.push(_value);
    }

    function valueCount() public view returns(uint){
        return value.length;
    }

    uint256[][] public array2d =[[1,2,3],[2,3,4]];
    


}