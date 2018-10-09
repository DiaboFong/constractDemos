pragma solidity ^0.4.24;
/*

维护账户昵称，账户ID到WeiboAccount合约之间的映射关系，别人可以平台找到对方并与之互动，及时平台被屏蔽或者删除，我们的微博合约仍旧存在
本合约(微博管理平台)功能
1.注册微博
2.返回已经注册的账户数量
3.查找微博账户
4.打赏
*/
contract Register{
    //根据账户昵称，ID，地址查找微博账户
    mapping(address => string) _addressToAccountName;
    mapping(uint => address) _accountIdToAccountAddress;
    mapping(string => address) _accountNameToAddress;

    //平台上的注册账户数量
    uint _numberOfAccounts;

    //定义微博平台管理员
    address _registerAdmin;

    //定义权限控制
    modifier onlyRegistryAdmin {
        require(msg.sender == _registerAdmin,"非法操作");
        _;
    }
    //微博管理平台构造函数
    constructor () public {
        _numberOfAccounts = 0;
        _registerAdmin = msg.sender;
    }

    //在平台上注册微博：用户名/微博账号
    function register(string name, address accountAddress) public {
        //需要满足账号未曾注册
        require(_accountNameToAddress[name] == address(0),"账号已存在");
        //需要满足昵称未曾注册
        require(bytes(_addressToAccountName[accountAddress]).length == 0,"昵称已存在");
    }
    //返回已注册的账户数量
    function getNumberOfAccounts() public view returns (uint numberOfAccounts) {
        numberOfAccounts = _numberOfAccounts;
    }

    //根据昵称对应的微博账户地址
    function getAddressOfName(string name)public  view returns (address addr){
        addr = _accountNameToAddress[name];
    }
    //根据微博账户地址返回昵称
    function getNameOfAddress(address addr) public view returns (string name){
        name = _addressToAccountName[addr];
    }
    //根据ID返回账户地址
    function getAddressOfId(uint id)public  view returns (address addr){
        addr = _accountIdToAccountAddress[id];
    }
    //取回打赏
    function adminRetrieveDonations()public onlyRegistryAdmin{
        assert(_registerAdmin.send(this.balance));
    }
     //记录每条打赏记录
    event LogDonate(address indexed from, uint256 _aomunt);

    //接受别人的打赏
    function()public payable {
        emit LogDonate(msg.sender,msg.value);
    }
    
    //摧毁合约
    function adminDeleteRegistry() public onlyRegistryAdmin{
        selfdestruct(_registerAdmin);
    }


}
