import Control.Monad.State
import Control.Monad.Trans (liftIO)

-- Define the BankAccount type
type BankAccount = Int

-- Define the operations that can be performed on the account using the State monad
deposit :: Int -> StateT BankAccount IO ()
deposit amount = do
    -- Get the current balance
    balance <- get
    -- Update the balance by adding the deposit amount
    put (balance + amount)

withdraw :: Int -> StateT BankAccount IO ()
withdraw amount = do
    -- Get the current balance
    balance <- get
    -- Check if there are sufficient funds before updating the balance
    if balance >= amount
        then put (balance - amount)
        else liftIO $ putStrLn "Insufficient funds"

checkBalance :: StateT BankAccount IO Int
checkBalance = get

-- Perform a sequence of bank transactions
bankTransactions :: StateT BankAccount IO ()
bankTransactions = do
    deposit 100
    withdraw 50
    deposit 30

-- Run the bankTransactions with an initial balance of 0
main :: IO ()
main = do
    finalBalance <- execStateT bankTransactions 0
    putStrLn $ "Final Balance: " ++ show finalBalance
