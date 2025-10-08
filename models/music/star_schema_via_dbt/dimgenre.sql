{{ config(
    materialized='table',
    schema='STAR_SCHEMA_DBT',
    tags=['create']
) }}

select 
    genre_id,
    name as genre_name
from {{ source('music_source', 'GENRE') }}
