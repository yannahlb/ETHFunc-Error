# Project: Error Handling in Solidity Smart Contracts
This Solidity smart contract project demonstrates the use of various error handling mechanisms within smart contracts, such as require(), assert(), and revert(). These mechanisms are essential in ensuring the contract behaves as expected and handles errors gracefully. The primary goal of this project is to provide an introduction to error handling in Solidity, focusing on how to prevent invalid transactions and maintain contract integrity.


## Description

The contract allows users to perform withdrawals, check balances, and deposit funds while ensuring that balances do not go negative. It showcases how different error-handling functions are used in various scenarios, including validation of sufficient funds, ensuring non-negative balances, and reverting transactions under certain conditions.

Key Features:
- ```require()```: Used to validate conditions before executing a function (e.g., checking if a user has sufficient funds to withdraw).
- ```assert()```: Ensures that internal contract conditions are met, typically for checking invariants, such as ensuring the balance cannot go negative.
- ```revert()```: Explicitly reverts the transaction with a custom error message when certain conditions fail, such as trying to set a negative balance.

The contract is designed to help Solidity beginners understand the importance of error handling and how to use it to protect the state of a smart contract from invalid interactions.

## Getting Started

### Executing the Program
To run the program, you can use an online Solidity IDE called Remix (https://remix.ethereum.org/) and follow the steps below: 

Go to the Remix website and create a new file by clicking on the "+" icon in the left-hand sidebar. Name the file ErrorHandling.sol.

Copy and paste the following code into your new file:
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ErrorHandlingExample {

    uint public balance;

    // Constructor to set the initial balance
    constructor(uint initialBalance) {
        balance = initialBalance;
    }

    // Function using require() to validate input (ensures positive deposit)
    function deposit(uint amount) public {
        // Require that the amount is greater than 0
        require(amount > 0, "Deposit amount must be greater than 0");
        
        balance += amount;
    }

    // Function using assert() to validate internal logic (balance should never be negative)
    function withdraw(uint amount) public {
        // Ensure that the balance is not less than the withdrawal amount
        require(balance >= amount, "Insufficient balance");
        
        balance -= amount;

        // Assert that the balance after withdrawal is correct (internal logic check)
        assert(balance >= 0); // Balance should never be negative
    }

    // Function using revert() to reject a specific condition (prevent negative balance)
    function setBalance(uint newBalance) public {
        // Revert if the new balance is negative
        if (newBalance < 0) {
            revert("Balance cannot be negative");
        }

        balance = newBalance;
    }
}

```
Click on the "Solidity Compiler" tab in the left-hand sidebar. Ensure the "Compiler" version is set to 0.8.13 (or another compatible version). Then click the "Compile ErrorHandling.sol" button.

After successfully compiling, navigate to the "Deploy & Run Transactions" tab. Select the specified contract from the dropdown menu, and click the "Deploy" button.

You can interact with the contract by using the deposit function to add funds ensuring the amount is greater than zero to pass the require() validation. Use the withdraw function to withdraw funds. If the balance becomes negative, the assert() will revert the transaction. You can also use the setBalance function to set a new balance. If the balance is negative, the revert() statement gets triggered and there will be an error.

## Authors

Reannah Lobaton

@yannahlb
