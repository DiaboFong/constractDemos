pragma solidity ^0.4.24;

/*
值类型: 深拷贝 ，拷贝值 (memory类型)
布尔(Booleans)
整型(Interger)
地址(Address)
定长字节数组(fixed byte arrarys)
有理数和整型(Rational and Inter Literals ,String literals)
枚举类型(Eums)
函数(Function Types)

引用类型: 浅拷贝，传递指针 (storage类型)
不定长字节数组(bytes)
字符串(string)
数组(Array)
结构体(Structs)

*/

//引用传递

contract Person {
    string _name;
    constructor (string name){
        _name = name;
    }
    function f()public {
        modify(_name);
    }
    //默认为memory,如果设置为storge类型，则函数类型只能为interal或者private类型，只能内部调用
    function modify(string storage name) internal{
        //string类型的字符串为定长字节数组，不能够直接对变量进行赋值修改操作
        bytes(name)[0] = "F";
       // name = "brucefeng"; 
    }

    function name() public view returns (string){
        return _name;
    }



}