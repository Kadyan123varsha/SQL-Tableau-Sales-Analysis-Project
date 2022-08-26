SELECT COUNT(*) FROM model..[Orders$]

SELECT * FROM model..[Orders$]
ORDER BY 1

SELECT * FROM model..[Orders$]
WHERE [Ship Date]<[Order Date]

SELECT [Segment],[Product ID],[Category],[Sub-Category],[Product Name],[Sales],[Quantity],[Discount],[Profit],[Shipping Cost]
FROM model..[Orders$]
WHERE [Category]='Office Supplies'
AND [Quantity]>3
ORDER BY 9 DESC 

SELECT [Country],
SUM([Profit]) AS Total_Profit
FROM model..[Orders$]
GROUP BY [Country]
ORDER BY Total_Profit DESC

SELECT DISTINCT [Ship Mode] FROM model..[Orders$]

SELECT [Order ID],COUNT(*)
FROM model..[Orders$]
GROUP BY [Order ID]
HAVING COUNT(*)>1

SELECT [Customer ID], 
SUM(quantity) AS Total_Quantity 
FROM model..[Orders$] 
GROUP BY [Customer ID]

SELECT [Customer ID], [Sales],[Profit],[Quantity],[Order id],
    CASE
        WHEN [Profit]>500 Then 'Best margin'
	    WHEN [Profit]>250 Then 'Good margin'
	    WHEN [Profit]>50 Then 'Average'
        ELSE 'Need Improvement'
	END AS 'Profit_margin'
FROM model..[Orders$] 

SELECT [Category], 
SUM([Discount]) AS Total_Discount 
FROM model..[Orders$]
GROUP BY [Category]

SELECT MIN(a.NumOfDays),MAX(a.NumOfDays)
FROM(
SELECT DATEDIFF(DAY, [Order Date], [Ship Date]) AS NumOfDays,*
FROM model..[Orders$]
WHERE [Ship Mode]='Second Class')a

SELECT [Customer ID], [Order ID],COUNT(*)
FROM model..[Orders$]
GROUP BY [Customer ID], [Order ID]
ORDER BY [Customer ID]

SELECT * FROM model..[Orders$]
WHERE [Order ID]='CA-2011-138100'

SELECT COUNT(*) FROM model..[People$]

SELECT * FROM model..[People$]

SELECT [Person],COUNT(*)
FROM model..[People$]
GROUP BY [Person]
HAVING COUNT(*)>1

SELECT COUNT(*) FROM model..[Returns$]

SELECT * FROM model..[Returns$]

SELECT COUNT(*) FROM model..[Returns$]
WHERE [market] = 'LATAM'

SELECT * FROM model..[Orders$] 
WHERE [Order ID] IN(
SELECT [Order ID] FROM model..[Returns$] WHERE Market='EU')

SELECT [Customer ID],[Customer Name],[Category],[Profit],[Quantity],model..[Orders$].[Order ID],[Country] FROM model..[Orders$]
       JOIN model..[Returns$]
	   ON model..[Orders$].[Order ID] = [Returns$].[Order ID]
	   WHERE model..[Orders$].Country='Brazil'
	   ORDER BY [Profit] DESC

