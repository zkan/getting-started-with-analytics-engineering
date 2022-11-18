with

source as (

    select * from {{ source('greenery', 'promos') }}

)

, final as (

    select    
        promo_id
        , discount
        , status

    from source

)

select * from final
