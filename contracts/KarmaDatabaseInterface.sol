pragma solidity ^0.4.24;

import "./KarmaDatabaseModel.sol";
import "./KarmaConstants.sol";

contract KarmaDatabaseInterface is KarmaDatabaseModel {
   function createCustomer(bytes32 _customerExternalId, CustomerType _customerType) external returns (uint _customerId);
   function createServiceProvider(bytes32 _serviceProviderExternalId, address _providerAddress, bytes32 _name, Category _category) external returns (uint _serviceProviderId);
   function createLoan(uint _principal, uint _tenure, Currency _currency, Category _category, bytes32 _customerExternalId, bytes32 _serviceProviderExternalId) external returns (uint _loanId);


   function getCustomerCount() external returns (uint count);
   function getCustomerById(uint _customerId) external returns (address _customerAddress,CustomerType _customerType);

   function getServiceProviderCount() external returns (uint _count);
   function getServiceProviderById(uint _serviceProviderId) external returns (address _providerAddress,Category _category);

   function getLoanCount() external returns (uint _count);
   function getLoanById(uint _loanId) external returns (address _customerAddress,uint principal, uint tenure, Currency currency,Category category);
}
