with pop as (
    select * from {{ source('COVID19_EPIDEMIOLOGICAL_DATA', 'DEMOGRAPHICS') }}
),

final as (
    select * from pop
)

select * from final
