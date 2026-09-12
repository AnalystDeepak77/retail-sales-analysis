-- ===*===*===*===*===*===*===*===*===*===
-- Retail_Sales_Project => 5 Reports
-- ===*===*===*===*===*===*===*===*===*===

-- Report 1: Region-wise Sales & Profit
SELECT 
    Region,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM retail_project.retail_sales_csv
GROUP BY Region
ORDER BY Total_Sales DESC;


-- Report 2: Category-wise Performance
SELECT 
    Category,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percent
FROM retail_project.retail_sales_csv
GROUP BY Category
ORDER BY Total_Sales DESC;


-- Report 3: Monthly Sales Trend
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM retail_project.retail_sales_csv
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Month ASC;


-- Report 4: Segment-wise Performance
SELECT 
    Segment,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM retail_project.retail_sales_csv
GROUP BY Segment
ORDER BY Total_Sales DESC;


-- Report 5: Discount Impact on Profit Margin
SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.1 THEN 'Low (upto 10%)'
        WHEN Discount <= 0.2 THEN 'Medium (10-20%)'
        ELSE 'High (20%+)'
    END AS Discount_Range,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percent
FROM retail_project.retail_sales_csv
GROUP BY Discount_Range
ORDER BY Profit_Margin_Percent DESC;
