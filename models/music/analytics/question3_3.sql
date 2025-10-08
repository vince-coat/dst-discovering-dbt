{{ config(
    materialized='view',
    tags=['analytics']
) }}

select f.track_name, f.composer
from {{ ref('facttrack') }} f
join {{ ref('dimgenre') }} g on f.genre_id = g.genre_id
where g.genre_name in ('Rock', 'Jazz')
