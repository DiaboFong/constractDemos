pragma solidity ^0.4.24;

contract Person {
/*
1.合约中的方法默认为Public类型，可以被外部直接访问
*/
    function age() constant returns (uint){
        return 55;
    }
    function weight() public constant returns (uint){
        return 172;
    }    
    function height() internal constant returns (uint){
        return 180;
    }  
    function money() private constant returns (uint){
        return 10000;
    }      

}