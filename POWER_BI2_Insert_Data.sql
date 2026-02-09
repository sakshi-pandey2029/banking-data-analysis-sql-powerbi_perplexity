

INSERT INTO Customers (CustomerID, Name, Gender, DateOfBirth, Address, Email, Phone, AccountID) VALUES
(1, 'Ajay Sharma', 'M', '1980-11-04', '123 Main St', NULL, '9891000001', 101),
(2, 'priya singh', NULL, '21-07-1975', '22B Park Road', 'priya@sample.com', '9891000002', 102),
(3, 'Sarah Khan', 'F', '1989/02/20', '', 'sarahkhan@email.com', '9891000003', 103),
(4, 'Mark Lee', 'M', '1995-05-14', '456 North Rd', 'markl@email.com', '9891000004', 104),
(5, 'NAdea KUmar', 'F', '04-12-1982', NULL, NULL, '9891000005', 105);


-- Accounts (outlier balances, inconsistent type case, mixed date formats, invalid CustomerID)
INSERT INTO Accounts (AccountID, CustomerID, Type, OpenDate, Balance) VALUES
(101, 1, 'SAVINGS',    '03/14/2013',      10000.00),
(102, 2, 'current',    '2011-06-20',    -157874.40),
(103, 3, 'Savings',    '2019/11/02',      0.00),
(104, 4, 'CURRENT',    '21-07-2018',        50.00),
(105, 99, 'Savings',   '07-05-2016',       14.75);      -- CustomerID 99 doesn't exist


-- Example: Generate 10,000 synthetic transactions with data issues
;WITH NumberedRows AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM
        sys.all_objects a
        CROSS JOIN sys.all_columns c
)
INSERT INTO Transactions (
    TransactionID, AccountID, TransactionDate, Type, Amount, Description, Currency
)
SELECT
    100000 + rn AS TransactionID,
    -- Some non-matching AccountIDs for referential issues
    CASE WHEN rn % 20 = 0 THEN 9999 ELSE 101 + (rn % 100) END AS AccountID,
    -- Mixed date formats
    CASE 
        WHEN rn % 3 = 0 THEN FORMAT(GETDATE() - (rn % 365), 'yyyy/MM/dd')
        ELSE CONVERT(VARCHAR(10), GETDATE() - (rn % 365), 105)
    END AS TransactionDate,
    -- Inconsistent Type capitalization
    CASE WHEN rn % 2 = 0 THEN 'Credit' ELSE 'DEBIT' END AS Type,
    -- Amount with negatives and outliers
    CASE 
        WHEN rn % 1000 = 0 THEN -99999.99       -- negative outlier
        WHEN rn % 250 = 0 THEN 1000000.99       -- positive outlier
        ELSE (ABS(CHECKSUM(NEWID())) % 5000) *
             CASE WHEN rn % 2 = 0 THEN 1 ELSE -1 END 
    END AS Amount,
    -- NULLs for descriptions, inconsistent case
    CASE 
        WHEN rn % 50 = 0 THEN NULL
        ELSE CASE WHEN rn % 2 = 0 THEN 'payment' ELSE 'Salary Credit' END
    END AS Description,
    -- Mixed currency cases
    CASE 
        WHEN rn % 3 = 0 THEN 'usd'
        WHEN rn % 5 = 0 THEN 'INR'
        ELSE 'USD'
    END AS Currency
FROM NumberedRows
WHERE rn <= 10000;



SELECT * from Transactions

SELECT * from Customers


SELECT * from Accounts
