pragma solidity ^0.4.24;

import "./KarmaConstants.sol";

contract KarmaDatabaseModel is KarmaConstants {
    struct ServiceProvider {
        address providerAddress;
        bytes32 name;
        Category category;
        bytes32 serviceProviderId;
    }

    struct Loan {
        uint loanId;

        Category category;

        uint principal;

        Currency currency;

        uint rateOfInterest;

        uint approvedRate;

        uint incentiveRate;

        uint tenure;

        bytes32 borrowerExternalId;
        bytes32 investorExternalId;
        bytes32 serviceProviderId;

        Status status;
    }

    struct Customer {
        bytes32 customerExternalId;
        CustomerType customerType;
    }
}
