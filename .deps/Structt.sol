// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;


contract Structt{

     
    struct Student {
        string name;
        uint roll;
        bool pass;
    }
    Student public s1;
    function insert (string memory _name, uint _roll , bool _pass ) public{
        // s1.name= _name;
        // s1.roll = _roll;
        // s1.pass= _pass;
        s1=Student(_name,_roll,_pass);
    }



    function getter() public view returns (Student memory){
        return s1;
    }
    //array of struct

    Student[4] public s;
    Student[] public ds;
    function insertStudent(uint index, string memory _name,uint _roll , bool _pass) public {
        s[index]=Student(_name,_roll,_pass);
    }

    function retudenStudent(uint index) public view returns(Student memory){
        return s[index];
    }

    //mapping
    mapping(uint=>Student) public m;
    function insertStudent1(uint index, string memory _name,uint _roll , bool _pass) public {
        m[index]=Student(_name,_roll,_pass);
    }


}