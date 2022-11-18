with

users_with_order_count as (

    select
        user_id
        , case
            when count(order_id) = 1 then 'one_purchase'
            when count(order_id) = 2 then 'two_purchases'
            when count(order_id) >= 3 then 'three_plus_purchases'
        end as order_count

    from orders
    group by 1

)

select
    order_count,
    count(1)

from users_with_order_count
group by 1