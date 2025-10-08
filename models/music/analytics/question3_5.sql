{{ config(
    materialized='view',
    tags=['analytics']
) }}

select ar.artist_name, count(da.album_id) as nb_albums
from {{ ref('dimalbum') }} da
join {{ ref('dimartist') }} ar on da.artist_id = ar.artist_id
group by ar.artist_name
