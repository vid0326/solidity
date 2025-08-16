// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;


contract CrowdFunding{
    mapping(address=>uint) public contributers;
    address public manager;
    uint public minimumContribution;
    uint public deadline;
    uint public target;
    uint public raisedAmount;
    uint public noOfContributors;

    struct  Request{
        string desc;
        address payable recipient;
        uint value;
        bool completed;
        uint noOfVoters;
        mapping(address=>bool) voters;


    }
    mapping(uint=>Request) public requests;
    uint  public numOfReq;

    constructor(uint _target,uint _deadline){
        target=_target;
        deadline=block.timestamp+_deadline;
        minimumContribution=100 wei;
        manager=msg.sender;

    }
    modifier onlyManager(){
        require(msg.sender==manager,"only manager can create a Request");
        _;
    }

    function createReaquest(
        string calldata _description,
        address payable _recipient,
        uint _value

    ) public  onlyManager{
        Request storage newReq = requests[numOfReq];
        numOfReq++;
        newReq.desc=_description;
        newReq.recipient=_recipient;
        newReq.value=_value;
        newReq.completed=false;
        newReq.noOfVoters=0;


    }

    function contribution() public payable{
        require(block.timestamp<deadline,"sorry You are late buddy");
        require(msg.value>=minimumContribution,"bhai kuch aur badfa de bhikh thode de raha hai ");
        
        if(contributers[msg.sender]==0){
            noOfContributors++;
        }
        contributers[msg.sender]+=msg.value;
        raisedAmount+=msg.value;


    }

    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }


    function refund() public{
        require(block.timestamp>deadline && raisedAmount<target,"you are not eligble for refund");
        require(contributers[msg.sender]>0,"you are not elligble");
        payable(msg.sender).transfer(contributers[msg.sender]);
        contributers[msg.sender]==0;
    }

    function voteReq(uint _req) public{
        require(contributers[msg.sender]>0,"you are not elligble to vote");
        Request storage thisReq = requests[_req];
        require(thisReq.voters[msg.sender]==false,"You have already voted");
        thisReq.voters[msg.sender]=true;
        thisReq.noOfVoters++;

    }

    function makePayment (uint _reqNo) public onlyManager{
        require(raisedAmount>=target,"Target  is not reached");
        Request storage thisReq = requests[_reqNo];
        require(thisReq.completed==false,"money is already given");
        require(thisReq.noOfVoters>noOfContributors/2,"you need more votes");
        thisReq.recipient.transfer(thisReq.value);
        thisReq.completed=true;
    }



}