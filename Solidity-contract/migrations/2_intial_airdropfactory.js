const ERC20FactoryOrchestrator = artifacts.require("ERC20FactoryOrchestrator");

module.exports = function (deployer) {
    let eRC20FactoryOrchestrator;
    deployer.deploy(ERC20FactoryOrchestrator);
    deployer.then(function() {
	   
	  	return ERC20FactoryOrchestrator.deployed();
	}).then(function(instance) {
		eRC20FactoryOrchestrator = instance;
		return airDropFactoryOrchestrator.init();
	})
};