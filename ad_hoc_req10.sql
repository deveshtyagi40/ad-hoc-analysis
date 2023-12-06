WITH TBL1 AS (
SELECT p.division, s.product_code, p.product, SUM(s.sold_quantity) AS Total_sold_quantity
FROM gdb023.dim_product p JOIN gdb023.fact_sales_monthly s
ON p.product_code = s.product_code
WHERE s.fiscal_year = 2021 
GROUP BY  s.product_code, division, p.product
),TBL2 AS 
(
SELECT division, product_code, product, Total_sold_quantity,
        RANK() OVER(PARTITION BY division ORDER BY Total_sold_quantity DESC) AS 'Rank_Order' 
FROM TBL1
)
 SELECT TBL1.division, TBL1.product_code, TBL1.product, TBL2.Total_sold_quantity, TBL2.Rank_Order
 FROM TBL1 JOIN TBL2
 ON TBL1.product_code = TBL2.product_code
WHERE TBL2.Rank_Order IN (1,2,3)