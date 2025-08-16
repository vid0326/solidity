// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract LotteryProject {
    // entities -> manager, players and winner
    address public manager;
    address payable[] public players;
    address payable public winner;

    constructor() {
        manager = msg.sender;
    }

    modifier minCost(uint _cost) {
        require(msg.value >= _cost, "Not sufficient ether, send exactly 1");
        _;
    }

    modifier minParticipation(uint _minPlayer) {
        require(players.length >= _minPlayer, "Not enough players");
        _;
    }

    modifier managerOnly() {
        require(manager == msg.sender, "You are not the manager");
        _;
    }

    function participate() public payable minCost(1 ether) {
        players.push(payable(msg.sender));
    }

    function getBalance() public view managerOnly returns (uint) {
        return address(this).balance;
    }

    function random() internal view returns (uint) {
        return uint(
            keccak256(
                abi.encodePacked(
                    block.prevrandao,
                    block.timestamp,
                    players.length
                )
            )
        );
    }

    function pickWinner() public managerOnly minParticipation(3) {
        uint index = random() % players.length; // random index
        winner = players[index];
        winner.transfer(getBalance());
        players = new address payable[](0) ; // reset players for next round
    }
}
