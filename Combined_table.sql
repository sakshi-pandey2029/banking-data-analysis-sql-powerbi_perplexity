
---Combining all the tables 

-- we took all the columns from all the tables and and went to perplixity to write get a sql query to combine all the tables

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like 'Customers'
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like 'Transactions'
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like 'Accounts'


SELECT
    t.TransactionID,
    t.AccountID AS Transaction_AccountID,
    t.TransactionDate,
    t.Type AS TransactionType,
    t.Amount,
    t.Description,
    t.Currency,
    a.AccountID AS Account_AccountID,
    a.CustomerID AS Account_CustomerID,
    a.Type AS AccountType,
    a.OpenDate,
    a.Balance,
    c.CustomerID,
    c.Name,
    c.Gender,
    c.DateOfBirth,
    c.Address,
    c.Email,
    c.Phone
INTO CombinedBankingDataset
FROM
    Transactions t
    Left JOIN Accounts a ON t.AccountID = a.AccountID
    Left JOIN Customers c ON a.CustomerID = c.CustomerID


	select * from CombinedBankingDataset