pragma solidity ^0.4.24;

import "./ConvertLib.sol";
import "./KarmaDatabaseModel.sol";
import "./KarmaConstants.sol";
import "./KarmaDatabaseInterface.sol";


contract KarmaDatabase is KarmaDatabaseInterface, ConvertLib {
    // List of Customers
    Customer[] public customers;
    mapping (address => uint) public customerIds; // Extract data from list using index based id
    mapping (bytes32 => Customer) public customerByExternalId; // extract data based on Database id

    // List of Service providers
    ServiceProvider[] public serviceProviders;
    mapping (address => uint) public serviceProviderIds; // Extract data from list using index based id
    mapping (bytes32 => ServiceProvider) public serviceProviderByExternalIds; // extract data based on Database id

    // List of Loans
    Loan[] public loans;
    mapping (bytes32 => uint[]) public customerLoansById; // Extract data from list using index based id
    mapping (address => uint[]) public customerLoans; // extract data based on Database id

    function createCustomer(bytes32 _customerExternalId, CustomerType _customerType) external returns (uint _customerId){
        _customerId =  customers.length++;

        customerIds[msg.sender] = _customerId;
        Customer storage c = customers[_customerId];
        c.customerExternalId = _customerExternalId;
        c.customerType = _customerType;
        c.customerAddress = msg.sender;

        customerByExternalId[_customerExternalId] = c;

        emit LogNewCustomer(_customerId, msg.sender, _customerType);
    }

    function createServiceProvider(bytes32 _serviceProviderExternalId, address _providerAddress, bytes32 _name, Category _category) external returns (uint _serviceProviderId){
        _serviceProviderId = serviceProviders.length++;

        serviceProviderIds[_providerAddress] = _serviceProviderId;

        ServiceProvider storage sp = serviceProviders[_serviceProviderId];
        sp.providerAddress = _providerAddress;
        sp.name = _name;
        sp.category = _category;
        sp.serviceProviderId = _serviceProviderExternalId;

        serviceProviderByExternalIds[_serviceProviderExternalId] = sp;

        emit LogNewServiceProvider(_serviceProviderId, _providerAddress, _name, _category);
    }

    function createLoan(uint _principal, uint _tenure, Currency _currency, Category _category, bytes32 _customerExternalId, bytes32 _serviceProviderId) external returns (uint _loanId) {
        _loanId = loans.length++;
        customerLoans[msg.sender].push(_loanId);
        customerLoansById[_customerExternalId].push(_loanId);

        // Populate the loan details for the loan based on loan Ids in the Loans Array
        Loan storage l = loans[_loanId];
        l.borrowerAddress = msg.sender;
        l.loanId = _loanId;
        l.principal = _principal;
        l.tenure = _tenure;
        l.currency = _currency;
        l.borrowerExternalId = _customerExternalId;
        l.serviceProviderId = _serviceProviderId;
        l.category = _category;
        l.status = Status.Apply;

        // Notify new loan application
        emit LogLoanApplied(_loanId, _customerExternalId, _serviceProviderId,_principal, _tenure);
    }

    function getCustomerCount() external returns (uint _count){
        _count = customers.length;
    }

    function getCustomerById(uint _customerId) external returns (address _customerAddress,CustomerType _customerType){
      Customer memory c = customers[_customerId];
      _customerAddress = c.customerAddress;
      _customerType = c.customerType;
    }


    function getServiceProviderCount() external returns (uint _count){
        _count = serviceProviders.length;
    }

    function getServiceProviderById(uint _serviceProviderId) external returns (address _providerAddress,Category _category){
        ServiceProvider storage sp = serviceProviders[_serviceProviderId];
        _providerAddress = sp.providerAddress;
        _category = sp.category;
    }

    function getLoanCount() external returns (uint _count){
        _count = loans.length;
    }

    function getLoanById(uint _loanId) external returns (address _customerAddress,uint _principal, uint _tenure, Currency _currency,Category _category){
        Loan storage l = loans[_loanId];

        _customerAddress = l.borrowerAddress;
        _principal = l.principal;
        _tenure = l.tenure;
        _currency = l.currency;
        _category = l.category;
    }
}
