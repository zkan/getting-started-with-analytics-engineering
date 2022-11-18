with

orders_cohort as (

    select
        user_id
        , count(distinct order_id) as user_orders

    from {{ ref('stg_orders') }}
    group by 1

),

users_bucket as (

    select
        user_id
        , (user_orders >= 2)::int has_two_purchases

    from orders_cohort

)

select
    sum(has_two_purchases)::float / count(distinct user_id)::float as repeat_rate

from users_bucket