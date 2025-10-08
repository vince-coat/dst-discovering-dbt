{{ config(
    materialized='table',
    schema='STAR_SCHEMA_DBT',
    tags=['create']
) }}

select 
    mediatype_id,
    name as mediatype_name
from {{ source('music_source', 'MEDIATYPE') }}
