select m.product_code,p.product,round(m.manufacturing_cost,2 ) as manufacturing_cost
from gdb023.dim_product p join gdb023.fact_manufacturing_cost m
on p.product_code=m.product_code 
where manufacturing_cost in 
 (select max(manufacturing_cost) from gdb023.fact_manufacturing_cost 
	union select min(manufacturing_cost) from gdb023.fact_manufacturing_cost) 
    order by manufacturing_cost desc;