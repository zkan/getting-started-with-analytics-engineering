with

unique_sessions as (

    select
        count(distinct session_id) as number_of_unique_sessions

    from {{ ref('stg_events') }}

)

, unique_add_to_cart_sessions as (

    select
        count(distinct session_id) as number_of_unique_add_to_cart_sessions

    from {{ ref('stg_events') }}
    where event_type = 'add_to_cart'

)

select
  number_of_unique_add_to_cart_sessions
  , number_of_unique_sessions
  , number_of_unique_add_to_cart_sessions::float / number_of_unique_sessions::float as add_to_cart_rate

from unique_add_to_cart_sessions, unique_sessions