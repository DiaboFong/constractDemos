pragma solidity ^0.4.24;

import "../node_modules/zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract BFCToken is StandardToken {
    string public _name = "BruceFeng Coin";
    string public _symbol = "BFC";
    uint8  public _decimals = 4;
    uint256 public _INITIAL_SUPPLY = 1000000;
    constructor () public{
        totalSupply_ = _INITIAL_SUPPLY;
        balances[msg.sender] = _INITIAL_SUPPLY;
    }
}