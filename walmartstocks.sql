# View data set 
SELECT *
FROM walmartstocks.wmt;

# change data type for date column 
SET SQL_SAFE_UPDATES = 0;
UPDATE walmartstocks.wmt
SET Date = STR_TO_DATE(Date, '%m/%d/%Y');

ALTER TABLE walmartstocks.wmt
MODIFY Date DATE;

# check for null values 
SELECT *
FROM walmartstocks.wmt 
WHERE 
	Date IS NULL OR 
	Open IS NULL OR
    High IS NULL OR
    Low IS NULL OR
    Close IS NULL OR 
    `Adj Close` IS NULL OR 
    Volume IS NULL;
    
    # check for duplicates 
    SELECT *,
    COUNT(*)
    FROM walmartstocks.wmt 
    GROUP BY
		Date, Open, High, Low, Close, `Adj Close`, Volume
    HAVING COUNT(*) > 1;
    
# Finalised Dataset 
SELECT
		DATE_FORMAT(Date, '%d/%m/%Y') AS Date,
		ROUND(Open, 2) AS Open,
		ROUND(High, 2) AS High,
		ROUND(Low, 2) AS Low, 
		ROUND(Close, 2) AS Close,
		ROUND(`Adj Close`, 2) AS Adjusted_Close,  
		Volume AS Volume 
	FROM
		walmartstocks.wmt;
    



