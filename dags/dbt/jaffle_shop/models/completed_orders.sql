with final as (

    select * from orders
    where status = 'completed'

)

select * from final
