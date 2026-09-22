 Select *
FROM PortfolioProject.dbo.WalmartSales

----- Categorising Products and knowing their counts

Select DISTINCT Product_Category, COUNT (Product_Category)
FROM PortfolioProject.dbo.WalmartSales
Group By Product_Category

----- Total Revenue > 1000 grouped by different categories and models

Select Product_Category, Product_Name, Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
where Total_Revenue>1000

Select Product_Category, Product_Name, Units_Sold,  Region, Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
Where Total_Revenue>1000
Order by Total_Revenue desc


Select Product_Category, Product_Name, Units_Sold,  Region, Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
Where Total_Revenue>1000
Order by Units_Sold desc

Select Product_Category, Region,  Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
Where Total_Revenue>1000
Order by Total_Revenue desc

Select Product_Category, Units_Sold,  Region, Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
Where Total_Revenue>1000
Order by Units_Sold desc

---- Rolling up Product Categories

Select Product_Category, Region, Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
--Where Total_Revenue<1000
Where Product_Category = 'Electronics'
Order by Total_Revenue desc

Select Product_Category, Region, Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
Where Total_Revenue<1000 And Product_Category = 'Beauty Products'
Order by Total_Revenue desc

Select Product_Category, Region, Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
Where Total_Revenue<1000 And Product_Category = 'Clothing'
Order by Total_Revenue desc

Select Product_Category, Region, Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
Where Product_Category = 'Books'
Order by Total_Revenue desc

Select Product_Category, Region, Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
Where Product_Category = 'Home Appliances'
Order by Total_Revenue desc

Select Product_Category, Region, Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
Where Product_Category = 'Sports'
Order by Total_Revenue desc

Select Distinct (Region)
FROM PortfolioProject.dbo.WalmartSales


---- Rolling up Product Categories into different segments.

Select Product_Category, SUM(Total_Revenue) AS Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
WHERE Product_Category = 'Electronics'
GROUP BY Product_Category

Select Product_Category, SUM(Total_Revenue) AS Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
WHERE Product_Category = 'Books'
GROUP BY Product_Category

Select Product_Category, SUM(Total_Revenue) AS Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
WHERE Product_Category = 'Clothing'
GROUP BY Product_Category

Select Product_Category, SUM(Total_Revenue) AS Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
WHERE Product_Category = 'Home Appliances'
GROUP BY Product_Category

Select Product_Category, SUM(Total_Revenue) AS Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
WHERE Product_Category = 'Sports'
GROUP BY Product_Category

Select DISTINCT *
FROM PortfolioProject.dbo.WalmartSales

Select DISTINCT (Product_Category), Units_Sold
FROM PortfolioProject.dbo.WalmartSales
Order By Units_Sold DESC

ALTER TABLE PortfolioProject.dbo.WalmartSales
ADD Product_Category_RolledUp varchar (50)

ALTER TABLE PortfolioProject.dbo.WalmartSales
ADD Total_Revenue_RolledUp int

  
---- Rolling up Product Categories intp one table.

Select Product_Category, Total_Revenue, SUM (Total_Revenue)
OVER(PARTITION BY Product_Category) AS Category_Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
ORDER BY 3 DESC

Select *
FROM PortfolioProject.dbo.WalmartSales

SELECT
SUBSTRING(Total_Revenue, 1, CHARINDEX('.', Total_Revenue)) AS Total_Revenue
FROM PortfolioProject.dbo.WalmartSales
