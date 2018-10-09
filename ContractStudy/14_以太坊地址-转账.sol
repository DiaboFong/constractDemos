pragma  solidity ^0.4.24;


contract payableTest{

    function desposit(address addr) public  payable {
        addr.transfer(msg.value);
     
    }
    function getAccountBalance(address addr) public view returns (uint){
        return addr.balance;
    }
}