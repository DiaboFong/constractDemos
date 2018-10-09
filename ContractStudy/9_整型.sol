
pragma solidity ^0.4.24;
/*
1. uint8, uint16,uint24 ... uint256 以8为递增
    int8,int16,int24...      int256 
2. int ==>int256  uint==>uint256

3. int8 有符号 (+/-) 只有8位 -127 ~ 127 255个数
   uint8 无符号(+) // 00000000 ~ 11111111 (0~255)
*/

//
contract Test{
    uint8 _a;

    constructor (uint8 a ) public{
        _a = a;
    }


    function setA(uint8 a )public {
        _a = a;
    }

    function a() public view returns (uint8){
        return _a;
    }
    function testVar() public view returns (uint8){
        uint8 a = 100;
        //通过var定义的变量，默认会等于a的类型
        var b = a;
        return b;
    }
    //在进行循环的时候，需要注意能够存入的值跟类型的对应
    function testVar1() public view returns (uint){
        uint a;
        for(uint16 i = 0; i <= 255; i++){
            a = i;
        }
        return a;
    }





}