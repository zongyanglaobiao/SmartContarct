// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;
contract MutexContract {
    event log(bool msg);
    bool locked = true;
    modifier noReentrancy() {
        require(locked,"method not execute !!!");
        locked = true;
        _;
        locked = false;
    }
    /// 此函数由互斥锁保护，这意味着msg中的可重入调用。发件人。call不能再调用f。
    /// “return 5”语句将7赋给返回值，但仍然执行修饰符中的语句“locked=false”。
    /// executes the statement `locked = false` in the modifier.
    function f() public noReentrancy returns (uint) {
        (bool success, ) = msg.sender.call("");
        emit  log(success);
        require(!success,"success == false");
        return 5;
    }
}