const Spacebears = artifacts.require("Spacebear");

module.exports = function(deployer, network, accounts) {
    deployer.deploy(Spacebears, {from: accounts[0]});
}
