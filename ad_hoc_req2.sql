select year_2020.unique_products_2020,
year_2021.unique_products_2021, 
round((year_2021.unique_products_2021-year_2020.unique_products_2020)*100/unique_products_2020,2) as percentage_chg from 
 ((select count(distinct (product_code)) as unique_products_2020 
 from gdb023.fact_sales_monthly 
 where fiscal_year=2020) year_2020,
(select count(distinct (product_code)) as unique_products_2021 
from gdb023.fact_sales_monthly 
where fiscal_year=2021) year_2021)