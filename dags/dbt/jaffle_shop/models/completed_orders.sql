with final as (

    select * from jaffle_shop_prod.orders
    where status = 'completed'

)

select * from final
