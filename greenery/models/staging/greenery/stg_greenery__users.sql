-- select * from public.users

-- select user_id, email from {{ source('greenery', 'users') }}

with

source as (

    select * from {{ source('greenery', 'users') }}

)

, renamed_recasted as (

    select
        user_id as user_guid
        , created_at as created_at_utc
        , updated_at as updated_at_utc
        , address_id as address_guid

    from source

)

select * from renamed_recasted