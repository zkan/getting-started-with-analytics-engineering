with

users as (

    select * from {{ ref('stg_greenery__users') }}

)

select count(distinct user_guid) from users