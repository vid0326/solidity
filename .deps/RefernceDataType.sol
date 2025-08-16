// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

/*
  Data locations quick notes:
  - storage: state variables live here (persist on-chain)
  - memory: temporary, function-scoped copies
  - calldata: read-only args of external functions (cheapest for large inputs)
*/

contract ReferenceDataType {
    uint[] private arr;

    // Append an item
    function pushItem(uint _item) public {
        arr.push(_item);
    }

    // Set value at index, auto-expanding the array with zeros if needed
    function setAt(uint _index, uint _item) public {
        if (_index >= arr.length) {
            uint toAdd = _index + 1 - arr.length;
            for (uint i = 0; i < toAdd; i++) {
                arr.push(0);
            }
        }
        arr[_index] = _item;
    }

    // Safe get by index
    function getAt(uint _index) public view returns (uint) {
        require(_index < arr.length, "Index out of bounds");
        return arr[_index];
    }

    // Return the whole array (copied from storage to memory)
    function getAll() public view returns (uint[] memory) {
        return arr;
    }

    // Replace the whole array with provided values (calldata -> storage)
    function replaceAll(uint[] calldata values) external {
        delete arr;
        for (uint i = 0; i < values.length; i++) {
            arr.push(values[i]);
        }
    }

    // Example of using calldata efficiently (read-only)
    function sum(uint[] calldata values) external pure returns (uint s) {
        for (uint i = 0; i < values.length; i++) {
            s += values[i];
        }
    }

    // Current length helper
    function length() public view returns (uint) {
        return arr.length;
    }

    //diffrence between memory and call data 
    //here we are stroing the frence data type
    //calldata make your refrence type data as immutable in nature
    //we cannot chnage the value (and call data is used as argument only) 

    //diffrence betweeen memory and storage 
     //memory is used to store the value in temporary
     //storage is used to store the value in permanent
    uint[3] public arr1=[1,2,3];//stoarge , arr is an array we crated as the storage area 
    function fmemory() public view{
        uint[3] memory a=arr1; // a is array that we cretaed inside the memory
        a[0]=0;
    }  

    function fstorage()  public  {
        uint[3] storage a=arr1;//a is pointer to arr1
        a[0]=1;

    }
}
