pragma solidity ^0.4.24;

contract Test{
    uint _a;
    uint _b ;
    bool _c ;
    constructor() public{
        _a = 100;
        _b = 200;
        _c = true;

    }


    // && 逻辑与  ==等于
    function test1() public view returns (bool) {
        return _a == _b && _c ;
    }    

    // == 等于

    // ! 逻辑非   != 不等于

    function test2() public view returns (bool) {
        return _a != _b || _c;
    }
}