pragma solidity ^0.4.24;

import "./KarmaDatabaseModel.sol";
import "./KarmaConstants.sol";

contract KarmaDatabaseInterface is KarmaDatabaseModel {
   function createCustomer(bytes32 _customerExternalId, CustomerType _customerType) external returns (uint _customerId);
   function createServiceProvider(bytes32 _serviceProviderExternalId, address _providerAddress, bytes32 _name, Category _category) external returns (uint _serviceProviderId);
   function createLoan(uint _principal, uint _tenure, Currency _currency, Category _category, bytes32 _customerExternalId, bytes32 _serviceProviderExternalId) external returns (uint _loanId);
}
