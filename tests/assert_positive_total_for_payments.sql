-- Refunds have a negative amount, so the total amount should always be >= 0.
-- Therefore return records where this isn't true to make the test fail
select 
    order_id,
    sum(amount) as total_amount
from {{ ref('stg_payments') }}
--group by the first column in select statement, better to use column name but for now using 1 to see how it works
group by 1 
having not(total_amount >= 0)