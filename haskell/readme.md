# Epigraph

I won't make a big example on Haskell, I once had a project on writing smart contracts on Haskell at work for the big crypto company Cardano. After writing smart contracts on Plutus Core + writing the backend on Haskell - I have PTSD when I hear Haskell, Plutus Core, extended UTXO, functional programming, and especially the word Monad

# Personal recommendation on Haskell

## online book that allowed me to learn Haskell in my own time

http://learnyouahaskell.com/chapters

# Bank Account Management with StateT Monad

## Overview

The provided Haskell code simulates a simple bank account system using the `StateT` monad transformer. The program defines operations such as deposit, withdraw, and check balance, and then sequences these operations to perform a series of bank transactions.

## Code Explanation

### Types

- `BankAccount`: An alias for the integer type, representing the balance of a bank account.

### Operations

1. **`deposit` Function:**
   - Accepts an amount as a parameter.
   - Retrieves the current balance using `get`.
   - Updates the balance by adding the deposit amount using `put`.

2. **`withdraw` Function:**
   - Accepts an amount as a parameter.
   - Retrieves the current balance using `get`.
   - Checks if there are sufficient funds and updates the balance if possible.
   - If insufficient funds, outputs a message using `liftIO`.

3. **`checkBalance` Function:**
   - Retrieves and returns the current balance using `get`.

### Bank Transactions

The `bankTransactions` function performs a sequence of transactions:
   1. Deposit 100
   2. Withdraw 50
   3. Deposit 30

### Main Function

The `main` function:
   - Executes the `bankTransactions` using `execStateT` with an initial balance of 0.
   - Prints the final balance.

## Monad Explanation

### StateT Monad Transformer

The `StateT` monad transformer is crucial in this program. It allows us to manage and thread through the state of the bank account (balance) across different operations without explicitly passing it as a parameter.

In particular:
   - `StateT BankAccount IO`: Indicates a stateful computation in the IO monad.
   - `get`: Retrieves the current state (balance).
   - `put`: Updates the current state (balance).

### Monad Operations

1. **`do` Notation:**
   - Enables sequential composition of monadic actions.
   - Facilitates the chaining of operations that involve state modifications.

2. **`liftIO` Function:**
   - Lifts an IO action into the `StateT` monad transformer.
   - Allows us to perform IO actions (like printing) within the stateful computation.

### `evalStateT` and `execStateT`

- **`evalStateT`**: Extracts the final result from the stateful computation.
- **`execStateT`**: Extracts the final state from the stateful computation.

# How to run

```ghc -o BankAccountExample BankAccountExample.hs```

```./BankAccountExample```