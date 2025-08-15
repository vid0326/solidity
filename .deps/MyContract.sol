// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;


contract MyContract{
    //state variable
    int256 public  myInt=1; // we will deal with pos and neg
    uint public myUint =1; //== uint256  public myUint256

    uint8 public myUint8=1; 
    string public  myString = "helloWorld";
    bytes32 public myByte32 = "hsdytyhw";

    address public myAddress=0x79B3D67c3448799d511b847eEb1dcE8294D43EF0;

    struct MyStruct {
        uint myUint ;
        string myString;

    }

    MyStruct public myStruct = MyStruct(1,"helo world");

    //ifwe have to deal with the state var then we have to use view 

    //Local variable
    function getValue() public  pure returns(uint) { //we use pure when we are dealing with local val
        uint  val = 1;
        return val;
    }
}
