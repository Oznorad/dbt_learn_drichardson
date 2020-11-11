with payments as (
select * from {{ ref('stg_payments') }}
), pivot as (
  -- can we omit the comma on the final element?
    -- If last element in the array change statement.
    -- Another array with whitespace (i.e. [",",","," "])?
    -- 
  -- can we automatically get all the values in the column dynamically?

  select
    order_id,
    {% for pm in ['credit_card','bank_transfer','gift_card','coupon'] %}
      sum(case when payment_method = '{{ pm }}' then amount else 0 end) as {{ pm }}_amount
      {% if not loop.last %}
      ,
      {% endif %}
    {% endfor %}
  from payments
  group by order_id
)
select *
from pivot