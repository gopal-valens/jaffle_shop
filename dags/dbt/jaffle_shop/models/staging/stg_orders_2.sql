with raw_order_source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from raw_orders

),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from raw_order_source

)

select * from renamed
