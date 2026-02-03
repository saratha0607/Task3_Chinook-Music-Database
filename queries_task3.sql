SELECT 
    g.Name AS Genre,
    COUNT(DISTINCT t.TrackId) AS Total_Tracks,
    SUM(il.Quantity) AS Total_Units_Sold,
    SUM(il.UnitPrice * il.Quantity) AS Total_Revenue,
    ROUND(AVG(il.UnitPrice), 2) AS Avg_Track_Price
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE il.UnitPrice >= 0.99
GROUP BY g.Name
HAVING SUM(il.UnitPrice * il.Quantity) > 100
ORDER BY Total_Revenue DESC;