create or replace view `dbt_gopal__jaffle_shop`.`stg_customers`
  
  
  as
    with source as (
    select * from `dbt_gopal__jaffle_shop`.`raw_customers`

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name

    from source

)

select * from renamed
