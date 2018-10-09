pragma solidity ^0.4.24;

/*
值类型包括: 深拷贝 ，拷贝值
布尔(Booleans)
整型(Interger)
地址(Address)
定长字节数组(fixed byte arrarys)
有理数和整型(Rational and Inter Literals ,String literals)
枚举类型(Eums)
函数(Function Types)

引用类型: 浅拷贝，传递指针
不定长字节数组(bytes)
字符串(string)
数组(Array)
结构体(Structs)

*/

//值传递

contract Person {
    uint _age;
    constructor (uint age){
        _age = age;
    }
    function f()public {
        modify(_age);
    }

    function modify(unit age) public{
        age = 100;
    }

    function age() public view returns (uint){
        return _age;
    }



}