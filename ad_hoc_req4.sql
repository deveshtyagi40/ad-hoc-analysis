WITH TBL1 AS 
	(SELECT p.segment AS A , COUNT(DISTINCT(s.product_code)) AS B 
    FROM gdb023.dim_product p, gdb023.fact_sales_monthly s
    WHERE p.product_code = s.product_code
    GROUP BY s.fiscal_year, p.segment
    HAVING s.fiscal_year = "2020"),
TBL2 AS
    (
	SELECT p.segment AS C , COUNT(DISTINCT(s.product_code)) AS D 
    FROM gdb023.dim_product p, gdb023.fact_sales_monthly s
    WHERE p.product_code = s.product_code
    GROUP BY s.fiscal_year, p.segment
    HAVING s.fiscal_year = "2021"
    )     
SELECT TBL1.A AS segment, TBL1.B AS product_count_2020, TBL2.D AS product_count_2021, (TBL2.D-TBL1.B) AS difference  
FROM TBL1, TBL2
WHERE TBL1.A = TBL2.C ;