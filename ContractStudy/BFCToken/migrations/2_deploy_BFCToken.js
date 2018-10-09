var BFCToken = artifacts.require("./BFCToken.sol");

module.exports = function(deployer) {
  deployer.deploy(BFCToken);
};
