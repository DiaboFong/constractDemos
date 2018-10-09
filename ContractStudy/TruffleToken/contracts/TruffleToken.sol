pragma solidity ^0.4.24;

contract TruffleToken{
    uint256 INITIAL_SUPPLY = 888888;
    mapping (address=>uint256) balances;
    constructor () public {
        balances[msg.sender] = INITIAL_SUPPLY;
    }
    //转账到指定地址
    function transfer(address _to, uint256 _amount) public {
        assert(balances[msg.sender] >= _amount);
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
    // 查看指定地址的余额
    function balanceOfAddress(address _owner)public view returns (uint256) {
        return balances[_owner];
    }

}