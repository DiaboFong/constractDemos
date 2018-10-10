/*
前端逻辑
1.生成微博账号
2.在平台中注册微博昵称
3.发送微博
4.展示微博内容
5.展示打赏金额
*/

//填写部署好weiboRegister的合约地址
var weiboRegistryAddress  = "0x345ca3e014aaf5dca488057592ee47305d9b3e10"
var currentWeiboAddress ;

//部署WeiboAccount合约，需要的gas设置
var defaultGas = 5000000;

//注册微博账号
// 注册微博账号
function register() {
    var weiboRegistryInstance;
    var name = $("#weiboName").val();
    var accountAddress;
    var weiboAccountAddress;
    Account.new({from: web3.eth.accounts[0], gas: defaultGas}).then(function (instance) {
        weiboAccountAddress = instance.address;
        cuurentWeiboAddress = weiboAccountAddress;
        $("#weiboAddress").val(weiboAccountAddress);
    }).then(function () {
        Register.at(weiboRegistryAddress).then(function (instance) {
            weiboRegistryInstance = instance;
            return weiboRegistryInstance.register(name, weiboAccountAddress, {
                from: web3.eth.accounts[0],
                gas: defaultGas
            });
        }).then(function (txReceipt) {
            console.info(txReceipt);
            showAllRegister();
        });
    });
}

function getRegisterUser(id) {
    var addr;
    return Register.at(weiboRegistryAddress).then(function (instance) {
        weiboRegistryInstance = instance;
        return weiboRegistryInstance.getAddressOfId.call(id).then(function (a) {
            addr = a;
            return weiboRegistryInstance.getNameOfAddress.call(addr);
        }).then(function (name) {
            return {id: id, name: name, addr: addr}
        })
    });
}

// 微博平台上所有注册用户
function getTotalRegisterUser() {
    return Register.at(weiboRegistryAddress).then(function (instance) {
        weiboRegistryInstance = instance;
        return weiboRegistryInstance.getNumberOfAccounts.call()
    }).then(function (total) {
        return total;
    });
}

//查看平台所有已注册的微博账户
// {id:1,name:"",address:""}
async function getAllRegister() {
    let users = [];
    let total = await getTotalRegisterUser();
    for (let i = 0; i < total; i++) {
        let user = await getRegisterUser(i);
        users.push(user);
    }
    return users;

}

// 在页面中展示所有已注册用户
function showAllRegister() {
    getAllRegister().then(function (list) {
        $("#weiboList").html('');
        list.forEach(function (item, index) {
            $("#weiboList").append("<tr><td>" + item.id + "</td><td>" + item.name + "</td><td>" + item.addr + "</td></tr>");
        });
        cuurentWeiboAddress = list[0].addr || "";
    })
}

// 平台余额
function plantformBalance() {
    let balance = web3.eth.getBalance(weiboRegistryAddress);
    balance = web3.fromWei(balance, 'ether');
    return balance.toString();
}

// 微博平台基本信息
function getPlantformInfo() {
    $("#plantformAccount").html(weiboRegistryAddress);
    $("#plantformBalance").html(plantformBalance() + " ether");
}


// 账户发微博
function sendWeibo() {
    var weiboAccountInstance;
    var weiboContent = $("#weiboContent").val();
    Account.at(cuurentWeiboAddress).then(function (instance) {
        weiboAccountInstance = instance;
        return weiboAccountInstance.weibo(weiboContent, {from: web3.eth.accounts[0], gas: defaultGas});
    }).then(function (txReceipt) {
        console.info(txReceipt);
        showWeibo();
        $("#weiboContent").val('');
    });
}

// 返回weiboAddress账户发出的第id条微博
function getWeibo(weiboAddress, id) {
    var weiboAccountInstance;
    return Account.at(weiboAddress).then(function (instance) {
        weiboAccountInstance = instance;
        return weiboAccountInstance.getWeibo.call(id).then(function (w) {
            return {id: id, weiboContent: w[0], timestamp: w[1]};
        })
    });
}

// 返回账户发的微博总数
function getTotalWeibo(weiboAddress) {
    var weiboAccountInstance;
    return Account.at(weiboAddress).then(function (instance) {
        weiboAccountInstance = instance;
        return weiboAccountInstance.getNumberOfWeibos.call()
    }).then(function (total) {
        return total;
    });
}

// 返回账户发的所有微博
async function getAllWeibo(weiboAddress) {
    let weibos = [];
    let total = await getTotalWeibo(weiboAddress);
    for (let i = 0; i < total; i++) {
        let weibo = await getWeibo(weiboAddress, i);
        weibos.push(weibo)
    }
    return weibos;
}

// 在页面中展示微博信息
function showWeibo() {
    getAllWeibo(cuurentWeiboAddress).then(function (list) {
        $("#weiboContentList").html('');
        list.forEach(function (item, index) {
            $("#weiboContentList").append("<tr><td>" + item.id + "</td><td>" + item.weiboContent + "</td><td>" + item.timestamp + "</td></tr>");
        });
    });
}


// 微博余额
function weiboBalance() {
    var balance = web3.eth.getBalance(cuurentWeiboAddress);
    balance = web3.fromWei(balance, 'ether');
    return balance.toString();
}

function getNameOfAddress() {
    var weiboRegistryInstance;
    return Register.at(weiboRegistryAddress).then(function (instance) {
        weiboRegistryInstance = instance;
        return weiboRegistryInstance.getNameOfAddress.call(cuurentWeiboAddress);
    }).then(function (name) {
        $("#myName").html(name);
    });
}

function getWeiboInfo() {
    getNameOfAddress();
    $("#myAccount").html(cuurentWeiboAddress);
    $("#myBalance").html(weiboBalance() + " ether");
}

window.onload = function () {

    getPlantformInfo();
    showAllRegister();

    $("#home_tab").click(function (e) {
        e.preventDefault();
        getPlantformInfo();
        showAllRegister();
    })

    $("#weibo_tab").click(function (e) {
        e.preventDefault();
        getWeiboInfo();
        showWeibo();
    })

    $("#registerBtn").click(function () {
        register();
    });

    $("#sendweiboBtn").click(function () {
        sendWeibo();
    });


};