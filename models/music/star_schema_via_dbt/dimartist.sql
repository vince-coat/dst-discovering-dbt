{{ config(
    materialized='table',
    schema='STAR_SCHEMA_DBT',
    tags=['create']
) }}

select 
    artist_id,
    name as artist_name,
    birthyear,
    country
from {{ source('music_source', 'ARTIST') }}
