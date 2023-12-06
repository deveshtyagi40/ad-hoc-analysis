with TBL1 as(select c.channel,concat(round(sum(s.sold_quantity*g.gross_price)/1000000,2), ' M') as gross_sales_mln 
from gdb023.fact_sales_monthly s 
join gdb023.dim_customer c 
on s.customer_code=c.customer_code join gdb023.fact_gross_price g on s.product_code=g.product_code where s.fiscal_year=2021
group by c.channel)
SELECT B.channel, CONCAT(Gross_sales_mln) AS Gross_sales_mln , CONCAT(ROUND(Gross_sales_mln*100/A.total , 2), ' %') AS percentage
FROM((SELECT SUM(Gross_sales_mln) AS total FROM TBL1) A,(SELECT * FROM TBL1) B) ORDER BY percentage DESC 

