// SPDX-License-Identifier: MIT
pragma solidity >0.4.0;

contract HelloWorld {
    string  public messsage = "hello world";

    function getMsg() public view returns (string memory) {
        return messsage;
    }

    function setMsg(string memory _msg) public {
        messsage = _msg;
    }
}
