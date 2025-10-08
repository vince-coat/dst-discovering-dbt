{{ config(
    materialized='view',
    tags=['analytics']
) }}

select ar.artist_name, count(distinct f.track_id) as nb_tracks
from {{ ref('facttrack') }} f
join {{ ref('dimartist') }} ar on f.artist_id = ar.artist_id
group by ar.artist_name
