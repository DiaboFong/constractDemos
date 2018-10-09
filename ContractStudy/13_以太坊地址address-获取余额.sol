pragma solidity ^0.4.24;

contract addressBalance{
    function getBalance(address addr) public view returns (uint){
        return addr.balance;
    }
    function getContractAddressBalance() public view returns (uint){
        return this.balance; //查询当前合约地址的余额
    }
}
//0xbbf289d846208c16edc8474705c748aff07732db
