// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9;
contract HotelRoom{
    //vaccant
    //Occupied


    //enum
    enum Statuses {vacant
    ,occupied
    }
    Statuses public  currStatus;

    event Occupy(address _occupant,uint _value); //help to log on the transaction logs

    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
        currStatus=Statuses.vacant;
    }

    modifier onlyWithVacant {
        require(currStatus==Statuses.vacant,"Room is occupied");
        _; //if check confirmend then the function will be executed
    }
    modifier costs(uint _amount){
        require(msg.value>= _amount , "Not enough ether provided");
        _;
    }


   function book() public payable onlyWithVacant costs(2 ether) {
    (bool sent, ) = owner.call{value: msg.value}("");
    //(bool sent, bytes memory data) = owner.call{value: msg.value}("");

    require(sent, "Failed to send Ether");

    currStatus = Statuses.occupied;
    emit Occupy(msg.sender, msg.value);
    }
}
