select CASE
    WHEN date BETWEEN '2019-09-01' AND '2019-11-01' then 1  
    WHEN date BETWEEN '2019-12-01' AND '2020-02-01' then 2
    WHEN date BETWEEN '2020-03-01' AND '2020-05-01' then 3
    WHEN date BETWEEN '2020-06-01' AND '2020-08-01' then 4
    END AS Quarters,
    concat(round(sum(sold_quantity)/1000000,2),' M') as total_sold_quantity 
    from gdb023.fact_sales_monthly
    where fiscal_year=2020 
    group by Quarters 
    order by total_sold_quantity desc;