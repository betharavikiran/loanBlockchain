pragma solidity ^0.4.24;

import "./KarmaDatabaseModel.sol";

contract KarmaDatabaseInterface is KarmaDatabaseModel {
   function createCustomer(bytes32 _customerExternalId, CustomerType customerType) returns (uint _customerId);
   function createServiceProvider(bytes32 _serviceProviderExternalId, address _providerAddress, bytes32 name, Category category) returns (uint _serviceProviderId);
   function createLoan(uint _principal, uint tenure, Currency _currency, bytes32 _customerExternalId, bytes32 _serviceProviderId) returns (uint _loanId);
}
