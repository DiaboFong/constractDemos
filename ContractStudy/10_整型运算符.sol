pragma solidity ^0.4.24;

contract Test{
    uint _a;
    uint _b;

    constructor ()public {
        _a = 100;
        _b = 200;
    }

    //比较运算符 <= , < , == , != , >= ,>
    function test1() public view returns (bool){
        return _a <= _b;
    }
    // 与或非，异或
    function setValue() public{
        _a = 5; //0000 0101
        _b = 8; //0000 1000
    }

    



}