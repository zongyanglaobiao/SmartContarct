// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract HelloWorld {
    string messsage;
    
    constructor() {
        messsage = "Hello, World!";
    }

    function getGreeting() public view returns (string memory) {
        return messsage;
    }

    function setGreeting(string memory _msg) public {
        messsage = _msg;
    }
}
