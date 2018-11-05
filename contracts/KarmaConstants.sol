pragma solidity ^0.4.24;

contract KarmaConstants {
    enum Currency {
        GBP,
        CAD,
        EUR,
        USD,
        JPY
    }

    enum Status {
        Apply,
        Processing,
        Granted,
        Disbursed,
        Active,
        Closed
    }

    enum Category {
        Telephone,
        Grocery,
        Electricity
    }

    enum CustomerType {
        Borrower,
        Investor
    }


    event LogLoanApplied(
       uint _loanId,
        bytes32 _customerId,
        bytes32 _serviceProviderId,
       uint principal,
       uint tenure
    );

    event LogLoanAccepted(
       uint _loanId,
       uint principal,
       uint rate,
       uint tenure
    );

    event LogLoanDisbursed(
       uint _loanId,
       uint principal
    );

    event LogLoanRepaid (
       uint _loanId
    );

    event LogLoanDeclined (
       uint _loanId,
       bytes32 reason
    );

    event LogSendFail(
       uint _loanId,
       bytes32 strReason
    );

    event LogSendFunds(
       address _recipient,
       uint _from,
       uint amount
    );

    event LogReceivedFunds(
       address _sender,
       uint _to,
       uint amount
    );

    event LogNewServiceProvider(
       uint _serviceProviderId,
       address _serviceProvider,
       bytes32 _name,
       Category _category
    );

    event LogNewCustomer(
       uint _customerId,
       address _customer,
       CustomerType _customerType
    );
}
