{{ config(
    materialized='view',
    tags=['analytics']
) }}

select g.genre_name, count(f.track_id) as nb_morceaux
from {{ ref('facttrack') }} f
join {{ ref('dimgenre') }} g on f.genre_id = g.genre_id
where f.prodyear between 2000 and 2009
group by g.genre_name
order by nb_morceaux desc
limit 1
