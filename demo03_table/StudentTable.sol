// SPDX-License-Identifier: MIT
pragma solidity>=0.4.24 <0.6.11;
pragma experimental ABIEncoderV2;

import "./Table.sol";

contract  StudentTable{
      
      TableFactory private factory;
      string private constant table_name = "demo03_student";
      string private constant key = "id";
      string private constant table_colunm = "name,student_address";
     

      constructor () public {
          factory = TableFactory(0x1001);
          //创建表
          //表名 主键名  表列
          factory.createTable(table_name,key,table_colunm);
      }
    
    

    //log事件
    event log(string msg ,int hint);

    //增加学生 
    //0失败，1成功
    function addStudent(string memory id,string memory name,string memory student_address) public  returns(int){
        Table table = factory.openTable(table_name);

        //判断数据是否有此人    
        Condition condition  = table.newCondition();
        condition.EQ("id",id);

        Entries entries = table.select(id,condition);
        int size = entries.size();

        //打印日志
        emit  log("select result = ",size);
        if(size > 0){
            return 0; 
        } 


        Entry entry =  table.newEntry();
        entry.set("id",id);
        entry.set("name",name);
        entry.set("student_address",student_address);

        int result = table.insert(id,entry);
        emit log("insert result = ",result);
        return  result;
    }
    //删除学生
    //0失败，1成功
    function removeStudent(string memory id) public  returns(int result){
        //打开表
        Table table = factory.openTable(table_name);
        
        //条件
        Condition con = table.newCondition();
        con.EQ("id",id);

        Entries entries  = table.select(id,con);

        emit  log("select result = ",entries.size());

        if(entries.size() == 0){
            return  0;
        } 

        //删除
        result = table.remove(id,con);

        return  result;

    }
    //查询某个学生
    //失败返回 0 
    function queryAllStudent(string memory key) public  returns(string memory ,string memory ,string memory ){
        //打开表
        Table table = factory.openTable(table_name);
        //条件
        Condition con = table.newCondition();
        con.EQ("id",key);

        Entries entries = table.select(key,con);
        int result = entries.size();

        emit  log("select result = ",result);

        if(result == 0 || result != 1){
            
            return ("0","0","0");
        }   
        Entry entry = entries.get(0);
        
        return (entry.getString("id"),entry.getString("name"),entry.getString("student_address"));
    }
}