pragma solidity ^0.8.0;
contract EventTest{
    event log(string msg,uint indexed index) anonymous;
    event log1(string msg);
    function getData() public  returns(uint data){
        emit log1("this a log");
        return data = 10;
    }



}