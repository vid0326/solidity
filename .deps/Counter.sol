// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;

contract Counter{
    uint  public count;
    // function getCount() public view returns(uint){
    //     return count;
    
    // } if we declare the uint variable as public then we do not need to require to create get fn

    
    function incrCount() public{
        count++;
    }
}