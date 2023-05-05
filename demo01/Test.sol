pragma solidity >0.8.0;
/*
    测试合约
*/
contract Test{
    /*
        测试地址类型
    */
    address public address1 = msg.sender;
    address payable public address2 = payable(address1);

    function testMethod(uint var1,uint var2) public view returns(uint){
        return var1%var2;
    }


}
