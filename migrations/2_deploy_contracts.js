var KarmaDatabase = artifacts.require("KarmaDatabase");

module.exports = function(deployer) {
  deployer.deploy(KarmaDatabase);
};
