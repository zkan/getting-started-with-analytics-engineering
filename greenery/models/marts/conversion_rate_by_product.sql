with

page_view_count_by_product as (

    select
        p.product_id
        , p.name as product_name
        , sum(case when e.event_type = 'page_view' then 1 else 0 end) as page_view_count

    from {{ ref('stg_events') }} as e
    left join {{ ref('stg_products') }} as p
        on e.product_id = p.product_id
    where
        e.product_id is not null
    group by 1, 2

)

, checkout_count_by_product as (

    select
        po.product_id
        , po.product_name
        , sum(case when e.event_type = 'checkout' then 1 else 0 end) as checkout_count

    from {{ ref('stg_events') }} as e
    left join {{ ref('int_product_orders__joined') }} as po
        on e.order_id = po.order_id
    where
        e.order_id is not null
    group by 1, 2

)

, final as (

    select
        co.product_name
        , checkout_count
        , page_view_count
        , checkout_count::float / page_view_count::float as conversion_rate

    from checkout_count_by_product as co
    join page_view_count_by_product as pv
        on co.product_id = pv.product_id

)

select * from final
