select distinct market 
from gdb023.dim_customer 
where region='APAC' 
and customer like '%EXCLUSIVE%'                                                 