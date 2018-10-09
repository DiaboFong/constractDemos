pragma solidity ^0.4.24;

/*
以太坊中的地址长度为20字节，一个字节为8位，所以address可以用uint160来声明
十六进制 每个数字=二进制的4位，所以，地址为16进制的40个数字

*/
contract Test{
    address public _owner; //第一次部署合约的地址，合约的拥有者
    uint _number ;
  

    constructor ()public{
        _owner = msg.sender; //msg.sender是全局变量
    }

    function msgSenderAddress() public view returns (address) {
        return msg.sender;
    }
    function setNumber1()public {
        _number += 5;
    }
    function setNumber2() public {
        if (_owner == msg.sender){
            _number += 10;
        }else {
            _number -= 1;
        }
    }

    function contractAddress() public view returns (address){
        return this; //返回的是合约地址
        
    }

}

