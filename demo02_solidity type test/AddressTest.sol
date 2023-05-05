pragma solidity >=0.8.0;
/**
 */ 
contract AddressTest {
    event log(string msg);
    // payable 构造函数表示创建合约时可以接收以太币  
    //关键就在于这个payable这个关键字，他表示这个合约可以接收以太币
    constructor() public payable {}
    
    function getBanlance() public  view   returns(uint){  
        //返回当前合约余额剩余多少以太币
        return  address(this).balance;
    }

    function set(address payable a1,uint a2) public  payable {
        a1.transfer(a2);
    }
    /*
        try-catch语句块不能对内部函数使用，也就是不是我们编写的函数
    */
    function setBanlance(address payable var1,uint var2) public  payable {
        try this.set(var1, var2){
           emit log("success");
        }catch {
            emit  log("fail !!!!!!");
        }
    }


    function transferTo(address payable  ad) public payable {
        uint amount = 100;
        
        ad.transfer(amount);
    }
    
    /*
        向指定账户转以太币，没有特别的
        takeOverAddress : 接收以太币的地址
        amount ： 向指定地址转多少以太币
        当前合约是发送以太币的
    */
    function sendTo(address payable takeOverAddress,uint amount) public payable  returns(uint){
        if (takeOverAddress.send(amount)){
            emit log("success");
            return  1;
        }else {
            emit  log("fail !!!!!!");
            return  0;
        }
    }
    
}