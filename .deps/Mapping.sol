// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;

contract Mapping{
   // mapping(uint=>uint) public myMapping;
   mapping(uint=>string) public names;
   mapping(uint=>Book) public books;
   //using struct we can define the element for the particular var 
   mapping(address=>mapping(uint=>Book)) public myBooks; //this is mapp of mapping if we provide the address then according to
   //that address we get the corresponding book deatils 


   struct Book{
    string title;
    string author;
   }

   constructor(){
    names[1]="vidhut";
    names[2]="raushan";
    names[3]="solu";
    names[4]="hello";


   }

   

   function addBook
   (uint _id, 
   string memory _title, 
   string memory _author)
   public {
    books[_id]=Book(_title,_author); //simplay assiging the value 

    // for id =1

    //1 point to Book struct so we have title and author 
    //
    //
   }


   function addMyBook(
        uint _id,
        string memory _title,
        string memory _author

   ) public{
        myBooks[msg.sender][_id]= Book(_title,_author); //msg is state var built in
   }







}