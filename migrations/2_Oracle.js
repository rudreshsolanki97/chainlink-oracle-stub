const Oracle = artifacts.require("Oracle");

module.exports = function (deployer) {
  deployer.deploy(Oracle,"0x000000000000000000000000000000000000bEEF");
};
