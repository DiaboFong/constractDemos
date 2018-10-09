pragma solidity ^0.4.24;
/*
合约功能
1. 发送微博
2. 查找微博
3. 打赏
*/
contract Account{
    //定义结构体
    struct Weibo{
        uint timeStamp;
        string weiboString;
    }
    //定义一个Mapping，用于保存微博内容，Key为ID，Value为微博结构体对象
    mapping (uint => Weibo) _weibos;
    // 定义微博账户发送的微博数量
    uint _numberOfWeibos;
    //定义微博账户的所有者
    address _adminAddress;

    //定义权限控制，被这个修饰符修饰的方法，表示该方法只能被微博所有者操作
    modifier onlyAdmin {
        require(msg.sender == _adminAddress, "非法操作");
        _;
    }
    //微博合约的构造方法
    constructor () public{
        _numberOfWeibos = 0;
        _adminAddress = msg.sender;
    }

    //发微博
    function sendWeibo(string weiboString) public onlyAdmin {
        //微博内容的长度不能超过200
        require(bytes(weiboString).length < 200,"微博内容不能超过200个文字");
        _weibos[_numberOfWeibos].timeStamp = now;
        _weibos[_numberOfWeibos].weiboString = weiboString;
        _numberOfWeibos++;
    }

    //根据ID查找微博
    function getWeibo(uint weiboId) public view returns (string weiboString,uint timeStamp){
        weiboString = _weibos[weiboId].weiboString;
        timeStamp = _weibos[weiboId].timeStamp;

    }
    //返回最新的一条微博
    function getLastestWeibo() public view returns (string weiboString, uint timeStamp, uint numberOfWeibos){
        weiboString = _weibos[_numberOfWeibos - 1].weiboString;
        timeStamp = _weibos[_numberOfWeibos - 1].timeStamp;
        numberOfWeibos = _numberOfWeibos;
    }
    
    //返回微博账户所有者
    function getOwnerAddress() public view returns (address adminAddress) {
        return _adminAddress;
    }
    //返回微博总数
    function getNumberOfWeibos() public view returns (uint numberOfWeibos) {
        return _numberOfWeibos;
    }
    //取回打赏
    function adminRetrieveDonation(address receiver) public onlyAdmin{
        assert(receiver.send(this.balance));

    }
    //记录每条打赏记录
    event LogDonate(address indexed from, uint256 _aomunt);

    //接受别人的打赏
    function()public payable {
        emit LogDonate(msg.sender,msg.value);
    }
    
    //摧毁合约
    function adminDeleteAccount() public onlyAdmin{
        selfdestruct(_adminAddress);
    }

}