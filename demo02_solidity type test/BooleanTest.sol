pragma solidity >0.8.0;
contract BooleanTest{
    //对于java是 public int count
    uint16 public count ;
    /*
        对比java
        public void  modify(int count){
            count = count;
        }
    
    */
    function modify(uint16 number) public{
        if(number < 10){
            return;
        }else if(number > 0){
            count += number;
        }
    }
    /*
        对比java
        public int getCount(){
            return count;
        }
        这里的防护直是returns别搞错了
    */
    function getCount() public returns(uint16){
        return count;
    }

}