with TBL1 as 
(select customer_code as A,AVG(pre_invoice_discount_pct*100) as B 
from gdb023.fact_pre_invoice_deductions
 where fiscal_year=2021 group by customer_code),
TBL2 as 
(select customer_code AS c,customer AS d from gdb023.dim_customer where market='India')
select TBL1.A as customer_code,
round(TBL1.B,2) as average_discount_percentage ,
TBL2.d as customer 
from TBL1 join TBL2 
on TBL1.A=TBL2.c
order by average_discount_percentage desc limit 5;