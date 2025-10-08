{{ config(
    materialized='view',
    tags=['analytics']
) }}

select distinct p.playlist_name
from {{ ref('facttrack') }} f
join {{ source('music_source', 'PLAYLISTTRACK') }} fp on f.track_id = fp.track_id
join {{ ref('dimplaylist') }} p on fp.playlist_id = p.playlist_id
where f.milliseconds > 240000

