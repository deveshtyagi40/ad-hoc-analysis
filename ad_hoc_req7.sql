with TBL1 as
(select * from gdb023.fact_sales_monthly 
where customer_code in 
(select customer_code from gdb023.dim_customer where customer= 'Atliq Exclusive'))
select month(date) as Month,
year(date) as Year,
concat(round(sum(g.gross_price*t.sold_quantity)/1000000,2),' M') as Gross_sales_Amount 
from TBL1 t join gdb023.fact_gross_price g 
on t.product_code=g.product_code and t.fiscal_year=g.fiscal_year
group by Month,Year;