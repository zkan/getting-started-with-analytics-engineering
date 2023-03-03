select
    {{ count_distinct_user('user_id') }} 
    
from {{ source('greenery', 'users') }}