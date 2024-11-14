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
