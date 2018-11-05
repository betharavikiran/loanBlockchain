pragma solidity ^0.4.24;

import "./KarmaDatabaseModel.sol";
import "./KarmaConstants.sol";
import "./KarmaDatabaseInterface.sol";


contract KarmaDatabase is KarmaDatabaseInterface {
    // List of Customers
    Customer[] public customers;
    // lookup CustomerId from address
    mapping (address => uint) public customerIds;
    // lookup Customer based on external id
    mapping (bytes32 => Customer) public customerByExternalId;

    // List of Service providers
    ServiceProvider[] public serviceProviders;
    // Lookup serv
    mapping (address => uint) public serviceProviderIds;
    mapping (bytes32 => ServiceProvider) public serviceProviderByExternalIds;

    // List of Loans
    Loan[] public loans;
    // lookup customer loan ids by external customer id
    mapping (bytes32 => uint[]) public customerLoansById;
    // look up customer loan ids by address
    mapping (address => uint[]) public customerLoans;

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
        // push Loan Id into lookup based on Address
        customerLoans[msg.sender].push(_loanId);

        // psuh Loan Id into Lookup based on external Loan id
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
        //emit LogLoanApplied(_loanId, _customerExternalId, _serviceProviderId,_principal, _tenure);
    }
}
