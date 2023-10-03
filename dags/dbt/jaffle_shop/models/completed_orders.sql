with final as (

    select * from {{ ref('orders') }}
    where status = 'completed'

)

select * from final
