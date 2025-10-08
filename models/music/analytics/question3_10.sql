{{ config(
    materialized='view',
    tags=['analytics']
) }}

select g.genre_name, avg(f.bytes) as avg_size
from {{ ref('facttrack') }} f
join {{ ref('dimgenre') }} g on f.genre_id = g.genre_id
group by g.genre_name
