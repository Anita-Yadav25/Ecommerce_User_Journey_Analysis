
USE FunnelAnalysisDB;

SELECT COUNT(*) AS Total_Rows
FROM dbo.FunnelEvents;


-- How many unique sessions reached each stage of the purchasing funnel (Browse, Add to Cart, Checkout, Purchase)?

SELECT
    Event,
    COUNT(DISTINCT [Session ID]) AS Total_Sessions
FROM dbo.FunnelEvents
GROUP BY Event
ORDER BY CASE Event
        WHEN 'Browse' THEN 1
        WHEN 'Add to Cart' THEN 2
        WHEN 'Checkout' THEN 3
        WHEN 'Purchase' THEN 4
        ELSE 5
    END;

-- What is the overall conversion rate from browsing to purchase?
    
WITH Funnel AS (
    SELECT
        COUNT(DISTINCT CASE
            WHEN Event = 'Browse' THEN [Session ID]
        END) AS Browse_Sessions,

        COUNT(DISTINCT CASE
            WHEN Event = 'Add to Cart' THEN [Session ID]
        END) AS Cart_Sessions,

        COUNT(DISTINCT CASE
            WHEN Event = 'Checkout' THEN [Session ID]
        END) AS Checkout_Sessions,

        COUNT(DISTINCT CASE
            WHEN Event = 'Purchase' THEN [Session ID]
        END) AS Purchase_Sessions
    FROM dbo.FunnelEvents
)
SELECT
    Browse_Sessions,
    Cart_Sessions,
    Checkout_Sessions,
    Purchase_Sessions,

    ROUND(100.0 * Cart_Sessions /
        NULLIF(Browse_Sessions, 0), 2) AS Browse_to_Cart_Pct,

    ROUND(100.0 * Checkout_Sessions /
        NULLIF(Cart_Sessions, 0), 2) AS Cart_to_Checkout_Pct,

    ROUND(100.0 * Purchase_Sessions /
        NULLIF(Checkout_Sessions, 0), 2) AS Checkout_to_Purchase_Pct,

    ROUND(100.0 * Purchase_Sessions /
        NULLIF(Browse_Sessions, 0), 2) AS Overall_Conversion_Pct
FROM Funnel;


--Analyze marketing channel performance


SELECT
    Channel,
    COUNT(DISTINCT [Session ID]) AS Purchase_Sessions,
    SUM(Revenue) AS Total_Revenue
FROM dbo.FunnelEvents
WHERE Event = 'Purchase'
GROUP BY Channel
ORDER BY Purchase_Sessions DESC;

-- Analyze device performance

SELECT
    Device,
    COUNT(DISTINCT [Session ID]) AS Purchase_Sessions,
    SUM(Revenue) AS Total_Revenue
FROM dbo.FunnelEvents
WHERE Event = 'Purchase'
GROUP BY Device
ORDER BY Purchase_Sessions DESC;

--How much time does each customer session take to move from browsing to adding a product to the cart?

WITH SessionEvents AS (
    SELECT
        [Session ID],
        MIN(CASE WHEN Event = 'Browse'
            THEN [Event Time] END) AS Browse_Time,

        MIN(CASE WHEN Event = 'Add to Cart'
            THEN [Event Time] END) AS Cart_Time,

        MIN(CASE WHEN Event = 'Checkout'
            THEN [Event Time] END) AS Checkout_Time,

        MIN(CASE WHEN Event = 'Purchase'
            THEN [Event Time] END) AS Purchase_Time
    FROM dbo.FunnelEvents
    GROUP BY [Session ID]
)
SELECT
    [Session ID],
    Browse_Time,
    Cart_Time,
    Checkout_Time,
    Purchase_Time,

    DATEDIFF(MINUTE, Browse_Time, Cart_Time)
        AS Browse_to_Cart_Min,

    DATEDIFF(MINUTE, Cart_Time, Checkout_Time)
        AS Cart_to_Checkout_Min,

    DATEDIFF(MINUTE, Checkout_Time, Purchase_Time)
        AS Checkout_to_Purchase_Min,

    DATEDIFF(MINUTE, Browse_Time, Purchase_Time)
        AS Total_Conversion_Min
FROM SessionEvents
WHERE Browse_Time IS NOT NULL
  AND Purchase_Time IS NOT NULL
ORDER BY Total_Conversion_Min DESC;




 -- What is the maximum time taken by a customer to complete a purchase?


 
WITH SessionEvents AS (
    SELECT
        [Session ID],
        MIN(CASE WHEN Event = 'Browse'
            THEN [Event Time] END) AS Browse_Time,
        MIN(CASE WHEN Event = 'Purchase'
            THEN [Event Time] END) AS Purchase_Time
    FROM dbo.FunnelEvents
    GROUP BY [Session ID]
)
SELECT
    COUNT(*) AS Converted_Sessions,
    AVG(CAST(
        DATEDIFF(SECOND, Browse_Time, Purchase_Time)
        AS FLOAT
    )) / 60.0 AS Avg_Conversion_Minutes,
    MIN(DATEDIFF(SECOND, Browse_Time, Purchase_Time)) / 60.0
        AS Min_Conversion_Minutes,
    MAX(DATEDIFF(SECOND, Browse_Time, Purchase_Time)) / 60.0
        AS Max_Conversion_Minutes
FROM SessionEvents
WHERE Browse_Time IS NOT NULL
  AND Purchase_Time IS NOT NULL
  AND Purchase_Time >= Browse_Time;


  --Which product categories contribute the most to overall business revenue?

  
SELECT
    [Product Category],
    COUNT(DISTINCT [Session ID]) AS Purchase_Sessions,
    SUM(Revenue) AS Total_Revenue
FROM dbo.FunnelEvents
WHERE Event = 'Purchase'
GROUP BY [Product Category]
ORDER BY Total_Revenue DESC;

--How much revenue does the business generate daily?


SELECT
    [Date],
    COUNT(DISTINCT [Session ID]) AS Purchase_Sessions,
    SUM(Revenue) AS Total_Revenue
FROM dbo.FunnelEvents
WHERE Event = 'Purchase'
GROUP BY [Date]
ORDER BY [Date];



-- Region wise
-- Which geographical region generates the highest number of purchase sessions?

SELECT
    Region,
    COUNT(DISTINCT [Session ID]) AS Purchase_Sessions,
    SUM(Revenue) AS Total_Revenue
FROM dbo.FunnelEvents
WHERE Event = 'Purchase'
GROUP BY Region
ORDER BY Total_Revenue DESC;


