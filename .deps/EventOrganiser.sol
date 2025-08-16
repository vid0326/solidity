// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;


contract EventOrganiser{
    struct Event{
        address oraganiser;
        string name;
        uint date;
        uint price;
        uint ticketCount;
        uint ticketRemanining;

    }
    mapping(uint=>Event)  public events;
    mapping(address=>mapping(uint=>uint)) public tickets;

    uint public nextId;
    function ceateEvent(string calldata name, uint date,uint price, uint ticketCount) public{
        require(block.timestamp<date,"you cannot create an event for past date");
        require(ticketCount>0,"Ticket count must be greater than zero ");
        events[nextId]=Event(msg.sender,name,date,price,ticketCount,ticketCount);
        nextId++;

    }
    function buyTicket(uint id , uint quan) public payable{
        require(events[id].date!=0,"Event does not exist");
        require(events[id].date>block.timestamp,"Event has ended");
        Event storage _event = events[id];
        require(msg.value == (_event.price*quan),"ether is not enough");
        require(_event.ticketRemanining>=quan,"Not enough ticket left");
        _event.ticketRemanining-=quan;
        tickets[msg.sender][id]+quan;


    }

    function transferTicket(uint id,uint quan , address to ) public{
        require(events[id].date!=0,"Event does not exists");
        require(events[id].date>block.timestamp,"Event has ended");
        require(tickets[msg.sender][id]>=quan,"you do not have tickets to transfer");
        tickets[msg.sender][id]-=quan;
        tickets[to][id]+=quan;

    }
}


