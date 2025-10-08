{{ config(
    materialized='table',
    schema='STAR_SCHEMA_DBT',
    tags=['create']
) }}

select 
    album_id,
    title as album_title,
    artist_id,
    prodyear,
    cdyear
from {{ source('music_source', 'ALBUM') }}
