pragma solidity ^0.4.24;
/*
pragma :版本声明
solidity: 开发语言
0.4.4 :当前语言的版本，0.4：主版本，.17代表修复Bug的升级版
^：代表向上兼容，表示0.4.1-0.4.17或者更高版本可以代码进行编译

*/

contract Person{
    //属性名规范:加上下划线
    uint  _height;  //身高
    uint _age ; //年龄
    address _owner; //代表合约的拥有者

//方法名和合约名称相同时就属于构造函数，在创建对象时，构造函数时会自动最先调用
    constructor () public {
        _height = 180;
        _age = 29;
        _owner = msg.sender;
    }

    function owner() public view  returns (address){
        return _owner;
    }


    // set 方法，可以修改height属性
    function setHeight(uint height) public{
        _height = height;
        
    }
    // get 方法，读取height

    function getHeight() public view  returns (uint){
        return _height;
    }

    function setAge (uint age) public{
        _age = age; 
    }

    function getAge() public view returns (uint){
        return _age;
    }

    // 析构函数，用于销毁合约
    function kill() public{
        if (_owner == msg.sender){
            selfdestruct(_owner);
        }
        


    }



}

