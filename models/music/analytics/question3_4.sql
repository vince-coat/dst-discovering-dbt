{{ config(
    materialized='view',
    tags=['analytics']
) }}

select da.album_title, sum(f.milliseconds) as total_duration
from {{ ref('facttrack') }} f
join {{ ref('dimalbum') }} da on f.album_id = da.album_id
group by da.album_title
order by total_duration desc
limit 10
