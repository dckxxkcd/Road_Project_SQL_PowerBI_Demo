BULK INSERT Payment
FROM "C:\Users\...\bulk_insert_payments.csv"
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);


Select * From Payment;
