{{ config(
    materialized='view',
    tags=['analytics']
) }}

select f.track_name, ar.artist_name
from {{ ref('facttrack') }} f
join {{ ref('dimgenre') }} g on f.genre_id = g.genre_id
join {{ ref('dimartist') }} ar on f.artist_id = ar.artist_id
where lower(g.genre_name) like '%rock%'
  and lower(ar.country) like '%france%'
