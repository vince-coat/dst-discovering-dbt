{{ config(
    materialized='view',
    tags=['analytics']
) }}

select track_name
from {{ ref('facttrack') }}
where prodyear in (2000, 2002)
