// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

contract Ownable { //this is the parent class 
    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}

contract SecretVault {
    string secret;
    
    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view returns (string memory) {
        return secret;
    }
}

contract Secret is Ownable { // this is the child class 
    address secretVault; // store the address of SecretVault

    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);//iterfearnce
        secretVault = address(_secretVault);
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return SecretVault(secretVault).getSecret();
    }
}
