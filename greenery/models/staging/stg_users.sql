with

users as (

    select * from {{ ref('base_users') }}

)

, addresses as (

    select * from {{ ref('base_addresses') }}

)

-- Remove the columns that contain PII
, final as (

    select
        user_id
        -- , first_name
        -- , last_name
        -- , email
        -- , phone_number
        , created_at
        , updated_at
        , address
        , zipcode
        , state
        , country

    from users as u
    left join addresses as a
    on
        u.address_id = a.address_id

)

select * from final
