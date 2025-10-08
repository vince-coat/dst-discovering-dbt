{{ config(
    materialized='table',
    schema='STAR_SCHEMA_DBT',
    tags=['create']
) }}

select 
    t.track_id,
    t.name as track_name,
    t.composer,
    t.milliseconds,
    t.bytes,
    t.unitprice,
    t.genre_id,
    t.mediatype_id,
    t.album_id,
    a.artist_id,
    al.prodyear,
    al.cdyear
from {{ source('music_source', 'TRACK') }} t
left join {{ source('music_source', 'ALBUM') }} al
    on t.album_id = al.album_id
left join {{ source('music_source', 'ARTIST') }} a
    on al.artist_id = a.artist_id
