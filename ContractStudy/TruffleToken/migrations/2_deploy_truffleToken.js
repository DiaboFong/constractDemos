var TruffleToken = artifacts.require("./TruffleToken.sol")

module.exports = function(deployer){
    deployer.deploy(TruffleToken);
}