pragma solidity >0.8.0;
/*
    测试合约
*/
contract Test{

    function testMethod(uint var1,uint var2) public view returns(uint){
        return var1%var2;
    }


}
