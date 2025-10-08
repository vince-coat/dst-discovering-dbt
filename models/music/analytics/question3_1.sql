{{ config(
    materialized='view',
    tags=['analytics']
) }}

select album_title
from {{ ref('dimalbum') }}
where cdyear > 1
