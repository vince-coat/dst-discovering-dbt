{{ config(
    materialized='table',
    schema='STAR_SCHEMA_DBT',
    tags=['create']
) }}

select 
    playlist_id,
    name as playlist_name
from {{ source('music_source', 'PLAYLIST') }}
