pragma solidity ^0.4.24;

import "./KarmaConstants.sol";

contract KarmaDatabaseModel is KarmaConstants {

    // User type who can interact with Karma website
    struct Customer {
        address customerAddress; // Wallet address
        bytes32 customerExternalId; // Links the record back to External Database
        CustomerType customerType;  // Customer either as Investor or Borrower
    }

    // Wallets where loans borrowed can be utilized
    struct ServiceProvider {
        address providerAddress; // Wallet address
        bytes32 serviceProviderId; // Links the record back to ExternalDatabase
        bytes32 name; // Name of Service Provider
        Category category; // Category
    }

    // Loan
    struct Loan {
        address borrowerAddress; // Address of the Borrower
        address investorAddress; // Address of the Lender

        uint principal;
        uint tenure;
        Currency currency;
        Category category; // Category

        uint rateOfInterest;
        uint approvedRate;
        uint incentiveRate;
        uint loanId;

        // Links the record back to External Database
        bytes32 borrowerExternalId;
        bytes32 investorExternalId;
        bytes32 serviceProviderId;

        Status status;
    }
}
