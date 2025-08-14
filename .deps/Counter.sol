// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;

contract Counter{
    uint count;
    function getCount() public view returns(uint){
        return count;
    }
    function incrCount() public{
        count=count+1;
    }
}