var PatientRecords = artifacts.require("./PatientRecords.sol");

module.exports = function(deployer) {
  deployer.deploy(PatientRecords);
};
