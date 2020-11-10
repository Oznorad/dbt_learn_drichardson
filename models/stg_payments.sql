select 
  id as payment_id,
  orderid as order_id,
  paymentmethod as payment_method,
  status,
  amount/100 as amount, --cents to dollars
  created as created_at
from raw.stripe.payment