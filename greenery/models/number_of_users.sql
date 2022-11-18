select
    count(distinct user_id) as number_of_users

from {{ ref('stg_users') }}